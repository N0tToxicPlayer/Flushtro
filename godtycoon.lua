SMODS.Joker{ --GOD TYCOON
    key = "godtycoon",
    config = {
        extra = {
            XMult = 5,
            Chips = 5,
            Hands = 2,
            Discards = 2,
            HandSize = 3,
            currentmoney = 0
        }
    },
    loc_txt = {
        ['name'] = 'GOD TYCOON',
        ['text'] = {
            [1] = 'and he suggested:',
            [2] = '{X:mult,C:white}X#1#{} {C:dark_edition}GOD{} MULT, {X:chips,C:white}X#2#{} {C:dark_edition}GOD{} CHIPS,',
            [3] = 'DOUBLES {C:dark_edition}GOD{} MONEY AFTER {C:dark_edition}GOD{} ROUND,',
            [4] = '{C:blue}+#3#{} {C:dark_edition}GOD{} HANDS, {C:red}+#4#{} {C:dark_edition}GOD{} DISCARDS,',
            [5] = '{C:attention}+#5#{} {C:dark_edition}GOD{} HAND SIZE, {C:attention}DISABLES{} {C:dark_edition}GOD{} BOSS BLIND'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 30,
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
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.XMult, card.ability.extra.Chips, card.ability.extra.Hands, card.ability.extra.Discards, card.ability.extra.HandSize}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.XMult,
                    extra = {
                        x_chips = card.ability.extra.Chips,
                        colour = G.C.DARK_EDITION
                        }
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = G.GAME.dollars
                }
        end
        
    if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
        G.GAME.blind:disable()
        play_sound('timpani')
        SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
    end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.Hands
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.Discards
        G.hand:change_size(card.ability.extra.HandSize)
        
  if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
      G.GAME.blind:disable()
      play_sound('timpani')
      SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
  end
  
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.Hands
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.Discards
        G.hand:change_size(-card.ability.extra.HandSize)
    end
}