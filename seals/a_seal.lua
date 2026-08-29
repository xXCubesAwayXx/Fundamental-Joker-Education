SMODS.Seal {
    key = 'a_seal',
    pos = {
        x = 0,
        y = 0
    },
    badge_colour = HEX('FF4848'),
    loc_txt = {
        ['name'] = 'A+ Seal',
        ['label'] = 'A+ Seal',
        ['text'] = {
            [1] = '{C:planet}Levels up{} played hand when {C:attention}scored{}'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            do
            SMODS.smart_level_up_hand(card, context.scoring_name, false, 1)
            return {
                message = localize('k_level_up_ex'),
                colour = G.C.GREEN
            }
        end
    end
end
}
