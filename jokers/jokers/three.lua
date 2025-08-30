SMODS.Joker{ --three
    key = "three",
    config = {
        extra = {
            retriggers = 3
        }
    },
    loc_txt = {
        ['name'] = 'three',
        ['text'] = {
            [1] = 'retriggers a scored card {C:attention}#1#{} times',
            [2] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.retriggers}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
                return {
                    repetitions = card.ability.extra.retriggers,
                    message = localize('k_again_ex')
                }
        end
    end
}