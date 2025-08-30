SMODS.Joker{ --Price Tag
    key = "pricetag",
    config = {
        extra = {
            Dollar = 2,
            perma_p_dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Price Tag',
        ['text'] = {
            [1] = 'Every played card permanently',
            [2] = 'gains {C:money}+$#1#{} when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Dollar}}
    end,

    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + card.ability.extra.Dollar
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY }, card = card
                }
        end
    end
}