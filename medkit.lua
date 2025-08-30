SMODS.Joker{ --Medkit
    key = "medkit",
    config = {
        extra = {
            deathremaining = 2
        }
    },
    loc_txt = {
        ['name'] = 'Medkit',
        ['text'] = {
            [1] = 'from {C:attention}Phighing{}??',
            [2] = 'Saves from death {C:attention}#1#{} time/s',
            [3] = 'before {C:attention}destroying itself{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 11
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.deathremaining}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if (card.ability.extra.deathremaining or 0) ~= 0 then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                    card.ability.extra.deathremaining = math.max(0, (card.ability.extra.deathremaining) - 1)
                    return true
                end,
                            message = "-1",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}