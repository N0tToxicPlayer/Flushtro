SMODS.Joker{ --Steelaholic
    key = "steelaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Steelaholic',
        ['text'] = {
            [1] = 'Makes every card scored',
            [2] = 'into a {C:enhanced}steel{} card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 19
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = "flush_epic",
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_cardaholic"] = true },
    soul_pos = {
        x = 2,
        y = 19
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_steel)
                return {
                    message = "Painted"
                }
        end
    end
}