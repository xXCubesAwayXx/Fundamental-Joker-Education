--  Oliver
SMODS.Joker {
    key = 'oliver',
    config = {
        extra = { oliverMult = 0 }
    },
    loc_txt = {
        ['name'] = 'Oliver',
        ['text'] = {
            [1] = '{C:red}+10{} Mult for all cards {C:attention}in your full deck{} with an {C:dark_edition}Edition{}',
            [2] = '{C:inactive}(Currently{} {C:red}+#1#{} {C:inactive}Mult){}'
        }
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