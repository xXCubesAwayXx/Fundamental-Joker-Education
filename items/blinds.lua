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

