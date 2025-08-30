SMODS.Joker{ --Cloaker Noob
    key = "cloakernoob",
    config = {
        extra = {
            ExpMult = 3,
            ExpExpMult = 27,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Cloaker Noob',
        ['text'] = {
            [1] = 'Whats that ringing noise?',
            [2] = '{X:mult,C:white}^#1#{} Mult',
            [3] = '{C:green}#3# in #4#{} chance of {X:mult,C:white}^#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 4
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_cloakernoob') 
        return {vars = {card.ability.extra.ExpMult, card.ability.extra.ExpExpMult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    e_mult = card.ability.extra.ExpMult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_fdc26278', 1, card.ability.extra.odds, 'j_flush_cloakernoob', false) then
              SMODS.calculate_effect({e_mult = card.ability.extra.ExpExpMult}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}
