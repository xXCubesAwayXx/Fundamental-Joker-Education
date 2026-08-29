--  Bubble
SMODS.Joker {
    key = 'bubble',
    loc_txt = {
        ['name'] = 'Bubble',
        ['text'] = {
            [1] = '{C:attention}When Boss Blind is defeated{}, creates a {C:attention}random Tag{}',
            [2] = '{C:inactive}(Must have room){}'
        }
    },
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
