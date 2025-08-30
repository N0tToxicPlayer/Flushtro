SMODS.Joker{ --cokeblock
    key = "cokeblock",
    config = {
        extra = {
            Incremental = 0.4043,
            ExpMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'cokeblock',
        ['text'] = {
            [1] = 'Gains {X:mult,C:white}^#1#{} Mult for',
            [2] = 'every scored {C:attention}4{}, {C:attention}Ace{}, or {C:attention}3{}',
            [3] = '(Currenrly {X:mult,C:white}^#2#{} Mult)',
            [4] = '{C:inactive}{s:0.8}original idea by: cokeblock (cokelatro){}{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 43,
    rarity = "flush_mythical",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 3,
        y = 4
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
        return {vars = {card.ability.extra.Incremental, card.ability.extra.ExpMult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 4 then
                card.ability.extra.ExpMult = (card.ability.extra.ExpMult) + card.ability.extra.Incremental
                return {
                    message = "Upgrade!"
                }
            elseif context.other_card:get_id() == 14 then
                card.ability.extra.ExpMult = (card.ability.extra.ExpMult) + card.ability.extra.Incremental
                return {
                    message = "Upgrade!"
                }
            elseif context.other_card:get_id() == 3 then
                card.ability.extra.ExpMult = (card.ability.extra.ExpMult) + card.ability.extra.Incremental
                return {
                    message = "Upgrade!"
                }
            end
        end
    end
}
