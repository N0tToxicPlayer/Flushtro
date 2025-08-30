SMODS.Joker{ --Pest
    key = "pest",
    config = {
        extra = {
            odds = 3,
            dollars_min = 5,
            dollars_max = 10
        }
    },
    loc_txt = {
        ['name'] = 'Pest',
        ['text'] = {
            [1] = 'When hand is played, {C:green}#1# in #2#{}',
            [2] = 'chance of taking {C:money}money{} from you'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "flush_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 14
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_pest') 
        return {vars = {new_numerator, new_denominator}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_02e84c47', 1, card.ability.extra.odds, 'j_flush_pest', false) then
              card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Let me take this from you.", colour = G.C.WHITE})
                        SMODS.calculate_effect({dollars = -pseudorandom('dollars_fda1699c', card.ability.extra.dollars_min, card.ability.extra.dollars_max)}, card)
          end
            end
        end
    end
}