--  Miss Bloomie
SMODS.Joker {
    key = 'miss_bloomie',
    loc_txt = {
        ["name"] = "Miss Bloomie",
        ["text"] = {
            "If discarded hand has only {C:attention}1{} card,",
            "{C:red}destroys{} that card and creates {C:attention}2{} copies with",
            "a random {C:enhanced}Enhancement{}, {C:attention}Seal{}, and {C:dark_edition}Edition",
            "{C:inactive}Optimized by{} {C:dark_edition, E:1}baldmorning!{}"
        }
    },
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
