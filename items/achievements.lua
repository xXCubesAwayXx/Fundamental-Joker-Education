-- Tables
 local fpe_students = {
        ['j_fpe_abbie'] = true,
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
    }

 local fpe_teachers = {
        ['j_fpe_mister_compass'] = true,
        ['j_fpe_miss_circle'] = true,
        ['j_fpe_miss_thavel'] = true,
        ['j_fpe_miss_bloomie'] = true,
        ['j_fpe_miss_emily'] = true,
        ['j_fpe_mister_demi'] = true,
        ['j_fpe_miss_sasha'] = true,
        ['j_fpe_miss_grace'] = true,
    }
	
 local fpe_jokers = {
        ['j_fpe_abbie'] = true,
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
		['j_fpe_mister_compass'] = true,
        ['j_fpe_miss_circle'] = true,
        ['j_fpe_miss_thavel'] = true,
        ['j_fpe_miss_bloomie'] = true,
        ['j_fpe_miss_emily'] = true,
        ['j_fpe_mister_demi'] = true,
        ['j_fpe_miss_sasha'] = true,
        ['j_fpe_miss_grace'] = true,
		['j_fpe_alice'] = true,
    }

local fpe_class = {
	c_fpe_the_halls,
	c_fpe_mathematics,
	c_fpe_language_arts,
	c_fpe_science,
	c_fpe_history,
	c_fpe_art,
	c_fpe_music,
	c_fpe_geometry,
	c_fpe_theatre,
	c_fpe_phys_ed,
	c_fpe_swimming,
	c_fpe_chorus,
	c_fpe_computer_lab,
	c_fpe_detention,
	c_fpe_administration,
	c_fpe_examination,
	}

-- Bronze Achievments
-- Welcome to Paper School!

SMODS.Achievement({
	key = "first_student",
	pos = {x = 0, y = 0},
	hidden_pos = { x = 0, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      for S,B in pairs(fpe_students) do
			if G.P_CENTERS[S].discovered then
			return true
		end
		end
	end,
})

-- Registration
SMODS.Achievement({
	key = "first_class_card",
	pos = {x = 0, y = 0},
	hidden_pos = { x = 0, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
   if args.type == "ach_first_class_card" then	
			return true
		end
	end,
})

-- No, my homework!
SMODS.Achievement({
	key = "paper_destroyed",
	pos = {x = 0, y = 0},
	hidden_pos = { x = 0, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args and args.type == 'ach_paper_destroyed' then	
			return true
		end
	end,
})

-- Top Marks
SMODS.Achievement({
	key = "top_marks",
	pos = {x = 0, y = 0},
	hidden_pos = { x = 0, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args and args.type == 'ach_top_marks' then	
			return true
		end
	end,
})

-- Silver Achievements
-- Learning's More Fun With Everyone
function ach_learnings_more_fun()
local students_met = 0
for _, card in ipairs(G.P_CENTER_POOLS.fpe_students) do
    if card.discovered then
        students_met = students_met + 1
    end
end
if students_met == 17 then check_for_unlock({ type = "ach_all_friends" })
end
end

SMODS.Achievement({
	key = "all_friends",
	pos = {x = 1, y = 0},
	hidden_pos = { x = 1, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
		      if args and args.type == 'ach_all_friends' then	
			return true
		end
      end
})
  
-- WHAT HAVE YOU DONE?!?
SMODS.Achievement({
	key = "alice",
	pos = {x = 1, y = 0},
	hidden_pos = { x = 1, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args and args.type == 'ach_alice' then	
			return true
		end
	end
})

-- Tutoring Session
SMODS.Achievement({
	key = "spawn_teacher",
	pos = {x = 1, y = 0},
	hidden_pos = { x = 1, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args and args.type == 'ach_spawn_teacher' then	
			return true
		end
	end,
})

-- Schedule Overload

SMODS.Achievement({
	key = "schedule_overload",
	pos = {x = 1, y = 0},
	hidden_pos = { x = 1, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = 	function(self, args)
		if args.type == "ach_schedule_overload" then return true
      end
	  end
    })
  
-- Golden Achievements
-- Perfect Attendance 
function ach_perfect_attendance_unlock()
local full_attendant = true
for S,B in pairs(fpe_students) do
  if not next(SMODS.find_card(S)) then
    full_attendant = false
    break
end
if full_attendant then
 check_for_unlock({ type = "ach_perfect_attendance" })
end
end
end

SMODS.Achievement({
	key = "perfect_attendance",
	pos = {x = 2, y = 0},
	hidden_pos = { x = 2, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == "ach_perfect_attendance" then	
			return true
		end
	end,
})

-- Jimbo's Precious Little Life
SMODS.Achievement({
	key = "jpll",
	pos = {x = 2, y = 0},
	hidden_pos = { x = 2, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
		if G.GAME.round >= 150 then
		return true
		end
	end,
})

-- Golden Graduates
SMODS.Achievement({
	key = "golden_graduates",
	pos = {x = 2, y = 0},
	hidden_pos = { x = 2, y = 1 },
	bypass_all_unlocked = false,
	atlas = "CustomAchievements",
	reset_on_startup = false,
unlock_condition = function (self, args)
  if args and args.type == "win_stake" then
local fpe_students_gold_stake = 0
for _, j in ipairs(G.P_CENTER_POOLS.fpe_students) do
if get_joker_win_sticker(G.P_CENTERS[j.key], true) >= 8 then
fpe_students_gold_stake = fpe_students_gold_stake + 1 end end
if fpe_students_gold_stake == 17 then
    return true
end
end
end
})

-- Dedicated Scholar
function class_card_achievement()
local class_cards_discovered = 0
for _, card in ipairs(G.P_CENTER_POOLS.class) do
    if card.discovered then
        class_cards_discovered = class_cards_discovered + 1
    end
end
if class_cards_discovered == 16 then check_for_unlock({ type = "ach_schedule_overload" })
end
local total = 0
for _, c in ipairs(G.P_CENTER_POOLS.class) do
    local usage = G.PROFILES[G.SETTINGS.profile].consumeable_usage[c.key]
    if usage then
        total = total + usage.count
    end
end
if total >= 100 then check_for_unlock ({ type = "ach_dedicated_scholar" })
end
end

SMODS.Achievement({
	key = "dedicated_scholar",
	pos = {x = 2, y = 0},
	hidden_pos = { x = 2, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == "ach_dedicated_scholar" then	
			return true
		end
	end,
})

-- Diamond
-- Staff Meeting
function ach_staff_meeting_unlock()
local full_staff = true
for S,B in pairs(fpe_teachers) do
  if not next(SMODS.find_card(S)) then
    full_staff = false
    break
end
if full_staff then
 check_for_unlock({ type = "ach_staff_meeting" })
end
end
end

SMODS.Achievement({
	key = "staff_meeting",
	pos = {x = 3, y = 0},
	hidden_pos = { x = 3, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == "ach_staff_meeting" then	
			return true
		end
	end,
})

-- Ultimate Assembly!
function ach_ultimate_assembly_unlock()
local full_school = true
for S,B in pairs(fpe_jokers) do
  if not next(SMODS.find_card(S)) then
    full_school = false
    break
end
if full_school then
 check_for_unlock({ type = "ach_ultimate_assembly" })
end
end
end
SMODS.Achievement({
	key = "ultimate_assembly",
	pos = {x = 3, y = 0},
	hidden_pos = { x = 3, y = 1 },
	bypass_all_unlocked = false,
	atlas = "CustomAchievements",
	--reset_on_startup = false,
	unlock_condition = function(self, args)
	
	      if args.type == "ach_ultimate_assembly" then	
			return true
		end
	end,
})

-- BEST. TEACHERS. EVER!
SMODS.Achievement({
	key = "best_teachers_ever",
	pos = {x = 3, y = 0},
	hidden_pos = { x = 3, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = true,
unlock_condition = function (self, args)
  if args and args.type == "win_stake" then
local fpe_teachers_gold_stake = 0
for _, j in ipairs(G.P_CENTER_POOLS.fpe_teachers) do
if get_joker_win_sticker(G.P_CENTERS[j.key], true) >= 8 then
fpe_teachers_gold_stake = fpe_teachers_gold_stake + 1 end
 end
if fpe_teachers_gold_stake == 8 then
    return true
end
end
end
})

-- Ultimate
SMODS.Achievement({
	key = "baron_of_behavior",
	pos = {x = 4, y = 0},
	hidden_pos = { x = 4, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	reset_on_startup = false,
unlock_condition = function (self, args)
  if args and args.type == "win_stake" then
local fpe_jokers_gold_stake = 0
for _, j in ipairs(G.P_CENTER_POOLS.fpe_jokers) do
if get_joker_win_sticker(G.P_CENTERS[j.key], true) >= 8 then
fpe_jokers_gold_stake = fpe_jokers_gold_stake + 1 end
 end
if fpe_jokers_gold_stake == 26 then
    return true
end
end
end
})