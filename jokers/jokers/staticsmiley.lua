SMODS.Joker{ --Static Smiley
    key = "staticsmiley",
    config = {
        extra = {
            XMult = 8
        }
    },
    loc_txt = {
        ['name'] = 'Static Smiley',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = 'Decreases every {C:attention}Ante{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 19
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
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.XMult
                }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if (card.ability.extra.XMult or 0) > 2 then
                return {
                    func = function()
                    card.ability.extra.XMult = math.max(0, (card.ability.extra.XMult) - 1)
                    return true
                end,
                    message = "-X1 Mult"
                }
            elseif (card.ability.extra.XMult or 0) <= 2 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            end
        end
    end
}