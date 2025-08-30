SMODS.Joker{ --Party Noob
    key = "partynoob",
    config = {
        extra = {
            odds = 3,
            dollars_min = 5,
            dollars_max = 20
        }
    },
    loc_txt = {
        ['name'] = 'Party Noob',
        ['text'] = {
            [1] = 'When hand is played, {C:green}#1# in #2#{}',
            [2] = 'chance of giving {C:money}money{} or {C:attention}consumable{}',
            [3] = 'to you',
            [4] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 5,
        y = 14
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_partynoob') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_02e84c47', 1, card.ability.extra.odds, 'j_flush_partynoob', false) then
              card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Gift for you!", colour = G.C.WHITE})
                        SMODS.calculate_effect({dollars = pseudorandom('dollars_fda1699c', card.ability.extra.dollars_min, card.ability.extra.dollars_max)}, card)
          end
                if SMODS.pseudorandom_probability(card, 'group_1_024d71fa', 1, card.ability.extra.odds, 'j_flush_partynoob', false) then
              local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local random_sets = {'Tarot', 'Planet', 'Spectral'}
                            local random_set = random_sets[math.random(1, #random_sets)]
                            SMODS.add_card{set=random_set, key_append='joker_forge_' .. random_set:lower()}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Another Gift from you!", colour = G.C.PURPLE})
          end
            end
        end
    end
}