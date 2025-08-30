SMODS.Joker{ --Goldaholic
    key = "goldaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Goldaholic',
        ['text'] = {
            [1] = 'Makes every card scored',
            [2] = 'into a {C:enhanced}gold{} card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 9
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
    pools = { ["flush_cardaholic"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_gold)
                return {
                    message = "Card Modified!"
                }
        end
    end
}