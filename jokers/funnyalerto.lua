SMODS.Joker{ --Funny Alerto
    key = "funnyalerto",
    config = {
        extra = {
            odds = 5,
            buffoon = 0
        }
    },
    loc_txt = {
        ['name'] = 'Funny Alerto',
        ['text'] = {
            [1] = 'when hand is played, {C:green}#2# in #3#{}',
            [2] = 'chance of creating',
            [3] = 'a {C:attention}Buffoon{} tag'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 12,
    rarity = "flush_alerto",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_funnyalerto') 
        return {vars = {card.ability.extra.buffoon, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_5c80aadc', 1, card.ability.extra.odds, 'j_flush_funnyalerto', false) then
              G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_buffoon")
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
