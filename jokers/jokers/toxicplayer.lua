SMODS.Joker{ --ToxicPlayer
    key = "toxicplayer",
    config = {
        extra = {
            reroll_amount = 1,
            XChips = 30,
            XMult = 30
        }
    },
    loc_txt = {
        ['name'] = 'ToxicPlayer',
        ['text'] = {
            [1] = 'who wouldnt want a {C:attention}self insert{}?',
            [2] = '{X:mult,C:white}^#2#{} Mult, {X:chips,C:white}^#1#{} Chips to every card scored',
            [3] = 'Rerolls are {C:attention}free{}',
            [4] = 'Scored cards turn into {C:edition}Polychrome{},',
            [5] = '{C:attention}Glass{}, {C:attention}Red Seal{}. {C:attention}King{} of {C:spades}Spades{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 20
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 200,
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
        return {vars = {card.ability.extra.XChips, card.ability.extra.XMult}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                assert(SMODS.change_base(context.other_card, "Spades", "King"))
                context.other_card:set_ability(G.P_CENTERS.m_glass)
                context.other_card:set_seal("Red", true)
                context.other_card:set_edition("e_polychrome", true)
                return {
                    e_mult = card.ability.extra.XChips,
                    extra = {
                        e_chips = card.ability.extra.XMult,
                        colour = G.C.DARK_EDITION,
                        extra = {
                            message = "Card Modified!",
                            colour = G.C.BLUE
                        }
                        }
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.reroll_amount)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-(card.ability.extra.reroll_amount))
    end
}