SMODS.Joker{ --Orange
    key = "orange",
    config = {
        extra = {
            moneyearn = 10,
            decrement = 2
        }
    },
    loc_txt = {
        ['name'] = 'Orange',
        ['text'] = {
            [1] = '{C:money}{}When the round ends, earn {C:money}$#1#{}',
            [2] = 'but {C:red}decreases{} by {C:money}$#2#{} when triggered.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 14
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
    pools = { ["flush_food"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.moneyearn, card.ability.extra.decrement}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                local moneyearn_value = card.ability.extra.moneyearn
                return {
                    dollars = moneyearn_value,
                    extra = {
                        func = function()
                    card.ability.extra.moneyearn = math.max(0, (card.ability.extra.moneyearn) - card.ability.extra.decrement)
                    return true
                end,
                            message = "-$2",
                        colour = G.C.RED
                        }
                }
        end
    end
}