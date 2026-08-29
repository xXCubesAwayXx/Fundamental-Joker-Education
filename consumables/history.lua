--  History
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
    loc_txt = {
        ['name'] = 'History',
        ['text'] = {
            [1] = '{C:green}#2# in #3# chance{} to give a permanent {C:blue}+2 Hands{}'
        }
    },
    cost = 5,
    unlocked = true,
    discovered = true,
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
