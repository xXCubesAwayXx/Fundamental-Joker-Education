SMODS.Joker {
    key = 'miss_thavel',
    config = {
        extra = { create_consumable_count0 = 1 }
    },
    loc_txt = {
        ['name'] = 'Miss Thavel',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} is selected, creates a copy of {C:spectral}Grim{}',
            [2] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    soul_pos = {
        x = 8,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.create_consumable_count0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            do
            if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, key = 'c_grim', set = 'Spectral' }) end
            return {
                message = localize('k_plus_consumable'),
                colour = G.C.GREEN
            }
        end
    end
end
}
