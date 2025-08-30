SMODS.Joker{ --Spawnpoint
    key = "spawnpoint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Spawnpoint',
        ['text'] = {
            [1] = 'Saves from death only {C:attention}once{}.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
                return {
                    saved = true,
                    message = localize('k_saved_ex'),
                    extra = {
                        func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Second Life!",
                        colour = G.C.RED
                        }
                }
        end
    end
}