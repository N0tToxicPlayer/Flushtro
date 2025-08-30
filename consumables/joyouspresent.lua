SMODS.Consumable {
    key = 'joyouspresent',
    set = 'glaggleland',
    pos = { x = 1, y = 1 },
    config = { extra = {
        add_cards_count = 1
    } },
    loc_txt = {
        name = 'Joyous Present',
        text = {
        [1] = 'Create a {C:attention}Steel{}, {C:attention}Red Seal{}, {C:edition}Polychrome{}',
        [2] = 'card of a random rank of any suit'
    }
    },
    cost = 7,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.7,
                func = function()
                    local cards = {}
                    for i = 1, 1 do
                        local _rank = pseudorandom_element(SMODS.Ranks, 'add_random_rank').card_key
                        local _suit = nil
                        local enhancement = G.P_CENTERS['m_steel']
                        local new_card_params = { set = "Base" }
                        if _rank then new_card_params.rank = _rank end
                        if _suit then new_card_params.suit = _suit end
                        if enhancement then new_card_params.enhancement = enhancement.key end
                        cards[i] = SMODS.add_card(new_card_params)
                        if cards[i] then
                            cards[i]:set_seal('Red', nil, true)
                        end
                        if cards[i] then
                            cards[i]:set_edition({ polychrome = true }, true)
                        end
                    end
                    SMODS.calculate_context({ playing_card_added = true, cards = cards })
                    return true
                end
            }))
            delay(0.3)
    end,
    can_use = function(self, card)
        return true
    end
}