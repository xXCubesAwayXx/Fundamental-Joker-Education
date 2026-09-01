--  Administration
SMODS.Consumable {
    key = 'administration',
    set = 'class',
    pos = {
        x = 4,
        y = 1
    },
    config = {
        extra = { create_consumable_count0 = 2 }
    },
    loc_txt = {
        ['name'] = 'Administration',
        ['text'] = {
            [1] = 'Creates {C:attention}2{} random {C:class}Class{} cards'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.create_consumable_count0
            }
        }
    end,
    use = function(self, card, area, copier)
        do
            for _ = 1, card.ability.extra.create_consumable_count0 do if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, soulable = true, set = 'class' }) end end
            return {
                message = localize('k_plus_consumable'),
                colour = G.C.GREEN
            }
        end
    end,
    can_use = function(self, card)
        return (G.consumeables and #G.consumeables.cards < G.consumeables.config.card_limit) or
            (card.area == G.consumeables)
    end
}
