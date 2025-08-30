SMODS.Joker{ --Noob
    key = "noob",
    config = {
        extra = {
            Mult = 3,
            XMult = 3,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Noob',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult',
            [2] = '{C:green}#3# in #4#{} chance of {X:mult,C:white}X#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_noob') 
        return {vars = {card.ability.extra.Mult, card.ability.extra.XMult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.Mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_04e5f933', 1, card.ability.extra.odds, 'j_flush_noob', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.XMult}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}
