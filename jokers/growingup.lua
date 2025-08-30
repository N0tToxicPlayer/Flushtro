SMODS.Joker{ --Growing Up
    key = "growingup",
    config = {
        extra = {
            Mult = 0,
            MultIncremental = 4
        }
    },
    loc_txt = {
        ['name'] = 'Growing Up',
        ['text'] = {
            [1] = 'Gains {C:mult}+4{} Mult every round',
            [2] = '{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 9
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
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + card.ability.extra.MultIncremental
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.Mult
                }
        end
    end
}
