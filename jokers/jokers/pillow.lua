SMODS.Joker{ --Pillow
    key = "pillow",
    config = {
        extra = {
            NumeratorIncrement = 0,
            DenominatorIncrement = 0,
            numerator = 0,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pillow',
        ['text'] = {
            [1] = '{C:inactive,s:0.8}Death = Good Luck!{}',
            [2] = 'If a card is {C:attention}sold{}, {C:attention}destroyed{}, or a consumable is {C:attention}used{},',
            [3] = 'if {C:green}denominator{} is greater than {C:attention}0{}, decrement it by {C:attention}1{}',
            [4] = 'if {C:green}denominator{} is equal to {C:attention}0{}, increment {C:green}numerator{} by {C:attention}1{}',
            [5] = '{C:attention}Vice versa{} if a card is {C:attention}bought{}, or a playing card is {C:attention}added{}',
            [6] = '{C:inactive}(Currently{} {C:green}+#1# Numerator{}, {C:green}+#2# Denominator{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.NumeratorIncrement, card.ability.extra.DenominatorIncrement}}
    end,

    calculate = function(self, card, context)
          if context.mod_probability  then
          local numerator, denominator = context.numerator, context.denominator
                  numerator = numerator + card.ability.extra.NumeratorIncrement
                denominator = denominator + card.ability.extra.DenominatorIncrement
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
        if context.selling_card  then
            if (card.ability.extra.DenominatorIncrement or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.NumeratorIncrement = (card.ability.extra.NumeratorIncrement) + 1
                    return true
                end,
                    message = "+1 Numerator"
                }
            elseif (card.ability.extra.DenominatorIncrement or 0) > 0 then
                return {
                    func = function()
                    card.ability.extra.DenominatorIncrement = math.max(0, (card.ability.extra.DenominatorIncrement) - 1)
                    return true
                end,
                    message = "-1 Denominator"
                }
            end
        end
        if context.buying_card  then
            if (card.ability.extra.NumeratorIncrement or 0) > 0 then
                return {
                    func = function()
                    card.ability.extra.NumeratorIncrement = math.max(0, (card.ability.extra.NumeratorIncrement) - 1)
                    return true
                end,
                    message = "-1 Numerator"
                }
            elseif (card.ability.extra.NumeratorIncrement or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.DenominatorIncrement = (card.ability.extra.DenominatorIncrement) + 1
                    return true
                end,
                    message = "+1 Denominator"
                }
            end
        end
        if context.remove_playing_cards  then
            if (card.ability.extra.DenominatorIncrement or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.NumeratorIncrement = (card.ability.extra.NumeratorIncrement) + 1
                    return true
                end,
                    message = "+1 Numerator"
                }
            elseif (card.ability.extra.DenominatorIncrement or 0) > 0 then
                return {
                    func = function()
                    card.ability.extra.DenominatorIncrement = math.max(0, (card.ability.extra.DenominatorIncrement) - 1)
                    return true
                end,
                    message = "-1 Denominator"
                }
            end
        end
        if context.playing_card_added  then
            if (card.ability.extra.NumeratorIncrement or 0) > 0 then
                return {
                    func = function()
                    card.ability.extra.NumeratorIncrement = math.max(0, (card.ability.extra.NumeratorIncrement) - 1)
                    return true
                end,
                    message = "-1 Numerator"
                }
            elseif (card.ability.extra.NumeratorIncrement or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.DenominatorIncrement = (card.ability.extra.DenominatorIncrement) + 1
                    return true
                end,
                    message = "+1 Denominator"
                }
            end
        end
        if context.using_consumeable  then
            if (card.ability.extra.DenominatorIncrement or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.NumeratorIncrement = (card.ability.extra.NumeratorIncrement) + 1
                    return true
                end,
                    message = "+1 Numerator"
                }
            elseif (card.ability.extra.DenominatorIncrement or 0) > 0 then
                return {
                    func = function()
                    card.ability.extra.DenominatorIncrement = math.max(0, (card.ability.extra.DenominatorIncrement) - 1)
                    return true
                end,
                    message = "-1 Denominator"
                }
            end
        end
    end
}