-- Open House Tag
SMODS.Tag {
    key = "open_house",
    min_ante = 2,
    pos = { x = 0, y = 0 },
    atlas = 'CustomTags',
	shiny_atlas = 'ShinyTags',
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_schedule_pack_mega
    end,
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', HEX('a1b3ce'), function()
                local booster = SMODS.create_card { key = 'p_fpe_schedule_pack_mega', area = G.play }
                booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
                booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
                booster.T.w = G.CARD_W * 1.27
                booster.T.h = G.CARD_H * 1.27
                booster.cost = 0
                booster.from_tag = true
                G.FUNCS.use_card({ config = { ref_table = booster } })
                booster:start_materialize()
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}
-- Malice Tag
SMODS.Tag {
    key = "malice",
    min_ante = 2,
    pos = { x = 1, y = 0 },
    atlas = 'CustomTags',
	shiny_atlas = 'ShinyTags',
    apply = function(self, tag, context)
        if context.type == 'round_start_bonus' then
            tag:yep('+', HEX('7f3f3f'), function()
				G.GAME.blind.chips = G.GAME.blind.chips * 0.5
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end)
            tag.triggered = true
            return true
        end
    end
}
