
if SMODS.Atlas then
  SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
  })
end

SMODS.Atlas{
    key = 'Placeholder', --atlas key
    path = 'placeholders.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}

SMODS.Atlas{
    key = 'Jokers', --atlas key
    path = 'Jokers.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}

SMODS.Joker{
    key = 'AEOM', --joker key
    loc_txt = { -- local text
        name = 'All Eyes On Me',
        text = {
          'All {C:attention}face{} Cards',
          'Grant {X:mult,C:white}X#1#{} Mult'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 3, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 7, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 0, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
	config = { 
		extra = {
			Xmult = 1.25,
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {center.ability.extra.Xmult}
		}
	end,
	calculate = function(self,card,context)
		 if context.individual and context.cardarea == G.play then
            if context.other_card:is_face() then
				return {
					card = card,
					Xmult = card.ability.extra.Xmult,
					colour = G.C.MULT
				}
			end
        end
	end
}

SMODS.Joker{
    key = 'Sybyrr', --joker key
    loc_txt = { -- local text
        name = 'Sybyrrrrrr',
        text = {
          'Disables {C:attention}Boss Blind{}',
		  'All {C:attention}Jokers{} give {C:attention}#1#${}'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 4, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    soul_pos = { x = 0, y = 1 },
    cost = 10, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 1, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
	config = { 
		extra = {
			money = 2
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.money
			}
		}
	end,
	calculate = function(self,card,context)
		if context.setting_blind and not self.getting_sliced then
            if context.blind.boss and not self.getting_sliced then
				return {
					G.GAME.blind:disable(),
					message = "Get Sybyrrrrrr'd!",
					colour = G.C.MULT
                }
            end
		end
		if context.other_joker then
			return {
				dollars = card.ability.extra.money,
				card = context.other_context and context.other_context.blueprint_card or context.other_card or nil,
			}
		end
	end
}

SMODS.Joker{
    key = 'Joe',
    loc_txt = {
        name = 'Joement',
        text = {
          'Gives {X:mult,C:white}#1#{} Mult',
		  'Removes {X:chip,C:white}25{} Chips'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 1, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 3, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 2, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
	config = { 
		extra = {
			mult = 15,
			chips = -25,
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.mult,
				center.ability.extra.chips
			}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				colour = G.C.MULT,
				chip_mod = card.ability.extra.chips,
				message = '-50 Chips',
				colour = G.C.CHIP,
				card = card
			}
		end
	end
}

SMODS.Joker{
	key = 'Dopi',
    loc_txt = {
        name = 'Dopi',
        text = {
          'Gains {X:mult,C:white}X0.25{} Mult every {C:attention}Joe{} Sold',
		  '{s:0.8}(Currently{} {X:mult,C:white,s:0.8}X#1#{} {s:0.8}Mult){}'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 0},
	config = {
		extra = {
			xMult = 1,
			xMult_gain = 0.25
		}
	},
	loc_vars = function(self, info_queue, center)
		return {
			vars = {
				center.ability.extra.xMult,
				center.ability.extra.xMult_gain
			}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then 
			return {
				Xmult = card.ability.extra.xMult,
				card = card
			}
		end
		if context.selling_card and (context.card.config.center.key == "j_nyx_Joe" or context.card.config.center.key == "j_nyx_joe2") then
			card.ability.extra.xMult = card.ability.extra.xMult + card.ability.extra.xMult_gain
			return {
				message = "Fuck you Joe",
				message_card = card
			}
		end
	end
}

SMODS.Joker{
    key = 'Eeffoc', --joker key
    loc_txt = { -- local text
        name = 'Coffee backwards is Eeffoc',
        text = {
          'And thats funny'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 1, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    --soul_pos = { x = 0, y = 0 },
    cost = 1, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 4, y = 0}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
	config = { 
		extra = {
			Xchips = 0,
			money = 1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xchips,
				center.ability.extra.money
			}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				Xchip_mod = card.ability.extra.Xchips,
				dollars = card.ability.extra.money,
				message = 'Its funny!',
				colour = G.C.CHIP,
				card = card
			}
		end
	end
}

SMODS.Joker{
    key = 'Neo', --joker key
    loc_txt = { -- local text
        name = '{C:purple,E:2}Ourpler{}',
        text = {
          '{C:purple,s:0.8}Ourpling{}',
		  'If the first {C:attention}hand{} has {C:attention}one card{}',
		  'Add a {C:purple}Purple Seal{} to it'
        },
    },
    atlas = 'Jokers', --atlas' key
	soul_pos = { x = 1, y = 1 },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 5, y = 0},
	calculate = function(self,card,context)
		if context.scoring_hand ~= nil and G.GAME.current_round.hands_played == 0 then
			if context.individual and #context.full_hand == 1 and context.cardarea == G.play then
				context.other_card:set_seal("Purple",nil,true)
			end
		end
	end
}

SMODS.Joker{
    key = 'Kirb', --joker key
    loc_txt = { -- local text
        name = 'Kirber',
        text = {
          'Gives {C:mult}+2{} Mult and {C:chips}+5{} Chips',
		  'For every level the played {C:attention}Poker{} {C:attention}hand{} has'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 6, y = 0},
	calculate = function(self,hand,context)
		if context.joker_main then
			return {
				mult_mod = (G.GAME.hands[context.scoring_name].level)*2,
				chip_mod = (G.GAME.hands[context.scoring_name].level)*5,
				message = "Kirbed!",
				message_card = card,
				card = card
			}
		end
	end
}

SMODS.Joker{
    key = 'Straz', --joker key
    loc_txt = { -- local text
        name = '{C:red}Beastmode{}',
        text = {
          '{C:Red}There can only be one{}'
        },
    },
    atlas = 'Jokers', --atlas' key
	soul_pos = { x = 2, y = 1 },
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 7, y = 0},
	config = { 
		extra = {
			Xmult = 5,
			odds = 10
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult,
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.odds
			}
		}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and context.cardarea == G.jokers then
			if pseudorandom('nyx_straz') < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
                    func = function()
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                            return true; end})) 
                        return true
                    end
                 })) 
				return {
					message = "Sniped!",
                    colour = G.C.RED
				}
			else 
				return {
					message = 'Nah, Id Win™'
				}
			end
		end
		if context.joker_main then 
			return {
				Xmult = card.ability.extra.Xmult,
				card = card
			}
		end
	end
}

SMODS.Joker{
    key = 'Asto', --joker key
    loc_txt = { -- local text
        name = 'Asto',
        text = {
          '{C:attention}Upgrades{} {C:planet}High Card{} when played',
		  '{C:green}#1#/69{} Chance to be {C:red}Destroyed{} and set {C:planet}High Card{} to {C:red}1{}'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 8, y = 0},
	config = { 
		extra = {
			odds = 69
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.odds
			}
		}
	end,
	calculate = function(self,card,context)
		if context.before and context.main_eval and context.scoring_name == "High Card" then
			return {
				level_up = true,
				message = localize('k_level_up_ex')
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			local decrease = (-1*G.GAME.hands['High Card'].level)+2
			if pseudorandom('nyx_asto') < G.GAME.probabilities.normal / card.ability.extra.odds then
				level_up_hand(card, 'High Card', nil, decrease)
				SMODS.smart_level_up_hand(card, 'High Card', nil, -1)
				G.E_MANAGER:add_event(Event({
                    func = function()
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                            return true; end})) 
                        return true
                    end
                })) 
			end
		end
	end
}

SMODS.Joker{
    key = 'Nicky', --joker key
    loc_txt = { -- local text
        name = 'The Nickle Monster',
        text = {
          'Either {X:mult,C:white}XMult{} of {X:mult,C:white}50{} or {X:mult,C:white}0.02{}',
		  '{C:inactive,s:0.8}Not Compatible with {}{C:green,s:0.8}Oops All 6s{}'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 3,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 9, y = 0},
	calculate = function(self,card,context)
		if context.joker_main then
			if math.random(1, 2) == 1 then 
				return {
					Xmult = 50,
					card = card
				}
			else 
				return {
					Xmult = 0.02,
					card = card
				}
			end
		end
	end
}

SMODS.Joker{
    key = 'Pyro',
    loc_txt = {
        name = 'Owner of DPG.tf',
        text = {
          'What more did you expect?'
        },
    },
    atlas = 'Jokers',
    rarity = 4,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 10, y = 0},
	calculate = function(self,card,context)
		if context.setting_blind then
			return {
				message = 'Server Crash!',
				message_card = card,
				G.jokers:remove_card(card),
				card:remove(),
				card = nil,
				SMODS.add_card {
					set = 'Joker',
					area = G.jokers,
					rarity = "Legendary"
				}
			}
		end
	end
}

SMODS.Joker{
    key = 'yummi',
    loc_txt = {
        name = 'Sorry!',
        text = {
          'Upon selecting a {C:attention}Blind{} deletes itself',
		  'With a {C:green}chance{} of spawning 2 random {C:attention}Jokers{}',
		  '{C:inactive,s:0.8}Not Compatible with{} {C:green,s:0.8}Oops All 6s{}'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 11, y = 0},
	calculate = function(self,card,context)
		if context.setting_blind then
			if math.random(1,2) == 1 then
				return {
					message = 'Fuck you Logger',
					message_card = card,
					G.jokers:remove_card(card),
					card:remove(),
					card = nil
				}
			else
				return {
					message = 'Fuck you Logger',
					message_card = card,
					G.jokers:remove_card(card),
					card:remove(),
					card = nil,
					SMODS.add_card {
						set = 'Joker',
						area = G.jokers,
					},
					SMODS.add_card {
						set = 'Joker',
						area = G.jokers
					}
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'Bozo',
    loc_txt = {
        name = 'bozo!',
        text = {
          'Changes all {C:attention}Cards{} in {C:attention}hand{}',
		  'To a random {C:attention}suit{} and {C:attention}rank{}'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 12, y = 0},
	calculate = function(self,card,context)
		if context.joker_main then 
			for i=1, #G.hand.cards do
				local percent = 1.15 - (i-0.999)/(#G.hand.cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('card1', percent);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.2)
            local _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('sigil'))
            for i=1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({func = function()
                    local card = G.hand.cards[i]
                    local suit_prefix = _suit..'_'
                    local rank_suffix = card.base.id < 10 and tostring(card.base.id) or
                                        card.base.id == 10 and 'T' or card.base.id == 11 and 'J' or
                                        card.base.id == 12 and 'Q' or card.base.id == 13 and 'K' or
                                        card.base.id == 14 and 'A'
                    card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                return true end }))
            end  
            local _rank = pseudorandom_element({'2','3','4','5','6','7','8','9','T','J','Q','K','A'}, pseudoseed('ouija'))
            for i=1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({func = function()
                    local card = G.hand.cards[i]
                    local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
                    local rank_suffix =_rank
                    card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
                return true end }))
            end
			for i=1, #G.hand.cards do
				local percent = 0.85 + (i-0.999)/(#G.hand.cards-0.998)*0.3
				G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() G.hand.cards[i]:flip();play_sound('tarot2', percent, 0.6);G.hand.cards[i]:juice_up(0.3, 0.3);return true end }))
			end
			delay(0.5)
		end
	end
}

SMODS.Joker{
	key = 'coin',
    loc_txt = {
        name = '{C:red,s:1.5,E:2}Fuck it, We Ball{}',
        text = {
          '{C:red}Mult{} is either {X:mult,C:white}^20{} or {C:red}Divided{} by {X:mult,C:white}100{}',
		  '{s:1.5,E:2}There is no inbetween{}',
		  'Sets hands to {C:attention}1{}',
		  '{C:inactive,s:0.8}Not Compatible with {}{C:green,s:0.8}Oops All 6s{}'
        },
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 13, y = 0},
	calculate = function(self,card,context)
		if context.setting_blind and not self.getting_sliced then
			if not (context.blueprint_card or self).getting_sliced then
				return {
					ease_hands_played(-G.GAME.current_round.hands_left+1, nil, true)
				}
			end
		end
		if context.joker_main then
			if math.random(1, 2) > 1 then 
				return {
					message = localize({
						type = "variable",
						key = "a_powmult",
						vars = { number_format(20) },
					}),
					Emult_mod = lenient_bignum(20),
					colour = G.C.DARK_EDITION,
					card = card,
				}
			else 
				return {
					Xmult = 0.01,
					message = 'Bye lol',
					message_card = card,
					card = card,
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'ragebait',
    loc_txt = {
        name = 'Rage Bait',
        text = {
          '{C:green}#1#/2{} Chance on selecting a {C:attention}Blind{} to',
		  'produce a {C:dark_edition}Negative{} {C:attention}Joe{}'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 14, y = 0},
	config = { 
		extra = {
			odds = 2
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.odds
			}
		}
	end,
	calculate = function(self,card,context)
		if context.setting_blind and pseudorandom('nyx_ragebait') < G.GAME.probabilities.normal / card.ability.extra.odds then
			if math.random(1,2) == 1 then
				return {
					message = 'Rage Baiter!',
					message_card = card,
					SMODS.add_card {
						key = 'j_nyx_Joe',
						edition = 'e_negative'
					}
				}
			else 
				return {
					message = 'Rage Baiter!',
					message_card = card,
					SMODS.add_card {
						key = 'j_nyx_joe2',
						edition = 'e_negative'
					}
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'no',
    loc_txt = {
        name = 'Just Say No!',
        text = {
          '{C:green}#1#/3{} Chance to refund a {C:attention}purchase{}'
        },
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 15, y = 0},
	config = { 
		extra = {
			odds = 3
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.odds
			}
		}
	end,
	calculate = function(self,card,context)
		if context.buying_card and pseudorandom('nyx_no') < G.GAME.probabilities.normal / card.ability.extra.odds then
            return {
                dollars = context.card.config.center.cost,
				message = "Refund!",
				message_card = card
            }
        end
	end
}

SMODS.Joker{
	key = 'duplicator',
    loc_txt = {
        name = 'Duplicator',
        text = {
          '{C:green}#1#/4{} Chance to Generate a {C:attention}Consumable{}',
		  'when using a {C:attention}Consumable{}'
        },
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 16, y = 0},
	config = { 
		extra = {
			odds = 4
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.odds
			}
		}
	end,
	calculate = function(self,card,context)
		if context.using_consumeable and pseudorandom('nyx_dupe') < G.GAME.probabilities.normal / card.ability.extra.odds then
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                play_sound('timpani')
                local card = create_card('Tarot_Planet', G.consumeables, nil, nil, nil, nil, G.GAME.current_tarot_planet)
                card:add_to_deck()
                G.consumeables:emplace(card)
            return true end }))
			delay(0.6)
		end
	end
}

SMODS.Joker{
	key = 'fuckbaron',
    loc_txt = {
        name = 'Fuck You Baron',
        text = {
          'Turns all played {C:attention}Kings{} into {C:attention}Queens{}'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 17, y = 0},
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			for i=1, #context.scoring_hand do
				if context.scoring_hand[i]:get_id() == 13 then
					G.E_MANAGER:add_event(Event({
						func = function()
							assert(SMODS.change_base(context.scoring_hand[i], nil, "Queen"))
							return true
						end
					}))
				end
			end
		end
	end
}

SMODS.Joker{
	key = 'milkmann',
    loc_txt = {
        name = 'The Milk Mann',
        text = {
          '{C:green}#2#/#1#{} Chance to {C:attention}create Milk{} when selecting {C:attention}blind{}',
		  '{C:green}Chance{} increases with every successful proc'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 18, y = 0},
	config = { 
		extra = {
			odds = 10
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.odds,
				(G.GAME and G.GAME.probabilities.normal or 1)
			}
		}
	end,
	calculate = function(self,card,context)
		if context.setting_blind then
			if pseudorandom('nyx_milk') < G.GAME.probabilities.normal / card.ability.extra.odds then
				SMODS.add_card {
					key = 'j_nyx_milk'
				}
				if card.ability.extra.odds > 1 then
					card.ability.extra.odds = card.ability.extra.odds - 1
				end
				return {
					message = "Milk!",
					message_card = card
				}
			else
				return {
					message = "Fuck",
					message_card = card
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'milk',
    loc_txt = {
        name = 'Milk',
        text = {
          'Gains {X:mult,C:white}0.2X{} Mult for every {C:attention}Milk{} owned',
		  '{C:green}#2#/3{} Chance to {C:red}not{} be {C:attention}consumed{} when leaving the {C:attention}shop{}',
		  '{C:inactive,s:0.9}(Currently{} {X:mult,C:white,s:0.8}#1#X{} {C:inactive,s:0.8}Mult){}'
        },
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 0,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x = 19, y = 0},
	config = { 
		extra = {
			Xmult = 1,
			odds = 3
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult,
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.odds
			}
		}
	end,
	in_pool = function(self)
		return false 
	end,
	set_ability = function(self, card, initial)
		card:set_edition('e_negative')
	end,
	calculate = function(self,card,context)
		if context.setting_blind then
			card.ability.extra.Xmult = 1
			for i=1, #SMODS.find_card("j_nyx_milk")-1 do
				card.ability.extra.Xmult = card.ability.extra.Xmult + 0.2
			end
		end
		if context.joker_main then
			return {
				Xmult = card.ability.extra.Xmult,
				card = card
			}
		end
		if context.ending_shop and not (pseudorandom('nyx_milk') < G.GAME.probabilities.normal / card.ability.extra.odds) then
			return {
				message = "Drunk!",
				message_card = card,
				G.E_MANAGER:add_event(Event({
                    func = function()
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                G.jokers:remove_card(card)
                                card:remove()
                                card = nil
                            return true; end})) 
                        return true
                    end
                })) 
			}
		end
	end
}

SMODS.Joker{
	key = 'snakeeyes',
    loc_txt = {
        name = 'Snake Eyes',
        text = {
          '{C:attention}Lucky{} Cards always give {C:mult}+#1#{} Mult'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 20, y = 0},
	config = { 
		extra = {
			mult = 20
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.mult
			}
		}
	end,
	in_pool = function(self, args) --equivalent to `enhancement_gate = 'm_lucky'`
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_lucky') then
                return true
            end
        end
        return false
    end,
	calculate = function(self,card,context)
		if context.main_scoring and context.cardarea == G.play then
			for i=1, #context.scoring_hand do
				if SMODS.has_enhancement(context.scoring_hand[i], "m_lucky") then
					SMODS.Enhancement:take_ownership('lucky', -- object key (class prefix not required)
						{
							calculate = function(self, card, context)
								if context.main_scoring and context.cardarea == G.play then
									return {
										mult = card.ability.extra.mult
									}
								end
							end
						},
						true
					)
				end
			end
		end
	end
}

SMODS.Joker{
	key = 'steamsale',
    loc_txt = {
        name = '{C:edition,E:1}Steam Sale{}',
        text = {
          '{C:dark_edition,E:1,s:2}EVERYTHING IS 50% OFF!{}',
		  '{C:red,s:0.5}Destroyed when leaving the shop{}'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 21, y = 0},
	config = { 
		extra = {
			discount = 50
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.discount
			}
		}
	end,
	calculate = function(self,card,context)
		if G.shop then
			G.E_MANAGER:add_event(Event({
				func = function()
					G.GAME.discount_percent = card.ability.extra.discount
					for _, v in pairs(G.I.CARD) do
						if v.set_cost then v:set_cost() end
					end
					return true
				end
			}))
		end
		if context.ending_shop then
			G.E_MANAGER:add_event(Event({
                func = function()
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                           G.jokers:remove_card(card)
                           card:remove()
                           card = nil
						return true; end})) 
					return true
				end
            })) 
		end
	end
}

SMODS.Joker{
	key = 'phi',
    loc_txt = {
        name = '{C:gold}Phi{}',
        text = {
          '{C:gold,s:1.2,E:2}The Golden Ratio{}',
		  'Scored {C:attention}Gold{} Cards give {X:mult,C:white}X#1#{}',
		  '{C:attention}Steel{} Cards in hand give {C:money}$#2#{}'
        },
    },
    atlas = 'Jokers',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 22, y = 0},
	config = { 
		extra = {
			Xmult = 1.5,
			money = 3
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult,
				center.ability.extra.money
			}
		}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_gold') then
			return {
                Xmult = card.ability.extra.Xmult,
				card = card
            }
		end
		if context.individual and context.cardarea == G.hand and context.other_card.config.center.key == 'm_steel' and not context.end_of_round then
			return {
                dollars = card.ability.extra.money
            }
		end
	end
}

SMODS.Joker{
    key = 'friend', --joker key
    loc_txt = { -- local text
        name = 'Best Friend', -- 
        text = {
          'Gives {C:mult}#3#{} Mult,',
		  'Gains {C:mult}+1{} Mult after every {C:attention}Blind{}',
		  'As your friend, he has a {C:green}#1#/3{} chance to give {C:money}$#4#{},', -- money
		  'and {C:green}#1#/6{} chance to create a {C:tarot}Tarot{} Card every hand played.',
		  '{C:inactive,s:0.7}snuggle... -w-{}'
        },
    },
    atlas = 'Jokers', --atlas' key
    rarity = 2, --rarity: 1 = Common, 2 = Uncommon, 3 = Rare, 4 = Legendary
    soul_pos = { x = 0, y = 3 },
    cost = 6, --cost
    unlocked = true, --where it is unlocked or not: if true, 
    discovered = true, --whether or not it starts discovered
    blueprint_compat = true, --can it be blueprinted/brainstormed/other
    eternal_compat = true, --can it be eternal
    perishable_compat = true, --can it be perishable
    pos = {x = 0, y = 2}, --position in atlas, starts at 0, scales by the atlas' card size (px and py): {x = 1, y = 0} would mean the sprite is 71 pixels to the right
	config = { 
		extra = {
			odds = 1,
			mult = 4,
			money = 2
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.odds,
				center.ability.extra.mult,
				center.ability.extra.money
			}
		}
	end,
	calculate = function(self,hand,context)
		local dollarAmnt = 0
		if context.joker_main then
			if pseudorandom('nyx_friend') < G.GAME.probabilities.normal / 3 then
				dollarAmnt = hand.ability.extra.money
			end
			if pseudorandom('nyx_friend2') < G.GAME.probabilities.normal / 6 then
				return {
					message = 'My gift to you <3',
					colour = G.C.PURPLE,
					mult = hand.ability.extra.mult,
					card = hand
				},
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.0, func = function()
					play_sound('timpani')
					local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'car')
					card:add_to_deck()
					G.consumeables:emplace(card)
				return true end })),
				delay(0.6)
			end
			if dollarAmnt > 0 then
				return {
					colour = G.C.GREEN,
					dollars = dollarAmnt,
					mult = hand.ability.extra.mult,
					card = hand
				}
			else
				return {
					mult = hand.ability.extra.mult,
					card = hand,
				}
			end
		end
		if context.end_of_round and context.cardarea == G.jokers then
			hand.ability.extra.mult = hand.ability.extra.mult + 1
			return {
				message = '+1 Mult',
				colour = G.C.RED
			}
		end
	end
}

SMODS.Joker{
	key = 'fate',
    loc_txt = {
        name = 'FATE',
        text = {
          'Copies the effects of all other Jokers'
        },
    },
    atlas = 'Jokers',
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 2},
	calculate = function(self, card, context)
		local effects = {}
		for i=1, #G.jokers.cards do -- for all jokers
			if G.jokers.cards[i] ~= card then -- not itself
				local other_joker = G.jokers.cards[i]

				local effect = SMODS.blueprint_effect(card, other_joker, context) -- get effect
				if effect then
					table.insert(effects, effect) -- add to array
				end
			end
		end
		return SMODS.merge_effects(effects) -- Do
		
		-- blueprint code
		-- local other_joker
		-- for i=1, #G.jokers.cards do
		-- 	if G.jokers.cards[i] == card and G.jokers.cards[i+1] then
		-- 		other_joker = G.jokers.cards[i+1]
		-- 	end
		-- end
		-- local effects = {}
		-- local effect = SMODS.blueprint_effect(card, other_joker, context)
		-- if effect then
		-- 	table.insert(effects, effect)
		-- end
		-- return SMODS.merge_effects(effects)
    end
}

-- unfinished jokers below--
-- unfinished jokers below--
-- unfinished jokers below--

SMODS.Joker{
	key = 'gummies',
    loc_txt = {
        name = 'Vitamin Gummies',
        text = {
          '{X:mult,C:white}X#1#{} Mult but decreases by {X:mult,C:white}X0.25{} every round',
		  "{C:inactive,E:1,s:0.8}You know you're only supposed to eat 2 a day right?{}"
        },
    },
    atlas = 'Placeholder',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    pos = {x = 3, y = 0},
	config = { 
		extra = {
			Xmult = 2
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult
			}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				Xmult = card.ability.extra.Xmult,
				card = card
            }
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.Xmult = card.ability.extra.Xmult - 0.25
			if card.ability.extra.Xmult == 1 then
				G.E_MANAGER:add_event(Event({
					func = function()
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
							return true; end})) 
						return true
					end
				}))
				return {
					message = 'Eaten!'
				}
			else
				return {
					message = '-X0.25',
					colour = G.C.RED
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'joe2',
    loc_txt = {
        name = 'Joe 2 - Electric Boogaloo',
        text = {
          '{C:green}#1#/2{} Chance of giving {X:mult,C:white}X5{} Mult!',
		  '{C:inactive,s:0.8}Not Compatible with {}{C:green,s:0.8}Oops All 6s{}',
		  '#2#'
        },
    },
    atlas = 'Placeholder',
    rarity = 1,
    cost = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 0},
	config = { 
		extra = {
			lie = 1,
			lie2 = '',
			count = 1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.lie,
				center.ability.extra.lie2,
				center.ability.extra.count
			}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			card.ability.extra.count = card.ability.extra.count + 1
			if card.ability.extra.count == 10 then
				card.ability.extra.lie = 0
				card.ability.extra.lie2 = 'Did you actually expect him to do something?'
				return {
					message = "Revealed!",
					card = card
				}
			else
				return {
					message = "Unlucky!",
					card = card
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'glut',
    loc_txt = {
        name = 'Glutton',
        text = {
          'Gain {C:red}+1{} Discard',
		  'Able to discard {C:red}6{} cards'
        },
    },
    atlas = 'Placeholder',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 0},
	config = { 
		extra = {
			discard = 1,
			limit = 1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.discard,
				center.ability.extra.limit
			}
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard
        ease_discard(card.ability.extra.discard)
		SMODS.change_discard_limit(card.ability.extra.limit)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard
        ease_discard(-card.ability.extra.discard)
		SMODS.change_discard_limit(-1 * card.ability.extra.limit)
		if not G.GAME.before_play_buffer then
			G.hand:unhighlight_all()
		end
	end
}

SMODS.Joker{
	key = 'allinred',
    loc_txt = {
        name = '{C:red,E:1}All In{}',
        text = {
          '{X:mult,C:white}X#1#{} Mult',
		  'Never see a {C:attention}shop{} again'
        },
    },
    atlas = 'Placeholder',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 3, y = 0},
	set_ability = function(self, card, initial)
		card:set_eternal(true)
	end,
	config = { 
		extra = {
			Xmult = 3,
			count = 1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult,
				center.ability.extra.count
			}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			card.ability.extra.count = 1
			return {
				Xmult = card.ability.extra.Xmult,
				card = card
			}
		end
		if G.shop and card.ability.extra.count == 1 then
			card.ability.extra.count = card.ability.extra.count + 1
			for i = 1, #G.jokers.cards do
				G.jokers.cards[i]:calculate_joker({ending_shop = true})
			end
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 1,
				func = function()
					G.shop.alignment.offset.y = G.ROOM.T.y + 29
					G.SHOP_SIGN.alignment.offset.y = -15
				return true
				end
			})) 
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 1.5,
				func = function()
					G.shop:remove()
					G.shop = nil
					G.SHOP_SIGN:remove()
					G.SHOP_SIGN = nil
					G.STATE_COMPLETE = false
					G.STATE = G.STATES.BLIND_SELECT
					G.CONTROLLER.locks.toggle_shop = nil
					return true
				end
			}))
		end
	end
}
SMODS.Joker{
	key = 'allinblack',
    loc_txt = {
        name = '{C:black,E:1}All In{}',
        text = {
          '{X:mult,C:white}X#1#{} Mult',
		  'Hand {C:attention}size{} is set to 1'
        },
    },
    atlas = 'Placeholder',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 3, y = 0},
	set_ability = function(self, card, initial)
		card:set_eternal(true)
	end,
	config = { 
		extra = {
			Xmult = 3,
			hand_size = 1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult,
				center.ability.extra.hand_size
			}
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.hand_size = G.hand.config.card_limit
		G.hand:change_size(-card.ability.extra.hand_size + 1)
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.hand:change_size(card.ability.extra.hand_size - 1)
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				Xmult = card.ability.extra.Xmult,
				card = card
			}
		end
	end
}
SMODS.Joker{
	key = 'allingreen',
    loc_txt = {
        name = '{C:green,E:1}All In{}',
        text = {
          '{X:mult,C:white}X#1#{} Mult',
		  'Joker {C:attention}slots{} are set to 1'
        },
    },
    atlas = 'Placeholder',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 3, y = 0},
	set_ability = function(self, card, initial)
		card:set_eternal(true)
	end,
	config = { 
		extra = {
			Xmult = 3,
			joker_slots = 1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult,
				center.ability.extra.joker_slots
			}
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.joker_slots = G.jokers.config.card_limit
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots + 1
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots - 1
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			return {
				Xmult = card.ability.extra.Xmult,
				card = card
			}
		end
	end
}

SMODS.Joker{
	key = 'allin',
    loc_txt = {
        name = '{C:edition,s:1.2,E:2}All in{}',
        text = {
          '{X:mult,C:white}X#1#{} Mult',
		  '{C:red}There is no shop{}',
		  '{C:red}There is only one hand{}',
		  '{C:red}Only one card{}',
		  '{C:red}Only one Joker{}'
        },
    },
    atlas = 'Placeholder',
    rarity = 2,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pos = {x = 3, y = 0},
	set_ability = function(self, card, initial)
		card:set_eternal(true)
	end,
	config = { 
		extra = {
			Xmult = 30,
			hand_size = 1,
			joker_slots = 1,
			count = 1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.Xmult,
				center.ability.extra.hand_size,
				center.ability.extra.joker_slots,
				center.ability.extra.count
			}
		}
	end,
	add_to_deck = function(self, card, from_debuff)
		card.ability.extra.hand_size = G.hand.config.card_limit
		G.hand:change_size(-card.ability.extra.hand_size + 1)
		card.ability.extra.joker_slots = G.jokers.config.card_limit
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slots + 1
		local deletable_jokers = {}
		for k, v in pairs(G.jokers.cards) do
			deletable_jokers[#deletable_jokers + 1] = v
		end
		local _first_dissolve = nil
		G.E_MANAGER:add_event(Event({
			trigger = "before",
			delay = 0.75,
			func = function()
				for k, v in pairs(deletable_jokers) do
					v:start_dissolve(nil, _first_dissolve)
					_first_dissolve = true
				end
				return true
			end,
		}))
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots - 1
		G.hand:change_size(card.ability.extra.hand_size - 1)
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			card.ability.extra.count = 1
			return {
				Xmult = card.ability.extra.Xmult,
				card = card
			}
		end
		if G.shop and card.ability.extra.count == 1 then
			card.ability.extra.count = card.ability.extra.count + 1
			for i = 1, #G.jokers.cards do
				G.jokers.cards[i]:calculate_joker({ending_shop = true})
			end
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 1,
				func = function()
					G.shop.alignment.offset.y = G.ROOM.T.y + 29
					G.SHOP_SIGN.alignment.offset.y = -15
				return true
				end
			})) 
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 1.5,
				func = function()
					G.shop:remove()
					G.shop = nil
					G.SHOP_SIGN:remove()
					G.SHOP_SIGN = nil
					G.STATE_COMPLETE = false
					G.STATE = G.STATES.BLIND_SELECT
					G.CONTROLLER.locks.toggle_shop = nil
					return true
				end
			}))
		end
	end
}

SMODS.Joker{
	key = 'temp',
    loc_txt = {
        name = '',
        text = {
          'Gains {X:mult,C:white}X#2#{} Mult for every card {C:attention}scored{}',
		  '{C:attention}Resets{} at the end of round',
		  '{C:inactive,s:0.8}Currently{} {X:mult,C:white,s:0.8}X#1#{} {C:inactive,s:0.8}Mult{}'
        },
    },
    atlas = 'Placeholder',
    rarity = 4,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 5, y = 0},
	config = { 
		extra = {
			xMult = 1.1,
			xMult_gain = 0.1,
			xMult_base = 1.1
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.xMult,
				center.ability.extra.xMult_gain,
				center.ability.extra.xMult_base
			}
		}
	end,
	calculate = function(self,card,context)
		if context.individual and context.cardarea == G.play then
			local xMult = card.ability.extra.xMult
			-- Upgrade the xMult if not blueprint
			if not context.blueprint then
				card.ability.extra.xMult = card.ability.extra.xMult + card.ability.extra.xMult_gain
			end
			return {
				x_mult = xMult,
				card = card
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			card:juice_up(0.3, 0.4)
			card.ability.extra.xMult = card.ability.extra.xMult_base
			return {
				message = "Reset",
				message_card = card,
				
			}
		end
	end
}

SMODS.Joker{
	key = 'scratch',
    loc_txt = {
        name = 'Scratch Ticket',
        text = {
          '{C:green}#2#/#1#{} Chance to give {C:money}$#3#{} every hand'
        },
    },
    atlas = 'Placeholder',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 0},
	config = { 
		extra = {
			odds = 15,
			money = 20
			
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.odds,
				(G.GAME and G.GAME.probabilities.normal or 1), 
				center.ability.extra.money
			}
		}
	end,
	calculate = function(self,card,context)
		if context.joker_main then
			if pseudorandom('nyx_scratch') < G.GAME.probabilities.normal / card.ability.extra.odds then
				return {
					dollars = card.ability.extra.money
				}
			else
				return {
					message_card = card,
					message = "Lost your mortgage"
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'rulebook',
    loc_txt = {
        name = 'Rulebook',
        text = {
          'Always start with {C:blue}#1#{} hands',
		  '{C:red}#2#{} discards, and {C:attention}#3#{} hand size'
        },
    },
    atlas = 'Placeholder',
    rarity = 1,
    cost = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 0},
	config = { 
		extra = {
			hands = 4,
			discards = 3,
			h_size = 8
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.hands,
				center.ability.extra.discards,
				center.ability.extra.h_size
			}
		}
	end,
	calculate = function(self,card,context)
		if context.setting_blind then
			G.GAME.round_resets.hands = card.ability.extra.hands
			G.GAME.current_round.hands_left = card.ability.extra.hands
			G.GAME.round_resets.discards = card.ability.extra.discards
			G.GAME.current_round.discards_left = card.ability.extra.discards
			G.hand:change_size(-G.hand.config.card_limit)
			G.hand:change_size(card.ability.extra.h_size)
		end
	end
}

SMODS.Joker{
	key = 'vending',
    loc_txt = {
        name = 'Vending Machine',
        text = {
          'When leaving the {C:attention}shop{} takes {C:money}$#1#{}',
		  'But has a {C:green}#2#/#3#{} chance to create a random {C:attention}Food{} Joker'
        },
    },
    atlas = 'Placeholder',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 0},
	config = { 
		extra = {
			cost = 1,
			odds = 3
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.cost,
				(G.GAME and G.GAME.probabilities.normal or 1),
				center.ability.extra.odds
			}
		}
	end,
	calculate = function(self,card,context)
		if context.ending_shop then
			if pseudorandom('nyx_scratch') < G.GAME.probabilities.normal / card.ability.extra.odds then
				local joker =  math.random(1,9)
				local vendingJokers = {'j_gros_michel', 'j_egg', 'j_ice_cream', 'j_cavendish', 'j_turtle_bean', 'j_popcorn', 'j_ramen', 'j_nyx_Sybyrr', 'j_nyx_gummies'}
				return { -- nyx code gone! :rofl: :rofl:			bitch - nyx
					SMODS.add_card {
						key = vendingJokers[joker]
					},
					dollars = -card.ability.extra.cost,
					card = card
				}
			else
				return {
					message_card = card,
					message = "Jammed!",
					dollars = -card.ability.extra.cost,
					card = card
				}
			end
			return {
				dollars = -card.ability.extra.cost,
				card = card
			}
		end
	end
}

SMODS.Joker{
	key = 'astone',
    loc_txt = {
        name = 'Ascension Stone',
        text = {
          'After 5 rounds, becomes a {C:purple}Legendary{} Joker... sometimes.',
		  "{C:inactive,s:0.8}(#1#/5){}",
        },
    },
    atlas = 'Placeholder',
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    pos = {x = 4, y = 0},
	config = {
		extra = {
			count = 0
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				center.ability.extra.count
			}
		}
	end,
	calculate = function(self,card,context)
		if context.end_of_round and context.cardarea == G.jokers then
			card.ability.extra.count = card.ability.extra.count + 1
			if card.ability.extra.count >= 5 and math.random(1, 3) == 1 then
				play_sound('timpani', 0.5)
				return {
					card:juice_up(0.3, 0.5),
					G.jokers:remove_card(card),
					card:remove(),
					card = nil,
					SMODS.add_card {
						set = 'Joker',
						legendary = true,
						area = G.jokers
					},
					message = "Ascended!"
				}
			else
				return {
					message = "" .. card.ability.extra.count .. "/5",
					message_card = card,
					colour = G.C.PURPLE
				}
			end
		end
	end
}

SMODS.Joker{
	key = 'Bell Curve',
    loc_txt = {
        name = 'Bell Curve',
        text = {
          'Converges the {C:attention}first{} and {C:attention}last{} scored cards towards {C:attention}8{}'
        },
    },
    atlas = 'Placeholder',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 3, y = 0},
	calculate = function(self,card,context)
		if context.before and context.main_eval and not context.blueprint then
			local first_card = context.scoring_hand[1]
			local last_card = context.scoring_hand[#context.scoring_hand]
			--Here comes some nyx code
			if tonumber(first_card:get_id()) > 8 then
					SMODS.modify_rank(first_card, -1)
					first_card:juice_up(0.3, 0.4)
					play_sound('card1')
			elseif tonumber(first_card:get_id()) < 8  then
				SMODS.modify_rank(first_card, 1)
					first_card:juice_up(0.3, 0.4)
					play_sound('card1')
			elseif tonumber(first_card:get_id()) == 8  then
				first_card:juice_up(0.3, 0.4)
				return {
					message = 'Already at 8',
					card = card,
					colour = G.C.PURPLE
				}
			end
			if context.scoring_hand[1] ~= context.scoring_hand[#context.scoring_hand] then
				if tonumber(last_card:get_id()) > 8 then
					SMODS.modify_rank(last_card, -1)
					last_card:juice_up(0.3, 0.4)
					play_sound('card1')
				elseif tonumber(last_card:get_id()) < 8 then
					SMODS.modify_rank(last_card, 1)
					last_card:juice_up(0.3, 0.4)
					play_sound('card1')
				elseif tonumber(last_card:get_id()) == 8 then
					last_card:juice_up(0.3, 0.4)
					return {
						message = 'Already at 8',
						card = card,
						colour = G.C.PURPLE
					}
				end
			end
		end
	end
}

--
--- Other Stuff ---
-- Tarot --
SMODS.Atlas{
    key = 'Tarot', --atlas key
    path = 'NewWeakness.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Consumable{
    key = 'NewWeakness', --key
    set = 'Tarot', --the set of the card: corresponds to a consumable type
    atlas = 'Tarot', 
    pos = {x = 0, y = 0},
    loc_txt = {
        name = 'Weakness', --name of card
        text = { --text of card
            'Decreases rank of up to #1# selected cards by 1'
        }
    },
    cost = 3,
    config = { max_highlighted = 2, min_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    -- SMODS.modify_rank will increment/decrement a given card's rank by a given amount
                    assert(SMODS.modify_rank(G.hand.highlighted[i], -1))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end
}
--
-- Spectral --

SMODS.Consumable {
    key = 'horizon',
    set = 'Spectral',
	atlas = 'Placeholder',
    pos = { x = 1, y = 0 },
    config = { extra = { seal = 'nyx_greenseal' }, max_highlighted = 1 },
	loc_txt = {
        name = 'Horizon', --name of card
        text = { --text of card
            'Add a {C:green}Green Seal{}',
			'to {C:attention}1{} selected',
			'card in your hand'
        }
    },
	cost = 3,
	unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_seal(card.ability.extra.seal, nil, true)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
SMODS.Consumable {
    key = 'ritual',
    set = 'Spectral',
	atlas = 'Placeholder',
    pos = { x = 1, y = 0 },
	loc_txt = {
        name = 'Ritual', --name of card
        text = { --text of card
            'Destroy a random {C:attention}Joker{}',
			'Add {C:dark_edition}Negative{} to random {C:attention}Joker{}'
        }
    },
	cost = 4,
	unlocked = true,
    discovered = true,
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.e_negative
    end,
    use = function(self, card, area, copier)
		local deletable_jokers = {}
		local chosen_joker = pseudorandom_element(G.jokers.cards, pseudoseed('ritual_choice'))
		deletable_jokers[#deletable_jokers + 1] = chosen_joker
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.75,
            func = function()
                for _, joker in pairs(deletable_jokers) do
                    joker:start_dissolve(nil, _first_dissolve)
                    _first_dissolve = true
                end
                return true
            end
        }))
        local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local eligible_card = pseudorandom_element(editionless_jokers, pseudoseed('ritual'))
                eligible_card:set_edition({ negative = true })
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.6)
    end,
    can_use = function(self, card)
        return G.jokers and next(SMODS.Edition:get_edition_cards(G.jokers, true))
    end
}
SMODS.Consumable {
    key = 'Curse',
    set = 'Spectral',
	atlas = 'Placeholder',
    pos = { x = 1, y = 0 },
	config = { 
		extra = {
			max_highlighted = 1
		}
	},
	loc_txt = {
        name = 'Curse', --name of card
        text = { --text of card
            'Add {C:attention}Eternal{} to a selected joker'
        }
    },
	cost = 3,
	unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
		if G.jokers.highlighted[1] then
			local chosen_joker = G.jokers.highlighted[1]
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
					chosen_joker:set_eternal(true)
					card:juice_up(0.3, 0.5)
					return true
				end
			}))
		end
    end,
	can_use = function(self, card)
        return #G.jokers.highlighted
    end
}
SMODS.Consumable {
    key = 'Blessing',
    set = 'Spectral',
	atlas = 'Placeholder',
    pos = { x = 1, y = 0 },
    config = { 
		extra = {
			max_highlighted = 1
		}
	},
	loc_txt = {
        name = 'Blessing', --name of card
        text = { --text of card
            'Remove all {C:attention}stickers{} from a selected Joker',
			'{C:inactive,s:0.8}If the joker has no stickers, this card will not be consumed{}'
        }
    },
	cost = 3,
	unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.seal]
        return { vars = { card.ability.max_highlighted } }
    end,
    use = function(self, card, area, copier)
		if G.jokers.highlighted[1] then
			local chosen_joker = G.jokers.highlighted[1]
			if chosen_joker.ability.eternal or chosen_joker.ability.perishable or chosen_joker.ability.rental then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.4,
					func = function()
						SMODS.Stickers.eternal:apply(chosen_joker, false)
						SMODS.Stickers.perishable:apply(chosen_joker, false)
						SMODS.Stickers.rental:apply(chosen_joker, false)
						card:juice_up(0.3, 0.5)
						return true
					end
				}))
			else
				SMODS.add_card {
					key = 'c_nyx_Blessing'
				}
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.4,
					func = function()
						attention_text({
							text = "No Stickers",
							scale = 1.3,
							hold = 1.4,
							major = card,
							backdrop_colour = G.C.SECONDARY_SET.Tarot,
							align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
								'tm' or 'cm',
							offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
							silent = true
						})
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.06 * G.SETTINGS.GAMESPEED,
							blockable = false,
							blocking = false,
							func = function()
								play_sound('tarot2', 0.76, 0.4)
								return true
							end
						}))
						play_sound('tarot2', 1, 0.4)
						card:juice_up(0.3, 0.5)
						return true
					end
				}))
			end
		end
    end,
	can_use = function(self, card)
        return #G.jokers.highlighted
    end
}

--
-- Seals --
local oldsmodsscorecard = SMODS.score_card
function SMODS.score_card(card, context)
    if not G.modprefix_sealkey and card:get_seal() == 'nyx_greenseal' and context.cardarea == G.hand then
        G.modprefix_sealkey = true
        context.cardarea = G.play
        SMODS.score_card(card, context)
        context.cardarea = G.hand
        G.modprefix_sealkey = nil
    end
    return oldsmodsscorecard(card, context)
end
-- Thank you somethingcom515 from the Balatro Discord for helping with this seal
SMODS.Atlas{
    key = 'Sealss', --atlas key
    path = 'Sealss.png', --atlas' path in (yourMod)/assets/1x or (yourMod)/assets/2x
    px = 71, --width of one card
    py = 95 -- height of one card
}
SMODS.Seal {
	name = "Green",
	key = "greenseal",
	badge_colour = G.C.GREEN,
	atlas = "Sealss",
	discovered = true,
	pos = { x = 0, y = 0 },
	loc_txt = {
		label = 'Green Seal',
		name = 'Green Seal',
		text = {
			'Cards held in hand are {C:attention}scored{}'
		}
	}
}
--

-- Booster Pack --

SMODS.Booster {
	key = 'testingboost',
	atlas = 'Placeholder',
	pos = { x = 0, y = 0 },
	cost = 4,
	kind = "Joker",
	loc_txt = {
        name = 'Testing Pack', --name of card
        text = { --text of card
            'Choose {C:attention}1{} of up to {C:attention}3{} Joker cards',
			'From the {C:attention,E:2}Testing{} Mod'
        }
    },
	config = { 
		extra = 3,
		choose = 1
	},
	create_card = function(self, card)
		local keys = {
			'j_nyx_AEOM',
			'j_nyx_Joe',
			'j_nyx_Dopi',
			'j_nyx_Eeffoc',
			'j_nyx_Neo',
			'j_nyx_Kirb',
			'j_nyx_Straz',
			'j_nyx_Asto',
			'j_nyx_Nicky',
			'j_nyx_yummi',
			'j_nyx_Bozo',
			'j_nyx_coin',
			'j_nyx_ragebait',
			'j_nyx_no',
			'j_nyx_duplicator',
			'j_nyx_fuckbaron',
			'j_nyx_milkmann',
			'j_nyx_snakeeyes',
			'j_nyx_steamsale',
			'j_nyx_phi',
			'j_nyx_gummies',
			'j_nyx_joe2',
			'j_nyx_glut',
			'j_nyx_allingreen',
			'j_nyx_allinred',
			'j_nyx_allinblack',
			'j_nyx_allin',
			'j_nyx_scratch',
			'j_nyx_rulebook',
			'j_nyx_vending'
		}
		local key = pseudorandom_element(keys,"nyx")
		return {key = key}
	end
	
}
--

-- DECKS --
SMODS.Atlas{
	key = 'Decks',
	path = 'Decks.png',
	px = 71,
	py = 95
}
SMODS.Back {
	key = 'milkdeck',
	atlas = 'Decks',
	pos = { x = 0, y = 0 },
	loc_txt = {
		name = "The Milk Deck",
		text = {
			'Start the game with a {C:attention}Milk Mann{}',
			'And an {C:green}Oops all 6s{}'
		}
	},
	unlocked = true,
    discovered = true,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card {
						key = 'j_nyx_milkmann',
						stickers = { "eternal" }
					}
					SMODS.add_card {
						key = 'j_oops'
					}
					return true
				end
			end,
		}))
	end
}
--


-- various presets --

--[[ Joker thingy
SMODS.Joker{
	key = '',
    loc_txt = {
        name = '',
        text = {
          ''
        },
    },
    atlas = 'Placeholder',
    rarity = 1,
    cost = 0,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = {x = 2, y = 0},
	config = { 
		extra = {
			
		}
	},
	loc_vars = function(self,info_queue,center)
		return{
			vars = {
				
			}
		}
	end,
	calculate = function(self,card,context)
		if  then
		
		end
	end
}
]]

--[[ Delete card thingy
			G.E_MANAGER:add_event(Event({
                func = function()
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
							G.jokers:remove_card(card)
							card:remove()
							card = nil
						return true; end})) 
					return true
				end
            })) 
]]