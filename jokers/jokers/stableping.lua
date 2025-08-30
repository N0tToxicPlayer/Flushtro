SMODS.Joker{ --Stable Ping
    key = "stableping",
    config = {
        extra = {
            XMult = 3,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Stable Ping',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance of {X:mult,C:white}X#1#{} Mult',
            [2] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 18
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_stableping') 
        return {vars = {card.ability.extra.XMult, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_6d5295f2', 1, card.ability.extra.odds, 'j_flush_stableping', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.XMult}, card)
          end
            end
        end
    end
}