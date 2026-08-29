--  Lana
SMODS.Joker {
    key = 'lana',
    config = {
        extra = { create_consumable_count0 = 1 }
    },
    loc_txt = {
        ['name'] = 'Lana',
        ['text'] = {
            [1] = 'When {C:attention}blind is selected,{}',
            [2] = 'creates a random {C:class}Class{} card',
            [3] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 4,
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
                self.config.extra.create_consumable_count0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            do
                if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, set = 'class' }) end
                return {
                    message = localize('k_plus_consumable'),
                    colour = G.C.GREEN
                }
            end
        end
    end
}
