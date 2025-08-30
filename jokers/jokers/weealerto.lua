SMODS.Joker{ --Wee Alerto
    key = "weealerto",
    config = {
        extra = {
            Retriggers = 1
        }
    },
    loc_txt = {
        ['name'] = 'Wee Alerto',
        ['text'] = {
            [1] = 'Retriggers scored cards {C:attention}#1#{} times',
            [2] = 'gains an extra retrigger for every scored {C:attention}9{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 22
    },
    display_size = {
        w = 71 * 0.7, 
        h = 95 * 0.7
    },
    cost = 13,
    rarity = "flush_alerto",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Retriggers}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if not (context.other_card:get_id() == 9) then
                return {
                    repetitions = card.ability.extra.Retriggers,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                card.ability.extra.Retriggers = (card.ability.extra.Retriggers) + 1
                return {
                    message = "+1 Retrigger"
                }
            end
        end
    end
}