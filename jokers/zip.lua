--  Zip
SMODS.Joker {
    key = 'zip',
    loc_txt = {
        ['name'] = 'Zip',
        ['text'] = {
            [1] = '{C:attention}Booster packs{} include {C:attention}1 extra card{}'
        }
    },
    pos = {
        x = 4,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) + 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) - 1
    end,
    calculate = function(self, card, context)
        if context.buying_self and not context.blueprint then
            do
                G.P_CENTERS["j_fpe_chip"].in_pool = function() return true end
                return {
                    message = "yarrr! >:3",
                    colour = G.C.MONEY
                }
            end
        end
    end
}
