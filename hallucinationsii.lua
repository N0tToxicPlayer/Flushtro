SMODS.Joker{ --Hallucinations II
    key = "hallucinationsii",
    config = {
        extra = {
            retriggers = 2,
            Mult = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Hallucinations II',
        ['text'] = {
            [1] = 'Retriggers cards {C:attention}#1#{} times',
            [2] = 'and applies {X:mult,C:white}X#2#{} Mult'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 8,
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
        x = 9,
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
        return {vars = {card.ability.extra.retriggers, card.ability.extra.Mult}}
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
        if context.repetition and context.cardarea == G.play  then
                return {
                    repetitions = card.ability.extra.retriggers,
                    message = localize('k_again_ex')
                }
        end
        if context.individual and context.cardarea == G.play  then
                return {
                    Xmult = card.ability.extra.Mult
                }
        end
    end
}