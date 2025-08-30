SMODS.Joker{ --NOSOI
    key = "nosoi",
    config = {
        extra = {
            odds = 5
        }
    },
    loc_txt = {
        ['name'] = 'NOSOI',
        ['text'] = {
            [1] = '{C:red,s:3}SPREAD{}',
            [2] = '{C:red,s:3}SPREAD{}',
            [3] = '{C:red,s:3}SPREAD{}',
            [4] = '{C:red,s:3}SPREAD{}',
            [5] = '{C:red,s:3}SPREAD{}',
            [6] = '{C:red,s:3}SPREAD{}',
            [7] = ''
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 13
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
    soul_pos = {
        x = 2,
        y = 13
    },

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_e14e3ba4', 1, card.ability.extra.odds, 'j_flush_nosoi', false) then
              local created_joker = true
                  G.E_MANAGER:add_event(Event({
                      func = function()
                          local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_flush_nosoi' })
                          if joker_card then
                              joker_card:set_edition("e_negative", true)
                              
                          end
                          
                          return true
                      end
                  }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "SPREAD", colour = G.C.BLUE})
          end
            end
        end
    end
}