SMODS.Joker{ --Red Sealaholic
    key = "redsealaholic",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Red Sealaholic',
        ['text'] = {
            [1] = 'Applies {C:attention}Red Seal{} to every card scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 17
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
    soul_pos = {
        x = 2,
        y = 17
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_seal("Red", true)
                return {
                    message = "Card Modified!"
                }
        end
    end
}