SMODS.Joker{ --pekeo
    key = "pekeo",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'pekeo',
        ['text'] = {
            [1] = 'creates a copy of {C:attention}1{} random',
            [2] = 'consumable at the end of the',
            [3] = 'shop',
            [4] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 14
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
    pools = { ["flush_crappylegendary"] = true },
    soul_pos = {
        x = 7,
        y = 14
    },

    calculate = function(self, card, context)
        if context.ending_shop  then
                return {
                    func = function()
            local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                table.insert(target_cards, consumable)
            end
            if #target_cards > 0 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local copied_card = copy_card(card_to_copy)
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Consumable!", colour = G.C.GREEN})
            end
                    return true
                end
                }
        end
    end
}