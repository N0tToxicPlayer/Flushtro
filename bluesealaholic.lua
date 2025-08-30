SMODS.Joker{ --Blue Sealaholic
    key = "bluesealaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Blue Sealaholic',
        ['text'] = {
            [1] = 'Applies {C:attention}Blue Seal{} to every card scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_cardaholic"] = true },
    soul_pos = {
        x = 5,
        y = 2
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_seal("Blue", true)
                return {
                    message = "Card Modified!"
                }
        end
    end
}