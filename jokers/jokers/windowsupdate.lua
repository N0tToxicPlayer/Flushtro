SMODS.Joker{ --Windows Update
    key = "windowsupdate",
    config = {
        extra = {
            Progress = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Windows Update',
        ['text'] = {
            [1] = '{C:inactive}#1#% Complete.{}',
            [2] = 'playing a hand increases the percentage by a random amount.',
            [3] = 'if the percentage reaches {C:attention}100%{}, create a {C:legendary}Legendary{} Joker'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Progress}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                card.ability.extra.Progress = (card.ability.extra.Progress) + pseudorandom('Progress_10e82f5d', 1, 3)
        end
        if context.after and context.cardarea == G.jokers  then
            if (card.ability.extra.Progress or 0) >= 100 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!",
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'Legendary' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}