SMODS.Joker{ --Smiley Vanity
    key = "smileyvanity",
    config = {
        extra = {
            XMult = 2,
            perma_x_mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Smiley Vanity',
        ['text'] = {
            [1] = 'They say my {C:mult}Mult{} is a {C:attention}problem{}.',
            [2] = 'applies {X:mult,C:white}X#1#{} Mult {C:attention}bonus{} to',
            [3] = 'every card {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.XMult
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT }, card = card
                }
        end
    end
}