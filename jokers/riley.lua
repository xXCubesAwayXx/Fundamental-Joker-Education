--  Riley
SMODS.Joker {
    key = 'riley',
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 8,
            rileyChips = 0
        }
    },


    loc_txt = {
        ['name'] = 'Riley',
        ['text'] = {
            [1] = '{C:green}1 in 8{} chance to {C:red}destroy discarded cards{} and {C:blue}gain {C:blue}+10{} Chips{}',
            [2] = '{C:inactive}Currently{} {C:blue}+#1#{} {C:inactive}Chips{}',
            [3] = '{C:inactive}Debugged by{} {C:dark_edition, E:1}Oxicreep!{}'
        }
    },

    pos = {
        x = 0,
        y = 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',



    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'j_fpe_riley')
        return {
            vars = {
                card.ability.extra.rileyChips,
                new_numerator0,
                new_denominator0
            }
        }
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy then
            return { remove = true }
        end
        if context.joker_main then
            do
                return {
                    chips = card.ability.extra.rileyChips
                }
            end
        end
        if context.discard then
            do
                if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_fpe_riley', false) then
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                    return {
                        remove = true,
                        message = 'Murdered!',
                        colour = G.C.RED,
                        extra = {
                            func = function()
                                card.ability.extra.rileyChips = (card.ability.extra.rileyChips) + 10
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                end
            end
        end
    end
}
