-- Class Cards set details
SMODS.ConsumableType {
    key = 'class',
    primary_colour = HEX('A1B3CE'),
    secondary_colour = HEX('A1B3CE'),
    collection_rows = {
        8,
        8
    },
    shop_rate = 2,
    cards = {}
}

SMODS.UndiscoveredSprite {
    key = 'class',
    atlas = 'CustomConsumables',
    pos = {x = 1, y = 2}
}

--  000. The Halls
SMODS.Consumable {
    key = 'the_halls',
    set = 'class',
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    unlocked = true,
    discovered = false,
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
        return G.jokers and #G.jokers.cards < G.jokers.config.card_limit
    end
}

-- 001. Mathematics
SMODS.Consumable {
    key = 'mathematics',
    set = 'class',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            pb_mult0 = 5,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_mathematics')
        return {
            vars = {
                self.config.extra.pb_mult0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 2 and #G.hand.highlighted > 0 then
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_mathematics', false) then
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
                            G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult or 0
                            G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult + card.ability.extra.pb_mult0
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
                            message = localize('k_upgrade_ex'),
                            colour = G.C.MULT
                        }
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return #G.hand.highlighted <= 2 and #G.hand.highlighted > 0
end
}

-- 002. Language Arts
SMODS.Consumable {
    key = 'language_arts',
    set = 'class',
    pos = {
        x = 2,
        y = 0
    },
    config = {
        extra = {
            cards_selected_value0 = 3,
            cards_selected_value1 = 0,
            edit_count0 = 2,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_language_arts')
        return {
            vars = {
                self.config.extra.cards_selected_value0,
                self.config.extra.cards_selected_value1,
                self.config.extra.edit_count0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= card.ability.extra.cards_selected_value0 and #G.hand.highlighted > card.ability.extra.cards_selected_value1 then
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_language_arts', false) then
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
                local random_enhancement = SMODS.poll_enhancement({ key = 'random_enhance', guaranteed = true, no_replace = true })
                if random_enhancement then G.hand.highlighted[i]:set_ability(G.P_CENTERS[random_enhancement]) end
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
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return #G.hand.highlighted <= card.ability.extra.cards_selected_value0 and #G.hand.highlighted > card.ability.extra.cards_selected_value1
    end
}

--  003. Science
SMODS.Consumable {
    key = 'science',
    set = 'class',
    pos = {
        x = 3,
        y = 0
    },
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_science')
        return {
            vars = {
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        do
          local _handname, _played = 'High Card', -1
          for hand_key, hand in pairs(G.GAME.hands) do
          if hand.played > _played then
        _played = hand.played
        _handname = hand_key
         end
         end
        local most_played = _handname
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_science', false) then
      SMODS.upgrade_poker_hands({hands = most_played, from = card, level_up = 3})
                return {
                    message = localize('k_level_up_ex'),
                    colour = G.C.GREEN
                }
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return true
    end
}

--  004. History
SMODS.Consumable {
    key = 'history',
    set = 'class',
    pos = {
        x = 4,
        y = 0
    },
    config = {
        extra = {
            hands0 = 2,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_history')
        return {
            vars = {
                card.ability.extra.hands0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_history', false) then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hands0).." Hands", colour = G.C.GREEN})
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands0
                        ease_hands_played(card.ability.extra.hands0)
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
    end,
    can_use = function(self, card)
        return true
    end
}

--  005. Art
SMODS.Consumable {
    key = 'art',
    set = 'class',
    pos = {
        x = 5,
        y = 0
    },
    config = {
        extra = {
            hand_size0 = 2,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_art')
        return {
            vars = {
                self.config.extra.hand_size0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_art', false) then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hand_size0)..' Hand Limit', colour = G.C.BLUE})
                        G.hand:change_size(card.ability.extra.hand_size0)
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
    end,
    can_use = function(self, card)
        return true
    end
}

--  006. Music
SMODS.Consumable {
    key = 'music',
    set = 'class',
    pos = {
        x = 6,
        y = 0
    },
    config = {
        extra = {
            discards0 = 2,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Music',
        ['text'] = {
            [1] = '{C:green}#2# in #3# chance{} to give a permanent {C:red}+2 Discards{}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_music')
        return {
            vars = {
                self.config.extra.discards0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_music', false) then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards0).." Discards", colour = G.C.GREEN})
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards0
                        ease_discard(card.ability.extra.discards0)
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function() 
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
    end,
    can_use = function(self, card)
        return true
    end
}

--  007. Geometry
SMODS.Consumable {
    key = 'geometry',
    set = 'class',
    pos = {
        x = 7,
        y = 0
    },
    config = {
        extra = {
            cards_selected_value0 = 2,
            cards_selected_value1 = 0,
            pb_bonus0 = 25,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_geometry')
        return {
            vars = {
                self.config.extra.cards_selected_value0,
                self.config.extra.cards_selected_value1,
                self.config.extra.pb_bonus0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 2 and #G.hand.highlighted > 0 then
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_geometry', false) then
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
                            G.hand.highlighted[i].ability.perma_bonus = G.hand.highlighted[i].ability.perma_bonus or 0
                            G.hand.highlighted[i].ability.perma_bonus = G.hand.highlighted[i].ability.perma_bonus + card.ability.extra.pb_bonus0
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
                            message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS
                        }
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return #G.hand.highlighted <= card.ability.extra.cards_selected_value0 and #G.hand.highlighted > card.ability.extra.cards_selected_value1
    end
}

--  008. Theatre
SMODS.Consumable {
    key = 'theatre',
    set = 'class',
    pos = {
        x = 8,
        y = 0
    },
    config = {
        extra = {
            joker_count_value0 = 0,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_theatre')
        return {
            vars = {
                self.config.extra.joker_count_value0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        if #G.jokers.cards > card.ability.extra.joker_count_value0 then
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_theatre', false) then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

            local eligible_card = pseudorandom_element(editionless_jokers, 'fpe_theatre')
            eligible_card:set_edition('e_negative', true)
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end
}

--  009. Phys Ed
SMODS.Consumable {
    key = 'phys_ed',
    set = 'class',
    pos = {
        x = 9,
        y = 0
    },
    config = {
        extra = {
            shop_slots0 = 1,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_phys_ed')
        return {
            vars = {
                card.ability.extra.shop_slots0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        do
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_phys_ed', false) then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.booster_slots0)..' Booster Slots', colour = G.C.BLUE})
                        change_shop_size(card.ability.extra.shop_slots0)
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
    end
    end,
    can_use = function(self, card)
        return true
    end
}

--  010. Swimming
SMODS.Consumable {
    key = 'swimming',
    set = 'class',
    pos = {
        x = 0,
        y = 1
    },
    config = {
        extra = {
            booster_slots0 = 1,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_swimming')
        return {
            vars = {
                self.config.extra.booster_slots0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_swimming', false) then
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.booster_slots0)..' Booster Slots', colour = G.C.BLUE})
                        SMODS.change_booster_limit(card.ability.extra.booster_slots0)
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
    end,
    can_use = function(self, card)
        return true
    end
}

--  011. Chorus
SMODS.Consumable {
    key = 'chorus',
    set = 'class',
    pos = {
        x = 1,
        y = 1
    },
    config = {
        extra = {
            cards_selected_value0 = 2,
            cards_selected_value1 = 0,
            edit_count0 = 2,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_chorus')
        return {
            vars = {
                self.config.extra.cards_selected_value0,
                self.config.extra.cards_selected_value1,
                self.config.extra.edit_count0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= card.ability.extra.cards_selected_value0 and #G.hand.highlighted > card.ability.extra.cards_selected_value1 then
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_chorus', false) then
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
                local random_edition = SMODS.poll_edition({ key = 'random_edition', no_negative = true, guaranteed = true })
                if random_edition then G.hand.highlighted[i]:set_edition(random_edition, true) end
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
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return #G.hand.highlighted <= card.ability.extra.cards_selected_value0 and #G.hand.highlighted > card.ability.extra.cards_selected_value1
    end
}

--  012. Computer Lab
SMODS.Consumable {
    key = 'computer_lab',
    set = 'class',
    pos = {
        x = 2,
        y = 1
    },
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_computer_lab')
        return {
            vars = {
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        do
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_computer_lab', false) then
                local created_joker = false
                if G.jokers and G.jokers.cards and G.jokers.config and #G.jokers.cards + (G.GAME.joker_buffer or 0) < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = (G.GAME.joker_buffer or 0) + 1
                G.E_MANAGER:add_event(Event({
                func = function()
                local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                            G.GAME.joker_buffer = math.max(0, (G.GAME.joker_buffer or 1) - 1)
                return true
                end
                }))
                end
                return {
                    message = created_joker and localize('k_plus_joker'),
                    colour = G.C.GREEN
                }
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return true
    end
}

--  013. Detention
SMODS.Consumable {
    key = 'detention',
    set = 'class',
    pos = {
        x = 3,
        y = 1
    },
    config = {
        extra = {
            ante_value0 = 1,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_detention')
        return {
            vars = {
                self.config.extra.ante_value0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        do
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_detention', false) then
                local mod = -card.ability.extra.ante_value0; ease_ante(mod); G.GAME.round_resets.blind_ante = (G.GAME.round_resets.blind_ante or 0) + mod
                return {
                    message = 'Ante Updated',
                    colour = G.C.YELLOW
                }
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return true
    end
}

--  014. Administration
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
    cost = 5,
    unlocked = true,
    discovered = false,
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

--  015. Examination
SMODS.Consumable {
    key = 'examination',
    set = 'class',
    pos = {
        x = 5,
        y = 1
    },
    config = {
        extra = {
            edit_count0 = 2,
            numerator_0 = 1,
            odds_0 = 2
        }
    },
    cost = 5,
    unlocked = true,
    discovered = false,
    atlas = 'CustomConsumables',
    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'c_fpe_examination')
        return {
            vars = {
                self.config.extra.cards_selected_value0,
                self.config.extra.edit_count0,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'c_fpe_examination', false) then
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
                G.hand.highlighted[i]:set_seal('fpe_a_seal', nil, true)
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
                    message = 'A+!',
                    colour = G.C.SECONDARY_SET.Class
                    }
            else
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false,
                        blocking = false,
                        func = function()
                            play_sound('tarot2', 0.76, 0.4)
                            return true
                        end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true
            end
          }))
           end
        end
    end,
    can_use = function(self, card)
        return #G.hand.highlighted == 1
    end
}
