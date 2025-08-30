SMODS.Consumable {
    key = 'mooble',
    set = 'glaggleland',
    pos = { x = 6, y = 1 },
    config = { extra = {
        joker_slots_value = 2
    } },
    loc_txt = {
        name = 'Mooble',
        text = {
        [1] = '{C:attention}+2{} Joker Slots'
    }
    },
    cost = 9,
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Joker Slot", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 2
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}