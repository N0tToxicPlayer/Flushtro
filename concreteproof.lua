SMODS.Joker{ --Concrete Proof
    key = "concreteproof",
    config = {
        extra = {
            XMult = 2,
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Concrete Proof',
        ['text'] = {
            [1] = 'show {C:attention}concrete proof{}.',
            [2] = '{X:mult,C:white}X#1#{} Mult for every {C:attention}Stone{}',
            [3] = 'card held in hand'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}