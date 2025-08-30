SMODS.Joker{ --Fool
    key = "fool",
    config = {
        extra = {
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Fool',
        ['text'] = {
            [1] = '{C:green}@Fool{} look at this {C:attention}fool{}',
            [2] = '',
            [3] = 'When Blind is selected, spawn a {C:tarot}Fool Tarot{}',
            [4] = '{C:inactive}(Must have room){}',
            [5] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 6
    },

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'Tarot', key = 'c_fool', key_append = 'joker_forge_tarot'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end
                }
        end
    end
}
