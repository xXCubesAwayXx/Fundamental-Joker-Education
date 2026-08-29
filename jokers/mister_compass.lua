--  Mister Compass
SMODS.Joker {
    key = 'mister_compass',
    config = {
        extra = {
            misterCompassxChips = 1
        }
    },
    loc_txt = {
        ['name'] = 'Mister Compass',
        ['text'] = {
            [1] = 'This Joker gains {X:chips,C:white}0.5{} Chips when',
            [2] = '{C:attention}scoring hand matches blind requirement on its own{}',
            [3] = '{C:inactive}(Currently{} {X:chips,C:white}#1#{} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 3,
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
                card.ability.extra.misterCompassxChips,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            do
                return {
                    x_chips = card.ability.extra.misterCompassxChips
                }
            end
        end
        if context.after and SMODS.last_hand_oneshot then
            return {
                func = function()
                     card.ability.extra.misterCompassxChips = (card.ability.extra.misterCompassxChips) + 0.5
                     return true
                   end,
                   message = "Have a KitKat, kid.",
                   colour = G.C.BLUE
                }
            end
    end
}