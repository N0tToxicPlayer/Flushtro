SMODS.Consumable {
    key = 'thepopup',
    set = 'Tarot',
    pos = { x = 0, y = 3 },
    config = { extra = {
        consumable_count = 1
    } },
    loc_txt = {
        name = 'The Pop-Up',
        text = {
        [1] = 'Creates a random {C:attention}Bundle{} Consumable',
        [2] = '{C:inactive}(Must have room){}'
    }
    },
    cost = 4,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            SMODS.add_card({ set = 'bundle' })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}