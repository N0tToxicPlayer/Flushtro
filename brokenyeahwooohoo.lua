SMODS.Joker{ --broken yeah wooohoo
    key = "brokenyeahwooohoo",
    config = {
        extra = {
            XMult = 3.402823669209385e+38,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'broken yeah wooohoo',
        ['text'] = {
            [1] = 'applies {X:mult,C:white,s:1.5}X#1#{} Mult',
            [2] = '{C:green}#2# in #3#{} chance of {C:attention}destroying{} itself',
            [3] = 'after the round ends'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_brokenyeahwooohoo') 
        return {vars = {card.ability.extra.XMult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.XMult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_3eb4a438', 1, card.ability.extra.odds, 'j_flush_brokenyeahwooohoo', false) then
              SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
          end
            end
        end
    end
}