SMODS.Consumable {
    key = 'glagoon',
    set = 'glaggleland',
    pos = { x = 8, y = 0 },
    config = { extra = {
        dollars_value = 30
    } },
    loc_txt = {
        name = 'Glagoon',
        text = {
        [1] = 'Grants {C:money}$30{} Dollars when used'
    }
    },
    cost = 1,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(30).." $", colour = G.C.MONEY})
                    ease_dollars(30, true)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}