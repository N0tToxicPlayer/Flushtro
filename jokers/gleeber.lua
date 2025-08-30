SMODS.Joker{ --Gleeber
    key = "gleeber",
    config = {
        extra = {
            ExpChips = 1.8,
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gleeber',
        ['text'] = {
            [1] = '{X:chips,C:white}^#1#{} Chips',
            [2] = 'Spawns a {C:tarot}tarot{} card when a',
            [3] = 'Blind is {C:attention}selected{}',
            [4] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 8
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
    pools = { ["flush_glaggle"] = true },
    soul_pos = {
        x = 6,
        y = 8
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ExpChips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_chips = card.ability.extra.ExpChips
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
                            SMODS.add_card{set = 'Tarot', key = nil, key_append = 'joker_forge_tarot'}
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
