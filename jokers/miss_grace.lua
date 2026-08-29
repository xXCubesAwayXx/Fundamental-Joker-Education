--  Miss Grace
SMODS.Joker {
    key = 'miss_grace',
    loc_txt = {
        ['name'] = 'Miss Grace',
        ['text'] = {
            [1] = '{C:attention}Prevents death{} when {C:attention}score{} is over {C:attention}50% of blind requirement{}',
            [2] = '{C:green}Does not destroy self{}'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    cost = 30,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval and not context.blueprint then
            if ((G.GAME.chips or 0) / (G.GAME.blind.chips or 1) * 100) >= 50 then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}
