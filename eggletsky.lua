SMODS.Joker{ --Eggletsky
    key = "eggletsky",
    config = {
        extra = {
            mult = 1,
            Incremental = 0.2,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Eggletsky',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}X#2#{} Mult for every',
            [2] = 'fried chicken it eats',
            [3] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = "flush_egg",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 5
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
        return {vars = {card.ability.extra.mult, card.ability.extra.Incremental}}
    end,

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_flush_friedchicken" then
              return true
          end
      end
      return false
  end)() then
                return {
                    func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_flush_friedchicken" and not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                        break
                    end
                end
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Yummy!", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + card.ability.extra.Incremental
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.mult
                }
        end
    end
}