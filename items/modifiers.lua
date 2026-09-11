-- Enhancements
-- Paper
SMODS.Enhancement {
    key = "paper",
    name = "Paper",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            Xchips = 1.5,
            odds = 4
        }
    },
    loc_txt = {
        name = "Paper",
        text = {
            "{C:white,X:chips}X#1#{} Chips",
            "{C:green}#2# in #3#{} chance to {C:red}destroy{} self after scoring"
        }
    },
    atlas = "CustomEnhancements",
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "fpe_paper")
        return {
            vars = {
                card.ability.extra.Xchips,
                numerator,
                denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {x_chips = card.ability.extra.Xchips}
        end
        if context.after and context.cardarea == G.play and SMODS.pseudorandom_probability(card, "fpe_paper", 1, card.ability.extra.odds) then
			check_for_unlock { type = 'ach_paper_destroyed' }
            SMODS.destroy_cards(card)
        end
    end
}

-- Seals
-- A+ Seal
SMODS.Seal {
    key = 'a_seal',
    pos = {
        x = 0,
        y = 0
    },
    badge_colour = HEX('FF4848'),
    loc_txt = {
        ['name'] = 'A+ Seal',
        ['label'] = 'A+ Seal',
        ['text'] = {
            [1] = '{C:planet}Levels up{} played hand when {C:attention}scored{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            do
			check_for_unlock { type = 'ach_top_marks' }
            SMODS.smart_level_up_hand(card, context.scoring_name, false, 1)
            return {
                message = localize('k_level_up_ex'),
                colour = G.C.GREEN
            }
        end
    end
end
}
