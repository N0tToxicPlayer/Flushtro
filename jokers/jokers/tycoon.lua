SMODS.Joker{ --Tycoon
    key = "tycoon",
    config = {
        extra = {
            TotalMoneyEarn = 1,
            Incremental = 1,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Tycoon',
        ['text'] = {
            [1] = '{C:money}+$#1#{} every round,',
            [2] = '{C:green}#3# in #4#{} chance of increasing by {C:money}$#2#{} when',
            [3] = 'hand is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_tycoon') 
        return {vars = {card.ability.extra.TotalMoneyEarn, card.ability.extra.Incremental, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = card.ability.extra.TotalMoneyEarn
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_38a8b712', 1, card.ability.extra.odds, 'j_flush_tycoon', false) then
              card.ability.extra.TotalMoneyEarn = (card.ability.extra.TotalMoneyEarn) + card.ability.extra.Incremental
                        
          end
            end
        end
    end
}