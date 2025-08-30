SMODS.Joker{ --One Mult
    key = "onemult",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'One Mult',
        ['text'] = {
            [1] = 'what the hell do i do with {C:red,s:2}1 Mult???{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}
