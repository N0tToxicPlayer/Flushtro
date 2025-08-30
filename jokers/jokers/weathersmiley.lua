SMODS.Joker{ --Weathersmiley
    key = "weathersmiley",
    config = {
        extra = {
            XChips = 2,
            perma_x_chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Weathersmiley',
        ['text'] = {
            [1] = 'Didn\'t you see the {C:attention}news{} today?',
            [2] = 'applies {X:chips,C:white}X#1#{} Chips {C:attention}bonus{} to',
            [3] = 'every card {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 22
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
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XChips}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + card.ability.extra.XChips
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
        end
    end
}