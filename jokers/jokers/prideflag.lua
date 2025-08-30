SMODS.Joker{ --Pride Flag
    key = "prideflag",
    config = {
        extra = {
            StraightMult = 3,
            OtherMult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Pride Flag',
        ['text'] = {
            [1] = '\"Hello im Fly Lag, Hello im Pride Fla- uh\"\"',
            [2] = '{X:mult,C:white}X#1#{} Mult if hand contains a {C:attention}Flush{}',
            [3] = '{X:mult,C:white}X#2#{} to all  other hands'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 16
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
        return {vars = {card.ability.extra.StraightMult, card.ability.extra.OtherMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Flush"]) then
                return {
                    Xmult = card.ability.extra.StraightMult
                }
            elseif not (next(context.poker_hands["Flush"])) then
                return {
                    Xmult = card.ability.extra.OtherMult
                }
            end
        end
    end
}