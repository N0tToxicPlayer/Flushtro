SMODS.Joker{ --Gazo
    key = "gazo",
    config = {
        extra = {
            ExpMult = 2,
            emult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Gazo',
        ['text'] = {
            [1] = '{X:mult,C:white}^#1#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_glaggle"] = true },
    soul_pos = {
        x = 6,
        y = 7
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ExpMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.emult
                }
        end
    end
}