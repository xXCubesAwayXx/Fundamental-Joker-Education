--  The Halls
SMODS.Consumable {
    key = 'the_halls',
    set = 'class',
    pos = {
        x = 0,
        y = 0
    },
    loc_txt = {
        ['name'] = 'The Halls',
        ['text'] = {
            [1] = 'Creates a random {C:uncommon}Student{} {C:attention}Joker{}',
            [2] = '{C:inactive}(Must have room){}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        do
            local created_joker = false
            if G.jokers and G.jokers.cards and G.jokers.config and #G.jokers.cards + (G.GAME.joker_buffer or 0) < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = (G.GAME.joker_buffer or 0) + 1
            G.E_MANAGER:add_event(Event({
            func = function()
            local joker_card = SMODS.add_card({ set = 'fpe_students' })
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
        end
    end,
    can_use = function(self, card)
        return true
    end
}
