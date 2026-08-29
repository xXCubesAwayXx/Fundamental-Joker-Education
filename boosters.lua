
SMODS.Booster {
    key = 'schedule_pack_normal_1',
    loc_txt = {
        name = "Schedule Pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}5{} {C:class}Class{} cards to be used immediately'
        },
        group_name = "Schedule Pack"
    },
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 4,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'Class',
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
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster {
    key = 'schedule_pack_normal_2',
    loc_txt = {
        name = "Schedule Pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}5{} {C:class}Class{} cards to be used immediately'
        },
        group_name = "Schedule Pack"
    },
    config = { extra = 3, choose = 1 },
    cost = 6,
    weight = 4,
    atlas = "CustomBoosters",
    pos = { x = 1, y = 0 },
    kind = 'Class',
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
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'schedule_pack_jumbo',
    loc_txt = {
        name = "Jumbo Schedule Pack",
        text = {
            [1] = 'Choose {C:attention}1{} of up to {C:attention}5{} {C:class}Class{} cards to be used immediately'
        },
        group_name = "Schedule Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 8,
    weight = 4,
    atlas = "CustomBoosters",
    pos = { x = 2, y = 0 },
    kind = 'Class',
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
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}

SMODS.Booster {
    key = 'schedule_pack_mega',
    loc_txt = {
        name = "Mega Schedule Pack",
        text = {
            [1] = 'Choose {C:attention}2{} of up to {C:attention}5{} {C:class}Class{} cards to be used immediately'
        },
        group_name = "Schedule Pack"
    },
    config = { extra = 5, choose = 2 },
    cost = 10,
    weight = 4,
    atlas = "CustomBoosters",
    pos = { x = 3, y = 0 },
    kind = 'Class',
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
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}