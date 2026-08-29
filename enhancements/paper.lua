-- Paper
SMODS.Enhancement {
    key = "paper",
    name = "Paper",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xchips = 1.5,
            odds = 4
        }
    },
    loc_txt = {
        name = "Paper",
        text = {
            "{C:white,X:chips}X#1#{} Chips",
            "{C:green}#2# in #3#{} chance to {C:red}destroy{} self after scoring"
        }
    },
    atlas = "CustomEnhancements",
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "fpe_paper")
        return {
            vars = {
                card.ability.extra.xchips,
                numerator,
                denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.play and SMODS.pseudorandom_probability(card, "fpe_paper", 1, card.ability.extra.odds) then
            SMODS.destroy_cards(card)
        end
    end
}