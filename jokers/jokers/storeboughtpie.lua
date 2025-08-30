SMODS.Joker{ --Store-bought Pie
    key = "storeboughtpie",
    config = {
        extra = {
            XMult = 3,
            XChips = 3
        }
    },
    loc_txt = {
        ['name'] = 'Store-bought Pie',
        ['text'] = {
            [1] = 'mmmmm pie with microperservatives',
            [2] = 'and artificial grape flavoring',
            [3] = '',
            [4] = '{X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips if hands',
            [5] = 'remaining equals to 3',
            [6] = '{C:inactive,s:0.75}get it cause 3.14159265 pi thing? laugh now bro{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 19
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult, card.ability.extra.XChips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_left == 3 then
                return {
                    x_chips = card.ability.extra.XMult,
                    extra = {
                        Xmult = card.ability.extra.XChips
                        }
                }
            end
        end
    end
}