--  Chorus
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
    loc_txt = {
        ['name'] = 'Chorus',
        ['text'] = {
            [1] = '{C:green}#4# in #5# chance{} to apply a random',
            [2] = '{C:dark_edition}edition{} to {C:attention}2 selected cards{}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
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
