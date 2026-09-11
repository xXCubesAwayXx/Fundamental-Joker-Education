-- Bronze Achievments
-- No, my homework!
SMODS.Achievement({
	key = "paper_destroyed",
	pos = {x = 0, y = 0},
	hidden_pos = { x = 0, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	--reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == 'ach_paper_destroyed' then	
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
	--reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == 'ach_top_marks' then	
			return true
		end
	end,
})

-- Silver Achievements
-- WHAT HAVE YOU DONE?!?
SMODS.Achievement({
	key = "alice",
	pos = {x = 1, y = 0},
	hidden_pos = { x = 1, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	--reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == 'ach_alice' then	
			return true
		end
	end,
})

-- Tutoring Session
SMODS.Achievement({
	key = "spawn_teacher",
	pos = {x = 1, y = 0},
	hidden_pos = { x = 1, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	--reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == 'ach_spawn_teacher' then	
			return true
		end
	end,
})

-- Golden Achievements
-- Perfect Attendance 
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
	--reset_on_startup = false,
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
	--reset_on_startup = false,
	unlock_condition = function(self, args)
		if G.GAME.round >= 150 then
		return true
		end
	end,
})
