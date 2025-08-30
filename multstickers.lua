SMODS.Joker{ --Mult Stickers
    key = "multstickers",
    config = {
        extra = {
            pb_mult_1cafec46 = 3,
            perma_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Mult Stickers',
        ['text'] = {
            [1] = 'Every played card permanently gains',
            [2] = '{C:mult}+3{} Mult when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 12
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
    soul_pos = {
        x = 4,
        y = 12
    },

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.pb_mult_1cafec46
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
        end
    end
}