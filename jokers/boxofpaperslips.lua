SMODS.Joker{ --Box of Paper Slips
    key = "boxofpaperslips",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Box of Paper Slips',
        ['text'] = {
            [1] = '{s:2,E:1}Infinite{} {s:2,C:red,E:1}Debt{}',
            [2] = '{s:0.8}not realy infinite more of maximum of 1e210 of debt{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1000,
    rarity = "flush_resplendant",
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
      end
}
