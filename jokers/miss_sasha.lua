SMODS.Joker {
    key = 'miss_sasha',
    config = {
        extra = { hand_size0 = 1 }
    },
    loc_txt = {
        ['name'] = 'Miss Sasha',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+1{} Hand Size for every scored {C:attention}2{}'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.hand_size0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hand_size0)..' Hand Limit', colour = G.C.BLUE})

                        G.hand:change_size(card.ability.extra.hand_size0)
                        return true
                    end,
                    colour = G.C.BLUE
                }
            end
        end
    end
}
