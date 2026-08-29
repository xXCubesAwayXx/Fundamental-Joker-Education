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
    loc_txt = {
        ['name'] = 'The Notebook',
        ['text'] = {
            [1] = '{C:enhanced}Enhances{} {C:attention}1 selected card{} into a {C:enhanced}Paper{} card'
        }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
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