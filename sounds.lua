-- Schedule Pack music
SMODS.Sound({
  vol = 1,
  key = "music_classbooster",
  path = "music_classbooster.ogg",
  select_music_track = function()
    if G.booster_pack and SMODS.OPENED_BOOSTER and
        SMODS.OPENED_BOOSTER.config.center.kind == "Class" 
        then
      return true
    end
    return false
  end
})

-- Circle quips
--- Winning
SMODS.Sound({
    key="quip_win_acceptable",
    path="circle_quips/quip_win_acceptable.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_win_bestgradeallday",
    path="circle_quips/quip_win_bestgradeallday.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_win_entitle",
    path="circle_quips/quip_win_entitle.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_win_gradeA",
    path="circle_quips/quip_win_gradeA.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_win_jimboquote",
    path="circle_quips/quip_win_jimboquote.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_win_morelikeit",
    path="circle_quips/quip_win_morelikeit.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_win_performanceinyears",
    path="circle_quips/quip_win_performanceinyears.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_win_seemeafterclass",
    path="circle_quips/quip_win_seemeafterclass.ogg",
    pitch=1,
    volume=1,
})

--- Losing
SMODS.Sound({
    key="quip_lose_abbie",
    path="circle_quips/quip_lose_abbie.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_lose_bluffing",
    path="circle_quips/quip_lose_bluffing.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_lose_failedme",
    path="circle_quips/quip_lose_failedme.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_lose_gradeF",
    path="circle_quips/quip_lose_gradeF.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_lose_housewinsagain",
    path="circle_quips/quip_lose_housewinsagain.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_lose_oreos",
    path="circle_quips/quip_lose_oreos.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_lose_thisinstant",
    path="circle_quips/quip_lose_thisinstant.ogg",
    pitch=1,
    volume=1,
})

SMODS.Sound({
    key="quip_lose_vendingmachine",
    path="circle_quips/quip_lose_vendingmachine.ogg",
    pitch=1,
    volume=1,
})

-- General sfx

-- Miss Circle scale
SMODS.Sound({
    key="circle_scale",
    path="circle_scale.ogg",
    pitch=1,
    volume=1,
})




