SMODS.Joker{ --Paid with Credit
    key = "paidwithcredit",
    config = {
        extra = {
            reroll_amount = 1,
            DebtStored = 0,
            Incremental = 5,
            AnteRemaining = 2
        }
    },
    loc_txt = {
        ['name'] = 'Paid with Credit',
        ['text'] = {
            [1] = '{C:green}Rerolls{} are {C:attention}free{} but stores',
            [2] = '{C:money}$#2#{} of {C:red}debt{} for',
            [3] = 'every {C:green}reroll{} that will deduct your',
            [4] = '{C:money}money{} in {C:attention}#3#{} Antes.',
            [5] = '{C:inactive}(Currently{} {C:money}$#1#{} {C:inactive}of{} {C:red}debt{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["flush_smiley"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.DebtStored, card.ability.extra.Incremental, card.ability.extra.AnteRemaining}}
    end,

    calculate = function(self, card, context)
        if context.reroll_shop  then
                return {
                    func = function()
                    card.ability.extra.DebtStored = (card.ability.extra.DebtStored) + card.ability.extra.Incremental
                    return true
                end,
                    message = "Paid with Credit"
                }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if (card.ability.extra.AnteRemaining or 0) > 1 then
                return {
                    func = function()
                    card.ability.extra.AnteRemaining = math.max(0, (card.ability.extra.AnteRemaining) - 1)
                    return true
                end,
                    message = "1"
                }
            elseif (card.ability.extra.AnteRemaining or 0) <= 1 then
                local DebtStored_value = card.ability.extra.DebtStored
                return {
                    func = function()
                    card.ability.extra.AnteRemaining = 2
                    return true
                end,
                    extra = {
                        dollars = -DebtStored_value,
                            message = "Debt Paid",
                        colour = G.C.MONEY,
                        extra = {
                            func = function()
                    card.ability.extra.DebtStored = 0
                    return true
                end,
                            colour = G.C.BLUE
                        }
                        }
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.reroll_amount)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-(card.ability.extra.reroll_amount))
    end
}