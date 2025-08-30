SMODS.Joker{ --Stoneaholic
    key = "stoneaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Stoneaholic',
        ['text'] = {
            [1] = 'Makes every card scored',
            [2] = 'into a {C:enhanced}stone{} card'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
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
    pools = { ["flush_cardaholic"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_stone)
                return {
                    message = "Card Modified!"
                }
        end
    end
}