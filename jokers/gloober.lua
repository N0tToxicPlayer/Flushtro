SMODS.Joker{ --Gloober
    key = "gloober",
    config = {
        extra = {
            ExpMult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Gloober',
        ['text'] = {
            [1] = '{X:chips,C:white}^#1#{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_glaggle"] = true },
    soul_pos = {
        x = 8,
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
