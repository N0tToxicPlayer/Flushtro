SMODS.Joker{ --Drunklerto
    key = "drunklerto",
    config = {
        extra = {
            Chips = 999,
            XMult = 9,
            Incremental = 0.9,
            odds = 2,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Drunklerto',
        ['text'] = {
            [1] = '{C:chips}+#1#{} Chips, {X:mult,C:white}X#2#{} Mult,',
            [2] = 'gains an extra {X:mult,C:white}X#3#{} for every',
            [3] = '{C:attention}9{} played',
            [4] = '',
            [5] = '{C:green}#4# in #5#{} chance to {C:attention}retrigger{} scored card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_drunklerto') 
        return {vars = {card.ability.extra.Chips, card.ability.extra.XMult, card.ability.extra.Incremental, new_numerator, new_denominator}}
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
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                if SMODS.pseudorandom_probability(card, 'group_0_bd9d2135', 1, card.ability.extra.odds, 'j_flush_drunklerto', false) then
              return {repetitions = card.ability.extra.repetitions}
                        
          end
            end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 9 then
                card.ability.extra.XMult = (card.ability.extra.XMult) + card.ability.extra.Incremental
            end
        end
    end
}