SMODS.Back {
    key = 'learning_deck',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = { joker_slots = 1 }
    },
    loc_txt = {
        ['name'] = 'Learning Deck',
        ['text'] = {
            [1] = 'Start with an {C:dark_edition}Eternal{} {C:class}Student{} Joker',
            [2] = '{C:attention}+1{} joker slot'
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.joker_slots
            }
        }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'fpe_students' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
    end
}