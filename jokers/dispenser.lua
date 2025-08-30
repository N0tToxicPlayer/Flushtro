SMODS.Joker{ --Dispenser
    key = "dispenser",
    config = {
        extra = {
            odds = 4,
            odds2 = 8,
            ignore = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dispenser',
        ['text'] = {
            [1] = 'When hand is played, {C:green}#3# in #4#{} chance',
            [2] = 'of creating a {C:rare}Rare{} Joker',
            [3] = '{C:green}#5# in #6#{} chance to turn into {C:attention}Observer{}',
            [4] = 'when the round ends',
            [5] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_dispenser')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_flush_dispenser')
        return {vars = {card.ability.extra.ignore, card.ability.extra.respect, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_54fb5e3d', 1, card.ability.extra.odds, 'j_flush_dispenser', false) then
              local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                          if joker_card then
                              
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
          end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_3e0ef10d', 1, card.ability.extra.odds, 'j_flush_dispenser', false) then
              SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        SMODS.calculate_effect({func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_observer' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
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
