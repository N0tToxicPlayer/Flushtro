SMODS.Joker{ --Neko Noob
    key = "nekonoob",
    config = {
        extra = {
            XMult = 3,
            ExpMult = 3,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Neko Noob',
        ['text'] = {
            [1] = 'what is this...',
            [2] = '{X:mult,C:white}X#1#{} Mult',
            [3] = '{C:green}#3# in #4#{} chance of {X:mult,C:white}^#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_nekonoob') 
        return {vars = {card.ability.extra.XMult, card.ability.extra.ExpMult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = card.ability.extra.XMult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_0431b560', 1, card.ability.extra.odds, 'j_flush_nekonoob', false) then
              SMODS.calculate_effect({e_mult = card.ability.extra.ExpMult}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}
