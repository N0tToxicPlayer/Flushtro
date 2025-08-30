SMODS.Joker{ --Tree-y
    key = "treey",
    config = {
        extra = {
            money = 7,
            mult = 2,
            chance = 0
        }
    },
    loc_txt = {
        ['name'] = 'Tree-y',
        ['text'] = {
            [1] = '{C:inactive}the most beautiful rhymer{}',
            [2] = 'grants either {C:money}$#1#{} or {X:mult,C:white}X#2#{} Mult',
            [3] = 'when a hand is played'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.money, card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.chance = pseudorandom('chance_6e0da6db', 0, 1)
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.chance or 0) == 0 then
                return {
                    Xmult = card.ability.extra.mult
                }
            elseif (card.ability.extra.chance or 0) == 1 then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end
    end
}