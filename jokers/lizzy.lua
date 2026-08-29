--  Lizzy
SMODS.Joker {
    key = 'lizzy',
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 8
        }
    },



    loc_txt = {
        ['name'] = 'Lizzy',
        ['text'] = {
            [1] = '{C:green}1 in 8{} chance to add a random {C:dark_edition}Edition{} to {C:attention}scored cards{}'
        }
    },

    pos = {
        x = 6,
        y = 0
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
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'j_fpe_lizzy')
        return {
            vars = {
                new_numerator0,
                new_denominator0
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            do
                if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_fpe_lizzy', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                    func = function()
                            local random_edition = SMODS.poll_edition({ key = 'edit_card_edition', no_negative = true, guaranteed = true })
                            if random_edition then
                                scored_card:set_edition(random_edition, true)
                            end
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                    end
                    }))
                    return {
                        colour = G.C.BLUE
                    }
                end
            end
        end
    end
}
