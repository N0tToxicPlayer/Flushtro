SMODS.Joker{ --He Sh*ts Gold
    key = "heshtsgold",
    config = {
        extra = {
            Dollar = 1
        }
    },
    loc_txt = {
        ['name'] = 'He Sh*ts Gold',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} for every card {C:attention}discarded{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Dollar}}
    end,

    calculate = function(self, card, context)
        if context.discard  then
                return {
                    dollars = card.ability.extra.Dollar
                }
        end
    end
}