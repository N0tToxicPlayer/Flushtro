SMODS.Joker{ --Hallucinations III
    key = "hallucinationsiii",
    config = {
        extra = {
            retriggers = 2,
            Mult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Hallucinations III',
        ['text'] = {
            [1] = '{C:attention}Copies{} the ability of the {C:attention}left{}',
            [2] = 'of this Joker',
            [3] = '{X:mult,C:white}X#2#{} Mult, Retriggers {C:attention}#1#{} TImes'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 10
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
        x = 1,
        y = 10
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
        
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        local ret = SMODS.blueprint_effect(card, target_joker, context)
        if ret then
            SMODS.calculate_effect(ret, card)
        end
    end
}