SMODS.Joker{ --Free Naneinf
    key = "freenaneinf",
    config = {
        extra = {
            mult = 10,
            emult = 309
        }
    },
    loc_txt = {
        ['name'] = 'Free Naneinf',
        ['text'] = {
            [1] = 'useful for uhhh idk naneinf? yeah this',
            [2] = 'usage kinda sucks ngl'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult,
                    message = "setup...",
                    extra = {
                        e_mult = card.ability.extra.emult,
                            message = "RELEASE",
                        colour = G.C.DARK_EDITION
                        }
                }
        end
        if context.after and context.cardarea == G.jokers  then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
        end
    end
}
