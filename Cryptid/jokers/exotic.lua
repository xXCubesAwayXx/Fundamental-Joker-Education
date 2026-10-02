if Cryptid then
--  Katie
SMODS.Joker {
    key = 'katie',
    config = {
        extra = { katieExpMult = 1, is_expansion = true, is_creator = true }
    },
    pos = { x = 0,  y = 0 },
	soul_pos = { x = 2, y = 0, extra = { x = 1, y = 0 } },
    cost = 50,
    rarity = 'cry_exotic',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    atlas = 'ExoticJokers',
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.katieExpMult
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
card.ability.extra.katieExpMult = 1 + (edition_tally * 0.2)
    return {e_mult = card.ability.extra.katieExpMult}
end
end
}
end