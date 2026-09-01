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
    loc_txt = {
        ['name'] = 'Chip',
        ['text'] = {
            [1] = '{C:attention}Booster packs{} allow you to {C:attention}choose 1 extra{} card',
            [2] = '{C:dark_edition}Debugged by Kranlax!{}'
        }
    },
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