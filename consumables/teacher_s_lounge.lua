--  Teacher's Lounge
SMODS.Consumable {
    key = 'teacher_s_lounge',
    set = 'Spectral',
    pos = {
        x = 7,
        y = 1
    },
    soul_pos = { x = 8, y = 1},
    loc_txt = {
        ['name'] = 'Teacher\'s Lounge',
        ['text'] = {
            [1] = 'Creates a random {C:legendary,E:1}Teacher{} {C:attention}Joker{}',
            [2] = '{C:inactive}Must have room{}'
        }
    },
    cost = 15,
    unlocked = true,
    discovered = true,
    hidden = true,
    soul_set = 'fpe_class',
    soul_rate = 0.003,
    can_repeat_soul = true,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
            local created_joker = false
            if G.jokers and G.jokers.cards and G.jokers.config and #G.jokers.cards + (G.GAME.joker_buffer or 0) < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = (G.GAME.joker_buffer or 0) + 1
            G.E_MANAGER:add_event(Event({
            func = function()
            local joker_card = SMODS.add_card({ set = 'fpe_teachers' })
                        G.GAME.joker_buffer = math.max(0, (G.GAME.joker_buffer or 1) - 1)
            return true
            end
            }))
            end
            play_sound('timpani')
            return {
                message = created_joker and localize('k_plus_joker'),
                colour = G.C.GREEN
            }
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end
}

