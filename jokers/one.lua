SMODS.Joker{ --One
    key = "one",
    config = {
        extra = {
            XMult = 1,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'One',
        ['text'] = {
            [1] = 'If a {C:attention}number{} card is played,',
            [2] = 'turn it into an {C:attention}Ace{} and gain {X:mult,C:white}^Mult{}',
            [3] = 'respective to the number',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}^#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 311,
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
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 2 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.XMult = (card.ability.extra.XMult) + 2
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card:get_id() == 4 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.XMult = (card.ability.extra.XMult) + 4
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card:get_id() == 5 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.XMult = (card.ability.extra.XMult) + 5
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card:get_id() == 6 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.XMult = (card.ability.extra.XMult) + 6
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card:get_id() == 7 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.XMult = (card.ability.extra.XMult) + 7
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card:get_id() == 8 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.var1 = (card.ability.extra.var1) + 8
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card:get_id() == 9 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.XMult = (card.ability.extra.XMult) + 9
                return {
                    message = "Card Modified!"
                }
            elseif context.other_card:get_id() == 10 then
                assert(SMODS.change_base(context.other_card, nil, "Ace"))
                card.ability.extra.XMult = (card.ability.extra.XMult) + 10
                return {
                    message = "Card Modified!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.XMult
                }
        end
    end
}
