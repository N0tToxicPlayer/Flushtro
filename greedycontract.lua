SMODS.Joker{ --Greedy Contract
    key = "greedycontract",
    config = {
        extra = {
            dollars = 0
        }
    },
    loc_txt = {
        ['name'] = 'Greedy Contract',
        ['text'] = {
            [1] = 'so the contract says;',
            [2] = '\"you will {C:attention}give{} me {C:attention}all your money{} at the end',
            [3] = 'of the round\"'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "flush_unforgiving",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 4,
        y = 9
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    local target_amount = card.ability.extra.dollars
                    local current_amount = G.GAME.dollars
                    local difference = target_amount - current_amount
                    ease_dollars(difference)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(card.ability.extra.dollars), colour = G.C.MONEY})
                    return true
                end
                }
        end
    end
}