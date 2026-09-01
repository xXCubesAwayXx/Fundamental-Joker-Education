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
    end
}
