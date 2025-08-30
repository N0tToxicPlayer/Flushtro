SMODS.Joker{ --Foilaholic
    key = "foilaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Foilaholic',
        ['text'] = {
            [1] = 'Applies {C:edition}Foil{} to every card scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_cardaholic"] = true },
    soul_pos = {
        x = 7,
        y = 6
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_edition("e_foil", true)
                return {
                    message = "Card Modified!"
                }
        end
    end
}