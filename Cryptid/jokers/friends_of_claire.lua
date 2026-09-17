if Cryptid then
-- Biscuit
SMODS.Joker {
    key = 'biscuit',
	dependencies = {
		items = {
			"tag_cry_cat",
		},
	},
    config = {
        extra = {
			biscuitXmult = 1,
			is_expansion = true
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    atlas = 'CryptidJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.biscuitXmult,
            }
        }
    end,
	calculate = function(self, card, context)
		if context.joker_main then
			do
			local highest_cat_lvl = 0
			for _, tag in pairs(G.GAME.tags) do
				local lvl = tag.ability.level
				if highest_cat_lvl < 1 and tag.key == "tag_cry_cat" then
					highest_cat_lvl = 1
				end
				if lvl and lvl > highest_cat_lvl then
					highest_cat_lvl = lvl
				end
			card.ability.extra.biscuitXmult = highest_cat_lvl
			end

			return {
				Xmult = card.ability.extra.biscuitXmult
			}
		end
	end
	end
}






end