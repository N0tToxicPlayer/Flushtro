SMODS.Joker{ --Advanced Plaque Entanglements
    key = "advancedplaqueentanglements",
    config = {
        extra = {
            Mult = 160,
            HalfMult = 160,
            ExpMult = 4,
            XMult = 20,
            odds = 3,
            emult = 1.1,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Advanced Plaque Entanglements',
        ['text'] = {
            [1] = '{X:mult,C:white}+XX-+^^X#3#????{} {C:red}M{}{s:0.5}u{}{C:red}l{}',
            [2] = '{C:inactive,s:0.8}stage 5{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "flush_epic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },
    soul_pos = {
        x = 8,
        y = 0
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_advancedplaqueentanglements') 
        return {vars = {card.ability.extra.Mult, card.ability.extra.HalfMult, card.ability.extra.ExpMult, new_numerator, new_denominator}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    mult = card.ability.extra.Mult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_3d3e9ce8', 1, card.ability.extra.odds, 'j_flush_advancedplaqueentanglements', false) then
              SMODS.calculate_effect({Xmult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({e_mult = card.ability.extra.emult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.HalfMult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.HalfMult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.HalfMult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
          end
                    if SMODS.pseudorandom_probability(card, 'group_1_b276fdd2', 1, card.ability.extra.odds, 'j_flush_advancedplaqueentanglements', false) then
              SMODS.calculate_effect({e_mult = card.ability.extra.ExpMult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({Xmult = card.ability.extra.XMult}, card)
                        SMODS.calculate_effect({Xmult = card.ability.extra.XMult}, card)
                        SMODS.calculate_effect({Xmult = card.ability.extra.XMult}, card)
          end
                    if SMODS.pseudorandom_probability(card, 'group_2_3bba3618', 1, card.ability.extra.odds, 'j_flush_advancedplaqueentanglements', false) then
              SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
                        SMODS.calculate_effect({mult = card.ability.extra.Mult}, card)
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
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_joker_gvk96t' })
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