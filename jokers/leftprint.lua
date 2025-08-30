SMODS.Joker{ --Leftprint
    key = "leftprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Leftprint',
        ['text'] = {
            [1] = 'Copies the ability of',
            [2] = '{C:attention}Joker{} to the left'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}
