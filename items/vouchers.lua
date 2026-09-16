-- Class Merchant
SMODS.Voucher {
    key = 'class_merchant',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = { item_rate0 = 2 }
    },
    cost = 10,
    unlocked = true,
    atlas = 'CustomVouchers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.item_rate0
            }
        }
    end,
    redeem = function(self, card)
        do
        G.GAME.class_rate = 2 * card.ability.extra.item_rate0
        return {
            message = 'Spawn Rate Changed',
            colour = G.C.BLUE
        }
    end
end
}

-- Class Tycoon
SMODS.Voucher {
    key = 'class_tycoon',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = { item_rate0 = 8 }
    },
    cost = 10,
    unlocked = false,
    requires = { 'v_fpe_class_merchant' },
    atlas = 'CustomVouchers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.item_rate0
            }
        }
    end,
    redeem = function(self, card)
        G.GAME.class_rate = 2 * card.ability.extra.item_rate0
        return {
            message = 'Spawn Rate Changed',
            colour = G.C.BLUE
        }
    end,
	check_for_unlock = function(self, args)
		      if args and args.type == 'v_class_tycoon' then	
			return true
		end
      end,
}
