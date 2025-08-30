SMODS.Joker{ --Peter, what are you doing?
    key = "peterwhatareyoudoing",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Peter, what are you doing?',
        ['text'] = {
            [1] = '{C:attention}Crack{}.',
            [2] = '{C:green}#1# in #2#{} chance of turning a scored',
            [3] = 'card into a {C:attention}Cracked Card {}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 15
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

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_peterwhatareyoudoing') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_623ffbb9', 1, card.ability.extra.odds, 'j_flush_peterwhatareyoudoing', false) then
              context.other_card:set_ability(G.P_CENTERS.m_flush_crackedcard)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
          end
            end
        end
    end
}