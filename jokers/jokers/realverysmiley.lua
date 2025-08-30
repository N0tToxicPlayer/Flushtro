SMODS.Joker{ --Real Very Smiley
    key = "realverysmiley",
    config = {
        extra = {
            ExpMult = 10,
            JokerSlots = 20
        }
    },
    loc_txt = {
        ['name'] = 'Real Very Smiley',
        ['text'] = {
            [1] = '{C:attention}+#2#{} Joker Slots',
            [2] = '{X:mult,C:white}^#1#{} Mult',
            [3] = '{C:inactive,s:0.8}No Alternate Smiley included really{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 250,
    rarity = "flush_resplendant",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.ExpMult, card.ability.extra.JokerSlots}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.ExpMult
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.JokerSlots
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.JokerSlots
    end
}