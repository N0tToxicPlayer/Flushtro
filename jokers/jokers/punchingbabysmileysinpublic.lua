SMODS.Joker{ --Punching Baby Smileys in Public!!
    key = "punchingbabysmileysinpublic",
    config = {
        extra = {
            incremental = 0.25,
            xmult = 1,
            odds = 4,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Punching Baby Smileys in Public!!',
        ['text'] = {
            [1] = 'When a hand is {C:attention}played{},',
            [2] = '{C:green}#4# in #5#{} chance of spawning',
            [3] = 'a {C:dark_edition}negative{} {C:attention}Baby Smiley{} and destroying it',
            [4] = 'after hand is scoring.',
            [5] = '{X:mult,C:white}X#1#{} for every Baby Smiley {C:attention}destroyed{}',
            [6] = '{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 5,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_flush_punchingbabysmileysinpublic') 
        return {vars = {card.ability.extra.incremental, card.ability.extra.xmult, card.ability.extra.var1, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    Xmult = card.ability.extra.xmult
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_20f5c719', 1, card.ability.extra.odds, 'j_flush_punchingbabysmileysinpublic', false) then
              local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_babysmiley' })
                          if joker_card then
                              joker_card:set_edition("e_negative", true)
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
          end
                        return true
                    end
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_flush_babysmiley" then
              return true
          end
      end
      return false
  end)() then
                return {
                    func = function()
                local target_joker = nil
                for i, joker in ipairs(G.jokers.cards) do
                    if joker.config.center.key == "j_flush_babysmiley" and not joker.ability.eternal and not joker.getting_sliced then
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
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
                    return true
                end,
                    extra = {
                        func = function()
                    card.ability.extra.xmult = (card.ability.extra.xmult) + card.ability.extra.incremental
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
    end
}