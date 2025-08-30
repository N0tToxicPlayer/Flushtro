SMODS.Joker{ --Noli
    key = "noli",
    config = {
        extra = {
            Retriggers = 3,
            odds = 3,
            hallucinations = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Noli',
        ['text'] = {
            [1] = 'Retriggers all {C:attention}face{} cards {C:attention}3{} times,',
            [2] = '{C:green}#5# in #6#{} chance of creating',
            [3] = 'a random {X:default,C:white}Hallucination{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_noli') 
        return {vars = {card.ability.extra.Retriggers, card.ability.extra.hallucinations, card.ability.extra.ignore, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    repetitions = card.ability.extra.Retriggers,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if ((function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_flush_hallucinationsi" then
              return false
          end
      end
      return true
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_flush_hallucinationsii" then
              return false
          end
      end
      return true
  end)() and (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_flush_hallucinationsiii" then
              return false
          end
      end
      return true
  end)()) then
                if SMODS.pseudorandom_probability(card, 'group_0_e5857023', 1, card.ability.extra.odds, 'j_flush_noli', false) then
              SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'flush_hallucinations' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
          end
            end
        end
    end
}