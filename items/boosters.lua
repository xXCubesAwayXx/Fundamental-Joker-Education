
local class_digital_hallucinations_compat = {
	colour = HEX("a1b3ce"),
      loc_key = "fpe_plus_class",
      create = function()
          local ccard = create_card("class", G.consumeables, nil, nil, nil, nil, nil, "diha")
          ccard:set_edition({ negative = true }, true)
          ccard:add_to_deck()
          G.consumeables:emplace(ccard)
      end,
}

SMODS.Booster {
    key = 'schedule_pack_normal_1',
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 4,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'class',
    draw_hand = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "class",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("a1b3ce"))
        ease_background_colour({ new_colour = HEX('a1b3ce'), special_colour = HEX("a1b3ce"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { lighten(HEX('AC8491'), 0.2), lighten(HEX('8190B3'), 0.2), lighten(HEX('909A8B'), 0.2), lighten(HEX('AFAA86'), 0.2), lighten(HEX('AB7F75'), 0.2), lighten(HEX('6F719A'), 0.2), lighten(HEX('8B7B95'), 0.2), },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
	cry_digital_hallucinations = class_digital_hallucinations_compat
}


SMODS.Booster {
    key = 'schedule_pack_normal_2',
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 4,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    kind = 'class',
    draw_hand = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "class",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("a1b3ce"))
        ease_background_colour({ new_colour = HEX('a1b3ce'), special_colour = HEX("a1b3ce"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { lighten(HEX('AC8491'), 0.2), lighten(HEX('8190B3'), 0.2), lighten(HEX('909A8B'), 0.2), lighten(HEX('AFAA86'), 0.2), lighten(HEX('AB7F75'), 0.2), lighten(HEX('6F719A'), 0.2), lighten(HEX('8B7B95'), 0.2), },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
	cry_digital_hallucinations = class_digital_hallucinations_compat
 }

SMODS.Booster {
    key = 'schedule_pack_jumbo',
    config = { extra = 5, choose = 1 },
    cost = 8,
    weight = 4,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    kind = 'class',
    draw_hand = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "class",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("a1b3ce"))
        ease_background_colour({ new_colour = HEX('a1b3ce'), special_colour = HEX("a1b3ce"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { lighten(HEX('AC8491'), 0.2), lighten(HEX('8190B3'), 0.2), lighten(HEX('909A8B'), 0.2), lighten(HEX('AFAA86'), 0.2), lighten(HEX('AB7F75'), 0.2), lighten(HEX('6F719A'), 0.2), lighten(HEX('8B7B95'), 0.2), },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
	cry_digital_hallucinations = class_digital_hallucinations_compat
}

SMODS.Booster {
    key = 'schedule_pack_mega',
    config = { extra = 5, choose = 2 },
    cost = 10,
    weight = 1,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    kind = 'class',
    draw_hand = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "class",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("a1b3ce"))
        ease_background_colour({ new_colour = HEX('a1b3ce'), special_colour = HEX("a1b3ce"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { lighten(HEX('AC8491'), 0.2), lighten(HEX('8190B3'), 0.2), lighten(HEX('909A8B'), 0.2), lighten(HEX('AFAA86'), 0.2), lighten(HEX('AB7F75'), 0.2), lighten(HEX('6F719A'), 0.2), lighten(HEX('8B7B95'), 0.2), },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
	cry_digital_hallucinations = class_digital_hallucinations_compat
}