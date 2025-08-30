SMODS.Joker{ --Chance
    key = "chance",
    config = {
        extra = {
            Mult = 1,
            currentmoney = 0,
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Chance',
        ['text'] = {
            [1] = 'Take a {C:attention}chance{}.',
            [2] = '',
            [3] = 'When Blind is selected, create',
            [4] = '2 {C:dark_edition}Negative{} {C:tarot}Wheel of Fortune{}.',
            [5] = '',
            [6] = 'When {C:tarot}Blind {} is {C:attention}selected{}, gain {X:mult,C:white}XMult{}',
            [7] = 'equivalent of {C:attention}25%{} of your money (#3#)',
            [8] = '',
            [9] = '{C:inactive}(Currently {}{X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
    rarity = "flush_mythical",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult, card.ability.extra.Tarot, ((G.GAME.dollars or 0)) * 0.25}}
    end,

    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Mult
                }
        end
        if context.setting_blind  then
                return {
                    func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = 'c_wheel_of_fortune', edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "GAMBLE", colour = G.C.PURPLE})
                    end
                    return true
                end,
                    extra = {
                        func = function()local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = 'c_wheel_of_fortune', edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "GAMBLE SOME MORE", colour = G.C.PURPLE})
                    end
                    return true
                end,
                        colour = G.C.PURPLE,
                        extra = {
                            func = function()
                    card.ability.extra.Mult = (card.ability.extra.Mult) + (G.GAME.dollars) * 0.25
                    return true
                end,
                            message = "Upgrade",
                            colour = G.C.GREEN
                        }
                        }
                }
        end
    end
}