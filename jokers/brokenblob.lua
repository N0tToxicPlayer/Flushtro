SMODS.Joker{ --Broken Blob
    key = "brokenblob",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Broken Blob',
        ['text'] = {
            [1] = '{s:5}LEAVE ME ALONE{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 2
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

    calculate = function(self, card, context)
        if context.selling_self  then
                return {
                    func = function()
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end
                }
        end
    end
}
