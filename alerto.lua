SMODS.Joker{ --Alerto
    key = "alerto",
    config = {
        extra = {
            Chips = 999,
            XMult = 9,
            Incremental = 0.9
        }
    },
    loc_txt = {
        ['name'] = 'Alerto',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips, {X:mult,C:white}X#2#{} Mult,',
            [2] = 'gains an extra {X:mult,C:white}X#3#{} for every',
            [3] = '{C:attention}9{} played',
            [4] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "flush_alerto",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Chips, card.ability.extra.XMult, card.ability.extra.Incremental}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.Chips,
                    extra = {
                        Xmult = card.ability.extra.XMult
                        }
                }
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                card.ability.extra.XMult = (card.ability.extra.XMult) + card.ability.extra.Incremental
            end
        end
    end
}