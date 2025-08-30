SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end

local function load_rarities_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("rarities.lua"))()
end

load_rarities_file()
local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
SMODS.ObjectType({
    key = "flush_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true,
        ["j_flush_orange"] = true
    },
})

SMODS.ObjectType({
    key = "flush_smiley",
    cards = {
        ["j_flush_alosingsmileyisraging"] = true,
        ["j_flush_advancedplaqueentanglements"] = true,
        ["j_flush_allornothing"] = true,
        ["j_flush_antimatter"] = true,
        ["j_flush_babysmiley"] = true,
        ["j_flush_backtheresmiley"] = true,
        ["j_flush_bigsmiley"] = true,
        ["j_flush_discountedsmiley"] = true,
        ["j_flush_distraught"] = true,
        ["j_flush_fedorasmiley"] = true,
        ["j_flush_geekedinvslockedin"] = true,
        ["j_flush_hdweesmiley"] = true,
        ["j_flush_itsjustaburningsmiley"] = true,
        ["j_flush_mitosis"] = true,
        ["j_flush_mythicsample"] = true,
        ["j_flush_onemult"] = true,
        ["j_flush_paidwithcredit"] = true,
        ["j_flush_pixelinconsistent"] = true,
        ["j_flush_pleaselegendary"] = true,
        ["j_flush_postawarenessconfusions"] = true,
        ["j_flush_punchingbabysmileysinpublic"] = true,
        ["j_flush_realverysmiley"] = true,
        ["j_flush_robbery"] = true,
        ["j_flush_smiley"] = true,
        ["j_flush_smileyhorde"] = true,
        ["j_flush_smileyvanity"] = true,
        ["j_flush_staticsmiley"] = true,
        ["j_flush_strongstart"] = true,
        ["j_flush_three"] = true,
        ["j_flush_twentyseven"] = true,
        ["j_flush_verysmiley"] = true,
        ["j_flush_weathersmiley"] = true,
        ["j_flush_weesmiley"] = true
    },
})

SMODS.ObjectType({
    key = "flush_cardaholic",
    cards = {
        ["j_flush_bluesealaholic"] = true,
        ["j_flush_bonusaholic"] = true,
        ["j_flush_foilaholic"] = true,
        ["j_flush_glassaholic"] = true,
        ["j_flush_goldsealaholic"] = true,
        ["j_flush_goldaholic"] = true,
        ["j_flush_hologramaholic"] = true,
        ["j_flush_luckaholic"] = true,
        ["j_flush_multaholic"] = true,
        ["j_flush_polychromaholic"] = true,
        ["j_flush_purplesealaholic"] = true,
        ["j_flush_redsealaholic"] = true,
        ["j_flush_steelaholic"] = true,
        ["j_flush_stoneaholic"] = true,
        ["j_flush_wildaholic"] = true,
        ["j_flush_zfightaholic"] = true
    },
})

SMODS.ObjectType({
    key = "flush_crappylegendary",
    cards = {
        ["j_flush_cano"] = true,
        ["j_flush_cicot"] = true,
        ["j_flush_pekeo"] = true,
        ["j_flush_tribolet"] = true,
        ["j_flush_yoric"] = true
    },
})

SMODS.ObjectType({
    key = "flush_glaggle",
    cards = {
        ["j_flush_enfosi"] = true,
        ["j_flush_gazo"] = true,
        ["j_flush_gembo"] = true,
        ["j_flush_giggler"] = true,
        ["j_flush_gleeber"] = true,
        ["j_flush_gloober"] = true
    },
})