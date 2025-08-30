SMODS.Joker{ --Hallucinations I
    key = "hallucinationsi",
    config = {
        extra = {
            jokercount = 1
        }
    },
    loc_txt = {
        ['name'] = 'Hallucinations I',
        ['text'] = {
            [1] = '{X:mult,C:white}X0.2{} for every joker',
            [2] = 'in your possesion',
            [3] = '{C:inactive}(Currently:{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 1,
    rarity = "flush_hallucinations",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 9
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
        return {vars = {card.ability.extra.jokercount + (#(G.jokers and (G.jokers and G.jokers.cards or {}) or {})) * 0.2}}
    end,

    set_ability = function(self, card, initial)
        card:set_edition("e_negative", true)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.jokercount + (#(G.jokers and G.jokers.cards or {})) * 0.2
                }
        end
    end
}
