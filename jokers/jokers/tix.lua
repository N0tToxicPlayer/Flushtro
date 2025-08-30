SMODS.Joker{ --Tix
    key = "tix",
    config = {
        extra = {
            Money = 10
        }
    },
    loc_txt = {
        ['name'] = 'Tix',
        ['text'] = {
            [1] = 'Sell this card to earn {C:money}$#1#{}',
            [2] = '{C:inactive}(Ignores slot limit when bought){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Money}}
    end,

    calculate = function(self, card, context)
        if context.selling_self  then
                return {
                    dollars = card.ability.extra.Money
                }
        end
    end
}

local check_for_buy_space_ref = G.FUNCS.check_for_buy_space
G.FUNCS.check_for_buy_space = function(card)
    if card.config.center.key == "j_flush_tix" then -- ignore slot limit when bought
        return true
    end
    return check_for_buy_space_ref(card)
end