SMODS.Joker {
    key = 'miss_emily',
    loc_txt = {
        ['name'] = 'Miss Emily',
        ['text'] = {
            [1] = '{C:blue}+1 Play{} Size',
            [2] = '{C:red}+1 Discard{} Size'
        }
    },
    pos = {
        x = 0,
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
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
        SMODS.change_discard_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
        SMODS.change_discard_limit(-1)
    end
}
