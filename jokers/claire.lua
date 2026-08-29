--  Claire
SMODS.Joker {
    key = 'claire',
    config = {
        extra = {
            dollars = 1.5,
            max = 10,
        }
    },
    loc_txt = {
        ['name'] = 'Claire',
        ['text'] = {
            [1] = 'At end of round, {C:money}multiplies money by 1.5{}',
            [2] = '{C:inactive}Max{} {C:money}$10{}'
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
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.max
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            do
                local target_card = card
                if target_card then
                target_card:juice_up(1, 1)
                end
                return {
                func = function()
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * 1.5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(math.min(dollar_value, 10))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(1.5), colour = G.C.MONEY})
                    return true
                end
                }
            end
        end
    end
}
