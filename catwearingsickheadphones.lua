SMODS.Joker{ --cat wearing SICK headphones
    key = "catwearingsickheadphones",
    config = {
        extra = {
            odds = 7
        }
    },
    loc_txt = {
        ['name'] = 'cat wearing SICK headphones',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance of',
            [2] = 'making scored cards into {C:attention}Red Seal{},',
            [3] = '{C:edition}Polychrome{}, {C:attention}Steel{}, {C:attention}King{} of {C:hearts}Hearts{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_catwearingsickheadphones') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_e64ea265', 1, card.ability.extra.odds, 'j_flush_catwearingsickheadphones', false) then
              assert(SMODS.change_base(context.other_card, "Hearts", "King"))
                context.other_card:set_ability(G.P_CENTERS.m_steel)
                context.other_card:set_seal("Red", true)
                context.other_card:set_edition("e_polychrome", true)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.BLUE})
          end
            end
        end
    end
}