SMODS.Joker{ --Wee Wee Joker
    key = "weeweejoker",
    config = {
        extra = {
            Chips = 0,
            Incremental = 2
        }
    },
    loc_txt = {
        ['name'] = 'Wee Wee Joker',
        ['text'] = {
            [1] = 'This joker gains {C:chips}+#2#{} Chips',
            [2] = 'and gives {C:chips}+#1# {}Chips',
            [3] = 'everytime a {C:attention}card{} is scored',
            [4] = '{C:inactive}(Currently{} {C:chips}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 22
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Chips, card.ability.extra.Incremental}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                card.ability.extra.Chips = (card.ability.extra.Chips) + card.ability.extra.Incremental
                return {
                    chips = card.ability.extra.Chips
                }
        end
    end
}