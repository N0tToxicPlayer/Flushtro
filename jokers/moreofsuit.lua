SMODS.Joker{ --More of suit
    key = "moreofsuit",
    config = {
        extra = {
            odds = 4,
            odds2 = 4,
            odds3 = 4,
            odds4 = 4
        }
    },
    loc_txt = {
        ['name'] = 'More of suit',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance of',
            [2] = 'creating the respective',
            [3] = '{C:edition}negative{} {C:tarot}tarot{} of the scored',
            [4] = 'card suit',
            [5] = '{C:inactive,s:0.8}this name kinda sucks ngl{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_moreofsuit') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Spades") then
            elseif context.other_card:is_suit("Hearts") then
            elseif context.other_card:is_suit("Diamonds") then
            elseif context.other_card:is_suit("Clubs") then
            end
        end
    end
}
