SMODS.Blind	{
    key = 'bully',
    dollars = 5,
    mult = 2,
    pos = {y = 0 },
    atlas = "CustomBlinds",
    boss = { min = 2 },
    boss_colour = HEX("8f9c9f"),
    loc_vars = function(self)
        return { vars = {SMODS.get_probability_vars(self, 1, 4, 'fpe_bully')} }
    end,
    collection_loc_vars = function(self)
        return { vars = {'1', '4'} }
    end,

	recalc_debuff = function(self, card, from_blind)
			if G.GAME.blind_disabled then return false end
			for k, v in pairs(G.playing_cards) do
			if card.ability.fpe_bully_checked == nil then
			   card.ability.fpe_bully_checked = SMODS.pseudorandom_probability(blind, 'fpe_bully', 1, 4)
			return card.ability.fpe_bully_checked
			end
			end
			if card.ability.fpe_bully_checked == true and (card.area == G.hand or G.deck) then
				return true
			end
		return false
	end,
	defeat = function(self)
	        for k, v in pairs(G.playing_cards) do
            v.ability.fpe_bully_checked = nil
        end
	end,
	disable = function(self)
	        for k, v in pairs(G.playing_cards) do
            v.ability.fpe_bully_checked = nil
        end
	end	
}

SMODS.Blind {
	key = 'malice',
	dollars = 5,
	mult = 2,
	pos = {y = 1},
    atlas = "CustomBlinds",
    boss = { min = 4 },
    boss_colour = HEX("5D3B39"),
	    loc_vars = function(self)
        return { vars = {SMODS.get_probability_vars(self, 1, 3, 'fpe_malice')} }
    end,
    collection_loc_vars = function(self)
        return { vars = {'1', '3'} }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play then
            do
            if SMODS.pseudorandom_probability(blind, 'fpe_malice', 1, 3) then
                if context.other_card then
                    context.other_card.should_destroy = true
					G.GAME.blind.triggered = true
                end
                return {
                    message = localize('k_destroyed'),
                    colour = G.C.fpe_maliceblind
                }
            end
        end
    end
end
}

SMODS.Blind {
	key = 'compass',
	dollars = 5,
	mult = 2,
	pos = {y = 2},
    atlas = "CustomBlinds",
    boss = { min = 2 },
    boss_colour = HEX("303752"),
	loc_vars = function(self)
        return { vars = {compassXCash} }
    end,
    calculate = function(self, card, context)
        if context.after and SMODS.last_hand_oneshot then
		G.GAME.blind.triggered = true
                return {
                func = function()
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * 0.5
                    local dollar_value = current_dollars - target_dollars
                    ease_dollars(-dollar_value)
                    return true
                end
                }
        end
    end
}

SMODS.Blind {
	key = 'cryptid',
	dollars = 5,
	mult = 2,
	pos = {y = 3},
    atlas = "CustomBlinds",
    boss = { min = 4 },
    boss_colour = HEX("A7AEB7"),
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				number_format(lenient_bignum((get_blind_amount(G.GAME.round_resets.ante) * 0.1))),
			},
		}
	end,
	set_blind = function(self, reset, silent)
		G.GAME.blind.chips =
			2 * ((get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling) + ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.all) * (get_blind_amount(G.GAME.round_resets.ante) * 0.1)))
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
	disable = function(self, silent)
		G.GAME.blind.chips = get_blind_amount(G.GAME.round_resets.ante) * G.GAME.starting_params.ante_scaling
		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
	end,
}


SMODS.Blind {
	key = 'flask',
	dollars = 5,
	mult = 2,
	pos = {y = 4},
    atlas = "CustomBlinds",
    boss = { min = 4 },
    boss_colour = HEX("152817"),
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.flasked then
                    scored_card.flasked = true
                    scored_card:set_ability('c_base', nil, true)
					G.GAME.blind.triggered = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.flasked = nil
                            return true
                        end
                    }))
                end
			end
        end
    end
}

SMODS.Blind	{
    key = 'final_inquiry',
    dollars = 8,
    mult = 2,
    pos = {y = 5},
    atlas = "CustomBlinds",
    boss = {showdown = true},
    boss_colour = HEX("3f497f"),
	recalc_debuff = function(self, card, from_blind)
			if G.GAME.blind_disabled then return false end
			for k, v in pairs(G.playing_cards) do
			if next(SMODS.get_enhancements(card)) then
				return true
			end
		return false
		end
	end
}