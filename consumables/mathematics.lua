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
    loc_txt = {
        ['name'] = 'Mathematics',
        ['text'] = {
            [1] = '{C:green}#2# in #3# chance{} to apply a {C:enhanced}permanent{}',
            [2] = '{C:red}+5 Mult{} {C:attention}bonus{} to {C:attention}2 selected cards{}'
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
