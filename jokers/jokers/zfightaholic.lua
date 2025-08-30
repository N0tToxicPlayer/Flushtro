SMODS.Joker{ --Z-Fightaholic
    key = "zfightaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Z-Fightaholic',
        ['text'] = {
            [1] = 'Makes every card scored',
            [2] = 'into a {C:enhanced}Z-Fighting{} card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 23
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
    pools = { ["flush_cardaholic"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_flush_zfightingcard)
                return {
                    message = "Card Modified!"
                }
        end
    end
}