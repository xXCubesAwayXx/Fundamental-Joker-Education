--  Abbie
SMODS.Joker {
    key = 'abbie',
    config = {
        extra = {
            abbieChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Abbie',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+15{} Chips when {C:attention}blind is skipped{}',
            [2] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 5,
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
                card.ability.extra.abbieChips,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and context.main_eval then
            do
                local target_card = card
                if target_card then
                target_card:juice_up(1, 1)
                end
                return {
                    func = function()
                        card.ability.extra.abbieChips = (card.ability.extra.abbieChips) + 15
                        return true
                    end,
                    colour = G.C.GREEN
                }
            end
        end
        if context.joker_main then
            do
                return {
                    chips = card.ability.extra.abbieChips
                }
            end
        end
    end
}
