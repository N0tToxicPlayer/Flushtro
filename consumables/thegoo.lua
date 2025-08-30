SMODS.Consumable {
    key = 'thegoo',
    set = 'Tarot',
    pos = { x = 7, y = 2 },
    loc_txt = {
        name = 'The Goo',
        text = {
        [1] = 'Enhances {C:attention}2{} selected cards into',
        [2] = '{C:enhanced}Enfosi{} Cards'
    }
    },
    cost = 7,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}