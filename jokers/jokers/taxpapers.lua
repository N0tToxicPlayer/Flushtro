SMODS.Joker{ --Tax Papers
    key = "taxpapers",
    config = {
        extra = {
            TaxValue = 25,
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tax Papers',
        ['text'] = {
            [1] = 'deducts {C:attention}25%{} of your {C:money}money{} when',
            [2] = 'shop is {C:attention}entered{}.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 19
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "flush_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 19
    },

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = -(G.GAME.dollars) * 0.25
                }
        end
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_greedycontract' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Contract Signed!", colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}