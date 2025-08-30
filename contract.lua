SMODS.Joker{ --Contract
    key = "contract",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Contract',
        ['text'] = {
            [1] = '\"So when does it take for you to {C:attention}sign{}?\"',
            [2] = '-{C:clubs}One{}',
            [3] = 'All scored {C:attention}numbered{} cards turn into {C:attention}Ace{}',
            [4] = 'when the round {C:attention}ends{}, {C:green}#1# in #2#{} chance to',
            [5] = 'spawn {C:clubs}One{}.',
            [6] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 13,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 4
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
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
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_signedcontract' })
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
        end,
                        colour = G.C.BLUE
                        }
                }
        end
        if context.ending_shop  then
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
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_signedcontract' })
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
        end,
                        colour = G.C.BLUE
                        }
                }
        end
    end
}