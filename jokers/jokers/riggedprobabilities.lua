SMODS.Joker{ --Rigged Probabilities
    key = "riggedprobabilities",
    config = {
        extra = {
            set_probability = 1,
            both = 0
        }
    },
    loc_txt = {
        ['name'] = 'Rigged Probabilities',
        ['text'] = {
            [1] = 'Makes all {C:green}probabilites{} {C:attention}guarranteed{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.fix_probability  then
        local numerator, denominator = context.numerator, context.denominator
                numerator = card.ability.extra.set_probability
        denominator = card.ability.extra.set_probability
      return {
        numerator = numerator, 
        denominator = denominator
      }
        end
    end
}