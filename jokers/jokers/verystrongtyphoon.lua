SMODS.Joker{ --Very Strong Typhoon
    key = "verystrongtyphoon",
    config = {
        extra = {
            MultX = 6,
            ChipX = 8,
            Incremental = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Very Strong Typhoon',
        ['text'] = {
            [1] = '{s:2,C:red,E:1}Pray.{}',
            [2] = '',
            [3] = '{X:mult,C:white}X#1#{} Mult and {X:chips,C:white}X#2#{} Chips.',
            [4] = '',
            [5] = 'If a first hand is discarded, {C:attention}destroy{} hand and',
            [6] = '{X:attention,C:white}+#3#{} to {X:mult,C:white}XMult{} and {X:chips,C:white}XChips{} for each card {C:attention}discarded{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
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
    soul_pos = {
        x = 1,
        y = 22
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' 
          or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.MultX, card.ability.extra.ChipX, card.ability.extra.Incremental}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.ChipX,
                    extra = {
                        Xmult = card.ability.extra.MultX
                        }
                }
        end
        if context.discard  then
            if G.GAME.current_round.discards_used <= 0 then
                return {
                    remove = true,
                  message = "Destroyed!",
                    extra = {
                        func = function()
                    card.ability.extra.MultX = (card.ability.extra.MultX) + card.ability.extra.Incremental
                    return true
                end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                    card.ability.extra.ChipX = (card.ability.extra.ChipX) + card.ability.extra.ChipX
                    return true
                end,
                            colour = G.C.GREEN
                        }
                        }
                }
            end
        end
    end
}