SMODS.Joker{ --Big Smiley
    key = "bigsmiley",
    config = {
        extra = {
            XMult = 800,
            XChips = 800
        }
    },
    loc_txt = {
        ['name'] = 'Big Smiley',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = '{X:chips,C:white}X#2#{} Chips'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1.2, 
        h = 95 * 1.2
    },
    cost = 8,
    rarity = "flush_mythical",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },
    soul_pos = {
        x = 2,
        y = 2
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult, card.ability.extra.XChips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.XMult,
                    extra = {
                        x_chips = card.ability.extra.XChips,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
    end
}
