SMODS.Joker{ --MisprintMisprint
    key = "misprintmisprint",
    config = {
        extra = {
            mult_min = 1,
            mult_max = 50,
            chips_min = 1,
            chips_max = 50
        }
    },
    loc_txt = {
        ['name'] = 'MisprintMisprint',
        ['text'] = {
            [1] = '{C:inactive}iVBORw0KGgoAAAANSUhEUgAAAEcAAABfCAYAAAC6Ndr{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 11
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = pseudorandom('mult_41bc27d1', card.ability.extra.mult_min, card.ability.extra.mult_max),
                    extra = {
                        chips = pseudorandom('chips_456531a0', card.ability.extra.chips_min, card.ability.extra.chips_max),
                        colour = G.C.CHIPS
                        }
                }
        end
    end
}