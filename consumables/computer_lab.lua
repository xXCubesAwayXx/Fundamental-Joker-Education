--  Computer Lab
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
    loc_txt = {
        ['name'] = 'Computer Lab',
        ['text'] = {
            [1] = '{C:green}#1# in #2# chance{} to spawn a random {C:rare}Rare{} Joker'
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
