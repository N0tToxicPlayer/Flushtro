SMODS.Joker{ --Tropical Depression
    key = "tropicaldepression",
    config = {
        extra = {
            Mult = 12,
            XChips = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Tropical Depression',
        ['text'] = {
            [1] = 'The{C:attention} low-pressure area{} has intensified into a {C:attention}Tropical Depression{},',
            [2] = 'Expect {C:attention}Moderate{} to {C:attention}Heavy Rains{} and {C:attention}Gusty Winds{}.',
            [3] = '',
            [4] = '{C:red}+#1#{} Mult and {X:chips,C:white}X#2#{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 21
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
        return {vars = {card.ability.extra.Mult, card.ability.extra.XChips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.Mult,
                    extra = {
                        x_chips = card.ability.extra.XChips,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}