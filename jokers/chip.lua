--  Chip
SMODS.Joker {
    key = 'chip',
    loc_txt = {
        ['name'] = 'Chip',
        ['text'] = {
            [1] = '{C:attention}Booster packs{} allow you to {C:attention}choose 1 extra{} card'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
        return not (args.type == 'sho' or args.source == 'sho')
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_choice_mod = (G.GAME.modifiers.booster_choice_mod or 0) + 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_choice_mod = (G.GAME.modifiers.booster_choice_mod or 0) - 1
    end
}
