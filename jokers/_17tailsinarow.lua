SMODS.Joker{ --17 tails in a row
    key = "_17tailsinarow",
    config = {
        extra = {
            mod_probability = 3,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = '17 tails in a row',
        ['text'] = {
            [1] = '\"JUST GIVE ME A SINGLE {s:1.5,C:attention}CHARGE{}\"',
            [2] = '{C:attention}triples{} the listed{C:green} denominators{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "flush_cursed",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
          if context.mod_probability  then
          local numerator, denominator = context.numerator, context.denominator
                  denominator = denominator * card.ability.extra.mod_probability
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
    end
}
