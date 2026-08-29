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
    loc_txt = {
        ['name'] = 'Mister Demi',
        ['text'] = {
            [1] = '{C:red}+2 Discards{} when {C:money}obtained,{}',
            [2] = 'then {C:attention}scales that amount{} every {C:attention}Ante{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1# Discards{}{C:inactive}){}'
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
