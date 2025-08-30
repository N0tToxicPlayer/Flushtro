SMODS.Joker{ --Quarter Joker
    key = "quarterjoker",
    config = {
        extra = {
            Mult = 50,
            CardCount = 1
        }
    },
    loc_txt = {
        ['name'] = 'Quarter Joker',
        ['text'] = {
            [1] = '{C:red}+#1#{} Mult if played hand',
            [2] = 'contains only {C:attention}#2#{} card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult, card.ability.extra.CardCount}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if #context.full_hand <= card.ability.extra.CardCount then
                return {
                    mult = card.ability.extra.Mult
                }
            end
        end
    end
}