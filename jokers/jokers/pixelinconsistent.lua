SMODS.Joker{ --Pixel Inconsistent
    key = "pixelinconsistent",
    config = {
        extra = {
            Mult = 8,
            XMult = 8,
            mult = 5,
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'Pixel Inconsistent',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult',
            [2] = '{C:green}#3# in #4#{} chance of {C:mult}X#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 15
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
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_pixelinconsistent') 
        return {vars = {card.ability.extra.Mult, card.ability.extra.XMult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_a515b5a5', 1, card.ability.extra.odds, 'j_flush_pixelinconsistent', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.XMult}, card)
          end
                        return true
                    end
                }
            end
        end
    end
}