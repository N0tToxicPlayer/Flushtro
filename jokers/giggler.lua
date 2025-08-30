SMODS.Joker{ --Giggler
    key = "giggler",
    config = {
        extra = {
            ExpMult = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Giggler',
        ['text'] = {
            [1] = '{X:mult,C:white}^#1#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_glaggle"] = true },
    soul_pos = {
        x = 3,
        y = 8
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ExpMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.ExpMult
                }
        end
    end
}
