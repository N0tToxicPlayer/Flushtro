SMODS.Joker{ --Low Pressure Area
    key = "lowpressurearea",
    config = {
        extra = {
            Destroyed = 0,
            Mult = 6
        }
    },
    loc_txt = {
        ['name'] = 'Low Pressure Area',
        ['text'] = {
            [1] = 'We\'re expecting some {C:attention}light{} to {C:attention}moderate rain{} today.',
            [2] = '',
            [3] = '',
            [4] = '{C:mult}+#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Destroyed, card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.Mult
                }
        end
    end
}
