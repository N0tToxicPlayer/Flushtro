SMODS.Joker{ --Retroslop
    key = "retroslop",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Retroslop',
        ['text'] = {
            [1] = '\"go back to forsaken\"',
            [2] = '-loser',
            [3] = '{C:red}+40{} Mult for every joker currently',
            [4] = 'in hand',
            [5] = '{C:inactive}(Currently{} {C:mult}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 17
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {(#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 40}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = (#(G.jokers and G.jokers.cards or {})) * 40
                }
        end
    end
}