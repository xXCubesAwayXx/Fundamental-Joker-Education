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
for S,B in ipairs(fpe_students) do
  if not next(find_joker(S)) then
    full_attendant = false
    break
end
if full_attendant then
 check_for_unlock({ type = "ach_perfect_attendace" })
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
if G.GAME.round == 150 then
  check_for_unlock({ type = "ach_jpll"})
  end

SMODS.Achievement({
	key = "jpll",
	pos = {x = 2, y = 0},
	hidden_pos = { x = 2, y = 1 },
	bypass_all_unlocked = true,
	atlas = "CustomAchievements",
	--reset_on_startup = false,
	unlock_condition = function(self, args)
	      if args.type == "ach_jpll" then	
			return true
		end
	end,
})