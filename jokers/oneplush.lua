SMODS.Joker{ --One Plush
    key = "oneplush",
    config = {
        extra = {
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'One Plush',
        ['text'] = {
            [1] = 'Occasionally turns scored cards',
            [2] = 'into {C:attention}Aces{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_25a4e4f6', 1, card.ability.extra.odds, 'j_flush_oneplush', false) then
              assert(SMODS.change_base(context.other_card, nil, "Ace"))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
          end
            end
        end
    end
}
