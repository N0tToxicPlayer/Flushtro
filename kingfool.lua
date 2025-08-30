SMODS.Joker{ --king fool
    key = "kingfool",
    config = {
        extra = {
            Mult = 100,
            currentweekday = 0,
            currenthours = 0,
            currentminutes = 0,
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'king fool',
        ['text'] = {
            [1] = '{C:green}fool{} the {C:green}foool{} of {C:green}tomfoolery{} on {C:green}fool{} only on',
            [2] = '{C:attention}tuesdays{} exactly at {C:attention}2:35pm{} on an {C:attention}average day{} in {C:green}:alien:{}',
            [3] = 'When Blind is {C:attention}selected{}, spawns a {C:tarot}Fool{} tarot',
            [4] = '{C:inactive}(Must have room){}',
            [5] = '{X:mult,C:white}X#1#{} Mult, and spawns {C:attention}5{} {C:dark_edition}negative{} {C:tarot}Fool{} tarots only',
            [6] = 'on {C:attention}Tuesdays{} at exactly {C:attention}2:35pm{}',
            [7] = '{C:inactive}(yes this actually works){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 9,
        y = 10
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if (3 == os.date("*t", os.time()).wday and 14 == os.date("*t", os.time()).hour and 35 == os.date("*t", os.time()).min) then
                return {
                    func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = 'c_fool', edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                    extra = {
                        func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = 'c_fool', edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                        colour = G.C.PURPLE,
                        extra = {
                            func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = 'c_fool', edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                            colour = G.C.PURPLE,
                        extra = {
                            func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = 'c_fool', edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                            colour = G.C.PURPLE,
                        extra = {
                            func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = 'c_fool', edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                end,
                            colour = G.C.PURPLE
                        }
                        }
                        }
                        }
                }
            else
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
        if context.cardarea == G.jokers and context.joker_main  then
            if (3 == os.date("*t", os.time()).wday and 14 == os.date("*t", os.time()).hour and 35 == os.date("*t", os.time()).min) then
                return {
                    Xmult = card.ability.extra.Mult
                }
            end
        end
    end
}