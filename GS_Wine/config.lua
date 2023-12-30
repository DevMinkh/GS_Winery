Config = {}

Config.Locale = 'en' -- Jezik // Language

Config.Vinarija = { -- Winery
    {
        branjekorde = vector4(-1901.0432, 1966.2927, 147.3533, 161.7360),
            -- vector4(-1896.1359, 1963.5258, 147.4811, 199.2892)

        --# Branje // Picking
        pickingtime = 5, -- U sekundama // In seconds
        pickingdict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', -- Dict Animacije // Dict Animation
        pickingclip = 'machinic_loop_mechandplayer', -- Clip Animacije // Clip Animation
        pickingicon = 'fas fa-hand', -- Ikonica za target // Icon for target
        grapeitem = 'grozdje', -- Item koji ce dobiti // Item that will they get
        grapecount = math.random(1,3), -- Koliko ce dobiti // How much will they get

        --# Bure // Barrel
        barrelprop = 'prop_barrel_02b', -- Prop
        barrelkorde = vector4(-1891.3844, 2039.1621, 140.8767, 176.2289), -- Kordinate bureta // Barrel coordinates
        needgrape = 4, -- Koliko treba da ima grozdja da bi napravio vino // How much they need grapes to make wine
        puttingtime = 5, -- U sekundama // In seconds
        puttingdict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', -- Dict Animacije // Dict Animation
        puttingclip = 'machinic_loop_mechandplayer', -- Clip Animacije // Clip Animation
        waitforwine = 5, -- Koliko trebaju sacekati da dobiju vino // How much they need to wait to get wine
        wineitem = 'crvenovino', -- Item vina // Wine item
        winecount = 1, -- Koliko ce dobiti vina // How much will they get wine

        --# Ped
        coords = vector4(-35.7422, 2870.9666, 59.6034, 158.5945), -- Kordinate peda // Ped coords
        model = 'a_m_m_farmer_01', -- Hash peda // Ped hash
        pedscenario = 'WORLD_HUMAN_CLIPBOARD', -- Ped Scenario
        pregovaranjedict = 'misscarsteal4@actor', -- Igrac Dict // Player Dict
        pregovaranjeclip = 'actor_berating_loop', -- Igrac Clip // Player Clip
        pedicon = 'fas fa-wine-bottle', -- Ikonica na pedu // Icon on ped
        wineprice = math.random(50,100), -- Koliko ce kostati 1 vino // How much per wine will cost
        rukovanjedict = 'mp_ped_interaction', -- Handshake dict
        rukovanjeclip = 'handshake_guy_a' -- Handshake clip
    }
}

Config.Blipovi = {
    {
        Ime = "Vinarija", -- Ime blipa // Name of blip // Winery
        Velicina = 1, -- Velicina blipa // Size of blip
        Boja = 50, -- Boja blipa // Color of blip
        Ikonica = 478, -- Blip sprite // Blip sprite
        Kordinate = vector3(-1891.6202, 2040.2919, 140.8977), -- Kordinate blipa // Coords of blip
        Pokazuj = 6, -- Display
    },
    {
        Ime = "Kupac Vina", -- Ime blipa // Name of blip // Buyer of wine
        Velicina = 1, -- Velicina blipa // Size of blip
        Boja = 24, -- Boja blipa // Color of blip
        Ikonica = 280, -- Blip sprite // Blip sprite
        Kordinate = vector3(-35.7422, 2870.9666, 59.6034), -- Kordinate blipa // Coords of blip
        Pokazuj = 6, -- Display
    }
}