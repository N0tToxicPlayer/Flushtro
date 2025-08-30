SMODS.Joker{ --that one femboy image of alerto
    key = "thatonefemboyimageofalerto",
    config = {
        extra = {
            Chips = 999,
            Mult = 9,
            Incremental = 0.9
        }
    },
    loc_txt = {
        ['name'] = 'that one femboy image of alerto',
        ['text'] = {
            [1] = '\"Don\'t worry chat,use this image to counter\"{}',
            [2] = '{C:chips}+#1#{} Chips, {X:mult,C:white}X#2#{} Mult,',
            [3] = 'gains an extra {X:mult,C:white}X#3#{} for every',
            [4] = '{C:attention}9{} or {C:attention}King{} played',
            [5] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 11,
    rarity = "flush_alerto",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Chips, card.ability.extra.Mult, card.ability.extra.Incremental}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                card.ability.extra.Mult = (card.ability.extra.Mult) + card.ability.extra.Incremental
            elseif context.other_card:get_id() == 13 then
                card.ability.extra.Mult = (card.ability.extra.Mult) + card.ability.extra.Incremental
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.Chips,
                    extra = {
                        Xmult = card.ability.extra.Mult
                        }
                }
        end
    end
}