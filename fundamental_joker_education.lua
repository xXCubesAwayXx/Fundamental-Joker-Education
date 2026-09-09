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

SMODS.Atlas({
    key = "CustomSleeves",
    path = "CustomSleeves.png",
    px = 73,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CryptidVouchers",
    path = "CryptidVouchers.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
JF_GLOBALS = JF_GLOBALS or {}

assert(SMODS.load_file("items/class.lua"))()
assert(SMODS.load_file("items/other_consumables.lua"))()
assert(SMODS.load_file("items/sounds.lua"))()
assert(SMODS.load_file("items/jokers.lua"))()
assert(SMODS.load_file("items/modifiers.lua"))()
assert(SMODS.load_file("items/vouchers.lua"))()
assert(SMODS.load_file("items/decks.lua"))()
assert(SMODS.load_file("items/sleeves.lua"))()
assert(SMODS.load_file("items/boosters.lua"))()
assert(SMODS.load_file("items/tags.lua"))()
assert(SMODS.load_file("items/quips.lua"))()
assert(SMODS.load_file("cryptid/vouchers.lua"))()