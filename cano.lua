SMODS.Joker{ --cano
    key = "cano",
    config = {
        extra = {
            multincrement = 4,
            currentmult = 0
        }
    },
    loc_txt = {
        ['name'] = 'cano',
        ['text'] = {
            [1] = 'this joker gains {C:mult}#1#{} Mult if',
            [2] = 'a {C:attention}face{} card is discarded',
            [3] = '{C:inactive}(Currently{} {C:mult}#2#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_crappylegendary"] = true },
    soul_pos = {
        x = 2,
        y = 3
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.multincrement, card.ability.extra.currentmult}}
    end,

    calculate = function(self, card, context)
        if context.discard  then
            if (function()
    local rankFound = false
    for i, c in ipairs(context.full_hand) do
        if c:is_face() then
            rankFound = true
            break
        end
    end
    
    return rankFound
end)() then
                return {
                    func = function()
                    card.ability.extra.currentmult = (card.ability.extra.currentmult) + card.ability.extra.multincrement
                    return true
                end,
                    message = "+4 Mult"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.currentmult
                }
        end
    end
}