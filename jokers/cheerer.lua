SMODS.Joker{ --Cheerer
    key = "cheerer",
    config = {
        extra = {
            ExpMult = 3,
            ExpChips = 3,
            glaggleland = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cheerer',
        ['text'] = {
            [1] = '{X:mult,C:white}^#1#{} Mult, {X:chips,C:white}^#2#{} Chips',
            [2] = 'Spawns {C:attention}a{} {X:attention,C:white}Glaggleland{} consumable',
            [3] = 'when blind is {C:attention}selecteed{}.',
            [4] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ExpMult, card.ability.extra.ExpChips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_chips = card.ability.extra.ExpChips,
                    extra = {
                        e_mult = card.ability.extra.ExpMult,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
        if context.setting_blind  then
                return {
                    func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'glaggleland', key = nil, key_append = 'joker_forge_glaggleland'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
                }
        end
    end
}
