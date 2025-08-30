SMODS.Joker{ --Sinner Alerto
    key = "sinneralerto",
    config = {
        extra = {
            odds = 2,
            Tarot = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sinner Alerto',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance of creating',
            [2] = 'a {C:dark_edition}negative{} {C:tarot}tarot{} card when',
            [3] = 'a hand is played'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 18
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "flush_alerto",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_sinneralerto') 
        return {vars = {card.ability.extra.Tarot, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_f12ec44e', 1, card.ability.extra.odds, 'j_flush_sinneralerto', false) then
              local created_consumable = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.add_card{set = 'Tarot', key = nil, edition = 'e_negative', key_append = 'joker_forge_tarot'}
                        return true
                    end
                }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_tarot') or nil, colour = G.C.PURPLE})
          end
            end
        end
    end
}