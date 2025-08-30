SMODS.Joker{ --MisprintMisprintMisprint
    key = "misprintmisprintmisprint",
    config = {
        extra = {
            xchips_min = 1,
            xchips_max = 20,
            Xmult_min = 1,
            Xmult_max = 20
        }
    },
    loc_txt = {
        ['name'] = 'MisprintMisprintMisprint',
        ['text'] = {
            [1] = '73 32 107 110 111 119',
            [2] = '32 121 111 117 32 116',
            [3] = '114 97 110 115 108 97 116',
            [4] = '101 100 32 116 104 105',
            [5] = '115 32 116 101 120 116',
            [6] = '32 99 97 117 115 101 32',
            [7] = '121 111 117 39 114',
            [8] = '101 32 99 117 114 105',
            [9] = '111 117 115 32 58 51'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 11
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = pseudorandom('xchips_5db6f81c', card.ability.extra.xchips_min, card.ability.extra.xchips_max),
                    extra = {
                        Xmult = pseudorandom('Xmult_fd2ea0e4', card.ability.extra.Xmult_min, card.ability.extra.Xmult_max)
                        }
                }
        end
    end
}
