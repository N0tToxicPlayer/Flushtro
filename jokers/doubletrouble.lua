SMODS.Joker{ --Double Trouble
    key = "doubletrouble",
    config = {
        extra = {
            odds = 3,
            double = 0
        }
    },
    loc_txt = {
        ['name'] = 'Double Trouble',
        ['text'] = {
            [1] = 'When hand is played, {C:green}#2# in #3#{}',
            [2] = 'chance of creating a {C:attention}Double Tag{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 5
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

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_doubletrouble') 
        return {vars = {card.ability.extra.double, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2c25fe45', 1, card.ability.extra.odds, 'j_flush_doubletrouble', false) then
              G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_double")
                    if tag.name == "Orbital Tag" then
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible then
                                _poker_hands[#_poker_hands + 1] = k
                            end
                        end
                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                    end
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Created Tag!", colour = G.C.GREEN})
          end
            end
        end
    end
}
