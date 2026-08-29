--  Δlice
SMODS.Joker {
    key = '_lice',
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 2,
            aliceXMult = 1
        }
    },

    loc_txt = {
        ['name'] = 'Alice',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to apply {C:dark_edition}Negative{} to {C:red}discarded{} {C:attention}face cards{}',
            [2] = 'Scales {X:mult,C:white}0.5{} Mult when {C:attention}ability is activated{}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    soul_pos = {x = 5, y = 2},
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'j_fpe__lice')
        return {
            vars = {
                card.ability.extra.aliceXMult,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.discard then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_fpe__lice', false) then
                    local target_card = card
                    if target_card then
                    target_card:juice_up(1, 1)
                    end
                    return {
                        func = function()
                                    context.other_card:set_edition("e_negative", true)
                                        return true
                        end,
                        message = 'Card Modified!',
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
                                card.ability.extra.aliceXMult = (card.ability.extra.aliceXMult) + 0.5
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                end
            end
        end
        if context.joker_main then
            do
                return {
                    Xmult = card.ability.extra.aliceXMult
                }
            end
        end
    end
}