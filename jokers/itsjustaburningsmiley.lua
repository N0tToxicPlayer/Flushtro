SMODS.Joker{ --Its just a burning smiley
    key = "itsjustaburningsmiley",
    config = {
        extra = {
            Mult = 8,
            HalfMult = 8,
            odds = 3,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Its just a burning smiley',
        ['text'] = {
            [1] = '{X:mult,C:white}+#3#?{} Mult',
            [2] = '{C:inactive,s:0.8}stage 1{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_itsjustaburningsmiley') 
        return {vars = {card.ability.extra.Mult, card.ability.extra.HalfMult, card.ability.extra.ignore, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.Mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_3d3e9ce8', 1, card.ability.extra.odds, 'j_flush_itsjustaburningsmiley', false) then
              SMODS.calculate_effect({mult = card.ability.extra.HalfMult}, card)
          end
                        return true
                    end
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!",
                    extra = {
                        func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_alosingsmileyisraging' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
        end
    end
}
