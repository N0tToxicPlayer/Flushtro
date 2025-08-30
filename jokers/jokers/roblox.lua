SMODS.Joker{ --Roblox
    key = "roblox",
    config = {
        extra = {
            Chips = 3,
            xchips = 3,
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'Roblox',
        ['text'] = {
            [1] = '{X:chips,C:white}X#1#{} Chips',
            [2] = '{C:green}#2# in #3#{} chance of forcing',
            [3] = 'a {C:attention}game over{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_roblox') 
        return {vars = {card.ability.extra.Chips, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.xchips
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1b47cd10', 1, card.ability.extra.odds, 'j_flush_roblox', false) then
              SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Roblox Crashed!", colour = G.C.RED})
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end}, card)
          end
            end
        end
    end
}