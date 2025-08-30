SMODS.Joker{ --Oops! All RENTED!
    key = "oopsallrented",
    config = {
        extra = {
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oops! All RENTED!',
        ['text'] = {
            [1] = 'takes away {C:money}$3 {}for every',
            [2] = '{C:attention}joker{} in your possesion after',
            [3] = 'round is {C:attention}ended{}.',
            [4] = '{C:inactive}(Currently takes{} {C:money}$#1#{} {C:inactive}money){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "flush_cursed",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {(#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 3}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = -(#(G.jokers and G.jokers.cards or {})) * 3
                }
        end
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_greedycontract' })
                    if joker_card then
                        joker_card:set_edition("e_negative", true)
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}
