SMODS.Joker{ --Chefletsky
    key = "chefletsky",
    config = {
        extra = {
            odds = 6,
            odds2 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Chefletsky',
        ['text'] = {
            [1] = 'When hand is played, {C:green}#1# in #2#{}',
            [2] = 'chance of cooking up',
            [3] = 'a {C:dark_edition}Negative{} {C:attention}Fried Chicken{}',
            [4] = 'to sell',
            [5] = '{C:green}#3# in #4#{} chance of creating',
            [6] = '{C:attention}Eggletsky{} if you already',
            [7] = 'dont have one'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_chefletsky')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_flush_chefletsky')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_flush_eggletsky" then
              return false
          end
      end
      return true
  end)() then
                if SMODS.pseudorandom_probability(card, 'group_0_ad627dc9', 1, card.ability.extra.odds, 'j_flush_chefletsky', false) then
              local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_eggletsky' })
                          if joker_card then
                              joker_card:set_edition("e_negative", true)
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Its Eggletsky!", colour = G.C.BLUE})
          end
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_05b92184', 1, card.ability.extra.odds, 'j_flush_chefletsky', false) then
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
          end
            end
        end
    end
}