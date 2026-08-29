--  Skell
SMODS.Joker {
    key = 'skell',
    config = {
        extra = {
            Xmult0 = 1.5,
        }
    },
    loc_txt = {
        ['name'] = 'Skell',
        ['text'] = {
            [1] = '{X:mult,C:white}1.5{} Mult on {C:attention}first hand of round{}'
        }
    },
    pos = {
        x = 1,
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
        return {
            vars = {
                self.config.extra.Xmult0,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    Xmult = card.ability.extra.Xmult0
                }
            end
        end
    end
}