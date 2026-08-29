--  Cubbie
SMODS.Joker {
    key = 'cubbie',
    config = {
        extra = {
            var_cubbiePacks0 = 5,
            cubbiePacks = 0
        }
    },

    loc_txt = {
        ['name'] = 'Cubbie',
        ['text'] = {
            [1] = '{C:red}+5{} Mult for every {C:attention}booster pack{}',
            [2] = 'opened since {C:money}Joker was bought{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        }
    },

    pos = {
        x = 8,
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
        return {
            vars = {
                card.ability.extra.cubbiePacks,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.open_booster and context.main_eval then
            do
                return {
                    func = function()
                        card.ability.extra.cubbiePacks = (card.ability.extra.cubbiePacks) + card.ability.extra.var_cubbiePacks0
                        return true
                    end,
                    message = +5 Mult
                    colour = G.C.GREEN
                }
            end
        end
        if context.joker_main then
            do
                return {
                    mult = card.ability.extra.cubbiePacks
                }
            end
        end
    end
}
