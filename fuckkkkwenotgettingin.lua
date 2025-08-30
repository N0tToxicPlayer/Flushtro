SMODS.Joker{ --fuckkkk we not getting in
    key = "fuckkkkwenotgettingin",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'fuckkkk we not getting in',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to disable boss ability'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 7
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

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'j_flush_fuckkkkwenotgettingin') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_6c131cb6', 2, card.ability.extra.odds, 'j_flush_fuckkkkwenotgettingin', false) then
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