SMODS.Joker{ --Shedletsky
    key = "shedletsky",
    config = {
        extra = {
            Mult = 3,
            spawnedfriedchicken = 0
        }
    },
    loc_txt = {
        ['name'] = 'Shedletsky',
        ['text'] = {
            [1] = '{X:mult,C:white}^#1#{} Mult',
            [2] = 'spawns {C:attention}Fried Chicken{}',
            [3] = 'once when a Blind is {C:attention}selected{}',
            [4] = '{C:inactive,s:0.8}(you can sell the chicken but i wouldnt do it if i were you){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 13,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.Mult
                }
        end
        if context.setting_blind  then
            if (card.ability.extra.spawnedfriedchicken or 0) ~= 1 then
                return {
                    func = function()
                    card.ability.extra.spawnedfriedchicken = 1
                    return true
                end,
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_friedchicken' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_flush_friedchicken" then
              return false
          end
      end
      return true
  end)() and (card.ability.extra.spawnedfriedchicken or 0) == 1) then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!",
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_whywouldyoudothat' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "fuck you", colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}