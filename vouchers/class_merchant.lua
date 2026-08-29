SMODS.Voucher {
    key = 'class_merchant',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = { item_rate0 = 2 }
    },
    loc_txt = {
        ['name'] = 'Class Merchant',
        ['text'] = {
            [1] = '{C:class}Class{} cards appear {C:attention}2x{} more',
            [2] = 'frequently in the shop'
        },
        ['unlock'] = {
            [1] = 'No description'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    atlas = 'CustomVouchers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.item_rate0
            }
        }
    end,
    redeem = function(self, card)
        do
        G.GAME.class_rate = 2 * card.ability.extra.item_rate0
        return {
            message = 'Spawn Rate Changed',
            colour = G.C.BLUE
        }
    end
end
}
