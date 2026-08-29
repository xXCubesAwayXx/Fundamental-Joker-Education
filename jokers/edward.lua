--  Edward
SMODS.Joker {
    key = 'edward',
    loc_txt = {
        ['name'] = 'Edward',
        ['text'] = {
            [1] = '{C:attention}Retriggers{} all {C:enhanced}Enhanced{} cards in the scoring hand'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                local target_card = context.other_card
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    extra = {
                        func = function()
                            target_card:juice_up(1, 1)
                            return true
                        end,
                        colour = G.C.WHITE
                    }
                }
            end
        end
    end
}
