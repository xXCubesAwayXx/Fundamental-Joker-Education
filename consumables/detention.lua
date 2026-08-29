--  Detention
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
    loc_txt = {
        ['name'] = 'Detention',
        ['text'] = {
            [1] = '{C:green}#2# in #3# chance{} to {C:attention}go back 1 Ante{}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
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
