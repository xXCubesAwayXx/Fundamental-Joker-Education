if CardSleeves then
	local learningsleeve = CardSleeves.Sleeve {
    key = "learning",
    name = "Learning Sleeve",
    loc_txt = {
        ['name'] = 'Learning Sleeve',
        ['text'] = {
            [1] = 'Start with an {C:dark_edition}Eternal{} {C:class}Student{} Joker',
            [2] = '{C:attention}+1{} joker slot'
        }
    },
    atlas = "CustomSleeves",
    pos = { x = 0, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_fpe_learning_deck", stake = "stake_green" },
		loc_vars = function(self)
			return { vars = {} }
    end,
    apply = function(self, sleeve)
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

	local sleeveitems = {}
	if CardSleeves then
		sleeveitems = {
                learningsleeve,
		}
	end
end
return { name = "Sleeves", init = function() end, items = { sleeveitems } }
