--  Petunia
SMODS.Joker {
    key = 'petunia',
    config = {
        extra = { petuniaChips = 0 }
    },
    loc_txt = {
        ['name'] = 'Petunia',
        ['text'] = {
            [1] = '{C:blue}+15{} Chips for every {C:attention}owned Joker{}',
            [2] = '{C:inactive}Currently{} {C:blue}+#1#{} {C:inactive}Chips{}'
        }
    },
    pos = {
        x = 5,
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
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.petuniaChips
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or context.selling_card or context.ending_shop or context.starting_shop or context.ending_booster or context.skipping_booster or context.open_booster or context.skip_blind or context.before or context.pre_discard or context.setting_blind or context.using_consumeable) then
            do
                return {
                    func = function()
                        card.ability.extra.petuniaChips = #G.jokers.cards * 15
                        return true
                    end,
                    colour = G.C.BLUE
                }
            end
        end
        if context.joker_main then
            do
                return {
                    chips = card.ability.extra.petuniaChips
                }
            end
        end
    end
}
