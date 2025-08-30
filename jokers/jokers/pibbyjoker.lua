SMODS.Joker{ --Pibby Joker
    key = "pibbyjoker",
    config = {
        extra = {
            chips_min = 1,
            chips_max = 500,
            mult_min = 1,
            mult_max = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Pibby Joker',
        ['text'] = {
            [1] = 'this shit is so tuff'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 15
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = pseudorandom('chips_09f2ed10', card.ability.extra.chips_min, card.ability.extra.chips_max),
                    extra = {
                        mult = pseudorandom('mult_4fd4b708', card.ability.extra.mult_min, card.ability.extra.mult_max)
                        }
                }
        end
    end
}