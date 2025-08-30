SMODS.Joker{ --Mythic Sample
    key = "mythicsample",
    config = {
        extra = {
            mythical = 0,
            perishable = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mythic Sample',
        ['text'] = {
            [1] = 'When this joker is sold,',
            [2] = 'create a Perishable {X:enhanced,C:white,s:1.4}Mythical{}',
            [3] = 'joker'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    calculate = function(self, card, context)
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', rarity = 'flush_mythical' })
                    if joker_card then
                        
                        joker_card:add_sticker('perishable', true)
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}