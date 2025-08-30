SMODS.Joker{ --10 Hour Burst
    key = "_10hourburst",
    config = {
        extra = {
            rounds = 2,
            odds = 6,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = '10 Hour Burst',
        ['text'] = {
            [1] = 'Copies the ability of the {C:attention}left{} and {C:attention}right{} of this joker,',
            [2] = 'destroys after {C:attention}#1#{} rounds,',
            [3] = '{C:green}#3# in #4#{} chance of destroying itself and',
            [4] = 'summoning {C:attention}10 Hour Burst Man{} when this card',
            [5] = 'is {C:attention}bought{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush__10hourburst') 
        return {vars = {card.ability.extra.rounds, card.ability.extra.ignore, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (card.ability.extra.rounds or 0) ~= 1 then
                return {
                    func = function()
                    card.ability.extra.rounds = math.max(0, (card.ability.extra.rounds) - 1)
                    return true
                end
                }
            elseif (card.ability.extra.rounds or 0) <= 1 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            end
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_27b27047', 1, card.ability.extra.odds, 'j_flush__10hourburst', false) then
              SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                        SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_10hourburstman' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "boii running at -1.96e-26 kmph", colour = G.C.BLUE})
            end
            return true
        end}, card)
          end
            end
        end
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos < #G.jokers.cards) and G.jokers.cards[my_pos + 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}
