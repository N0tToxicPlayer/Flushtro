SMODS.Joker{ --Comedic Banana Peel
    key = "comedicbananapeel",
    config = {
        extra = {
            XMult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Comedic Banana Peel',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 4
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.XMult
                }
        end
    end
}