SMODS.Joker{ --BFDI Mouth
    key = "bfdimouth",
    config = {
        extra = {
            Mult = 4,
            RareMult = 2763,
            odds = 6
        }
    },
    loc_txt = {
        ['name'] = 'BFDI Mouth',
        ['text'] = {
            [1] = '{s:2,C:attention}YEAH!{}',
            [2] = '{C:mult}+#1#{} Mult',
            [3] = '{C:green}#3# in #4#{} chance',
            [4] = 'of applying {C:red}+#4#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 2
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_bfdimouth') 
        return {vars = {card.ability.extra.Mult, card.ability.extra.RareMult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.Mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_4aa66bb5', 1, card.ability.extra.odds, 'j_flush_bfdimouth', false) then
              SMODS.calculate_effect({mult = card.ability.extra.RareMult}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}