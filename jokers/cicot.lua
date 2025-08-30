SMODS.Joker{ --cicot
    key = "cicot",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'cicot',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance of disabling',
            [2] = 'boss blind'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_crappylegendary"] = true },
    soul_pos = {
        x = 0,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_cicot') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                if SMODS.pseudorandom_probability(card, 'group_0_399b5b18', 1, card.ability.extra.odds, 'j_flush_cicot', false) then
              SMODS.calculate_effect({func = function()
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
            end
                    return true
                end}, card)
          end
            end
        end
    end
}
