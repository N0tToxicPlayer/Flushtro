SMODS.Joker{ --yoric
    key = "yoric",
    config = {
        extra = {
            multincrement = 3,
            carddiscarded = 2,
            currentmult = 0
        }
    },
    loc_txt = {
        ['name'] = 'yoric',
        ['text'] = {
            [1] = 'this joker gains {C:mult}#1#{} Mult',
            [2] = 'every {C:attention}2{} {C:inactive}(#2#){} cards discarded',
            [3] = '{C:inactive}(Currently{} {C:mult}#3#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 23
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
        x = 4,
        y = 23
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.multincrement, card.ability.extra.carddiscarded, card.ability.extra.currentmult}}
    end,

    calculate = function(self, card, context)
        if context.discard  then
            if (card.ability.extra.carddiscarded or 0) ~= 0 then
                return {
                    func = function()
                    card.ability.extra.carddiscarded = math.max(0, (card.ability.extra.carddiscarded) - 1)
                    return true
                end
                }
            elseif (card.ability.extra.carddiscarded or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.currentmult = (card.ability.extra.currentmult) + card.ability.extra.multincrement
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.carddiscarded = card.ability.extra.multincrement
                    return true
                end,
                            message = "+3 Mult",
                        colour = G.C.BLUE
                        }
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