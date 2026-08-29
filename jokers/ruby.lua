SMODS.Joker {
    key = 'ruby',
    loc_txt = {
        ['name'] = 'Ruby',
        ['text'] = {
            [1] = '{C:money}+1{} Voucher slot in the {C:money}shop{}'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
    end
}
