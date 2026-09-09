
-- Students

-- Nice Kids
--  Claire
SMODS.Joker {
    key = 'claire',
    config = {
        extra = {
            dollars = 1.5,
            max = 10,
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.max
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            do
                local target_card = card
                if target_card then
                target_card:juice_up(1, 1)
                end
                return {
                func = function()
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * 1.5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(math.min(dollar_value, 10))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(1.5), colour = G.C.MONEY})
                    return true
                end
                }
            end
        end
    end
}

--  Engel
SMODS.Joker {
    key = 'engel',
    config = {
        extra = {
            create_consumable_count0 = 1,
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.create_consumable_count0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.blind.triggered then
                if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, set = pseudorandom_element({'Tarot', 'Planet', 'Spectral'}, pseudoseed('create_consumable_set')), soulable = true }) end
                local target_card = card
                if target_card then
                target_card:juice_up(1, 1)
                end
                return {
                    message = localize('k_plus_consumable'),
                    colour = G.C.GREEN
                }
            end
        end
    end
}

--  Bubble
SMODS.Joker {
    key = 'bubble',
    pos = {
        x = 2,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            do
                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed('create_tag')).key; local tag = Tag(selected_tag); tag:set_ability(); add_tag(tag)
                local target_card = card
                if target_card then
                target_card:juice_up(1, 1)
                end
                return {
                    message = 'Created Tag!',
                    colour = G.C.GREEN
                }
            end
        end
    end
}

--  Lana
SMODS.Joker {
    key = 'lana',
    config = {
        extra = { create_consumable_count0 = 1 }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.create_consumable_count0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            do
                if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, set = 'class' }) end
                return {
                    message = localize('k_plus_consumable'),
                    colour = G.C.GREEN
                }
            end
        end
    end
}

--  Abbie
SMODS.Joker {
    key = 'abbie',
    config = {
        extra = {
            abbieChips = 0
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.abbieChips,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind and context.main_eval then
            do
                local target_card = card
                if target_card then
                target_card:juice_up(1, 1)
                end
                return {
                    func = function()
                        card.ability.extra.abbieChips = (card.ability.extra.abbieChips) + 15
                        return true
                    end,
                    colour = G.C.BLUE
                }
            end
        end
        if context.joker_main then
            do
                return {
                    chips = card.ability.extra.abbieChips
                }
            end
        end
    end
}

--  Popular Kids and Nerds
--  Petunia
SMODS.Joker {
    key = 'petunia',
    config = {
        extra = { petuniaChips = 0 }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.petuniaChips
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or context.selling_card or context.ending_shop or context.starting_shop or context.ending_booster or context.skipping_booster or context.open_booster or context.skip_blind or context.before or context.pre_discard or context.setting_blind or context.using_consumeable) then
            do
                return {
                    func = function()
                        card.ability.extra.petuniaChips = #G.jokers.cards * 15
                        return true
                    end,
                    colour = G.C.BLUE
                }
            end
        end
        if context.joker_main then
            do
                return {
                    chips = card.ability.extra.petuniaChips
                }
            end
        end
    end
}

--  Lizzy
SMODS.Joker {
    key = 'lizzy',
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 8
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'j_fpe_lizzy')
        return {
            vars = {
                new_numerator0,
                new_denominator0
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            do
                if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_fpe_lizzy', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                    func = function()
                            local random_edition = SMODS.poll_edition({ key = 'edit_card_edition', no_negative = true, guaranteed = true })
                            if random_edition then
                                scored_card:set_edition(random_edition, true)
                            end
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                    end
                    }))
                    return {
                        colour = G.C.BLUE
                    }
                end
            end
        end
    end
}

--  Kevin
SMODS.Joker {
    key = 'kevin',
    pos = {
        x = 7,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',


    calculate = function(self, card, context)
        if context.ending_shop then
            do
                    SMODS.add_card({ set = 'Enhanced', area = G.deck })
                    return {
                        message = 'Added Card!',
                        colour = G.C.GREEN
                    }
                end
            end
        end
}

--  Cubbie
SMODS.Joker {
    key = 'cubbie',
    config = {
        extra = {
            var_cubbiePacks0 = 5,
            cubbiePacks = 0
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cubbiePacks,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.open_booster and context.main_eval then
            do
                return {
                    func = function()
                        card.ability.extra.cubbiePacks = (card.ability.extra.cubbiePacks) + card.ability.extra.var_cubbiePacks0
                        return true
                    end,
                    message = '+5 Mult',
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            do
                return {
                    mult = card.ability.extra.cubbiePacks
                }
            end
        end
    end
}

-- Chaotic Kids
--  Robby
SMODS.Joker {
    key = 'robby',
    config = {
        extra = { consumable_count_value = 2 }
    },
    pos = {
        x = 9,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.consumable_count_value
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if #G.consumeables.cards >= card.ability.extra.consumable_count_value then
                if #G.consumeables.cards > 0 then local c = pseudorandom_element(G.consumeables.cards, pseudoseed('destroy_consumable')); if c then SMODS.destroy_cards({c}) end end
                if #G.consumeables.cards > 0 then local c = pseudorandom_element(G.consumeables.cards, pseudoseed('destroy_consumable')); if c then SMODS.destroy_cards({c}) end end
                local created_joker = true
                G.E_MANAGER:add_event(Event({
                func = function()
                local joker_card = SMODS.add_card({ set = 'Joker', edition = 'e_negative', stickers = { 'perishable' }, force_stickers = true })
                return true
                end
                }))
                return {
                    message = 'Destroyed Consumable!',
                    colour = G.C.RED,
                    extra = {
                        message = 'Destroyed Consumable!',
                        colour = G.C.RED,
                        extra = {
                            message = created_joker and localize('k_plus_joker'),
                            colour = G.C.GREEN
                        }
                    }
                }
            end
        end
    end
}

--  Riley
SMODS.Joker {
    key = 'riley',
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 8,
            rileyChips = 0
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',



    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'j_fpe_riley')
        return {
            vars = {
                card.ability.extra.rileyChips,
                new_numerator0,
                new_denominator0
            }
        }
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy then
            return { remove = true }
        end
        if context.joker_main then
            do
                return {
                    chips = card.ability.extra.rileyChips
                }
            end
        end
        if context.discard then
            do
                if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_fpe_riley', false) then
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                    return {
                        remove = true,
                        message = localize('k_murdered'),
                        colour = G.C.RED,
                        extra = {
                            func = function()
                                card.ability.extra.rileyChips = (card.ability.extra.rileyChips) + 10
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                end
            end
        end
    end
}

-- Ruby
SMODS.Joker {
    key = 'ruby',
    pos = {
        x = 2,
        y = 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
    end
}

--  Skell
SMODS.Joker {
    key = 'skell',
    config = {
        extra = {
            Xmult = 1.5,
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.Xmult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}

-- Bullies
--  Oliver
SMODS.Joker {
    key = 'oliver',
    config = {
        extra = { oliverMult = 0 }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.oliverMult
            }
        }
    end,

    calculate = function(self, card, context)
if context.joker_main then
    local edition_tally = 0
    for k, v in pairs(G.playing_cards) do
        if v.edition then
            edition_tally = edition_tally + 1
        end
    end
card.ability.extra.oliverMult = edition_tally * 10
    return {mult = card.ability.extra.oliverMult}
end
end
}

--  Zip
SMODS.Joker {
    key = 'zip',
    pos = {
        x = 4,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) + 1
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) - 1
    end
}

-- Chip
local orig_open_chip = Card.open
function Card:open()
    local extra_picks = 0

    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if string.find(j.config.center.key, "chip") and not j.debuff then
                extra_picks = extra_picks + 1
                j:juice_up(0.3, 0.4)
            end
        end
    end

    if extra_picks > 0 and self.ability and self.ability.choose then
        self.ability.choose = self.ability.choose + extra_picks
    end

    if orig_open_chip then orig_open_chip(self) end
end

SMODS.Joker {
    key = 'chip',
    pos = {
        x = 6,
        y = 2
    },
    display_size = { w = 71 * 0.7, h = 95 * 0.7 },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
}

--  Edward
SMODS.Joker {
    key = 'edward',
    pos = {
        x = 3,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                local target_card = context.other_card
                return {
                    repetitions = 1,
                    message = localize('k_again_ex'),
                    extra = {
                        func = function()
                            target_card:juice_up(1, 1)
                            return true
                        end,
                        colour = G.C.WHITE
                    }
                }
            end
        end
    end
}

--  Teachers
--  Murder Teachers
--  Mister Compass
SMODS.Joker {
    key = 'mister_compass',
    config = {
        extra = {
            misterCompassxChips = 1
        }
    },
    pos = {
        x = 3,
        y = 2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.misterCompassxChips,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            do
                return {
                    x_chips = card.ability.extra.misterCompassxChips
                }
            end
        end
        if context.after and SMODS.last_hand_oneshot then
            return {
                func = function()
                     card.ability.extra.misterCompassxChips = (card.ability.extra.misterCompassxChips) + 0.5
                     return true
                   end,
                   message = localize(k_compass_scale),
                   colour = G.C.BLUE
                }
            end
    end
}

--  Miss Circle
SMODS.Joker {
    key = 'miss_circle',
    pos = {
        x = 6,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.missCirclexMult,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            do
                return {
                    Xmult = card.ability.extra.missCirclexMult
                }
            end
        end
        if context.after and SMODS.last_hand_oneshot then
            return {
                func = function()
                     card.ability.extra.missCirclexMult = (card.ability.extra.missCirclexMult) + 0.5
                     return true
                   end,
                   sound = 'fpe_circle_scale',
                   message = localize('k_circle_scale'), 
                   colour = G.C.RED
                }
            end
    end
  }
  
  -- Miss Thavel
  SMODS.Joker {
    key = 'miss_thavel',
    config = {
        extra = { create_consumable_count0 = 1 }
    },
    pos = {
        x = 7,
        y = 1
    },
    soul_pos = {
        x = 8,
        y = 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.create_consumable_count0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.main_eval then
            do
            if #G.consumeables.cards + (G.GAME.consumeable_buffer or 0) < G.consumeables.config.card_limit then SMODS.add_card({ area = G.consumeables, key = 'c_grim', set = 'Spectral' }) end
            return {
                message = localize('k_plus_consumable'),
                colour = G.C.GREEN
            }
        end
    end
end
}

--  Miss Bloomie
SMODS.Joker {
    key = 'miss_bloomie',
    pos = { x = 9, y = 1 },
    attributes = { "destroy_card", "enhancements", "seals", "editions" },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    atlas = "CustomJokers",
    calculate = function(self, card, context)
        if context.discard and #context.full_hand == 1 then
            local target_card = context.full_hand[1]
            if target_card then
                for i = 1, 2 do
                    SMODS.add_card({
                        suit = target_card.base.suit,
                        rank = target_card.base.value,
                        edition = SMODS.poll_edition({ guaranteed = true }),
                        seal = SMODS.poll_seal({ guaranteed = true }),
                        enhancement = SMODS.poll_enhancement({ guaranteed = true })
                    })
                end
                return {
                    remove = true,
                    message = localize("k_copied_ex")
                }
            end
        end
    end
}

-- Miss Emily
SMODS.Joker {
    key = 'miss_emily',
    pos = {
        x = 0,
        y = 2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
        SMODS.change_discard_limit(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
        SMODS.change_discard_limit(-1)
    end
}

--  Miss Grace
SMODS.Joker {
    key = 'miss_grace',
    pos = {
        x = 7,
        y = 2
    },
    cost = 30,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval and not context.blueprint then
            if ((G.GAME.chips or 0) / (G.GAME.blind.chips or 1) * 100) >= 50 then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}

--  Mister Demi
SMODS.Joker {
    key = 'mister_demi',
    config = {
        extra = {
            discards0 = 2,
            var_misterDemiDiscards0 = 2,
            misterDemiDiscards = 2
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.misterDemiDiscards,
                card.ability.extra.discards0,
                card.ability.extra.var_misterDemiDiscards0
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 2
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 2
    end,
    calculate = function(self, card, context)
        if context.ante_change then
            do
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.discards0).." Discards", colour = G.C.GREEN})
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards0
                        ease_discard(card.ability.extra.discards0)
                        return true
                    end,
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            card.ability.extra.misterDemiDiscards = (card.ability.extra.misterDemiDiscards) + card.ability.extra.var_misterDemiDiscards0
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}

-- Miss Sasha
SMODS.Joker {
    key = 'miss_sasha',
    config = {
        extra = { hand_size0 = 1 }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.hand_size0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 then
                return {
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hand_size0)..' Hand Limit', colour = G.C.BLUE})

                        G.hand:change_size(card.ability.extra.hand_size0)
                        return true
                    end,
                    colour = G.C.BLUE
                }
            end
        end
    end
}

-- Other
--  Δlice
SMODS.Joker {
    key = '_lice',
    config = {
        extra = {
            numerator_0 = 1,
            odds_0 = 2,
            aliceXMult = 1
        }
    },

    pos = {
        x = 4,
        y = 2
    },
    soul_pos = {x = 5, y = 2},
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator0, new_denominator0 = SMODS.get_probability_vars(card, self.config.extra.numerator_0, self.config.extra.odds_0, 'j_fpe__lice')
        return {
            vars = {
                card.ability.extra.aliceXMult,
                new_numerator0,
                new_denominator0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.discard then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group0', card.ability.extra.numerator_0, card.ability.extra.odds_0, 'j_fpe__lice', false) then
                    local target_card = card
                    if target_card then
                    target_card:juice_up(1, 1)
                    end
                    return {
                        func = function()
                                    context.other_card:set_edition("e_negative", true)
                                        return true
                        end,
                        message = 'Card Modified!',
                        colour = G.C.BLUE,
                        extra = {
                            func = function()
                                card.ability.extra.aliceXMult = (card.ability.extra.aliceXMult) + 0.5
                                return true
                            end,
                            colour = G.C.GREEN
                        }
                    }
                end
            end
        end
        if context.joker_main then
            do
                return {
                    Xmult = card.ability.extra.aliceXMult
                }
            end
        end
    end
}

SMODS.ObjectType({
    key = 'fpe_jokers',
    cards = {
        ['j_fpe_abbie'] = true,
        ['j_fpe_alice'] = true,
        ['j_fpe_bubble'] = true,
        ['j_fpe_chip'] = true,
        ['j_fpe_claire'] = true,
        ['j_fpe_cubbie'] = true,
        ['j_fpe_edward'] = true,
        ['j_fpe_engel'] = true,
        ['j_fpe_kevin'] = true,
        ['j_fpe_lana'] = true,
        ['j_fpe_lizzy'] = true,
        ['j_fpe_miss_bloomie'] = true,
        ['j_fpe_miss_circle'] = true,
        ['j_fpe_miss_emily'] = true,
        ['j_fpe_miss_grace'] = true,
        ['j_fpe_miss_sasha'] = true,
        ['j_fpe_miss_thavel'] = true,
        ['j_fpe_mister_compass'] = true,
        ['j_fpe_mister_demi'] = true,
        ['j_fpe_oliver'] = true,
        ['j_fpe_petunia'] = true,
        ['j_fpe_riley'] = true,
        ['j_fpe_robby'] = true,
        ['j_fpe_ruby'] = true,
        ['j_fpe_skell'] = true,
        ['j_fpe_zip'] = true,
    },
})
SMODS.ObjectType({
    key = 'fpe_students',
    cards = {
        ['j_fpe_abbie'] = true,
        ['j_fpe_bubble'] = true,
        ['j_fpe_chip'] = true,
        ['j_fpe_claire'] = true,
        ['j_fpe_cubbie'] = true,
        ['j_fpe_edward'] = true,
        ['j_fpe_engel'] = true,
        ['j_fpe_kevin'] = true,
        ['j_fpe_lana'] = true,
        ['j_fpe_lizzy'] = true,
        ['j_fpe_oliver'] = true,
        ['j_fpe_petunia'] = true,
        ['j_fpe_riley'] = true,
        ['j_fpe_robby'] = true,
        ['j_fpe_ruby'] = true,
        ['j_fpe_skell'] = true,
        ['j_fpe_zip'] = true,
    },
})
SMODS.ObjectType({
    key = 'fpe_teachers',
    cards = {
        ['j_fpe_miss_bloomie'] = true,
        ['j_fpe_miss_circle'] = true,
        ['j_fpe_miss_emily'] = true,
        ['j_fpe_miss_grace'] = true,
        ['j_fpe_miss_sasha'] = true,
        ['j_fpe_miss_thavel'] = true,
        ['j_fpe_mister_compass'] = true,
        ['j_fpe_mister_demi'] = true,
    },
})