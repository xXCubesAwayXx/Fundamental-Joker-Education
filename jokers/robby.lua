--  Robby
SMODS.Joker {
    key = 'robby',
    config = {
        extra = { consumable_count_value0 = 2 }
    },
    loc_txt = {
        ['name'] = 'Robby',
        ['text'] = {
            [1] = 'After {C:attention}defeating the boss blind{},',
            [2] = 'consumes two random {C:attention}Consumables{} and',
            [3] = 'crafts a random {C:enhanced}Perishable{} {C:dark_edition}Negative{} {C:attention}Joker{}'
        }
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
                self.config.extra.consumable_count_value0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            if #G.consumeables.cards >= card.ability.extra.consumable_count_value0 then
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
