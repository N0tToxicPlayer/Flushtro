SMODS.Joker{ --mammoth
    key = "mammoth",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'mammoth',
        ['text'] = {
            [1] = 'mammorino',
            [2] = '{C:inactive,s:0.8}turns the cards into mamoth cards with mamoth seals{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
          or args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'sho' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                context.other_card:set_ability(G.P_CENTERS.m_flush_mamothcard)
                context.other_card:set_seal("flush_memoth", true)
                return {
                    message = "Card Modified!"
                }
        end
    end
}
