SMODS.Joker{ --Please Mythical
    key = "pleasemythical",
    config = {
        extra = {
            newdenominator = 15,
            odds = 1,
            mythical = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Please Mythical',
        ['text'] = {
            [1] = '{C:green}#4# in #1#{} chance of',
            [2] = 'spawning a {X:enhanced,C:white,s:1.4}Mythical{}',
            [3] = 'joker when shop is {C:attention}exited{},',
            [4] = 'destroys itself if successful'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 15
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
    soul_pos = {
        x = 6,
        y = 15
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_pleasemythical') 
        return {vars = {card.ability.extra.newdenominator, card.ability.extra.ignore, card.ability.extra.mythical, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4c776f29', 1, card.ability.extra.odds, 'j_flush_pleasemythical', false) then
              SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'flush_mythical' })
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
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (card.ability.extra.newdenominator or 0) > 1 then
                return {
                    func = function()
                    card.ability.extra.newdenominator = math.max(0, (card.ability.extra.newdenominator) - 1)
                    return true
                end,
                    message = "-1 Denominator"
                }
            end
        end
    end
}