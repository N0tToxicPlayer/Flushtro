SMODS.Joker{ --Two of Us
    key = "twoofus",
    config = {
        extra = {
            Mult = 20,
            ExtraMult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Two of Us',
        ['text'] = {
            [1] = '{C:inactive}Just the two of us,{}',
            [2] = '{C:inactive}we can make it if we try.{}',
            [3] = '{C:mult}+#1#{} Mult and {X:mult,C:white}X#2#{} Mult if hand contains only {C:attention}2{} cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult, card.ability.extra.ExtraMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #context.full_hand == 2 then
                return {
                    mult = card.ability.extra.Mult,
                    extra = {
                        Xmult = card.ability.extra.ExtraMult
                        }
                }
            end
        end
    end
}