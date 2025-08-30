SMODS.Joker{ --Multaholic
    key = "multaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Multaholic',
        ['text'] = {
            [1] = 'Makes every card scored',
            [2] = 'into a {C:enhanced}mult{} card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 12
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_cardaholic"] = true },
    soul_pos = {
        x = 6,
        y = 12
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_mult)
                return {
                    message = "Painted"
                }
        end
    end
}