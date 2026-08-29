--  Miss Circle
SMODS.Joker {
    key = 'miss_circle',
    config = {
        extra = {
            missCirclexMult = 1
            }
            },
    loc_txt = {
        ['name'] = 'Miss Circle',
        ['text'] = {
            [1] = 'This Joker gains {X:mult,C:white}0.5{} Mult when',
            [2] = '{C:attention}scoring hand matches blind requirement on its own{}',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}#1#{} {C:inactive}Mult){}'
        }
    },
    pos = {
        x = 6,
        y = 1
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
                card.ability.extra.missCirclexMult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            do
                return {
                    Xmult = card.ability.extra.missCirclexMult
                }
            end
        end
        if context.after and SMODS.last_hand_oneshot then
            return {
                func = function()
                     card.ability.extra.missCirclexMult = (card.ability.extra.missCirclexMult) + 0.5
                     return true
                   end,
                   message = "You owe me an Oreo...", 
                   colour = G.C.RED
                }
            end
    end
  }