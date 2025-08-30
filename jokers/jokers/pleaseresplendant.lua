SMODS.Joker{ --Please Resplendant
    key = "pleaseresplendant",
    config = {
        extra = {
            newdenominator = 20,
            odds = 1,
            resplendant = 0,
            ignore = 0,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Please Resplendant',
        ['text'] = {
            [1] = '{C:green}#4# in #1#{} chance of creating',
            [2] = 'a cool {C:dark_edition}negative{} {X:inactive,C:white,s:1.5}Resplendant{}',
            [3] = 'when shop is {C:attention}exited{}, destroys',
            [4] = 'itself if succesful'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 25,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_pleaseresplendant') 
        return {vars = {card.ability.extra.newdenominator, card.ability.extra.ignore, card.ability.extra.resplendant, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_a91baa07', 1, card.ability.extra.odds, 'j_flush_pleaseresplendant', false) then
              SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'flush_resplendant' })
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
                    card.ability.extra.denominator = math.max(0, (card.ability.extra.denominator) - 1)
                    return true
                end,
                    message = "-1 Denominator"
                }
            end
        end
    end
}