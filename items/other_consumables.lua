--  ???
SMODS.Consumable {
    key = 'alices_room',
    set = 'Spectral',
    pos = {
        x = 9,
        y = 1
    },
        soul_pos = { x = 0, y = 2},
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
    discovered = false,
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

-- The Notebook
SMODS.Consumable {
    key = 'the_notebook',
    set = 'Tarot',
    pos = {
        x = 6,
        y = 1
    },
    config = {
        extra = {
            cards_selected_value0 = 1,
            edit_count0 = 2
        }
    },
    cost = 3,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.cards_selected_value0,
                self.config.extra.edit_count0
            }
        }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == card.ability.extra.cards_selected_value0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = function() play_sound('tarot1'); used_card:juice_up(0.3, 0.5); return true end
                }))
                for i = 1, #G.hand.highlighted do
                    local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', delay = 0.15,
                        func = function() G.hand.highlighted[i]:flip(); play_sound('card1', percent); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end
                        }))
                    end
                    delay(0.2)
                    for i = 1, #G.hand.highlighted do
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
                            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_fpe_paper'])
                            return true
                            end}))
                        end
                        for i = 1, #G.hand.highlighted do
                            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.15,
                            func = function() G.hand.highlighted[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.highlighted[i]:juice_up(0.3, 0.3); return true end
                            }))
                        end
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,
                        func = function() G.hand:unhighlight_all(); return true end
                        }))
                        delay(0.5)
                        return {
                            colour = G.C.SECONDARY_SET.Tarot
                        }
                    end
                end,
                can_use = function(self, card)
                    return #G.hand.highlighted == card.ability.extra.cards_selected_value0
                end
            }

