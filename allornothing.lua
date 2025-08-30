SMODS.Joker{ --All or Nothing
    key = "allornothing",
    config = {
        extra = {
            Mult = 3
        }
    },
    loc_txt = {
        ['name'] = 'All or Nothing',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult on the {C:attention}last hand{}',
            [2] = 'of the round'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 1
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
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_left == 0 then
                return {
                    Xmult = card.ability.extra.Mult
                }
            end
        end
    end
}