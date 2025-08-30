SMODS.Joker{ --Those bouncing square race that make noise i always see on youtube shorts
    key = "thosebouncingsquareracethatmakenoiseialwaysseeonyoutubeshorts",
    config = {
        extra = {
            odds = 4,
            chips_min = 1,
            chips_max = 100,
            mult_min = 1,
            mult_max = 20,
            dollars_min = 1,
            dollars_max = 5
        }
    },
    loc_txt = {
        ['name'] = 'Those bouncing square race that make noise i always see on youtube shorts',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance of granting',
            [2] = 'A random amount of',
            [3] = '{C:mult}Mult{}, {C:chips}Chip{}, {C:money}Money{}, or a random',
            [4] = '{C:attention} consumable{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_thosebouncingsquareracethatmakenoiseialwaysseeonyoutubeshorts') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_8c5a77bf', 1, card.ability.extra.odds, 'j_flush_thosebouncingsquareracethatmakenoiseialwaysseeonyoutubeshorts', false) then
              SMODS.calculate_effect({chips = pseudorandom('chips_dcb8ff6c', card.ability.extra.chips_min, card.ability.extra.chips_max)}, card)
          end
                if SMODS.pseudorandom_probability(card, 'group_1_3aa753c2', 1, card.ability.extra.odds, 'j_flush_thosebouncingsquareracethatmakenoiseialwaysseeonyoutubeshorts', false) then
              SMODS.calculate_effect({mult = pseudorandom('mult_50d98439', card.ability.extra.mult_min, card.ability.extra.mult_max)}, card)
          end
                if SMODS.pseudorandom_probability(card, 'group_2_c0f79341', 1, card.ability.extra.odds, 'j_flush_thosebouncingsquareracethatmakenoiseialwaysseeonyoutubeshorts', false) then
              SMODS.calculate_effect({dollars = pseudorandom('dollars_df8420b4', card.ability.extra.dollars_min, card.ability.extra.dollars_max)}, card)
          end
                if SMODS.pseudorandom_probability(card, 'group_3_cfe11c94', 1, card.ability.extra.odds, 'j_flush_thosebouncingsquareracethatmakenoiseialwaysseeonyoutubeshorts', false) then
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_consumable') or nil, colour = G.C.PURPLE})
          end
                if SMODS.pseudorandom_probability(card, 'group_4_2ba77f6d', 1, card.ability.extra.odds, 'j_flush_thosebouncingsquareracethatmakenoiseialwaysseeonyoutubeshorts', false) then
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
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_consumable') or nil, colour = G.C.PURPLE})
          end
            end
        end
    end
}