SMODS.Joker{ --Observer
    key = "observer",
    config = {
        extra = {
            odds = 8,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Observer',
        ['text'] = {
            [1] = 'observing...',
            [2] = '{C:green}#2# in #3#{} chance to actually be {C:attention}useful{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_observer') 
        return {vars = {card.ability.extra.ignore, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_468db6c0', 1, card.ability.extra.odds, 'j_flush_observer', false) then
              SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_dispenser' })
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