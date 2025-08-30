SMODS.Joker{ --Glassaholic
    key = "glassaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Glassaholic',
        ['text'] = {
            [1] = 'Makes every card scored',
            [2] = 'into {C:attention}glass{} cards'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 15,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_cardaholic"] = true },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_glass)
                return {
                    message = "Card Modified!"
                }
        end
    end
}