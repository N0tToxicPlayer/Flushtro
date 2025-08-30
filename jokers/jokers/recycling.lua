SMODS.Joker{ --Recycling
    key = "recycling",
    config = {
        extra = {
            Incremental = 0.5,
            Mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Recycling',
        ['text'] = {
            [1] = '{C:mult}+#1#{} Mult for every card {C:attention}discarded{}',
            [2] = '',
            [3] = '{C:inactive}(Currently +#2# Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 17
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Incremental, card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.discard  then
                return {
                    func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + card.ability.extra.Incremental
                    return true
                end,
                    message = "Recycled"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.Mult
                }
        end
    end
}