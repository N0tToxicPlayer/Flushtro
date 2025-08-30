SMODS.Joker{ --Polar Enigma
    key = "polarenigma",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Polar Enigma',
        ['text'] = {
            [1] = 'When this joker is {C:attention}sold{}, create a random {C:dark_edition}negative{}',
            [2] = 'joker of {C:attention}any rarity{}.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Suprise!", colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}