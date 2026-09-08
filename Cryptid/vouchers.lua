if Cryptid then
local voucher_atlas = {
	object_type = "Atlas",
	key = "CryptidVouchers",
	path = "CryptidVouchers.png",
	px = 71,
	py = 95,
}

-- Class Acclimator
local class_acclimator = { -- Class Merchant T3; Classes are free, spawn rate controllable in run info
	object_type = "Voucher",
	dependencies = {
		items = {
			"set_cry_tier3",
		},
	},
	key = "class_acclimator",
        loc_txt = {
        ['name'] = 'Class Acclimator',
        ['text'] = {
            [1] = "{C:class}Class{} cards appear",
            [2] = "{C:attention}6x{} more frequently",
            [3] = "in the shop",
            [4] = "Allows control of the",
            [5] = "shop's {C:class}Class Rate{}",
            [6] = "{C:inactive}(Check{} {C:attention}Run Info{}{C:inactive}){}",
          },
        },
	config = { extra = 24 / 4, extra_disp = 6 },
	atlas = "CryptidVouchers",
	pos = { x = 0, y = 0 },
	requires = { "v_fpe_class_tycoon" },
	pools = { ["Tier3"] = true },
	loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra_disp or self.config.extra_disp } }
	end,
	redeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.class_rate = G.GAME.class_rate * (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
	unredeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.class_rate = G.GAME.class_rate / (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
}
-- Class Acclimator slider

if Cryptid.setup_voucher_rate_adjuster then
Cryptid.setup_voucher_rate_adjuster("v_fpe_class_acclimator", "b_class_rate", "class", G.C.SECONDARY_SET.class)
end


-- All Vouchers
local voucheritems = {
	voucher_atlas,
--T3s
class_acclimator,
}
  
return {
	name = "Vouchers",
	items = voucheritems,
}

end
