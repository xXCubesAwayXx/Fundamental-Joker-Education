--  Kevin
SMODS.Joker {
    key = 'kevin',
    loc_txt = {
        ['name'] = 'Kevin',
        ['text'] = {
            [1] = 'When {C:attention}exiting the shop,{} adds a random',
            [2] = '{C:enhanced}Enhanced{} {C:attention}playing card{} to your deck'
        }
    },

    pos = {
        x = 7,
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


    calculate = function(self, card, context)
        if context.ending_shop then
            do
                    SMODS.add_card({ set = 'Enhanced', area = G.deck })
                    return {
                        message = 'Added Card!',
                        colour = G.C.GREEN
                    }
                end
            end
        end
}