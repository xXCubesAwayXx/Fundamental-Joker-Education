SMODS.Atlas({
    key = "modicon",
    path = "ModIcon.png",
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro",
    path = "balatro.png",
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomJokers",
    path = "CustomJokers.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables",
    path = "CustomConsumables.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements",
    path = "CustomEnhancements.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals",
    path = "CustomSeals.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomVouchers",
    path = "CustomVouchers.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks",
    path = "CustomDecks.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomBoosters",
    path = "CustomBoosters.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomTags",
    path = "CustomTags.png",
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
JF_GLOBALS = JF_GLOBALS or {}

assert(SMODS.load_file("consumables/sets.lua"))()
assert(SMODS.load_file("sounds.lua"))()
assert(SMODS.load_file("jokers/claire.lua"))()
assert(SMODS.load_file("jokers/engel.lua"))()
assert(SMODS.load_file("jokers/bubble.lua"))()
assert(SMODS.load_file("jokers/abbie.lua"))()
assert(SMODS.load_file("jokers/lana.lua"))()
assert(SMODS.load_file("jokers/petunia.lua"))()
assert(SMODS.load_file("jokers/lizzy.lua"))()
assert(SMODS.load_file("jokers/kevin.lua"))()
assert(SMODS.load_file("jokers/cubbie.lua"))()
assert(SMODS.load_file("jokers/robby.lua"))()
assert(SMODS.load_file("jokers/riley.lua"))()
assert(SMODS.load_file("jokers/skell.lua"))()
assert(SMODS.load_file("jokers/ruby.lua"))()
assert(SMODS.load_file("jokers/edward.lua"))()
assert(SMODS.load_file("jokers/zip.lua"))()
assert(SMODS.load_file("jokers/oliver.lua"))()
assert(SMODS.load_file("jokers/miss_circle.lua"))()
assert(SMODS.load_file("jokers/miss_thavel.lua"))()
assert(SMODS.load_file("jokers/miss_bloomie.lua"))()
assert(SMODS.load_file("jokers/miss_emily.lua"))()
assert(SMODS.load_file("jokers/mister_demi.lua"))()
assert(SMODS.load_file("jokers/miss_sasha.lua"))()
assert(SMODS.load_file("jokers/mister_compass.lua"))()
assert(SMODS.load_file("jokers/alice.lua"))()
assert(SMODS.load_file("jokers/chip.lua"))()
assert(SMODS.load_file("jokers/miss_grace.lua"))()
SMODS.ObjectType({
    key = 'fpe_jokers',
    cards = {
        ['j_fpe_abbie'] = true,
        ['j_fpe_alice'] = true,
        ['j_fpe_bubble'] = true,
        ['j_fpe_chip'] = true,
        ['j_fpe_claire'] = true,
        ['j_fpe_cubbie'] = true,
        ['j_fpe_edward'] = true,
        ['j_fpe_engel'] = true,
        ['j_fpe_kevin'] = true,
        ['j_fpe_lana'] = true,
        ['j_fpe_lizzy'] = true,
        ['j_fpe_miss_bloomie'] = true,
        ['j_fpe_miss_circle'] = true,
        ['j_fpe_miss_emily'] = true,
        ['j_fpe_miss_grace'] = true,
        ['j_fpe_miss_sasha'] = true,
        ['j_fpe_miss_thavel'] = true,
        ['j_fpe_mister_compass'] = true,
        ['j_fpe_mister_demi'] = true,
        ['j_fpe_oliver'] = true,
        ['j_fpe_petunia'] = true,
        ['j_fpe_riley'] = true,
        ['j_fpe_robby'] = true,
        ['j_fpe_ruby'] = true,
        ['j_fpe_skell'] = true,
        ['j_fpe_zip'] = true,
    },
})
SMODS.ObjectType({
    key = 'fpe_students',
    cards = {
        ['j_fpe_abbie'] = true,
        ['j_fpe_alice'] = true,
        ['j_fpe_bubble'] = true,
        ['j_fpe_chip'] = true,
        ['j_fpe_claire'] = true,
        ['j_fpe_cubbie'] = true,
        ['j_fpe_edward'] = true,
        ['j_fpe_engel'] = true,
        ['j_fpe_kevin'] = true,
        ['j_fpe_lana'] = true,
        ['j_fpe_lizzy'] = true,
        ['j_fpe_oliver'] = true,
        ['j_fpe_petunia'] = true,
        ['j_fpe_riley'] = true,
        ['j_fpe_robby'] = true,
        ['j_fpe_ruby'] = true,
        ['j_fpe_skell'] = true,
        ['j_fpe_zip'] = true,
    },
})
SMODS.ObjectType({
    key = 'fpe_teachers',
    cards = {
        ['j_fpe_miss_bloomie'] = true,
        ['j_fpe_miss_circle'] = true,
        ['j_fpe_miss_emily'] = true,
        ['j_fpe_miss_grace'] = true,
        ['j_fpe_miss_sasha'] = true,
        ['j_fpe_miss_thavel'] = true,
        ['j_fpe_mister_compass'] = true,
        ['j_fpe_mister_demi'] = true,
    },
})
assert(SMODS.load_file("consumables/the_halls.lua"))()
assert(SMODS.load_file("consumables/mathematics.lua"))()
assert(SMODS.load_file("consumables/language_arts.lua"))()
assert(SMODS.load_file("consumables/science.lua"))()
assert(SMODS.load_file("consumables/history.lua"))()
assert(SMODS.load_file("consumables/art.lua"))()
assert(SMODS.load_file("consumables/music.lua"))()
assert(SMODS.load_file("consumables/geometry.lua"))()
assert(SMODS.load_file("consumables/theatre.lua"))()
assert(SMODS.load_file("consumables/phys_ed.lua"))()
assert(SMODS.load_file("consumables/swimming.lua"))()
assert(SMODS.load_file("consumables/chorus.lua"))()
assert(SMODS.load_file("consumables/computer_lab.lua"))()
assert(SMODS.load_file("consumables/detention.lua"))()
assert(SMODS.load_file("consumables/administration.lua"))()
assert(SMODS.load_file("consumables/examination.lua"))()
assert(SMODS.load_file("consumables/the_notebook.lua"))()
assert(SMODS.load_file("consumables/teacher_s_lounge.lua"))()
assert(SMODS.load_file("consumables/alices_room.lua"))()
assert(SMODS.load_file("enhancements/paper.lua"))()
assert(SMODS.load_file("seals/a_seal.lua"))()
assert(SMODS.load_file("vouchers/class_merchant.lua"))()
assert(SMODS.load_file("vouchers/class_tycoon.lua"))()
assert(SMODS.load_file("decks/learning_deck.lua"))()
assert(SMODS.load_file("boosters.lua"))()
assert(SMODS.load_file("tags.lua"))()