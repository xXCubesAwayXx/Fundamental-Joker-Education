--  Engel
SMODS.Joker {
    key = 'engel',
    config = {
        extra = {
            create_consumable_count0 = 1,
        }
    },
    loc_txt = {
        ['name'] = 'Engel',
        ['text'] = {
            [1] = 'If played hand {C:attention}triggers the Boss Blind effect{},',
            [2] = 'creates a random {C:attention}consumable{}',
            [3] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 1,
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
                card.ability.extra.create_consumable_count0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.blind.triggered then
                if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, set = pseudorandom_element({'Tarot', 'Planet', 'Spectral'}, pseudoseed('create_consumable_set')), soulable = true }) end
                local target_card = card
                if target_card then
                target_card:juice_up(1, 1)
                end
                return {
                    message = localize('k_plus_consumable'),
                    colour = G.C.GREEN
                }
            end
        end
    end
}
