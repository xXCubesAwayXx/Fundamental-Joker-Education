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
    key = "CustomAchievements",
    path = "CustomAchievements.png",
    px = 64,
    py = 64,
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
assert(SMODS.load_file("items/achievements.lua"))()
assert(SMODS.load_file("cryptid/vouchers.lua"))()

local ref = Game.main_menu
function Game:main_menu(change_context)
  for k, v in pairs(G.P_CENTERS) do
    if v.config and v.config.extra and type(v.config.extra) == "table" and v.config.extra.is_student then
      v.set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('student_joker_badge'), HEX('a1b3ce'),
          G.C.WHITE, 1)
      end
    end
  end
  ref(self, change_context)
end