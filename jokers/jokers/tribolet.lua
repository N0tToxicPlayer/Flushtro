SMODS.Joker{ --tribolet
    key = "tribolet",
    config = {
        extra = {
            mult = 20
        }
    },
    loc_txt = {
        ['name'] = 'tribolet',
        ['text'] = {
            [1] = 'face cards give {C:mult}#1#{} Mult when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 21
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_crappylegendary"] = true },
    soul_pos = {
        x = 1,
        y = 21
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}