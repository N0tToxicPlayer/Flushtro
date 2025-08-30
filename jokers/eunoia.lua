SMODS.Joker{ --Eunoia
    key = "eunoia",
    config = {
        extra = {
            debt_amount = 1,
            Discount = 50,
            Debt = 50,
            FreeRerolls = 5,
            Slots = 1
        }
    },
    loc_txt = {
        ['name'] = 'Eunoia',
        ['text'] = {
            [1] = 'Discounts all {C:attention}shop items{} by {C:attention}#1#%{}.',
            [2] = 'Allows {C:red}Debt{} of {C:red}$#2#{}.',
            [3] = 'Increases Booster and Voucher Slots by {C:attention}#4#{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' 
          or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Discount, card.ability.extra.Debt, card.ability.extra.FreeRerolls, card.ability.extra.Slots}}
    end,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - (card.ability.extra.debt_amount)
        SMODS.change_voucher_limit(card.ability.extra.Slots)
        SMODS.change_booster_limit(card.ability.extra.Slots)
        -- Showman effect enabled (allow duplicate cards)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
    func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true
    end
}))
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + (card.ability.extra.debt_amount)
        SMODS.change_voucher_limit(-card.ability.extra.Slots)
        SMODS.change_booster_limit(-card.ability.extra.Slots)
        -- Showman effect disabled
    end
}


local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    
    if next(SMODS.find_card("j_flush_eunoia")) then
        if (self.ability.set == 'Joker' or self.ability.set == 'Tarot' or self.ability.set == 'Planet' or self.ability.set == 'Spectral' or self.ability.set == 'Enhanced' or self.ability.set == 'Booster' or self.ability.set == 'Voucher') then
            self.cost = math.max(0, self.cost - (Discount))
        end
    end
    
    self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
    self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
end
local smods_showman_ref = SMODS.showman
function SMODS.showman(card_key)
    if next(SMODS.find_card("j_flush_eunoia")) then
        return true
    end
    return smods_showman_ref(card_key)
end
