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
	in_pool = function(self)
		if not G.GAME.tags or #G.GAME.tags == 0 then
			return false
		end
		for _, tag in pairs(G.GAME.tags) do
			if tag.key == "tag_cry_cat" then
				return true
			end
		end
		return false
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

-- Anova
SMODS.Joker {
    key = 'anova',
    config = {
        extra = {
            anovaScoringCards = 6,
            anovaXmult = 4,
			is_expansion = true
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    atlas = 'CryptidJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
				card.ability.extra.anovaScoringCards,
                card.ability.extra.anovaXmult,
            }
        }
    end,
	calculate = function(self, card, context)
        if context.joker_main then
            if #context.scoring_hand >= card.ability.extra.anovaScoringCards then
                return {
                    Xmult = card.ability.extra.anovaXmult
                }
            end
        end
    end
}

--Agetha
SMODS.Joker {
    key = 'agetha',
    config = {
        extra = {
			agethaBonus = 0,
			agethaBonusMod = 4,
			is_expansion = true
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 12,
    rarity = 'cry_epic',
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    atlas = 'CryptidJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
				card.ability.extra.agethaBonus,
				card.ability.extra.agethaBonusMod,
            }
        }
    end,
    calc_dollar_bonus = function(self, card)
        local blind_reward = 0
        blind_reward = blind_reward + math.max(card.ability.extra.agethaBonus, 0)
        if blind_reward > 0 then
            return blind_reward
        end
    end,
    calculate = function(self, card, context)
        if 	context.using_consumeable and context.consumeable.ability.set == "Code" and not context.consumeable.beginning_end and not context.blueprint then
            do
            return {
                func = function()
                    card.ability.extra.agethaBonus = (card.ability.extra.agethaBonus) + card.ability.extra.agethaBonusMod
                    return true
                end,
				sound = "cry_e_glitched",
				message = localize('k_agetha_scale'),
                colour = G.C.GREEN
            }
        end
    end
end
}

end