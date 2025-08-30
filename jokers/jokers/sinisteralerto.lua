SMODS.Joker{ --Sinister Alerto
    key = "sinisteralerto",
    config = {
        extra = {
            XMult = 1,
            Incremental = 0.15
        }
    },
    loc_txt = {
        ['name'] = 'Sinister Alerto',
        ['text'] = {
            [1] = 'gains {X:mult,C:white}X#2#{} Mult for every',
            [2] = 'card {C:attention}destroyed{} or {C:attention}sold{}',
            [3] = 'and consumables {C:attention}used{}',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 13,
    rarity = "flush_alerto",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult, card.ability.extra.Incremental}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.XMult
                }
        end
        if context.remove_playing_cards  then
                return {
                    func = function()
                    card.ability.extra.XMult = (card.ability.extra.XMult) + card.ability.extra.Incremental
                    return true
                end
                }
        end
        if context.selling_card  then
                return {
                    func = function()
                    card.ability.extra.XMult = (card.ability.extra.XMult) + card.ability.extra.Incremental
                    return true
                end
                }
        end
        if context.using_consumeable  then
                return {
                    func = function()
                    card.ability.extra.XMult = (card.ability.extra.XMult) + card.ability.extra.Incremental
                    return true
                end
                }
        end
    end
}