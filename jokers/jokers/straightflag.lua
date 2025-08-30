SMODS.Joker{ --Straight Flag
    key = "straightflag",
    config = {
        extra = {
            StraightMult = 4,
            OtherMult = 0.9
        }
    },
    loc_txt = {
        ['name'] = 'Straight Flag',
        ['text'] = {
            [1] = '\"IM BAAACK!\"',
            [2] = '{X:mult,C:white}X#1#{} Mult if hand contains',
            [3] = 'a {C:attention}Straight{},',
            [4] = '{X:mult,C:white}X#2#{} to all  other hands'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 19
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
        return {vars = {card.ability.extra.StraightMult, card.ability.extra.OtherMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight"]) then
                return {
                    Xmult = card.ability.extra.StraightMult
                }
            elseif not (next(context.poker_hands["Straight"])) then
                return {
                    Xmult = card.ability.extra.OtherMult
                }
            end
        end
    end
}