--  ???
SMODS.Consumable {
    key = 'alices_room',
    set = 'Spectral',
    pos = {
        x = 9,
        y = 1
    },
        soul_pos = { x = 0, y = 2},
    loc_txt = {
        ['name'] = '???',
        ['text'] = {
            [1] = 'Awakens {C:legendary}Princess Alice{}',
            [2] = '{C:inactive}Must have room{}'
        }
    },
    cost = 15,
    unlocked = true,
    discovered = false,
    hidden = true,
    soul_set = 'fpe_class',
    soul_rate = 0.003,
    can_repeat_soul = true,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        do
            local created_joker = false
            if G.jokers and G.jokers.cards and G.jokers.config and #G.jokers.cards + (G.GAME.joker_buffer or 0) < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = (G.GAME.joker_buffer or 0) + 1
            G.E_MANAGER:add_event(Event({
            func = function()
            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_fpe__lice' })
                        G.GAME.joker_buffer = math.max(0, (G.GAME.joker_buffer or 1) - 1)
            return true
            end
            }))
            end
            return {
                message = created_joker and localize('k_plus_joker'),
                colour = G.C.GREEN
            }
        end
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end
}
