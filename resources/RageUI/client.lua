local Walyptus = {}
local Utils = {}
local Account = {}
local Administration = {
    GamerTags = {},
    Characters = {},
    CharacterView = {},
    Reports = {},
    Customisation = {
        PedIndex = 1,
        PedEffect = 1
    },
    ActionId = {
        [1] = false,
        [3] = false,
        [4] = false,
        [5] = false
    },
    Index = {
        Staff = 1
    }
}
local Character = {}
local Objects = {}
local Weapons = {}
local Jobs = {}
local Npcs = {}
local Markers = {}
local Klothes = {}
local KlothesProps = {}
local VehiclesData = {}
local ClothesPreset = {}
local RageUI = {}
local RMenu = setmetatable({}, RMenu)
IsOnKeyboardInput = false
function Printf(s, ...)
    print(string.format(s, ...))
end
function KeyboardInput(TextEntry, ExampleText, MaxStringLenght, OnlyNumber)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    IsOnKeyboardInput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        IsOnKeyboardInput = false
        if (OnlyNumber) then
            number = tonumber(result)
            if (number ~= nil) then
                if (number < 0) then
                    return nil
                end
                return number
            end
            return nil
        else
            return result
        end
    else
        Citizen.Wait(500)
        IsOnKeyboardInput = false
        return nil
    end
end
function sf (s, ...)
    return string.format(s, ...)
end
local AdminTool = {
    npcspawner = { modelname = "a_m_m_fatlatin_01", Anim = { dict = "", name = "" } },
    markerspawner = { usageIndex = 1, preview = { 0, false }, data = { Colors = { 255, 80, 80, 100 }, Type = 27, Size = 1.5, Rotate = true, RotateIndex = 1, Usage = "ApuShop", Description = "Appuyez sur ~g~E ~w~", TouchId = 51, Distances = 1.00 } },
    jobsbuilder = { name = "Nom du job (Par défaut)" },
    blipsBuilder = { preview = { 0, false, blip = {} }, data = { Name = "Garage Central", Color = 0, Scale = 1.00, SpriteId = 357, Alpha = 255 } },
    noClip = false
}
local CharacterCreation = {
    sex = {
        index = 1,
        label = { "Homme", "Femme" },
        model = { "mp_m_freemode_01", "mp_f_freemode_01" },
        current = "",
        dict = { "mp_character_creation@customise@male_a", "mp_character_creation@customise@female_a" }
    },
    parents = {
        mum = {
            name = { "Hannah", "Audrey", "Jasmine", "Giselle", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Grace", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma", "Misty" },
            id = { 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 45 },
            index = 1,
        },
        dad = {
            name = { "Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Claude", "Niko", "John" },
            id = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 42, 43, 44 },
            index = 1,
        }
    },
    HeritageShape = {
        h = 0.5, i = 5
    },
    HeritageColor = {
        h = 0.5, i = 5
    },
    grid = {
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, rx = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, rx = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, rx = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        },
        {
            index = 1,
            label = { "Personnalisé(e)" },
            x = 0.5, y = 0.5, rx = 0.0, ry = 0.0
        }
    },
    panelData = {
        hairs = {
            index_one = 1, index_two = 1
        },
        strands = {
            index_one = 1, index_two = 1
        },
        eyebrows = {
            index_one = 1, index_two = 1
        },
        beards = {
            index_one = 1, index_two = 1
        },
        lipstick = {
            index_one = 1, index_two = 1,
        },
        blush = {
            index_one = 1, index_two = 1,
        },
        opacity = {
            eyebrows = 1.0, beards = 1.0, blemishes = 1.0, ageing = 1.0, complexion = 1.0, freckles = 1.0, sundamage = 1.0, makeup = 1.0, lipstick = 1.0, blush = 1.0
        }
    },
    hair = {
        name = {
            { "Rasé de près", "Côtés rasés", "Crête", "Coupe hipster", "Raie sur le côté", "Coupe courte", "Coupe biker", "Queue de cheval", "Nattes tressées", "Cheveux gominés", "Brosse", "Cheveux hérissés", "Coupe césar", "Coupe inégale", "Dreadlocks", "Cheveux longs", "Boucles ébouriffées", "Surfeur", "Court, raie sur le côté", "Côtés gominés", "Cheveux longs gominés", "Jeune hipster", "Mullet", "Nattes tressées, classique", "Nattes tressées, palmiers", "Nattes tressées, éclairs", "Nattes tressées, plates", "Nattes tressées, zigzag", "Nattes tressées, spirales", "Brosse à l'ancienne", "Vers l'arrière", "Undercut vers l'arrière", "Undercut sur le côté", "Crête hérissée", "Mod", "Dégradé mod", "Coupe en brosse", "Coupe militaire" },
            { "Close Shave", "Short", "Layered Bob", "Pigtails", "Ponytail", "Braided Mohawk", "Braids", "Bob", "Faux Hawk", "French Twist", "Long Bob", "Loose Tied", "Pixie", "Shaved Bangs", "Top Knot", "Wavy Bob", "Messy Bun", "Pin Up Girl", "Tight Bun", "Twisted Bob", "Flapper Bob", "Big Bangs", "Braided Top Knot", "Mullet", "Pinched Cornrows", "Leaf Cornrows", "Zig Zag Cornrows", "Pigtail Bangs", "Wave Braids", "Coil Braids", "Rolled Quiff", "Loose Swept Back", "Undercut Swept Back", "Undercut Swept Side", "Spiked Mohawk", "Bandana and Braid", "Layered Mod", "Skinbyrd", "Neat Bun", "Short Bob" },
        },
        id = {
            { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 72, 73 },
            { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 76, 77 }
        },
        index = 1,
        hairDecalsList = {
            {
                [0] = { "mpbeach_overlays", "FM_Hair_Fuzz" },
                [1] = { "multiplayer_overlays", "NG_M_Hair_001" },
                [2] = { "multiplayer_overlays", "NG_M_Hair_002" },
                [3] = { "multiplayer_overlays", "NG_M_Hair_003" },
                [4] = { "multiplayer_overlays", "NG_M_Hair_004" },
                [5] = { "multiplayer_overlays", "NG_M_Hair_005" },
                [6] = { "multiplayer_overlays", "NG_M_Hair_006" },
                [7] = { "multiplayer_overlays", "NG_M_Hair_007" },
                [8] = { "multiplayer_overlays", "NG_M_Hair_008" },
                [9] = { "multiplayer_overlays", "NG_M_Hair_009" },
                [10] = { "multiplayer_overlays", "NG_M_Hair_013" },
                [11] = { "multiplayer_overlays", "NG_M_Hair_002" },
                [12] = { "multiplayer_overlays", "NG_M_Hair_011" },
                [13] = { "multiplayer_overlays", "NG_M_Hair_012" },
                [14] = { "multiplayer_overlays", "NG_M_Hair_014" },
                [15] = { "multiplayer_overlays", "NG_M_Hair_015" },
                [16] = { "multiplayer_overlays", "NGBea_M_Hair_000" },
                [17] = { "multiplayer_overlays", "NGBea_M_Hair_001" },
                [18] = { "multiplayer_overlays", "NGBus_M_Hair_000" },
                [19] = { "multiplayer_overlays", "NGBus_M_Hair_001" },
                [20] = { "multiplayer_overlays", "NGHip_M_Hair_000" },
                [21] = { "multiplayer_overlays", "NGHip_M_Hair_001" },
                [22] = { "multiplayer_overlays", "NGInd_M_Hair_000" },
                [24] = { "mplowrider_overlays", "LR_M_Hair_000" },
                [25] = { "mplowrider_overlays", "LR_M_Hair_001" },
                [26] = { "mplowrider_overlays", "LR_M_Hair_002" },
                [27] = { "mplowrider_overlays", "LR_M_Hair_003" },
                [28] = { "mplowrider2_overlays", "LR_M_Hair_004" },
                [29] = { "mplowrider2_overlays", "LR_M_Hair_005" },
                [30] = { "mplowrider2_overlays", "LR_M_Hair_006" },
                [31] = { "mpbiker_overlays", "MP_Biker_Hair_000_M" },
                [32] = { "mpbiker_overlays", "MP_Biker_Hair_001_M" },
                [33] = { "mpbiker_overlays", "MP_Biker_Hair_002_M" },
                [34] = { "mpbiker_overlays", "MP_Biker_Hair_003_M" },
                [35] = { "mpbiker_overlays", "MP_Biker_Hair_004_M" },
                [36] = { "mpbiker_overlays", "MP_Biker_Hair_005_M" },
                [72] = { "mpgunrunning_overlays", "MP_Gunrunning_Hair_M_000_M" },
                [73] = { "mpgunrunning_overlays", "MP_Gunrunning_Hair_M_001_M" }
            },
            {
                [0] = { "mpbeach_overlays", "FM_Hair_Fuzz" },
                [1] = { "multiplayer_overlays", "NG_F_Hair_001" },
                [2] = { "multiplayer_overlays", "NG_F_Hair_002" },
                [3] = { "multiplayer_overlays", "NG_F_Hair_003" },
                [4] = { "multiplayer_overlays", "NG_F_Hair_004" },
                [5] = { "multiplayer_overlays", "NG_F_Hair_005" },
                [6] = { "multiplayer_overlays", "NG_F_Hair_006" },
                [7] = { "multiplayer_overlays", "NG_F_Hair_007" },
                [8] = { "multiplayer_overlays", "NG_F_Hair_008" },
                [9] = { "multiplayer_overlays", "NG_F_Hair_009" },
                [10] = { "multiplayer_overlays", "NG_F_Hair_010" },
                [11] = { "multiplayer_overlays", "NG_F_Hair_011" },
                [12] = { "multiplayer_overlays", "NG_F_Hair_012" },
                [13] = { "multiplayer_overlays", "NG_F_Hair_013" },
                [14] = { "multiplayer_overlays", "NG_M_Hair_014" },
                [15] = { "multiplayer_overlays", "NG_M_Hair_015" },
                [16] = { "multiplayer_overlays", "NGBea_F_Hair_000" },
                [17] = { "multiplayer_overlays", "NGBea_F_Hair_001" },
                [18] = { "multiplayer_overlays", "NG_F_Hair_007" },
                [19] = { "multiplayer_overlays", "NGBus_F_Hair_000" },
                [20] = { "multiplayer_overlays", "NGBus_F_Hair_001" },
                [21] = { "multiplayer_overlays", "NGBea_F_Hair_001" },
                [22] = { "multiplayer_overlays", "NGHip_F_Hair_000" },
                [23] = { "multiplayer_overlays", "NGInd_F_Hair_000" },
                [25] = { "mplowrider_overlays", "LR_F_Hair_000" },
                [26] = { "mplowrider_overlays", "LR_F_Hair_001" },
                [27] = { "mplowrider_overlays", "LR_F_Hair_002" },
                [28] = { "mplowrider2_overlays", "LR_F_Hair_003" },
                [29] = { "mplowrider2_overlays", "LR_F_Hair_003" },
                [30] = { "mplowrider2_overlays", "LR_F_Hair_004" },
                [31] = { "mplowrider2_overlays", "LR_F_Hair_006" },
                [32] = { "mpbiker_overlays", "MP_Biker_Hair_000_F" },
                [33] = { "mpbiker_overlays", "MP_Biker_Hair_001_F" },
                [34] = { "mpbiker_overlays", "MP_Biker_Hair_002_F" },
                [35] = { "mpbiker_overlays", "MP_Biker_Hair_003_F" },
                [36] = { "multiplayer_overlays", "NG_F_Hair_003" },
                [37] = { "mpbiker_overlays", "MP_Biker_Hair_006_F" },
                [38] = { "mpbiker_overlays", "MP_Biker_Hair_004_F" },
                [76] = { "mpgunrunning_overlays", "MP_Gunrunning_Hair_F_000_F" },
                [77] = { "mpgunrunning_overlays", "MP_Gunrunning_Hair_F_001_F" }
            }
        }
    },
    colors_hair = {
        { 28, 31, 33 },
        { 39, 42, 44 },
        { 49, 46, 44 },
        { 53, 38, 28 },
        { 75, 50, 31 },
        { 92, 59, 36 },
        { 109, 76, 53 },
        { 107, 80, 59 },
        { 118, 92, 69 },
        { 127, 104, 78 },
        { 153, 129, 93 },
        { 167, 147, 105 },
        { 175, 156, 112 },
        { 187, 160, 99 },
        { 214, 185, 123 },
        { 218, 195, 142 },
        { 159, 127, 89 },
        { 132, 80, 57 },
        { 104, 43, 31 },
        { 97, 18, 12 },
        { 100, 15, 10 },
        { 124, 20, 15 },
        { 160, 46, 25 },
        { 182, 75, 40 },
        { 162, 80, 47 },
        { 170, 78, 43 },
        { 98, 98, 98 },
        { 128, 128, 128 },
        { 170, 170, 170 },
        { 197, 197, 197 },
        { 70, 57, 85 },
        { 90, 63, 107 },
        { 118, 60, 118 },
        { 237, 116, 227 },
        { 235, 75, 147 },
        { 242, 153, 188 },
        { 4, 149, 158 },
        { 2, 95, 134 },
        { 2, 57, 116 },
        { 63, 161, 106 },
        { 33, 124, 97 },
        { 24, 92, 85 },
        { 182, 192, 52 },
        { 112, 169, 11 },
        { 67, 157, 19 },
        { 220, 184, 87 },
        { 229, 177, 3 },
        { 230, 145, 2 },
        { 242, 136, 49 },
        { 251, 128, 87 },
        { 226, 139, 88 },
        { 209, 89, 60 },
        { 206, 49, 32 },
        { 173, 9, 3 },
        { 136, 3, 2 },
        { 31, 24, 20 },
        { 41, 31, 25 },
        { 46, 34, 27 },
        { 55, 41, 30 },
        { 46, 34, 24 },
        { 35, 27, 21 },
        { 2, 2, 2 },
        { 112, 108, 102 },
        { 157, 122, 80 }
    },
    colors_makeup = {
        { 153, 37, 50 },
        { 200, 57, 93 },
        { 189, 81, 108 },
        { 184, 99, 122 },
        { 166, 82, 107 },
        { 177, 67, 76 },
        { 127, 49, 51 },
        { 164, 100, 93 },
        { 193, 135, 121 },
        { 203, 160, 150 },
        { 198, 145, 143 },
        { 171, 111, 99 },
        { 176, 96, 80 },
        { 168, 76, 51 },
        { 180, 113, 120 },
        { 202, 127, 146 },
        { 237, 156, 190 },
        { 231, 117, 164 },
        { 222, 62, 129 },
        { 179, 76, 110 },
        { 113, 39, 57 },
        { 79, 31, 42 },
        { 170, 34, 47 },
        { 222, 32, 52 },
        { 207, 8, 19 },
        { 229, 84, 112 },
        { 220, 63, 181 },
        { 194, 39, 178 },
        { 160, 28, 169 },
        { 110, 24, 117 },
        { 115, 20, 101 },
        { 86, 22, 92 },
        { 109, 26, 157 },
        { 27, 55, 113 },
        { 29, 78, 167 },
        { 30, 116, 187 },
        { 33, 163, 206 },
        { 37, 194, 210 },
        { 35, 204, 165 },
        { 39, 192, 125 },
        { 27, 156, 50 },
        { 20, 134, 4 },
        { 112, 208, 65 },
        { 197, 234, 52 },
        { 225, 227, 47 },
        { 255, 221, 38 },
        { 250, 192, 38 },
        { 247, 138, 39 },
        { 254, 89, 16 },
        { 190, 110, 25 },
        { 247, 201, 127 },
        { 251, 229, 192 },
        { 245, 245, 245 },
        { 179, 180, 179 },
        { 145, 145, 145 },
        { 86, 78, 78 },
        { 24, 14, 14 },
        { 88, 150, 158 },
        { 77, 111, 140 },
        { 26, 43, 85 },
        { 160, 126, 107 },
        { 130, 99, 85 },
        { 109, 83, 70 },
        { 62, 45, 39 }
    },
    eyebrows = {
        name = { "Sans", "Équilibre", "Mode", "Cléopâtre", "Perplexes", "Féminins", "Séduction", "Froncés", "Pouffe", "Triomphe", "Insouciance", "Arrondis", "Rongeur", "Doubles", "Minces", "Dessinés", "Épilés", "Droits et fins", "Naturels", "Frisotants", "Négligés", "Chenille", "Réguliers", "Méditerranéens", "Soignés", "Épais", "Plumes", "Hérissés", "Joints", "Effilés", "Triples", "Arqués", "Coupés", "Estompés", "Simples" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33 },
        index = 1
    },
    beards = {
        name = { "Rasé de près", "Barbe naissante", "Bouc léger", "Bouc complet", "Bouc", "Menton", "Barbiche", "Collier", "Poils au menton", "Mousquetaire", "Moustache", "Barba taillée", "Mal rasé", "Bouc fin", "Fer à cheval", "Moustache et rouflaquettes", "Collier et moustache", "Bouc léger et favoris", "Rouflaquettes", "Barbe de 3 jours", "Moustache en croc", "Moustache en croc & barbe", "Moustache en guidon", "Faust", "Otto & mouche", "Otto & barbe", "Franz", "Hampstead", "Ambrose", "Lincoln" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27 },
        index = 1
    },
    blemishes = {
        name = { "Sans", "Rougeole", "Verrues", "Points", "Éruption", "Points noirs", "Squames", "Pustules", "Boutons", "Acné (partout)", "Acné", "Joue irritées", "Rougeurs", "Boutons éclatés", "Puberté", "Laideron", "Menton irrité", "Double face", "Peau mixte", "Peau grasse", "Taches", "Cicatrices d'acné", "Cicatrices d'acné (partout)", "Herpès labial", "Impétigo" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 },
        index = 1
    },
    ageing = {
        name = { "Sans", "Pattes d'oies", "Premiers signes", "Age moyen", "Rides du front", "Déprimé", "Distingué", "Agé", "Buriné", "Ridé", "Flasque", "Marqué", "Vintage", "Retraité", "Junkie", "Ancêtre" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
        index = 1
    },
    complexion = {
        name = { "Sans", "Joue roses", "Irritation pileuse", "Bouffée dee chaleur", "Coup de soleil", "Contusions", "Alcoolique", "Irrégularité", "Totem", "Vaisseaux sanguins", "Abîmé", "Pâle", "Blafard" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        index = 1
    },
    freckles = {
        name = { "Sans", "Chérubin", "Partout", "Irrégulier", "Points", "Sur le nez", "Poupée", "Mutin", "Gorgé de soleil", "Grains de beauté", "Alignés", "Mannequin", "Occasionnel", "Moucheté", "Gouttes d'eau", "Double ration", "Unilatéral", "Paires", "Croissance" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 },
        index = 1
    },
    sundamage = {
        name = { "Sans", "Irrégulier", "Granuleux", "Inégal", "Grossier", "Tanné", "Râpeux", "Brut", "Rugueux", "Rides", "Crevasses", "Rêche" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        index = 1
    },
    eyescolor = {
        name = { "Noir", "Vert", "Émeraude", "Bleu clair", "Bleu marine", "Châtain", "Marron foncé", "Noisette", "Gris foncé", "Gris clair", "Rose", "Jaune", "Violet", "Opaque" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 },
        index = 1
    },
    makeup = {
        name = { "Sans", "Noir charbonneux", "Bronze", "Gris léger", "Glamour rétro", "Aspect naturel", "Yeux de chat", "Pouffe", "Vamp", "Glamour Vinewood", "Chewing-gum", "Rêve turquoise", "Pin-up", "Passion pourpre", "Crayon charbonneux", "Rubis incandescent", "Princesse de la pop", "Eyeliner", "Larmes de sang", "Heavy Metal", "Tristesse", "Prince des ténèbres", "Rocker", "Goth", "Punk", "Dévastation" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 32, 34, 35, 36, 37, 38, 39, 40, 41 },
        index = 1
    },
    lipstick = {
        name = { "Sans", "Mat coloré", "Gloss coloré", "Contour mat", "Contour brillant", "Contour mat épais", "Contour brillant épais", "Contour mat, nues", "Contour brillant, nues", "Bavures", "Geisha" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 },
        index = 1
    },
    blush = {
        name = { "Sans", "Max", "De biais", "Rond", "Horizontal", "Beaucoup", "Coeurs", "Années 80" },
        id = { -1, 0, 1, 2, 3, 4, 5, 6 },
        index = 1
    }
}

JobAlerts = {}
Components = {}
GameTimer = {
    Vehicle = 0,
    GamerTags = 0,
    OsTime = 0,
    Mechanic = 0,
    Robbing = 0,
    Holster = 0,
}
Timer = {
    Robbing = 0
}
Doors = {}
CharactersJobs = {}
VehiclesJobs = {}
MarkersUsage = {
    {
        [1] = 'ShopClothes',
        [2] = 'ShopVehicles',
        [3] = 'GarageOut',
        [4] = 'Garage',
        [5] = 'GarageRecovered',
        [6] = 'GarageJobLegal',
        [7] = 'Harvest',
        [8] = 'Treatment',
        [9] = 'Sale',
        [10] = "Bank",
        [11] = "BuyShopObjects",
        [12] = "TakeService",
        [13] = "GarageService",
        [14] = "JobChoice",
        [15] = "WeaponShop",
        [16] = "MaskShop",
        [17] = "Storage",
        [18] = "HairShop",
        [19] = "TattooShop",
        [20] = "BlackMarketShop",
        [21] = "GarageBoat",
        [22] = "GaragePlane",
        [23] = "UnicornSoda",
        [24] = "UnicornFridge",
        [25] = "Teleports",
        [26] = "Reseller",
    },
}
VehicleStorage = {}
JobStorage = {}
Invoices = {
    Character = {},
    Target = {}
}
JobTargetInfo = {}
VehicleTargetInfo = {}
BlipIds = {}
WaitMechanicResponse = false
DistanceMechanicMenu = vector3(-281.4365, -907.3414, 31.08062)
Ragdoll = false
RageUI.Item = {}
RageUI.Panel = {}
RageUI.Window = {}
local TotalMenus = {}
local MenusType = {}
local ClcNsm = {}
function RMenu.Add(Type, Name, Menu)
    if RMenu[Type] ~= nil then
        RMenu[Type][Name] = {
            Menu = Menu,
        }
    else
        RMenu[Type] = {}
        RMenu[Type][Name] = {
            Menu = Menu
        }
    end
    if MenusType[Menu] == nil then
        MenusType[Menu] = { Type = Type }
    end
    if ClcNsm[Type] == nil then
        ClcNsm[Type] = { Closable = true }
    end
    return table.insert(TotalMenus, Menu)
end
function RMenu:Get(Type, Name)
    if self[Type] ~= nil and self[Type][Name] ~= nil then
        return self[Type][Name].Menu
    end
end
function RMenu:GetType(Type)
    if self[Type] ~= nil then
        return self[Type]
    end
end
function RMenu:Settings(Type, Name, Settings, Value)
    if Value ~= nil then
        self[Type][Name][Settings] = Value
    else
        return self[Type][Name][Settings]
    end
end
function RMenu:Delete(Type, Name)
    self[Type][Name] = nil
    collectgarbage()
end
function RMenu:DeleteType(Type)
    self[Type] = nil
    collectgarbage()
end
function RageUI.GetTypeOfMenu(Menu)
    return MenusType[Menu].Type
end
function RageUI.SetClosableTypeOfMenu(Menu)
    ClcNsm[RageUI.GetTypeOfMenu(Menu)].Closable = false
end
function RageUI.GetClosableTypeOfMenu(Menu)
    return ClcNsm[RageUI.GetTypeOfMenu(Menu)].Closable
end
print("^4RageUI - https://github.com/iTexZoz/RageUI - OpenSource Advanced UI Api^0")
function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end
function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end
RageUI.Menus = setmetatable({}, RageUI.Menus)
RageUI.Menus.__call = function()
    return true
end
RageUI.PoolMenus = RageUI.PoolMenus or {
    Timer = 0,
    Name = nil,
};
RageUI.Menus.__index = RageUI.Menus
RageUI.CurrentMenu = nil
RageUI.NextMenu = nil
RageUI.Options = 0
RageUI.ItemOffset = 0
RageUI.StatisticPanelCount = 0
RageUI.UI = {
    Current = "NativeUI",
    Style = {
        RageUI = {
            Width = 0
        },
        NativeUI = {
            Width = 0
        }
    }
}
RageUI.Settings = {
    Debug = false,
    Controls = {
        Up = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 172 },
                { 1, 172 },
                { 2, 172 },
                { 0, 241 },
                { 1, 241 },
                { 2, 241 },
            },
        },
        Down = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 173 },
                { 1, 173 },
                { 2, 173 },
                { 0, 242 },
                { 1, 242 },
                { 2, 242 },
            },
        },
        Left = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        Right = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        SliderLeft = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        SliderRight = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        Select = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 201 },
                { 1, 201 },
                { 2, 201 },
            },
        },
        Back = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 177 },
                { 1, 177 },
                { 2, 177 },
                { 0, 199 },
                { 1, 199 },
                { 2, 199 },
            },
        },
        Click = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 24 },
            },
        },
        Enabled = {
            Controller = {
                { 0, 2 }, 
                { 0, 1 }, 
                { 0, 25 }, 
                { 0, 24 }, 
            },
            Keyboard = {
                { 0, 201 }, 
                { 0, 195 }, 
                { 0, 196 }, 
                { 0, 187 }, 
                { 0, 188 }, 
                { 0, 189 }, 
                { 0, 190 }, 
                { 0, 202 }, 
                { 0, 217 }, 
                { 0, 242 }, 
                { 0, 241 }, 
                { 0, 239 }, 
                { 0, 240 }, 
                { 0, 31 }, 
                { 0, 30 }, 
                { 0, 21 }, 
                { 0, 22 }, 
                { 0, 23 }, 
                { 0, 75 }, 
                { 0, 71 }, 
                { 0, 72 }, 
                { 0, 59 }, 
                { 0, 89 }, 
                { 0, 9 }, 
                { 0, 8 }, 
                { 0, 90 }, 
                { 0, 76 }, 
            },
        },
    },
    Audio = {
        Id = nil,
        Use = "NativeUI",
        RageUI = {
            UpDown = {
                audioName = "HUD_FREEMODE_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        },
        NativeUI = {
            UpDown = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        }
    },
    Items = {
        Title = {
            Background = { Width = 431, Height = 107 },
            Text = { X = 215, Y = 20, Scale = 1.15 },
        },
        Subtitle = {
            Background = { Width = 431, Height = 37 },
            Text = { X = 8, Y = 3, Scale = 0.35 },
            PreText = { X = 425, Y = 3, Scale = 0.35 },
        },
        Background = { Dictionary = "RageUI_cm", Texture = "", Y = 0, Width = 431 },
        Navigation = {
            Rectangle = { Width = 431, Height = 18 },
            Offset = 5,
            Arrows = { Dictionary = "RageUI_cm", Texture = "shop_arrows_upanddown", X = 190, Y = -6, Width = 50, Height = 50 },
        },
        Description = {
            Bar = { Y = 4, Width = 431, Height = 4 },
            Background = { Dictionary = "RageUI_cm", Texture = "", Y = 4, Width = 431, Height = 30 },
            Text = { X = 8, Y = 10, Scale = 0.35 },
        },
    },
    Panels = {
        Grid = {
            Background = { Dictionary = "RageUI_cm", Texture = "", Y = 4, Width = 431, Height = 275 },
            Grid = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", X = 115.5, Y = 47.5, Width = 200, Height = 200 },
            Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
            Text = {
                Top = { X = 215.5, Y = 15, Scale = 0.35 },
                Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
                Left = { X = 57.75, Y = 130, Scale = 0.35 },
                Right = { X = 373.25, Y = 130, Scale = 0.35 },
            },
        },
        Percentage = {
            Background = { Dictionary = "RageUI_cm", Texture = "", Y = 4, Width = 431, Height = 76 },
            Bar = { X = 9, Y = 50, Width = 413, Height = 10 },
            Text = {
                Left = { X = 25, Y = 15, Scale = 0.35 },
                Middle = { X = 215.5, Y = 15, Scale = 0.35 },
                Right = { X = 398, Y = 15, Scale = 0.35 },
            },
        },
    },
}
function RageUI.SetScaleformParams(scaleform, data)
    data = data or {}
    for k, v in pairs(data) do
        PushScaleformMovieFunction(scaleform, v.name)
        if v.param then
            for _, par in pairs(v.param) do
                if math.type(par) == "integer" then
                    PushScaleformMovieFunctionParameterInt(par)
                elseif type(par) == "boolean" then
                    PushScaleformMovieFunctionParameterBool(par)
                elseif math.type(par) == "float" then
                    PushScaleformMovieFunctionParameterFloat(par)
                elseif type(par) == "string" then
                    PushScaleformMovieFunctionParameterString(par)
                end
            end
        end
        if v.func then
            v.func()
        end
        PopScaleformMovieFunctionVoid()
    end
end
function RageUI.IsMouseInBounds(X, Y, Width, Height)
    local MX, MY = math.round(GetControlNormal(2, 239) * 1920) / 1920, math.round(GetControlNormal(2, 240) * 1080) / 1080
    X, Y = X / 1920, Y / 1080
    Width, Height = Width / 1920, Height / 1080
    return (MX >= X and MX <= X + Width) and (MY > Y and MY < Y + Height)
end
function RageUI.GetSafeZoneBounds()
    local SafeSize = GetSafeZoneSize()
    SafeSize = math.round(SafeSize, 2)
    SafeSize = (SafeSize * 100) - 90
    SafeSize = 10 - SafeSize
    local W, H = 1920, 1080
    return { X = math.round(SafeSize * ((W / H) * 5.4)), Y = math.round(SafeSize * 5.4) }
end
function RageUI.Visible(Menu, Value)
    if Menu ~= nil and Menu() then
        if Value == true or Value == false then
            if Value then
                if RageUI.CurrentMenu ~= nil then
                    if (RageUI.GetTypeOfMenu(Menu) ~= RageUI.GetTypeOfMenu(RageUI.CurrentMenu)) and not RageUI.GetClosableTypeOfMenu(RageUI.CurrentMenu) then
                        return
                    end
                    if (RageUI.GetTypeOfMenu(Menu) ~= RageUI.GetTypeOfMenu(RageUI.CurrentMenu)) and RageUI.GetTypeOfMenu(RageUI.CurrentMenu) == "vehiclestorage" then
                        TriggerServerEvent('Ms:ExitStorage')
                    end
                    if (RageUI.GetTypeOfMenu(Menu) ~= RageUI.GetTypeOfMenu(RageUI.CurrentMenu)) and RageUI.GetTypeOfMenu(RageUI.CurrentMenu) == "jobstorage" then
                        TriggerServerEvent('Ms:ExitJobStorage')
                    end
                    if RageUI.CurrentMenu.Closed ~= nil then
                        RageUI.CurrentMenu.Closed()
                    end
                    RageUI.CurrentMenu.Open = not Value
                    Menu:UpdateInstructionalButtons(Value);
                    Menu:UpdateCursorStyle();
                end
                RageUI.CurrentMenu = Menu
            else
                RageUI.CurrentMenu = nil
                collectgarbage()
            end
            Menu.Open = Value
            RageUI.Options = 0
            RageUI.ItemOffset = 0
            RageUI.LastControl = false
        else
            return Menu.Open
        end
    end
end
function RageUI.CloseAll()
    if RageUI.CurrentMenu ~= nil then
        local parent = RageUI.CurrentMenu.Parent
        while parent ~= nil do
            parent.Index = 1
            parent.Pagination.Minimum = 1
            parent.Pagination.Maximum = parent.Pagination.Total
            parent = parent.Parent
        end
        RageUI.CurrentMenu.Index = 1
        RageUI.CurrentMenu.Pagination.Minimum = 1
        RageUI.CurrentMenu.Pagination.Maximum = RageUI.CurrentMenu.Pagination.Total
        RageUI.CurrentMenu.Open = false
        RageUI.CurrentMenu = nil
    end
    RageUI.Options = 0
    RageUI.ItemOffset = 0
    ResetScriptGfxAlign()
    collectgarbage()
end
function RageUI.Banner()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Header) then
            RageUI.ItemsSafeZone(CurrentMenu)
            if CurrentMenu.Sprite.Dictionary then
                RenderSprite(CurrentMenu.Sprite.Dictionary, CurrentMenu.Sprite.Texture, CurrentMenu.X, CurrentMenu.Y, RageUI.Settings.Items.Title.Background.Width + CurrentMenu.WidthOffset, RageUI.Settings.Items.Title.Background.Height, nil)
            else
                RenderRectangle(CurrentMenu.X, CurrentMenu.Y, RageUI.Settings.Items.Title.Background.Width + CurrentMenu.WidthOffset, RageUI.Settings.Items.Title.Background.Height, CurrentMenu.Rectangle.R, CurrentMenu.Rectangle.G, CurrentMenu.Rectangle.B, CurrentMenu.Rectangle.A)
            end
            if (CurrentMenu.Display.Glare) then
                local ScaleformMovie = RequestScaleformMovie("MP_MENU_GLARE")
                local Glarewidth = RageUI.Settings.Items.Title.Background.Width
                local Glareheight = RageUI.Settings.Items.Title.Background.Height
                local GlareX = CurrentMenu.X / 1920 + (CurrentMenu.SafeZoneSize.X / (64.399 - (CurrentMenu.WidthOffset * 0.065731)))
                local GlareY = CurrentMenu.Y / 1080 + CurrentMenu.SafeZoneSize.Y / 33.195020746888
                RageUI.SetScaleformParams(ScaleformMovie, {
                    { name = "SET_DATA_SLOT", param = { GetGameplayCamRelativeHeading() } }
                })
                DrawScaleformMovie(ScaleformMovie, GlareX, GlareY, Glarewidth / 430, Glareheight / 100, 255, 255, 255, 255, 0)
            end
            RenderText(CurrentMenu.Title, CurrentMenu.X + RageUI.Settings.Items.Title.Text.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Items.Title.Text.Y, CurrentMenu.TitleFont, CurrentMenu.TitleScale, 255, 255, 255, 255, 1)
            RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Title.Background.Height
        end
    end
end
function RageUI.Subtitle()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Subtitle) then
            RageUI.ItemsSafeZone(CurrentMenu)
            if CurrentMenu.Subtitle ~= "" then
                RenderRectangle(CurrentMenu.X, CurrentMenu.Y + RageUI.ItemOffset, RageUI.Settings.Items.Subtitle.Background.Width + CurrentMenu.WidthOffset, RageUI.Settings.Items.Subtitle.Background.Height + CurrentMenu.SubtitleHeight, 11, 13, 19, 255)
                RenderText(CurrentMenu.Subtitle, CurrentMenu.X + RageUI.Settings.Items.Subtitle.Text.X, CurrentMenu.Y + RageUI.Settings.Items.Subtitle.Text.Y + RageUI.ItemOffset, 0, RageUI.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, RageUI.Settings.Items.Subtitle.Background.Width + CurrentMenu.WidthOffset)
                if CurrentMenu.Index > CurrentMenu.Options or CurrentMenu.Index < 0 then
                    CurrentMenu.Index = 1
                end
                if (CurrentMenu ~= nil) then
                    if (CurrentMenu.Index > CurrentMenu.Pagination.Total) then
                        local offset = CurrentMenu.Index - CurrentMenu.Pagination.Total
                        CurrentMenu.Pagination.Minimum = 1 + offset
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total + offset
                    else
                        CurrentMenu.Pagination.Minimum = 1
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total
                    end
                end
                if CurrentMenu.PageCounter == nil then
                    RenderText(CurrentMenu.PageCounterColour .. CurrentMenu.Index .. " / " .. CurrentMenu.Options, CurrentMenu.X + RageUI.Settings.Items.Subtitle.PreText.X + CurrentMenu.WidthOffset, CurrentMenu.Y + RageUI.Settings.Items.Subtitle.PreText.Y + RageUI.ItemOffset, 0, RageUI.Settings.Items.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                else
                    RenderText(CurrentMenu.PageCounter, CurrentMenu.X + RageUI.Settings.Items.Subtitle.PreText.X + CurrentMenu.WidthOffset, CurrentMenu.Y + RageUI.Settings.Items.Subtitle.PreText.Y + RageUI.ItemOffset, 0, RageUI.Settings.Items.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + RageUI.Settings.Items.Subtitle.Background.Height
            end
        end
    end
end
function RageUI.Background()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Display.Background) then
            RageUI.ItemsSafeZone(CurrentMenu)
            SetScriptGfxDrawOrder(0)
            RenderSprite(RageUI.Settings.Items.Background.Dictionary, RageUI.Settings.Items.Background.Texture, CurrentMenu.X, CurrentMenu.Y + RageUI.Settings.Items.Background.Y + CurrentMenu.SubtitleHeight, RageUI.Settings.Items.Background.Width + CurrentMenu.WidthOffset, RageUI.ItemOffset, 0, 22, 25, 35, 246)
            SetScriptGfxDrawOrder(1)
        end
    end
end
function RageUI.Description()
    local CurrentMenu = RageUI.CurrentMenu;
    local Description = RageUI.Settings.Items.Description;
    if CurrentMenu ~= nil and CurrentMenu.Description ~= nil then
        if CurrentMenu() then
            RageUI.ItemsSafeZone(CurrentMenu)
            RenderRectangle(CurrentMenu.X, CurrentMenu.Y + Description.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Description.Bar.Width + CurrentMenu.WidthOffset, Description.Bar.Height, 22, 25, 35, 255)
            RenderSprite(Description.Background.Dictionary, Description.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Description.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Description.Background.Width + CurrentMenu.WidthOffset, CurrentMenu.DescriptionHeight, 0, 22, 25, 35, 220)
            RenderText(CurrentMenu.Description, CurrentMenu.X + Description.Text.X, CurrentMenu.Y + Description.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Description.Text.Scale, 255, 255, 255, 255, nil, false, false, Description.Background.Width + CurrentMenu.WidthOffset - 8.0)
            RageUI.ItemOffset = RageUI.ItemOffset + CurrentMenu.DescriptionHeight + Description.Bar.Y
        end
    end
end
function RageUI.Render()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if CurrentMenu.Safezone then
                ResetScriptGfxAlign()
            end
            if (CurrentMenu.Display.InstructionalButton) then
                if not CurrentMenu.InitScaleform then
                    CurrentMenu:UpdateInstructionalButtons(true)
                    CurrentMenu.InitScaleform = true
                end
                DrawScaleformMovieFullscreen(CurrentMenu.InstructionalScaleform, 255, 255, 255, 255, 0)
            end
            CurrentMenu.Options = RageUI.Options
            CurrentMenu.SafeZoneSize = nil
            RageUI.Controls()
            RageUI.Options = 0
            RageUI.StatisticPanelCount = 0
            RageUI.ItemOffset = 0
            if CurrentMenu.Controls.Back.Enabled then
                if CurrentMenu.Controls.Back.Pressed then
                    CurrentMenu.Controls.Back.Pressed = false
                    if not RageUI.GetClosableTypeOfMenu(CurrentMenu) and CurrentMenu.Parent == nil then return end
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Back.audioName, Audio[Audio.Use].Back.audioRef)
                    if CurrentMenu.Closed ~= nil then
                        CurrentMenu.Closed()
                    end
                    if CurrentMenu.Parent ~= nil then
                        if CurrentMenu.Parent() then
                            RageUI.NextMenu = CurrentMenu.Parent
                            CurrentMenu:UpdateCursorStyle()
                        else
                            RageUI.NextMenu = nil
                            RageUI.Visible(CurrentMenu, false)
                        end
                    else
                        RageUI.NextMenu = nil
                        RageUI.Visible(CurrentMenu, false)
                    end
                end
            end
            if RageUI.NextMenu ~= nil then
                if RageUI.NextMenu() then
                    RageUI.Visible(CurrentMenu, false)
                    RageUI.Visible(RageUI.NextMenu, true)
                    CurrentMenu.Controls.Select.Active = false
                    RageUI.NextMenu = nil
                    RageUI.LastControl = false
                end
            end
        end
    end
end
function RageUI.ItemsDescription(CurrentMenu, Description, Selected)
    if Description ~= "" or Description ~= nil then
        local SettingsDescription = RageUI.Settings.Items.Description;
        if Selected and CurrentMenu.Description ~= Description then
            CurrentMenu.Description = Description or nil
            local DescriptionLineCount = GetLineCount(CurrentMenu.Description, CurrentMenu.X + SettingsDescription.Text.X, CurrentMenu.Y + SettingsDescription.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsDescription.Text.Scale, 255, 255, 255, 255, nil, false, false, SettingsDescription.Background.Width + (CurrentMenu.WidthOffset - 5.0))
            if DescriptionLineCount > 1 then
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height * DescriptionLineCount
            else
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height + 7
            end
        end
    end
end
function RageUI.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButton)
    local Hovered = false
    Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height)
    if Hovered and not Selected then
        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height, 255, 255, 255, 20)
        if CurrentMenu.Controls.Click.Active then
            CurrentMenu.Index = Option
            local Audio = RageUI.Settings.Audio
            RageUI.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
        end
    end
    return Hovered;
end
function RageUI.ItemsSafeZone(CurrentMenu)
    if not CurrentMenu.SafeZoneSize then
        CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }
        if CurrentMenu.Safezone then
            CurrentMenu.SafeZoneSize = RageUI.GetSafeZoneBounds()
            SetScriptGfxAlign(76, 84)
            SetScriptGfxAlignParams(0, 0, 0, 0)
        end
    end
end
function RageUI.CurrentIsEqualTo(Current, To, Style, DefaultStyle)
    return Current == To and Style or DefaultStyle or {};
end
function RageUI.IsVisible(Menu, Items, Panels)
    if (RageUI.Visible(Menu)) and (UpdateOnscreenKeyboard() ~= 0) and (UpdateOnscreenKeyboard() ~= 3) then
        RageUI.Banner()
        RageUI.Subtitle()
        if (Items ~= nil) then
            Items()
        end
        RageUI.Background();
        RageUI.Navigation();
        RageUI.Description();
        if (Panels ~= nil) then
            Panels()
        end
        RageUI.PoolMenus.Timer = 1
        RageUI.Render()
    end
end
function RageUI.SetStyleAudio(StyleAudio)
    RageUI.Settings.Audio.Use = StyleAudio or "RageUI"
end
function RageUI.GetStyleAudio()
    return RageUI.Settings.Audio.Use or "RageUI"
end
function RageUI.CreateWhile(callback)
    Citizen.CreateThread(function()
        while true do
            local time = callback()
            Citizen.Wait(time)
        end
    end)
end
function RageUI.OpenSubmenu(Submenu)
    if Submenu ~= nil then
        if Submenu() then
            RageUI.NextMenu = Submenu
        end
    end
end
function RageUI.Pool()
    for name, fn in pairs(RageUI.PoolMenus) do
        if type(fn) == "function" then
            fn()
            if RageUI.PoolMenus.Timer == 1 then
                RageUI.PoolMenus.Name = name
                return
            end
        end
    end
end
Citizen.CreateThread(function()
    while true do
        RageUI.PoolMenus.Timer = 10
        if RageUI.PoolMenus.Name ~= nil then
            RageUI.PoolMenus[RageUI.PoolMenus.Name]()
        end
        Citizen.Wait(RageUI.PoolMenus.Timer)
        if RageUI.PoolMenus.Timer == 10 then
            RageUI.PoolMenus.Name = nil
            RageUI.Pool();
        end
    end
end)
function RageUI.CreateMenu(Title, Subtitle, X, Y, TextureDictionary, TextureName, R, G, B, A)
    local Menu = {}
    Menu.Display = {};
    Menu.InstructionalButtons = {}
    Menu.Display.Header = true;
    Menu.Display.Glare = true;
    Menu.Display.Subtitle = true;
    Menu.Display.Background = true;
    Menu.Display.Navigation = true;
    Menu.Display.InstructionalButton = true;
    Menu.Title = Title or ""
    Menu.TitleFont = 2
    Menu.TitleScale = 1.2
    Menu.Subtitle = Subtitle or nil
    Menu.SubtitleHeight = -37
    Menu.Description = nil
    Menu.DescriptionHeight = RageUI.Settings.Items.Description.Background.Height
    Menu.X = X or 0
    Menu.Y = Y or 0
    Menu.Parent = nil
    Menu.WidthOffset = RageUI.UI.Style[RageUI.UI.Current].Width
    Menu.Open = false
    Menu.Controls = RageUI.Settings.Controls
    Menu.Index = 1
    Menu.Sprite = { Dictionary = TextureDictionary or "RageUI_cm", Texture = TextureName or "interaction_bgd", Color = { R = R, G = G, B = B, A = A } }
    Menu.Rectangle = nil
    Menu.Pagination = { Minimum = 1, Maximum = 10, Total = 10 }
    Menu.Safezone = true
    Menu.SafeZoneSize = nil
    Menu.EnableMouse = false
    Menu.Options = 0
    Menu.Closable = true
    Menu.InstructionalScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
    Menu.CursorStyle = 1
    if string.starts(Menu.Subtitle, "~") then
        Menu.PageCounterColour = string.sub(Menu.Subtitle, 1, 3)
    else
        Menu.PageCounterColour = ""
    end
    if Menu.Subtitle ~= "" then
        local SubtitleLineCount = GetLineCount(Menu.Subtitle, Menu.X + RageUI.Settings.Items.Subtitle.Text.X, Menu.Y + RageUI.Settings.Items.Subtitle.Text.Y, 0, RageUI.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, RageUI.Settings.Items.Subtitle.Background.Width + Menu.WidthOffset)
        if SubtitleLineCount > 1 then
            Menu.SubtitleHeight = 18 * SubtitleLineCount
        else
            Menu.SubtitleHeight = 0
        end
    end
    Citizen.CreateThread(function()
        if not HasScaleformMovieLoaded(Menu.InstructionalScaleform) then
            Menu.InstructionalScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
            while not HasScaleformMovieLoaded(Menu.InstructionalScaleform) do
                Citizen.Wait(0)
            end
        end
    end)
    Citizen.CreateThread(function()
        local ScaleformMovie = RequestScaleformMovie("MP_MENU_GLARE")
        while not HasScaleformMovieLoaded(ScaleformMovie) do
            Citizen.Wait(0)
        end
    end)
    return setmetatable(Menu, RageUI.Menus)
end
function RageUI.CreateSubMenu(ParentMenu, Title, Subtitle, X, Y, TextureDictionary, TextureName, R, G, B, A)
    if ParentMenu ~= nil then
        if ParentMenu() then
            local Menu = RageUI.CreateMenu(Title or ParentMenu.Title, Subtitle or ParentMenu.Subtitle, X or ParentMenu.X, Y or ParentMenu.Y)
            Menu.Parent = ParentMenu
            Menu.WidthOffset = ParentMenu.WidthOffset
            Menu.Safezone = ParentMenu.Safezone
            if ParentMenu.Sprite then
                Menu.Sprite = { Dictionary = TextureDictionary or ParentMenu.Sprite.Dictionary, Texture = TextureName or ParentMenu.Sprite.Texture, Color = { R = R or ParentMenu.Sprite.Color.R, G = G or ParentMenu.Sprite.Color.G, B = B or ParentMenu.Sprite.Color.B, A = A or ParentMenu.Sprite.Color.A } }
            else
                Menu.Rectangle = ParentMenu.Rectangle
            end
            return setmetatable(Menu, RageUI.Menus)
        else
            return nil
        end
    else
        return nil
    end
end
function RageUI.Menus:DisplayHeader(boolean)
    self.Display.Header = boolean;
    return self.Display.Header;
end
function RageUI.Menus:DisplayGlare(boolean)
    self.Display.Glare = boolean;
    return self.Display.Glare;
end
function RageUI.Menus:DisplaySubtitle(boolean)
    self.Display.Subtitle = boolean;
    return self.Display.Subtitle;
end
function RageUI.Menus:DisplayNavigation(boolean)
    self.Display.Navigation = boolean;
    return self.Display.Navigation;
end
function RageUI.Menus:DisplayInstructionalButton(boolean)
    self.Display.InstructionalButton = boolean;
    return self.Display.InstructionalButton;
end
function RageUI.Menus:SetTitle(Title)
    self.Title = Title
end
function RageUI.Menus:SetStyleSize(Value)
    local witdh
    if Value >= 0 and Value <= 100 then
        witdh = Value
    else
        witdh = 100
    end
    self.WidthOffset = witdh
end
function RageUI.Menus:GetStyleSize()
    if (self.WidthOffset == 100) then
        return "RageUI"
    elseif (self.WidthOffset == 0) then
        return "NativeUI";
    else
        return self.WidthOffset;
    end
end
function RageUI.Menus:SetCursorStyle(Int)
    self.CursorStyle = Int or 1 or 0
    SetMouseCursorSprite(Int)
end
function RageUI.Menus:ResetCursorStyle()
    self.CursorStyle = 1
    SetMouseCursorSprite(1)
end
function RageUI.Menus:UpdateCursorStyle()
    SetMouseCursorSprite(self.CursorStyle)
end
function RageUI.Menus:RefreshIndex()
    self.Index = 1
end
function RageUI.Menus:SetSubtitle(Subtitle)
    self.Subtitle = Subtitle or self.Subtitle
    if string.starts(self.Subtitle, "~") then
        self.PageCounterColour = string.sub(self.Subtitle, 1, 3)
    else
        self.PageCounterColour = ""
    end
    if self.Subtitle ~= "" then
        local SubtitleLineCount = GetLineCount(self.Subtitle, self.X + RageUI.Settings.Items.Subtitle.Text.X, self.Y + RageUI.Settings.Items.Subtitle.Text.Y, 0, RageUI.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, RageUI.Settings.Items.Subtitle.Background.Width + self.WidthOffset)
        if SubtitleLineCount > 1 then
            self.SubtitleHeight = 18 * SubtitleLineCount
        else
            self.SubtitleHeight = 0
        end
    else
        self.SubtitleHeight = -37
    end
end
function RageUI.Menus:SetPageCounter(Subtitle)
    self.PageCounter = Subtitle
end
function RageUI.Menus:EditSpriteColor(color)
    if self.Sprite.Dictionary == "RageUI_cm" then
        self.Sprite.Color = color
    end
end
function RageUI.Menus:SetPosition(X, Y)
    self.X = tonumber(X) or self.X
    self.Y = tonumber(Y) or self.Y
end
function RageUI.Menus:SetTotalItemsPerPage(Value)
    self.Pagination.Total = tonumber(Value) or self.Pagination.Total
end
function RageUI.Menus:SetRectangleBanner(R, G, B, A)
    self.Rectangle = { R = tonumber(R) or 255, G = tonumber(G) or 255, B = tonumber(B) or 255, A = tonumber(A) or 255 }
    self.Sprite = nil
end
function RageUI.Menus:SetSpriteBanner(TextureDictionary, Texture)
    self.Sprite = { Dictionary = TextureDictionary or "RageUI_cm", Texture = Texture or "interaction_bgd" }
    self.Rectangle = nil
end
function RageUI.Menus:AddInstructionButton(button)
    if type(button) == "table" and #button == 2 then
        table.insert(self.InstructionalButtons, button)
        self.UpdateInstructionalButtons(true);
    end
end
function RageUI.Menus:RemoveInstructionButton(button)
    if type(button) == "table" then
        for i = 1, #self.InstructionalButtons do
            if button == self.InstructionalButtons[i] then
                table.remove(self.InstructionalButtons, i)
                self.UpdateInstructionalButtons(true);
                break
            end
        end
    else
        if tonumber(button) then
            if self.InstructionalButtons[tonumber(button)] then
                table.remove(self.InstructionalButtons, tonumber(button))
                self.UpdateInstructionalButtons(true);
            end
        end
    end
end
function RageUI.Menus:UpdateInstructionalButtons(Visible)
    if not Visible then
        return
    end
    BeginScaleformMovieMethod(self.InstructionalScaleform, "CLEAR_ALL")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(self.InstructionalScaleform, "TOGGLE_MOUSE_BUTTONS")
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(self.InstructionalScaleform, "CREATE_CONTAINER")
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(self.InstructionalScaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(2, 176, 0))
    PushScaleformMovieMethodParameterString(GetLabelText("HUD_INPUT2"))
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(self.InstructionalScaleform, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(1)
    PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(2, 177, 0))
    PushScaleformMovieMethodParameterString(GetLabelText("HUD_INPUT3"))
    EndScaleformMovieMethod()
    local count = 2
    if (self.InstructionalButtons ~= nil) then
        for i = 1, #self.InstructionalButtons do
            if self.InstructionalButtons[i] then
                if #self.InstructionalButtons[i] == 2 then
                    BeginScaleformMovieMethod(self.InstructionalScaleform, "SET_DATA_SLOT")
                    ScaleformMovieMethodAddParamInt(count)
                    PushScaleformMovieMethodParameterButtonName(self.InstructionalButtons[i][1])
                    PushScaleformMovieMethodParameterString(self.InstructionalButtons[i][2])
                    EndScaleformMovieMethod()
                    count = count + 1
                end
            end
        end
    end
    BeginScaleformMovieMethod(self.InstructionalScaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    ScaleformMovieMethodAddParamInt(-1)
    EndScaleformMovieMethod()
end
RageUI.LastControl = false
local ControlActions = {
    'Left',
    'Right',
    'Select',
    'Click',
}
function RageUI.GoUp(Options)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        Options = CurrentMenu.Options
        if CurrentMenu() then
            if (Options ~= 0) then
                if Options > CurrentMenu.Pagination.Total then
                    if CurrentMenu.Index <= CurrentMenu.Pagination.Minimum then
                        if CurrentMenu.Index == 1 then
                            CurrentMenu.Pagination.Minimum = Options - (CurrentMenu.Pagination.Total - 1)
                            CurrentMenu.Pagination.Maximum = Options
                            CurrentMenu.Index = Options
                        else
                            CurrentMenu.Pagination.Minimum = (CurrentMenu.Pagination.Minimum - 1)
                            CurrentMenu.Pagination.Maximum = (CurrentMenu.Pagination.Maximum - 1)
                            CurrentMenu.Index = CurrentMenu.Index - 1
                        end
                    else
                        CurrentMenu.Index = CurrentMenu.Index - 1
                    end
                else
                    if CurrentMenu.Index == 1 then
                        CurrentMenu.Pagination.Minimum = Options - (CurrentMenu.Pagination.Total - 1)
                        CurrentMenu.Pagination.Maximum = Options
                        CurrentMenu.Index = Options
                    else
                        CurrentMenu.Index = CurrentMenu.Index - 1
                    end
                end
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
                RageUI.LastControl = true
                if (CurrentMenu.onIndexChange ~= nil) then
                    Citizen.CreateThread(function()
                        CurrentMenu.onIndexChange(CurrentMenu.Index)
                    end)
                end
            else
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
            end
        end
    end
end
function RageUI.GoDown(Options)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        Options = CurrentMenu.Options
        if CurrentMenu() then
            if (Options ~= 0) then
                if Options > CurrentMenu.Pagination.Total then
                    if CurrentMenu.Index >= CurrentMenu.Pagination.Maximum then
                        if CurrentMenu.Index == Options then
                            CurrentMenu.Pagination.Minimum = 1
                            CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total
                            CurrentMenu.Index = 1
                        else
                            CurrentMenu.Pagination.Maximum = (CurrentMenu.Pagination.Maximum + 1)
                            CurrentMenu.Pagination.Minimum = CurrentMenu.Pagination.Maximum - (CurrentMenu.Pagination.Total - 1)
                            CurrentMenu.Index = CurrentMenu.Index + 1
                        end
                    else
                        CurrentMenu.Index = CurrentMenu.Index + 1
                    end
                else
                    if CurrentMenu.Index == Options then
                        CurrentMenu.Pagination.Minimum = 1
                        CurrentMenu.Pagination.Maximum = CurrentMenu.Pagination.Total
                        CurrentMenu.Index = 1
                    else
                        CurrentMenu.Index = CurrentMenu.Index + 1
                    end
                end
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].UpDown.audioName, Audio[Audio.Use].UpDown.audioRef)
                RageUI.LastControl = false
                if (CurrentMenu.onIndexChange ~= nil) then
                    Citizen.CreateThread(function()
                        CurrentMenu.onIndexChange(CurrentMenu.Index)
                    end)
                end
            else
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
            end
        end
    end
end
function RageUI.GoActionControl(Controls, Action)
    if Controls[Action or 'Left'].Enabled then
        for Index = 1, #Controls[Action or 'Left'].Keys do
            if not Controls[Action or 'Left'].Pressed then
                if IsDisabledControlJustPressed(Controls[Action or 'Left'].Keys[Index][1], Controls[Action or 'Left'].Keys[Index][2]) then
                    Controls[Action or 'Left'].Pressed = true
                    Citizen.CreateThread(function()
                        Controls[Action or 'Left'].Active = true
                        Citizen.Wait(0.01)
                        Controls[Action or 'Left'].Active = false
                        Citizen.Wait(175)
                        while Controls[Action or 'Left'].Enabled and IsDisabledControlPressed(Controls[Action or 'Left'].Keys[Index][1], Controls[Action or 'Left'].Keys[Index][2]) do
                            Controls[Action or 'Left'].Active = true
                            Citizen.Wait(1)
                            Controls[Action or 'Left'].Active = false
                            Citizen.Wait(124)
                        end
                        Controls[Action or 'Left'].Pressed = false
                        if (Action ~= ControlActions[5]) then
                            Citizen.Wait(10)
                        end
                    end)
                    break
                end
            end
        end
    end
end
function RageUI.GoActionControlSlider(Controls, Action)
    if Controls[Action].Enabled then
        for Index = 1, #Controls[Action].Keys do
            if not Controls[Action].Pressed then
                if IsDisabledControlJustPressed(Controls[Action].Keys[Index][1], Controls[Action].Keys[Index][2]) then
                    Controls[Action].Pressed = true
                    Citizen.CreateThread(function()
                        Controls[Action].Active = true
                        Citizen.Wait(1)
                        Controls[Action].Active = false
                        while Controls[Action].Enabled and IsDisabledControlPressed(Controls[Action].Keys[Index][1], Controls[Action].Keys[Index][2]) do
                            Controls[Action].Active = true
                            Citizen.Wait(1)
                            Controls[Action].Active = false
                        end
                        Controls[Action].Pressed = false
                    end)
                    break
                end
            end
        end
    end
end
function RageUI.Controls()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if CurrentMenu.Open then
                local Controls = CurrentMenu.Controls;
                local Options = CurrentMenu.Options
                RageUI.Options = CurrentMenu.Options
                if CurrentMenu.EnableMouse then
                    DisableAllControlActions(2)
                    if not IsInputDisabled(2) then
                        for Index = 1, #Controls.Enabled.Controller do
                            EnableControlAction(Controls.Enabled.Controller[Index][1], Controls.Enabled.Controller[Index][2], true)
                        end
                    else
                        for Index = 1, #Controls.Enabled.Keyboard do
                            EnableControlAction(Controls.Enabled.Keyboard[Index][1], Controls.Enabled.Keyboard[Index][2], true)
                        end
                    end
                end
                if Controls.Up.Enabled then
                    for Index = 1, #Controls.Up.Keys do
                        if not Controls.Up.Pressed then
                            if IsDisabledControlJustPressed(Controls.Up.Keys[Index][1], Controls.Up.Keys[Index][2]) then
                                Controls.Up.Pressed = true
                                Citizen.CreateThread(function()
                                    RageUI.GoUp(Options)
                                    Citizen.Wait(175)
                                    while Controls.Up.Enabled and IsDisabledControlPressed(Controls.Up.Keys[Index][1], Controls.Up.Keys[Index][2]) do
                                        RageUI.GoUp(Options)
                                        Citizen.Wait(50)
                                    end
                                    Controls.Up.Pressed = false
                                end)
                                break
                            end
                        end
                    end
                end
                if Controls.Down.Enabled then
                    for Index = 1, #Controls.Down.Keys do
                        if not Controls.Down.Pressed then
                            if IsDisabledControlJustPressed(Controls.Down.Keys[Index][1], Controls.Down.Keys[Index][2]) then
                                Controls.Down.Pressed = true
                                Citizen.CreateThread(function()
                                    RageUI.GoDown(Options)
                                    Citizen.Wait(175)
                                    while Controls.Down.Enabled and IsDisabledControlPressed(Controls.Down.Keys[Index][1], Controls.Down.Keys[Index][2]) do
                                        RageUI.GoDown(Options)
                                        Citizen.Wait(50)
                                    end
                                    Controls.Down.Pressed = false
                                end)
                                break
                            end
                        end
                    end
                end
                for i = 1, #ControlActions do
                    RageUI.GoActionControl(Controls, ControlActions[i])
                end
                RageUI.GoActionControlSlider(Controls, 'SliderLeft')
                RageUI.GoActionControlSlider(Controls, 'SliderRight')
                if Controls.Back.Enabled then
                    for Index = 1, #Controls.Back.Keys do
                        if not Controls.Back.Pressed then
                            if IsDisabledControlJustPressed(Controls.Back.Keys[Index][1], Controls.Back.Keys[Index][2]) then
                                Controls.Back.Pressed = true
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end
function RageUI.Navigation()
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil and CurrentMenu() and CurrentMenu.EnableMouse then
        SetMouseCursorActiveThisFrame()
    end
end
function RageUI.GoBack()
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        local Audio = RageUI.Settings.Audio
        RageUI.PlaySound(Audio[Audio.Use].Back.audioName, Audio[Audio.Use].Back.audioRef)
        if CurrentMenu.Parent ~= nil then
            if CurrentMenu.Parent() then
                RageUI.NextMenu = CurrentMenu.Parent
            else
                RageUI.NextMenu = nil
                RageUI.Visible(CurrentMenu, false)
            end
        else
            RageUI.NextMenu = nil
            RageUI.Visible(CurrentMenu, false)
        end
    end
end
function RageUI.PlaySound(Library, Sound, IsLooped)
    local audioId
    if not IsLooped then
        PlaySoundFrontend(-1, Sound, Library, true)
    else
        if not audioId then
            Citizen.CreateThread(function()
                audioId = GetSoundId()
                PlaySoundFrontend(audioId, Sound, Library, true)
                Citizen.Wait(0.01)
                StopSound(audioId)
                ReleaseSoundId(audioId)
                audioId = nil
            end)
        end
    end
end
local enums = {
    __index = function(table, key)
        if rawget(table.enums, key) then
            return key
        end
    end
}
function RageUI.Enum(t)
    local e = { enums = t }
    return setmetatable(e, enums)
end
Keys = {};
function Keys.Register(Controls, ControlName, Description, Action)
    local _Keys = {
        CONTROLS = Controls
    }
    RegisterKeyMapping(string.format('RageUI-%s', ControlName), Description, "keyboard", Controls)
    RegisterCommand(string.format('RageUI-%s', ControlName), function(source, args)
        if (Action ~= nil) then
            print(string.format('RageUI - Pressed keys %s', Controls))
            Action();
        end
    end, false)
    return setmetatable(_Keys, Keys)
end
function Keys:Exists(Controls)
    return self.CONTROLS == Controls and true or false
end
function RenderRectangle(X, Y, Width, Height, R, G, B, A)
    local X, Y, Width, Height = (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080, (tonumber(Width) or 0) / 1920, (tonumber(Height) or 0) / 1080
    DrawRect(X + Width * 0.5, Y + Height * 0.5, Width, Height, tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
end
function RenderSprite(TextureDictionary, TextureName, X, Y, Width, Height, Heading, R, G, B, A)
    local X, Y, Width, Height = (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080, (tonumber(Width) or 0) / 1920, (tonumber(Height) or 0) / 1080
    if not HasStreamedTextureDictLoaded(TextureDictionary) then
        RequestStreamedTextureDict(TextureDictionary, true)
    end
    DrawSprite(TextureDictionary, TextureName, X + Width * 0.5, Y + Height * 0.5, Width, Height, Heading or 0, tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
end
function StringToArray(str)
    local charCount = #str
    local strCount = math.ceil(charCount / 99)
    local strings = {}
    for i = 1, strCount do
        local start = (i - 1) * 99 + 1
        local clamp = math.clamp(#string.sub(str, start), 0, 99)
        local finish = ((i ~= 1) and (start - 1) or 0) + clamp
        strings[i] = string.sub(str, start, finish)
    end
    return strings
end
function AddText(str)
    local str = tostring(str)
    local charCount = #str
    if charCount < 100 then
        AddTextComponentSubstringPlayerName(str)
    else
        local strings = StringToArray(str)
        for s = 1, #strings do
            AddTextComponentSubstringPlayerName(strings[s])
        end
    end
end
function GetLineCount(Text, X, Y, Font, Scale, R, G, B, A, Alignment, DropShadow, Outline, WordWrap)
    local Text, X, Y = tostring(Text), (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080
    SetTextFont(Font or 0)
    SetTextScale(1.0, Scale or 0)
    SetTextColour(tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
    if DropShadow then
        SetTextDropShadow()
    end
    if Outline then
        SetTextOutline()
    end
    if Alignment ~= nil then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextCentre(true)
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextRightJustify(true)
        end
    end
    if tonumber(WordWrap) and tonumber(WordWrap) ~= 0 then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextWrap(X - ((WordWrap / 1920) / 2), X + ((WordWrap / 1920) / 2))
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        else
            SetTextWrap(X, X + (WordWrap / 1920))
        end
    else
        if Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        end
    end
    BeginTextCommandLineCount("CELL_EMAIL_BCON")
    AddText(Text)
    return GetTextScreenLineCount(X, Y)
end
function RenderText(Text, X, Y, Font, Scale, R, G, B, A, Alignment, DropShadow, Outline, WordWrap)
    local Text, X, Y = tostring(Text), (tonumber(X) or 0) / 1920, (tonumber(Y) or 0) / 1080
    SetTextFont(Font or 0)
    SetTextScale(1.0, Scale or 0)
    SetTextColour(tonumber(R) or 255, tonumber(G) or 255, tonumber(B) or 255, tonumber(A) or 255)
    if DropShadow then
        SetTextDropShadow()
    end
    if Outline then
        SetTextOutline()
    end
    if Alignment ~= nil then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextCentre(true)
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextRightJustify(true)
        end
    end
    if tonumber(WordWrap) and tonumber(WordWrap) ~= 0 then
        if Alignment == 1 or Alignment == "Center" or Alignment == "Centre" then
            SetTextWrap(X - ((WordWrap / 1920) / 2), X + ((WordWrap / 1920) / 2))
        elseif Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        else
            SetTextWrap(X, X + (WordWrap / 1920))
        end
    else
        if Alignment == 2 or Alignment == "Right" then
            SetTextWrap(0, X)
        end
    end
    BeginTextCommandDisplayText("CELL_EMAIL_BCON")
    AddText(Text)
    EndTextCommandDisplayText(X, Y)
end
Visual = Visual or {};
local function AddLongString(txt)
    for i = 100, string.len(txt), 99 do
        local sub = string.sub(txt, i, i + 99)
        AddTextComponentSubstringPlayerName(sub)
    end
end
function Visual.ShowNotify(args)
    if args == nil or type(args) ~= "table" then return end
    if not args.dict and args.name then
        args.dict = args.name
    end
    if not HasStreamedTextureDictLoaded(args.dict) then
        RequestStreamedTextureDict(args.dict, false)
        while not HasStreamedTextureDictLoaded(args.dict) do Wait(0) end
    end
    if args.backId then
        ThefeedNextPostBackgroundColor(args.backId)
    end
    BeginTextCommandThefeedPost("jamyfafi")
    if args.message then
        AddTextComponentSubstringPlayerName(args.message)
        if string.len(args.message) > 99 then
            AddLongString(args.message)
        end
    end
    if args.title ~= nil or args.subtitle ~= nil or args.name ~= nil then
        EndTextCommandThefeedPostMessagetext(args.dict or "CHAR_DEFAULT", args.name or "CHAR_DEFAULT", true, args.icon or 0, args.title or "", args.subtitle or "")
        SetStreamedTextureDictAsNoLongerNeeded(args.dict)
    end
    EndTextCommandThefeedPostTicker(false, true)
end
function Visual.Subtitle(text, time)
    ClearPrints()
    BeginTextCommandPrint("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandPrint(time and math.ceil(time) or 0, true)
end
function Visual.FloatingHelpText(text, sound, loop)
    BeginTextCommandDisplayHelp("jamyfafi")
    AddTextComponentSubstringPlayerName(text)
    if string.len(text) > 99 then
        AddLongString(text)
    end
    EndTextCommandDisplayHelp(0, loop or 0, sound or true, -1)
end
function Visual.Prompt(text, spinner)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandBusyspinnerOn(spinner or 1)
end
function Visual.PromptDuration(duration, text, spinner)
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        Visual.Prompt(text, spinner)
        Citizen.Wait(duration)
        if (BusyspinnerIsOn()) then
            BusyspinnerOff();
        end
    end)
end
RageUI.BadgeStyle = {
    None = function()
        return {
            BadgeTexture = "",
            BadgeDictionary = "RageUI_cm"
        }
    end,
    BronzeMedal = function()
        return {
            BadgeTexture = "mp_medal_bronze",
        }
    end,
    GoldMedal = function()
        return {
            BadgeTexture = "mp_medal_gold",
        }
    end,
    SilverMedal = function()
        return {
            BadgeTexture = "medal_silver",
        }
    end,
    Alert = function()
        return {
            BadgeTexture = "mp_alerttriangle",
        }
    end,
    Crown = function(Selected)
        return {
            BadgeTexture = "mp_hostcrown",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Ammo = function(Selected)
        return {
            BadgeTexture = Selected and "shop_ammo_icon_b" or "shop_ammo_icon_a",
        }
    end,
    Armour = function(Selected)
        return {
            BadgeTexture = Selected and "shop_armour_icon_b" or "shop_armour_icon_a",
        }
    end,
    Barber = function(Selected)
        return {
            BadgeTexture = Selected and "shop_barber_icon_b" or "shop_barber_icon_a",
        }
    end,
    Clothes = function(Selected)
        return {
            BadgeTexture = Selected and "shop_clothing_icon_b" or "shop_clothing_icon_a",
        }
    end,
    Franklin = function(Selected)
        return {
            BadgeTexture = Selected and "shop_franklin_icon_b" or "shop_franklin_icon_a",
        }
    end,
    Bike = function(Selected)
        return {
            BadgeTexture = Selected and "shop_garage_bike_icon_b" or "shop_garage_bike_icon_a",
        }
    end,
    Car = function(Selected)
        return {
            BadgeTexture = Selected and "shop_garage_icon_b" or "shop_garage_icon_a",
        }
    end,
    Boat = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_boat_black" or "mp_specitem_boat",
            BadgeDictionary = "mpinventory"
        }
    end,
    Heli = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_heli_black" or "mp_specitem_heli",
            BadgeDictionary = "mpinventory"
        }
    end,
    Plane = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_plane_black" or "mp_specitem_plane",
            BadgeDictionary = "mpinventory"
        }
    end,
    BoatPickup = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_boatpickup_black" or "mp_specitem_boatpickup",
            BadgeDictionary = "mpinventory"
        }
    end,
    Card = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_keycard_black" or "mp_specitem_keycard",
            BadgeDictionary = "mpinventory"
        }
    end,
    Gun = function(Selected)
        return {
            BadgeTexture = Selected and "shop_gunclub_icon_b" or "shop_gunclub_icon_a",
        }
    end,
    Heart = function(Selected)
        return {
            BadgeTexture = Selected and "shop_health_icon_b" or "shop_health_icon_a",
        }
    end,
    Makeup = function(Selected)
        return {
            BadgeTexture = Selected and "shop_makeup_icon_b" or "shop_makeup_icon_a",
        }
    end,
    Mask = function(Selected)
        return {
            BadgeTexture = Selected and "shop_mask_icon_b" or "shop_mask_icon_a",
        }
    end,
    Michael = function(Selected)
        return {
            BadgeTexture = Selected and "shop_michael_icon_b" or "shop_michael_icon_a",
        }
    end,
    Star = function()
        return {
            BadgeTexture = "shop_new_star",
        }
    end,
    Tattoo = function(Selected)
        return {
            BadgeTexture = Selected and "shop_tattoos_icon_b" or "shop_tattoos_icon_a",
        }
    end,
    Trevor = function(Selected)
        return {
            BadgeTexture = Selected and "shop_trevor_icon_b" or "shop_trevor_icon_a",
        }
    end,
    Lock = function(Selected)
        return {
            BadgeTexture = "shop_lock",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Tick = function(Selected)
        return {
            BadgeTexture = "shop_tick_icon",
            BadgeColour = Selected and { R = 0, G = 0, B = 0, A = 255 } or { R = 255, G = 255, B = 255, A = 255 }
        }
    end,
    Key = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_cuffkeys_black" or "mp_specitem_cuffkeys",
            BadgeDictionary = "mpinventory"
        }
    end,
    Coke = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_coke_black" or "mp_specitem_coke",
            BadgeDictionary = "mpinventory"
        }
    end,
    Heroin = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_heroin_black" or "mp_specitem_heroin",
            BadgeDictionary = "mpinventory"
        }
    end,
    Meth = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_meth_black" or "mp_specitem_meth",
            BadgeDictionary = "mpinventory"
        }
    end,
    Weed = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_weed_black" or "mp_specitem_weed",
            BadgeDictionary = "mpinventory"
        }
    end,
    Package = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_package_black" or "mp_specitem_package",
            BadgeDictionary = "mpinventory"
        }
    end,
    Cash = function(Selected)
        return {
            BadgeTexture = Selected and "mp_specitem_cash_black" or "mp_specitem_cash",
            BadgeDictionary = "mpinventory"
        }
    end,
    RP = function(Selected)
        return {
            BadgeTexture = "mp_anim_rp",
            BadgeDictionary = "mphud"
        }
    end,
    LSPD = function()
        return {
            BadgeTexture = "mpgroundlogo_cops",
            BadgeDictionary = "3dtextures"
        }
    end,
    Vagos = function()
        return {
            BadgeTexture = "mpgroundlogo_vagos",
            BadgeDictionary = "3dtextures"
        }
    end,
    Bikers = function()
        return {
            BadgeTexture = "mpgroundlogo_bikers",
            BadgeDictionary = "3dtextures"
        }
    end,
    Badbeat = function()
        return {
            BadgeTexture = "badbeat",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    CashingOut = function()
        return {
            BadgeTexture = "cashingout",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    FullHouse = function()
        return {
            BadgeTexture = "fullhouse",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    HighRoller = function()
        return {
            BadgeTexture = "highroller",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    HouseKeeping = function()
        return {
            BadgeTexture = "housekeeping",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    LooseCheng = function()
        return {
            BadgeTexture = "loosecheng",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    LuckyLucky = function()
        return {
            BadgeTexture = "luckylucky",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    PlayToWin = function()
        return {
            BadgeTexture = "playtowin",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    StraightFlush = function()
        return {
            BadgeTexture = "straightflush",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    StrongArmTactics = function()
        return {
            BadgeTexture = "strongarmtactics",
            BadgeDictionary = "mpawardcasino"
        }
    end,
    TopPair = function()
        return {
            BadgeTexture = "toppair",
            BadgeDictionary = "mpawardcasino"
        }
    end,
}
RageUI.ItemsColour = {
    PureWhite = { 255, 255, 255, 255 },
    White = { 240, 240, 240, 255 },
    Black = { 0, 0, 0, 255 },
    Grey = { 155, 155, 155, 255 },
    GreyLight = { 205, 205, 205, 255 },
    GreyDark = { 77, 77, 77, 255 },
    Red = { 224, 50, 50, 255 },
    RedLight = { 240, 153, 153, 255 },
    RedDark = { 112, 25, 25, 255 },
    Blue = { 93, 182, 229, 255 },
    BlueLight = { 174, 219, 242, 255 },
    BlueDark = { 47, 92, 115, 255 },
    Yellow = { 240, 200, 80, 255 },
    YellowLight = { 254, 235, 169, 255 },
    YellowDark = { 126, 107, 41, 255 },
    Orange = { 255, 133, 85, 255 },
    OrangeLight = { 255, 194, 170, 255 },
    OrangeDark = { 127, 66, 42, 255 },
    Green = { 114, 204, 114, 255 },
    GreenLight = { 185, 230, 185, 255 },
    GreenDark = { 57, 102, 57, 255 },
    Purple = { 132, 102, 226, 255 },
    PurpleLight = { 192, 179, 239, 255 },
    PurpleDark = { 67, 57, 111, 255 },
    Pink = { 203, 54, 148, 255 },
    RadarHealth = { 53, 154, 71, 255 },
    RadarArmour = { 93, 182, 229, 255 },
    RadarDamage = { 235, 36, 39, 255 },
    NetPlayer1 = { 194, 80, 80, 255 },
    NetPlayer2 = { 156, 110, 175, 255 },
    NetPlayer3 = { 255, 123, 196, 255 },
    NetPlayer4 = { 247, 159, 123, 255 },
    NetPlayer5 = { 178, 144, 132, 255 },
    NetPlayer6 = { 141, 206, 167, 255 },
    NetPlayer7 = { 113, 169, 175, 255 },
    NetPlayer8 = { 211, 209, 231, 255 },
    NetPlayer9 = { 144, 127, 153, 255 },
    NetPlayer10 = { 106, 196, 191, 255 },
    NetPlayer11 = { 214, 196, 153, 255 },
    NetPlayer12 = { 234, 142, 80, 255 },
    NetPlayer13 = { 152, 203, 234, 255 },
    NetPlayer14 = { 178, 98, 135, 255 },
    NetPlayer15 = { 144, 142, 122, 255 },
    NetPlayer16 = { 166, 117, 94, 255 },
    NetPlayer17 = { 175, 168, 168, 255 },
    NetPlayer18 = { 232, 142, 155, 255 },
    NetPlayer19 = { 187, 214, 91, 255 },
    NetPlayer20 = { 12, 123, 86, 255 },
    NetPlayer21 = { 123, 196, 255, 255 },
    NetPlayer22 = { 171, 60, 230, 255 },
    NetPlayer23 = { 206, 169, 13, 255 },
    NetPlayer24 = { 71, 99, 173, 255 },
    NetPlayer25 = { 42, 166, 185, 255 },
    NetPlayer26 = { 186, 157, 125, 255 },
    NetPlayer27 = { 201, 225, 255, 255 },
    NetPlayer28 = { 240, 240, 150, 255 },
    NetPlayer29 = { 237, 140, 161, 255 },
    NetPlayer30 = { 249, 138, 138, 255 },
    NetPlayer31 = { 252, 239, 166, 255 },
    NetPlayer32 = { 240, 240, 240, 255 },
    SimpleBlipDefault = { 159, 201, 166, 255 },
    MenuBlue = { 140, 140, 140, 255 },
    MenuGreyLight = { 140, 140, 140, 255 },
    MenuBlueExtraDark = { 40, 40, 40, 255 },
    MenuYellow = { 240, 160, 0, 255 },
    MenuYellowDark = { 240, 160, 0, 255 },
    MenuGreen = { 240, 160, 0, 255 },
    MenuGrey = { 140, 140, 140, 255 },
    MenuGreyDark = { 60, 60, 60, 255 },
    MenuHighlight = { 30, 30, 30, 255 },
    MenuStandard = { 140, 140, 140, 255 },
    MenuDimmed = { 75, 75, 75, 255 },
    MenuExtraDimmed = { 50, 50, 50, 255 },
    BriefTitle = { 95, 95, 95, 255 },
    MidGreyMp = { 100, 100, 100, 255 },
    NetPlayer1Dark = { 93, 39, 39, 255 },
    NetPlayer2Dark = { 77, 55, 89, 255 },
    NetPlayer3Dark = { 124, 62, 99, 255 },
    NetPlayer4Dark = { 120, 80, 80, 255 },
    NetPlayer5Dark = { 87, 72, 66, 255 },
    NetPlayer6Dark = { 74, 103, 83, 255 },
    NetPlayer7Dark = { 60, 85, 88, 255 },
    NetPlayer8Dark = { 105, 105, 64, 255 },
    NetPlayer9Dark = { 72, 63, 76, 255 },
    NetPlayer10Dark = { 53, 98, 95, 255 },
    NetPlayer11Dark = { 107, 98, 76, 255 },
    NetPlayer12Dark = { 117, 71, 40, 255 },
    NetPlayer13Dark = { 76, 101, 117, 255 },
    NetPlayer14Dark = { 65, 35, 47, 255 },
    NetPlayer15Dark = { 72, 71, 61, 255 },
    NetPlayer16Dark = { 85, 58, 47, 255 },
    NetPlayer17Dark = { 87, 84, 84, 255 },
    NetPlayer18Dark = { 116, 71, 77, 255 },
    NetPlayer19Dark = { 93, 107, 45, 255 },
    NetPlayer20Dark = { 6, 61, 43, 255 },
    NetPlayer21Dark = { 61, 98, 127, 255 },
    NetPlayer22Dark = { 85, 30, 115, 255 },
    NetPlayer23Dark = { 103, 84, 6, 255 },
    NetPlayer24Dark = { 35, 49, 86, 255 },
    NetPlayer25Dark = { 21, 83, 92, 255 },
    NetPlayer26Dark = { 93, 98, 62, 255 },
    NetPlayer27Dark = { 100, 112, 127, 255 },
    NetPlayer28Dark = { 120, 120, 75, 255 },
    NetPlayer29Dark = { 152, 76, 93, 255 },
    NetPlayer30Dark = { 124, 69, 69, 255 },
    NetPlayer31Dark = { 10, 43, 50, 255 },
    NetPlayer32Dark = { 95, 95, 10, 255 },
    Bronze = { 180, 130, 97, 255 },
    Silver = { 150, 153, 161, 255 },
    Gold = { 214, 181, 99, 255 },
    Platinum = { 166, 221, 190, 255 },
    Gang1 = { 29, 100, 153, 255 },
    Gang2 = { 214, 116, 15, 255 },
    Gang3 = { 135, 125, 142, 255 },
    Gang4 = { 229, 119, 185, 255 },
    SameCrew = { 252, 239, 166, 255 },
    Freemode = { 45, 110, 185, 255 },
    PauseBg = { 0, 0, 0, 255 },
    Friendly = { 93, 182, 229, 255 },
    Enemy = { 194, 80, 80, 255 },
    Location = { 240, 200, 80, 255 },
    Pickup = { 114, 204, 114, 255 },
    PauseSingleplayer = { 114, 204, 114, 255 },
    FreemodeDark = { 22, 55, 92, 255 },
    InactiveMission = { 154, 154, 154, 255 },
    Damage = { 194, 80, 80, 255 },
    PinkLight = { 252, 115, 201, 255 },
    PmMitemHighlight = { 252, 177, 49, 255 },
    ScriptVariable = { 0, 0, 0, 255 },
    Yoga = { 109, 247, 204, 255 },
    Tennis = { 241, 101, 34, 255 },
    Golf = { 214, 189, 97, 255 },
    ShootingRange = { 112, 25, 25, 255 },
    FlightSchool = { 47, 92, 115, 255 },
    NorthBlue = { 93, 182, 229, 255 },
    SocialClub = { 234, 153, 28, 255 },
    PlatformBlue = { 11, 55, 123, 255 },
    PlatformGreen = { 146, 200, 62, 255 },
    PlatformGrey = { 234, 153, 28, 255 },
    FacebookBlue = { 66, 89, 148, 255 },
    IngameBg = { 0, 0, 0, 255 },
    Darts = { 114, 204, 114, 255 },
    Waypoint = { 164, 76, 242, 255 },
    Michael = { 101, 180, 212, 255 },
    Franklin = { 171, 237, 171, 255 },
    Trevor = { 255, 163, 87, 255 },
    GolfP1 = { 240, 240, 240, 255 },
    GolfP2 = { 235, 239, 30, 255 },
    GolfP3 = { 255, 149, 14, 255 },
    GolfP4 = { 246, 60, 161, 255 },
    WaypointLight = { 210, 166, 249, 255 },
    WaypointDark = { 82, 38, 121, 255 },
    PanelLight = { 0, 0, 0, 255 },
    MichaelDark = { 72, 103, 116, 255 },
    FranklinDark = { 85, 118, 85, 255 },
    TrevorDark = { 127, 81, 43, 255 },
    ObjectiveRoute = { 240, 200, 80, 255 },
    PausemapTint = { 0, 0, 0, 255 },
    PauseDeselect = { 100, 100, 100, 255 },
    PmWeaponsPurchasable = { 45, 110, 185, 255 },
    PmWeaponsLocked = { 240, 240, 240, 255 },
    ScreenBg = { 0, 0, 0, 255 },
    Chop = { 224, 50, 50, 255 },
    PausemapTintHalf = { 0, 0, 0, 255 },
    NorthBlueOfficial = { 0, 71, 133, 255 },
    ScriptVariable2 = { 0, 0, 0, 255 },
    H = { 33, 118, 37, 255 },
    HDark = { 37, 102, 40, 255 },
    T = { 234, 153, 28, 255 },
    TDark = { 225, 140, 8, 255 },
    HShard = { 20, 40, 0, 255 },
    ControllerMichael = { 48, 255, 255, 255 },
    ControllerFranklin = { 48, 255, 0, 255 },
    ControllerTrevor = { 176, 80, 0, 255 },
    ControllerChop = { 127, 0, 0, 255 },
    VideoEditorVideo = { 53, 166, 224, 255 },
    VideoEditorAudio = { 162, 79, 157, 255 },
    VideoEditorText = { 104, 192, 141, 255 },
    HbBlue = { 29, 100, 153, 255 },
    HbYellow = { 234, 153, 28, 255 },
    VideoEditorScore = { 240, 160, 1, 255 },
    VideoEditorAudioFadeout = { 59, 34, 57, 255 },
    VideoEditorTextFadeout = { 41, 68, 53, 255 },
    VideoEditorScoreFadeout = { 82, 58, 10, 255 },
    HeistBackground = { 37, 102, 40, 255 },
    VideoEditorAmbient = { 240, 200, 80, 255 },
    VideoEditorAmbientFadeout = { 80, 70, 34, 255 },
    Gb = { 255, 133, 85, 255 },
    G = { 255, 194, 170, 255 },
    B = { 255, 133, 85, 255 },
    LowFlow = { 240, 200, 80, 255 },
    LowFlowDark = { 126, 107, 41, 255 },
    G1 = { 247, 159, 123, 255 },
    G2 = { 226, 134, 187, 255 },
    G3 = { 239, 238, 151, 255 },
    G4 = { 113, 169, 175, 255 },
    G5 = { 160, 140, 193, 255 },
    G6 = { 141, 206, 167, 255 },
    G7 = { 181, 214, 234, 255 },
    G8 = { 178, 144, 132, 255 },
    G9 = { 0, 132, 114, 255 },
    G10 = { 216, 85, 117, 255 },
    G11 = { 30, 100, 152, 255 },
    G12 = { 43, 181, 117, 255 },
    G13 = { 233, 141, 79, 255 },
    G14 = { 137, 210, 215, 255 },
    G15 = { 134, 125, 141, 255 },
    Adversary = { 109, 34, 33, 255 },
    DegenRed = { 255, 0, 0, 255 },
    DegenYellow = { 255, 255, 0, 255 },
    DegenGreen = { 0, 255, 0, 255 },
    DegenCyan = { 0, 255, 255, 255 },
    DegenBlue = { 0, 0, 255, 255 },
    DegenMagenta = { 255, 0, 255, 255 },
    Stunt1 = { 38, 136, 234, 255 },
    Stunt2 = { 224, 50, 50, 255 },
}
RageUI.PanelColour = {
    HairCut = {
        { 22, 19, 19 }, 
        { 30, 28, 25 }, 
        { 76, 56, 45 }, 
        { 69, 34, 24 }, 
        { 123, 59, 31 }, 
        { 149, 68, 35 }, 
        { 165, 87, 50 }, 
        { 175, 111, 72 }, 
        { 159, 105, 68 }, 
        { 198, 152, 108 }, 
        { 213, 170, 115 }, 
        { 223, 187, 132 }, 
        { 202, 164, 110 }, 
        { 238, 204, 130 }, 
        { 229, 190, 126 }, 
        { 250, 225, 167 }, 
        { 187, 140, 96 }, 
        { 163, 92, 60 }, 
        { 144, 52, 37 }, 
        { 134, 21, 17 }, 
        { 164, 24, 18 }, 
        { 195, 33, 24 }, 
        { 221, 69, 34 }, 
        { 229, 71, 30 }, 
        { 208, 97, 56 }, 
        { 113, 79, 38 }, 
        { 132, 107, 95 }, 
        { 185, 164, 150 }, 
        { 218, 196, 180 }, 
        { 247, 230, 217 }, 
        { 102, 72, 93 }, 
        { 162, 105, 138 }, 
        { 171, 174, 11 }, 
        { 239, 61, 200 }, 
        { 255, 69, 152 }, 
        { 255, 178, 191 }, 
        { 12, 168, 146 }, 
        { 8, 146, 165 }, 
        { 11, 82, 134 }, 
        { 118, 190, 117 }, 
        { 52, 156, 104 }, 
        { 22, 86, 85 }, 
        { 152, 177, 40 }, 
        { 127, 162, 23 }, 
        { 241, 200, 98 }, 
        { 238, 178, 16 }, 
        { 224, 134, 14 }, 
        { 247, 157, 15 }, 
        { 243, 143, 16 }, 
        { 231, 70, 15 }, 
        { 255, 101, 21 }, 
        { 254, 91, 34 }, 
        { 252, 67, 21 }, 
        { 196, 12, 15 }, 
        { 143, 10, 14 }, 
        { 44, 27, 22 }, 
        { 80, 51, 37 }, 
        { 98, 54, 37 }, 
        { 60, 31, 24 }, 
        { 69, 43, 32 }, 
        { 8, 10, 14 }, 
        { 212, 185, 158 }, 
        { 212, 185, 158 }, 
        { 213, 170, 115 }, 
    },
}
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "RageUI_cm", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}
function RageUI.Button(Label, Description, Style, Enabled, Callback, Submenu)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                RageUI.ItemsSafeZone(CurrentMenu)
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or tonumber(Style.LeftBadge) == nil) and 0 or 27)
                local RightBadgeOffset = (Style.RightBadge ~= nil and Style.RightBadge.dictionary ~= nil and Style.RightBadge.texture ~= nil) and 32 or 0
                if Style.Color ~= nil then
                    if Style.Color.BackgroundColor ~= nil then
                        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height, Style.Color.BackgroundColor[1], Style.Color.BackgroundColor[2], Style.Color.BackgroundColor[3])
                    end
                end
                if Selected then
                    if Style.Color == nil then
                        RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    end
                    if Style.Color ~= nil and Style.Color.HightLightColor ~= nil then
                        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height, Style.Color.HightLightColor[1], Style.Color.HightLightColor[2], Style.Color.HightLightColor[3])
                    else
                        RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    end
                end
                if type(Style) == 'table' then
                    if Style.LeftBadge ~= nil then
                        if Style.LeftBadge ~= RageUI.BadgeStyle.None and tonumber(Style.LeftBadge) ~= nil then
                            RenderSprite(RageUI.GetBadgeDictionary(Style.LeftBadge, Selected), RageUI.GetBadgeTexture(Style.LeftBadge, Selected), CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, RageUI.GetBadgeColour(Style.LeftBadge, Selected))
                        end
                    end
                    if Style.RightBadge ~= nil and Style.RightBadge.dictionary ~= nil and Style.RightBadge.texture  ~= nil then
                        RenderSprite(Style.RightBadge.dictionary, Style.RightBadge.texture, CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, 255, 255, 255, 255)
                    end
                end
                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    local RightBadge = RageUI.BadgeStyle.Lock()
                    RenderSprite("RageUI_cm", RightBadge.BadgeTexture, CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, 255, 203, 220, 255)
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 255, 203, 220, 255)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                RageUI.ItemsDescription(CurrentMenu, Description, Selected);
                if (Callback.onActive ~= nil) and Selected then
                    Callback.onActive();
                end
                if Selected and Enabled and CurrentMenu.Controls.Select.Active then
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                    if (Callback.onSelected ~= nil) and (Selected) then
                        Callback.onSelected();
                    end
                    if Submenu ~= nil then
                        if Submenu() then
                            RageUI.NextMenu = Submenu
                        end
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "RageUI_cm", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}
local SettingsCheckbox = {
    Dictionary = "RageUI_cm", Textures = {
        "shop_box_blankb", 
        "shop_box_tickb", 
        "shop_box_blank", 
        "shop_box_tick", 
        "shop_box_crossb", 
        "shop_box_cross", 
    },
    X = 380, Y = -6, Width = 50, Height = 50
}
RageUI.CheckboxStyle = {
    Tick = 1,
    Cross = 2
}
local function StyleCheckBox(Selected, Checked, Box, BoxSelect, OffSet)
    local CurrentMenu = RageUI.CurrentMenu;
    if OffSet == nil then
        OffSet = 0
    end
    if Selected then
        if Checked then
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[Box], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        else
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[1], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        end
    else
        if Checked then
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[BoxSelect], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        else
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[3], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        end
    end
end
function RageUI.Checkbox(Label, Description, Checked, Style, Actions)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local BoxOffset = 0
                RageUI.ItemsSafeZone(CurrentMenu)
                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                end
                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if Selected then
                            RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                        else
                            RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                        end
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        local LeftBadgeOffset = ((LeftBadge == RageUI.BadgeStyle.None or LeftBadge == nil) and 0 or 27)
                        if Selected then
                            RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
                        else
                            RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
                        end
                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)
                            RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                    if Style.Enabled == true or Style.Enabled == nil then
                        if Selected then
                            if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                                RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                                BoxOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            end
                        else
                            if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                                RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                                BoxOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            end
                        end
                    end
                    BoxOffset = RightBadgeOffset + BoxOffset
                    if Style.Style ~= nil then
                        if Style.Style == RageUI.CheckboxStyle.Tick then
                            StyleCheckBox(Selected, Checked, 2, 4, BoxOffset)
                        elseif Style.Style == RageUI.CheckboxStyle.Cross then
                            StyleCheckBox(Selected, Checked, 5, 6, BoxOffset)
                        else
                            StyleCheckBox(Selected, Checked, 2, 4, BoxOffset)
                        end
                    else
                        StyleCheckBox(Selected, Checked, 2, 4, BoxOffset)
                    end
                    if Selected and CurrentMenu.Controls.Select.Active and (Style.Enabled == true or Style.Enabled == nil) then
                        local Audio = RageUI.Settings.Audio
                        RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                        Checked = not Checked
                        if (Checked) then
                            if (Actions.onChecked ~= nil) then
                                Actions.onChecked();
                            end
                        else
                            if (Actions.onUnChecked ~= nil) then
                                Actions.onUnChecked();
                            end
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                RageUI.ItemsDescription(CurrentMenu, Description, Selected)
                if (Actions.onSelected ~= nil) and (Selected) then
                    Actions.onSelected(Checked);
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "RageUI_cm", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}
local SettingsList = {
    LeftArrow = { Dictionary = "RageUI_cm", Texture = "arrowleft", X = 378, Y = 3, Width = 30, Height = 30 },
    RightArrow = { Dictionary = "RageUI_cm", Texture = "arrowright", X = 400, Y = 3, Width = 30, Height = 30 },
    Text = { X = 403, Y = 3, Scale = 0.35 },
}
function RageUI.List(Label, Items, Index, Description, Style, Enabled, Actions, Submenu)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false
                RageUI.ItemsSafeZone(CurrentMenu)
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local RightOffset = 0
                local ListText = (type(Items[Index]) == "table") and string.format("← %s →", Items[Index].Name) or string.format("← %s →", Items[Index]) or "NIL"
                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                end
                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                        end
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                    end
                end
                RightOffset = RightBadgeOffset * 1.3 + RightOffset
                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + 15 + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 245, 245, 245, 255, 2)
                    else
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                        RenderText(ListText, CurrentMenu.X + SettingsList.Text.X + 15 + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsList.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsList.Text.Scale, 245, 245, 245, 255, 2)
                    end
                else
                    local RightBadge = RageUI.BadgeStyle.Lock()
                    RenderSprite("RageUI_cm", RightBadge.BadgeTexture, CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, 255, 203, 220, 255)
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 255, 203, 220, 255)
                end
                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)
                            RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                RageUI.ItemsDescription(CurrentMenu, Description, Selected);
                if (Actions.onActive ~= nil) and Selected then
                    Actions.onActive();
                end
                if Selected and Enabled and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    Index = Index - 1
                    if Index < 1 then
                        Index = #Items
                    end
                    if (Actions.onListChange ~= nil) then
                        Actions.onListChange(Index, Items[Index]);
                    end
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                elseif Selected and Enabled and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    Index = Index + 1
                    if Index > #Items then
                        Index = 1
                    end
                    if (Actions.onListChange ~= nil) then
                        Actions.onListChange(Index, Items[Index]);
                    end
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                end
                if Selected and Enabled and CurrentMenu.Controls.Select.Active then
                    local Audio = RageUI.Settings.Audio
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(Index, Items[Index]);
                    end
                    if Submenu ~= nil and type(Submenu) == "table" then
                        RageUI.NextMenu = Submenu[Index]
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
}
function RageUI.Separator(Label)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                if (Label ~= nil) then
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + (CurrentMenu.WidthOffset * 2.5 ~= 0 and CurrentMenu.WidthOffset * 2.5 or 200), CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255, 1)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "RageUI_cm", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}
local SettingsSlider = {
    Background = { X = 250, Y = 14.5, Width = 150, Height = 9 },
    Slider = { X = 250, Y = 14.5, Width = 75, Height = 9 },
    Divider = { X = 323.5, Y = 9, Width = 2.5, Height = 20 },
    LeftArrow = { Dictionary = "RageUI_cm", Texture = "arrowleft", X = 235, Y = 11.5, Width = 15, Height = 15 },
    RightArrow = { Dictionary = "RageUI_cm", Texture = "arrowright", X = 400, Y = 11.5, Width = 15, Height = 15 },
}
function RageUI.Slider(Label, ProgressStart, ProgressMax, Description, Divider, Style, Enabled, Actions)
    local CurrentMenu = RageUI.CurrentMenu;
    local Audio = RageUI.Settings.Audio
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Items = {}
            for i = 1, ProgressMax do
                table.insert(Items, i)
            end
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false
                RageUI.ItemsSafeZone(CurrentMenu)
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local RightOffset = 0
                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height)
                end
                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 0, 0, 0, 255, 2)
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                        end
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                    end
                end
                RightOffset = RightOffset + RightBadgeOffset
                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 0, 0, 0, 255)
                        RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 0, 0, 0, 255)
                        RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 0, 0, 0, 255)
                    else
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
                    if Selected then
                        RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 163, 159, 148, 255)
                        RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 163, 159, 148, 255)
                    end
                end
                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)
                            RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end
                RenderRectangle(CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Background.Width, SettingsSlider.Background.Height, 4, 32, 57, 255)
                RenderRectangle(CurrentMenu.X + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width - SettingsSlider.Slider.Width) / (#Items - 1)) * (ProgressStart - 1)) + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Slider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Slider.Width, SettingsSlider.Slider.Height, 57, 116, 200, 255)
                if Divider then
                    RenderRectangle(CurrentMenu.X + SettingsSlider.Divider.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.Divider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Divider.Width, SettingsSlider.Divider.Height, 245, 245, 245, 255)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                RageUI.ItemsDescription(CurrentMenu, Description, Selected);
                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    ProgressStart = ProgressStart - 1
                    if ProgressStart < 1 then
                        ProgressStart = #Items
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    ProgressStart = ProgressStart + 1
                    if ProgressStart > #Items then
                        ProgressStart = 1
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                end
                if Selected and CurrentMenu.Controls.Select.Active then
                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    SelectedSprite = { Dictionary = "RageUI_cm", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}
local SettingsSlider = {
    Background = { X = 250, Y = 14.5, Width = 150, Height = 9 },
    Slider = { X = 250, Y = 14.5, Width = 75, Height = 9 },
    Divider = { X = 323.5, Y = 9, Width = 2.5, Height = 20 },
    LeftArrow = { Dictionary = "mpleaderboard", Texture = "leaderboard_female_icon", X = 215, Y = 0, Width = 40, Height = 40 },
    RightArrow = { Dictionary = "mpleaderboard", Texture = "leaderboard_male_icon", X = 395, Y = 0, Width = 40, Height = 40 },
}
local Items = {}
for i = 1, 10 do
    table.insert(Items, i)
end
function RageUI.UISliderHeritage(Label, ItemIndex, Description, Actions, Value)
    local CurrentMenu = RageUI.CurrentMenu;
    local Audio = RageUI.Settings.Audio
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local value = Value or 0.1
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false
                RageUI.ItemsSafeZone(CurrentMenu)
                local RightOffset = 0
                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                    LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height)
                    RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.SafeZoneSize.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height)
                end
                RightOffset = RightOffset
                if Selected then
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 245, 245, 245, 255)
                    RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 245, 245, 245, 255)
                else
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    RenderSprite(SettingsSlider.LeftArrow.Dictionary, SettingsSlider.LeftArrow.Texture, CurrentMenu.X + SettingsSlider.LeftArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.LeftArrow.Width, SettingsSlider.LeftArrow.Height, 0, 255, 255, 255, 255)
                    RenderSprite(SettingsSlider.RightArrow.Dictionary, SettingsSlider.RightArrow.Texture, CurrentMenu.X + SettingsSlider.RightArrow.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.RightArrow.Width, SettingsSlider.RightArrow.Height, 0, 255, 255, 255, 255)
                end
                RenderRectangle(CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Background.Width, SettingsSlider.Background.Height, 44, 7, 19, 255)
                RenderRectangle(CurrentMenu.X + SettingsSlider.Slider.X + (((SettingsSlider.Background.Width - SettingsSlider.Slider.Width) / (#Items)) * (ItemIndex)) + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Slider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Slider.Width, SettingsSlider.Slider.Height, 143, 0, 46, 255)
                RenderRectangle(CurrentMenu.X + SettingsSlider.Divider.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsSlider.Divider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Divider.Width, SettingsSlider.Divider.Height, 245, 245, 245, 255)
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                RageUI.ItemsDescription(CurrentMenu, Description, Selected);
                if Selected and (CurrentMenu.Controls.SliderLeft.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.SliderRight.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    ItemIndex = ItemIndex - value
                    if ItemIndex < 0.1 then
                        ItemIndex = 0.0
                    else
                        RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ItemIndex / 10, ItemIndex);
                    end
                elseif Selected and (CurrentMenu.Controls.SliderRight.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.SliderLeft.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    ItemIndex = ItemIndex + value
                    if ItemIndex > #Items then
                        ItemIndex = 10
                    else
                        RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ItemIndex / 10, ItemIndex);
                    end
                end
                if Selected and CurrentMenu.Controls.Select.Active then
                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(ItemIndex / 10, ItemIndex);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef, false)
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "RageUI_cm", Texture = "gradient_nav", Y = 0, Width = 431, Height = 38 },
}
local SettingsSlider = {
    Background = { X = 220, Y = 14.5, Width = 200, Height = 9 },
    Slider = { X = 220, Y = 14.5, Width = 200, Height = 9 },
    LeftArrow = { Dictionary = "RageUI_cm", Texture = "arrowleft", X = 235, Y = 11.5, Width = 15, Height = 15 },
    RightArrow = { Dictionary = "RageUI_cm", Texture = "arrowright", X = 400, Y = 11.5, Width = 15, Height = 15 },
}
function RageUI.SliderProgress(Label, ProgressStart, ProgressMax, Description, Style, Enabled, Actions)
    local CurrentMenu = RageUI.CurrentMenu;
    local Audio = RageUI.Settings.Audio
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Items = {}
            for i = 1, ProgressMax do
                table.insert(Items, i)
            end
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                local Selected = CurrentMenu.Index == Option
                local LeftArrowHovered, RightArrowHovered = false, false
                RageUI.ItemsSafeZone(CurrentMenu)
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local RightOffset = 0
                if Selected then
                    RenderSprite(SettingsButton.SelectedSprite.Dictionary, SettingsButton.SelectedSprite.Texture, CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height)
                end
                if Enabled == true or Enabled == nil then
                    if Selected then
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                        end
                    else
                        if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                            RightOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, 245, 245, 245, 255, 2)
                        end
                    end
                end
                RightOffset = RightOffset + RightBadgeOffset
                if Enabled == true or Enabled == nil then
                    if Selected then
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    else
                        RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 245, 245, 245, 255)
                    end
                else
                    RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.Text.Scale, 163, 159, 148, 255)
                end
                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, BadgeData.BadgeColour and BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour and BadgeData.BadgeColour.A or 255)
                                end
                            end
                        end
                    else
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)
                            RenderSprite(BadgeData.BadgeDictionary or "RageUI_cm", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, BadgeData.BadgeColour.R or 255, BadgeData.BadgeColour.G or 255, BadgeData.BadgeColour.B or 255, BadgeData.BadgeColour.A or 255)
                        end
                    end
                else
                    error("UICheckBox Style is not a `table`")
                end
                if (type(Style.ProgressBackgroundColor) == "table") then
                    RenderRectangle(CurrentMenu.X + SettingsSlider.Background.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsSlider.Background.Width, SettingsSlider.Background.Height, Style.ProgressBackgroundColor.R, Style.ProgressBackgroundColor.G, Style.ProgressBackgroundColor.B, Style.ProgressBackgroundColor.A)
                else
                    error("Style ProgressBackgroundColor is not a table or undefined")
                end
                if (type(Style.ProgressColor) == "table") then
                    RenderRectangle(CurrentMenu.X + SettingsSlider.Slider.X + CurrentMenu.WidthOffset - RightOffset, CurrentMenu.Y + SettingsSlider.Slider.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, (((SettingsSlider.Slider.Width) / (#Items - 1)) * (ProgressStart - 1)), SettingsSlider.Slider.Height, Style.ProgressColor.R, Style.ProgressColor.G, Style.ProgressColor.B, Style.ProgressColor.A)
                else
                    error("Style ProgressColor is not a table or undefined")
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                RageUI.ItemsDescription(CurrentMenu, Description, Selected);
                if Selected and (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) and not (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) then
                    ProgressStart = ProgressStart - 1
                    if ProgressStart < 1 then
                        ProgressStart = #Items
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                elseif Selected and (CurrentMenu.Controls.Right.Active or (CurrentMenu.Controls.Click.Active and RightArrowHovered)) and not (CurrentMenu.Controls.Left.Active or (CurrentMenu.Controls.Click.Active and LeftArrowHovered)) then
                    ProgressStart = ProgressStart + 1
                    if ProgressStart > #Items then
                        ProgressStart = 1
                    end
                    if (Actions.onSliderChange ~= nil) then
                        Actions.onSliderChange(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].LeftRight.audioName, Audio[Audio.Use].LeftRight.audioRef)
                end
                if Selected and CurrentMenu.Controls.Select.Active then
                    if (Actions.onSelected ~= nil) then
                        Actions.onSelected(ProgressStart);
                    end
                    RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end
local TextPanels = {
    Background = { Y = 4, Width = 431, Height = 42 },
    Text = {
        Left = { X = 8, Y = 10, Scale = 0.35 },
        Right = { X = 8, Y = 10, Scale = 0.35 },
    },
}
function RageUI.PicturePreview(Picture)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            RenderSprite('stalya', Picture, CurrentMenu.X, CurrentMenu.Y + TextPanels.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), TextPanels.Background.Width + CurrentMenu.WidthOffset, TextPanels.Background.Height + 200, 0, 255, 255, 255, 255);
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end
local Colour = {
    Background = { Dictionary = "RageUI_cm", Texture = "", Y = 4, Width = 431, Height = 112 },
    LeftArrow = { Dictionary = "RageUI_cm", Texture = "arrowleft", X = 7.5, Y = 15, Width = 30, Height = 30 },
    RightArrow = { Dictionary = "RageUI_cm", Texture = "arrowright", X = 393.5, Y = 15, Width = 30, Height = 30 },
    Header = { X = 215.5, Y = 15, Scale = 0.35 },
    Box = { X = 15, Y = 55, Width = 44.5, Height = 44.5 },
    SelectedRectangle = { X = 15, Y = 47, Width = 44.5, Height = 8 },
}
function RageUI.ColourPanel(Title, Colours, MinimumIndex, CurrentIndex, Action, Index)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() and (CurrentMenu.Index == Index) then
            local Maximum = (#Colours > 9) and 9 or #Colours
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + Colour.Box.X + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.Box.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, (Colour.Box.Width * Maximum), Colour.Box.Height)
            local LeftArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + Colour.LeftArrow.X + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.LeftArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.LeftArrow.Width, Colour.LeftArrow.Height)
            local RightArrowHovered = RageUI.IsMouseInBounds(CurrentMenu.X + Colour.RightArrow.X + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.RightArrow.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.RightArrow.Width, Colour.RightArrow.Height)
            local Selected = false
            RenderSprite(Colour.Background.Dictionary, Colour.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Colour.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.Background.Width + CurrentMenu.WidthOffset, Colour.Background.Height,0, 22, 25, 35, 220)
            RenderSprite(Colour.LeftArrow.Dictionary, Colour.LeftArrow.Texture, CurrentMenu.X + Colour.LeftArrow.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.LeftArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.LeftArrow.Width, Colour.LeftArrow.Height)
            RenderSprite(Colour.RightArrow.Dictionary, Colour.RightArrow.Texture, CurrentMenu.X + Colour.RightArrow.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.RightArrow.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.RightArrow.Width, Colour.RightArrow.Height)
            RenderRectangle(CurrentMenu.X + Colour.SelectedRectangle.X + (Colour.Box.Width * (CurrentIndex - MinimumIndex)) + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.SelectedRectangle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.SelectedRectangle.Width, Colour.SelectedRectangle.Height, 245, 245, 245, 255)
            for Index = 1, Maximum do
                RenderRectangle(CurrentMenu.X + Colour.Box.X + (Colour.Box.Width * (Index - 1)) + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.Box.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.Box.Width, Colour.Box.Height, table.unpack(Colours[MinimumIndex + Index - 1]))
            end
            RenderText((Title and Title or "") .. " (" .. CurrentIndex .. " of " .. #Colours .. ")", CurrentMenu.X + RageUI.Settings.Panels.Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + RageUI.Settings.Panels.Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, RageUI.Settings.Panels.Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
            if Hovered or LeftArrowHovered or RightArrowHovered then
                if RageUI.Settings.Controls.Click.Active then
                    Selected = true
                    if LeftArrowHovered then
                        CurrentIndex = CurrentIndex - 1
                        if CurrentIndex < 1 then
                            CurrentIndex = #Colours
                            MinimumIndex = #Colours - Maximum + 1
                        elseif CurrentIndex < MinimumIndex then
                            MinimumIndex = MinimumIndex - 1
                        end
                    elseif RightArrowHovered then
                        CurrentIndex = CurrentIndex + 1
                        if CurrentIndex > #Colours then
                            CurrentIndex = 1
                            MinimumIndex = 1
                        elseif CurrentIndex > MinimumIndex + Maximum - 1 then
                            MinimumIndex = MinimumIndex + 1
                        end
                    elseif Hovered then
                        for Index = 1, Maximum do
                            if RageUI.IsMouseInBounds(CurrentMenu.X + Colour.Box.X + (Colour.Box.Width * (Index - 1)) + CurrentMenu.SafeZoneSize.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Colour.Box.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Colour.Box.Width, Colour.Box.Height) then
                                CurrentIndex = MinimumIndex + Index - 1
                            end
                        end
                    end
                    if (Action.onColorChange ~= nil) then
                        Action.onColorChange(MinimumIndex, CurrentIndex)
                    end
                end
            end
            RageUI.ItemOffset = RageUI.ItemOffset + Colour.Background.Height + Colour.Background.Y
            if (Hovered or LeftArrowHovered or RightArrowHovered) and RageUI.Settings.Controls.Click.Active then
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
            end
        end
    end
end
local GridType = RageUI.Enum {
    Default = 1,
    Horizontal = 2,
    Vertical = 3
}
local GridSprite = {
    [GridType.Default] = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", },
    [GridType.Horizontal] = { Dictionary = "RageUI", Texture = "horizontal_grid", },
    [GridType.Vertical] = { Dictionary = "RageUI", Texture = "vertical_grid", },
}
local Grid = {
    Background = { Dictionary = "RageUI_cm", Texture = "", Y = 4, Width = 431, Height = 275 },
    Grid = { X = 115.5, Y = 47.5, Width = 200, Height = 200 },
    Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
    Text = {
        Top = { X = 215.5, Y = 15, Scale = 0.35 },
        Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
        Left = { X = 57.75, Y = 130, Scale = 0.35 },
        Right = { X = 373.25, Y = 130, Scale = 0.35 },
    },
}
local function UIGridPanel(Type, StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and ((CurrentMenu.Index == Index)) then
            local X = Type == GridType.Default and StartedX or Type == GridType.Horizontal and StartedX or Type == GridType.Vertical and 0.5
            local Y = Type == GridType.Default and StartedY or Type == GridType.Horizontal and 0.5 or Type == GridType.Vertical and StartedY
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + Grid.Grid.X + CurrentMenu.SafeZoneSize.X + 20, CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20, Grid.Grid.Width + CurrentMenu.WidthOffset - 40, Grid.Grid.Height - 40)
            local Selected = false
            local CircleX = CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20
            local CircleY = CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20
            if X < 0.0 or X > 1.0 then
                X = 0.0
            end
            if Y < 0.0 or Y > 1.0 then
                Y = 0.0
            end
            CircleX = CircleX + ((Grid.Grid.Width - 40) * X) - (Grid.Circle.Width / 2)
            CircleY = CircleY + ((Grid.Grid.Height - 40) * Y) - (Grid.Circle.Height / 2)
            RenderSprite(Grid.Background.Dictionary, Grid.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Grid.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Grid.Background.Width + CurrentMenu.WidthOffset, Grid.Background.Height, 0, 22, 25, 35, 220)
            RenderSprite(GridSprite[Type].Dictionary, GridSprite[Type].Texture, CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Grid.Grid.Width, Grid.Grid.Height, 0, 244, 5, 82, 246)
            RenderSprite(Grid.Circle.Dictionary, Grid.Circle.Texture, CircleX, CircleY, Grid.Circle.Width, Grid.Circle.Height, 0, 255, 35, 130, 255)
            if (Type == GridType.Default) then
                RenderText(TopText or "", CurrentMenu.X + Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
                RenderText(BottomText or "", CurrentMenu.X + Grid.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
                RenderText(LeftText or "", CurrentMenu.X + Grid.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Left.Scale, 245, 245, 245, 255, 1)
                RenderText(RightText or "", CurrentMenu.X + Grid.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Right.Scale, 245, 245, 245, 255, 1)
            end
            if (Type == GridType.Vertical) then
                RenderText(TopText or "", CurrentMenu.X + Grid.Text.Top.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Top.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Top.Scale, 245, 245, 245, 255, 1)
                RenderText(BottomText or "", CurrentMenu.X + Grid.Text.Bottom.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Bottom.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Bottom.Scale, 245, 245, 245, 255, 1)
            end
            if (Type == GridType.Horizontal) then
                RenderText(LeftText or "", CurrentMenu.X + Grid.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Left.Scale, 245, 245, 245, 255, 1)
                RenderText(RightText or "", CurrentMenu.X + Grid.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Grid.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Grid.Text.Right.Scale, 245, 245, 245, 255, 1)
            end
            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true
                    CircleX = math.round(GetControlNormal(2, 239) * 1920) - CurrentMenu.SafeZoneSize.X - (Grid.Circle.Width / 2)
                    CircleY = math.round(GetControlNormal(2, 240) * 1080) - CurrentMenu.SafeZoneSize.Y - (Grid.Circle.Height / 2)
                    if CircleX > (CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + Grid.Grid.Width - 40) then
                        CircleX = CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20 + Grid.Grid.Width - 40
                    elseif CircleX < (CurrentMenu.X + Grid.Grid.X + 20 - (Grid.Circle.Width / 2)) then
                        CircleX = CurrentMenu.X + Grid.Grid.X + 20 - (Grid.Circle.Width / 2)
                    end
                    if CircleY > (CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 + Grid.Grid.Height - 40) then
                        CircleY = CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 + Grid.Grid.Height - 40
                    elseif CircleY < (CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 - (Grid.Circle.Height / 2)) then
                        CircleY = CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20 - (Grid.Circle.Height / 2)
                    end
                    X = math.round((CircleX - (CurrentMenu.X + Grid.Grid.X + (CurrentMenu.WidthOffset / 2) + 20) + (Grid.Circle.Width / 2)) / (Grid.Grid.Width - 40), 2)
                    Y = math.round((CircleY - (CurrentMenu.Y + Grid.Grid.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + 20) + (Grid.Circle.Height / 2)) / (Grid.Grid.Height - 40), 2)
                    if (X ~= StartedX) and (Y ~= StartedY) then
                        Action.onPositionChange(X, Y, (X * 2 - 1), (Y * 2 - 1))
                    end
                    StartedX = X;
                    StartedY = Y;
                    if X > 1.0 then
                        X = 1.0
                    end
                    if Y > 1.0 then
                        Y = 1.0
                    end
                end
            end
            RageUI.ItemOffset = RageUI.ItemOffset + Grid.Background.Height + Grid.Background.Y
            if Hovered and Selected then
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                if (Action.onSelected ~= nil) then
                    Action.onSelected(X, Y, (X * 2 - 1), (Y * 2 - 1));
                end
            end
        end
    end
end
function RageUI.Grid(StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
    UIGridPanel(GridType.Default, StartedX, StartedY, TopText, BottomText, LeftText, RightText, Action, Index)
end
function RageUI.GridHorizontal(StartedX, LeftText, RightText, Action, Index)
    UIGridPanel(GridType.Horizontal, StartedX, nil, nil, nil, LeftText, RightText, Action, Index)
end
function RageUI.GridVertical(StartedY, TopText, BottomText, Action, Index)
    UIGridPanel(GridType.Vertical, nil, StartedY, TopText, BottomText, nil, nil, Action, Index)
end
local Percentage = {
    Background = { Dictionary = "RageUI_cm", Texture = "", Y = 4, Width = 431, Height = 76 },
    Bar = { X = 9, Y = 50, Width = 413, Height = 10 },
    Text = {
        Left = { X = 25, Y = 15, Scale = 0.35 },
        Middle = { X = 215.5, Y = 15, Scale = 0.35 },
        Right = { X = 398, Y = 15, Scale = 0.35 },
    },
}
function RageUI.PercentagePanel(Percent, HeaderText, MinText, MaxText, Action, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            local Hovered = RageUI.IsMouseInBounds(CurrentMenu.X + Percentage.Bar.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset - 4, Percentage.Bar.Width + CurrentMenu.WidthOffset, Percentage.Bar.Height + 8)
            local Selected = false
            local Progress = Percentage.Bar.Width
            if Percent < 0.0 then
                Percent = 0.0
            elseif Percent > 1.0 then
                Percent = 1.0
            end
            Progress = Progress * Percent
            RenderSprite(Percentage.Background.Dictionary, Percentage.Background.Texture, CurrentMenu.X, CurrentMenu.Y + Percentage.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percentage.Background.Width + CurrentMenu.WidthOffset, Percentage.Background.Height, 0, 22, 25, 35, 220)
            RenderRectangle(CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percentage.Bar.Width, Percentage.Bar.Height, 87, 87, 87, 255)
            RenderRectangle(CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Progress, Percentage.Bar.Height, 245, 245, 245, 255)
            RenderText(HeaderText or "Opacity", CurrentMenu.X + Percentage.Text.Middle.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Middle.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Percentage.Text.Middle.Scale, 245, 245, 245, 255, 1)
            RenderText(MinText or "0%", CurrentMenu.X + Percentage.Text.Left.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Percentage.Text.Left.Scale, 245, 245, 245, 255, 1)
            RenderText(MaxText or "100%", CurrentMenu.X + Percentage.Text.Right.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + Percentage.Text.Right.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Percentage.Text.Right.Scale, 245, 245, 245, 255, 1)
            if Hovered then
                if IsDisabledControlPressed(0, 24) then
                    Selected = true
                    Progress = math.round(GetControlNormal(2, 239) * 1920) - CurrentMenu.SafeZoneSize.X - (CurrentMenu.X + Percentage.Bar.X + (CurrentMenu.WidthOffset / 2))
                    if Progress < 0 then
                        Progress = 0
                    elseif Progress > (Percentage.Bar.Width) then
                        Progress = Percentage.Bar.Width
                    end
                    Percent = math.round(Progress / Percentage.Bar.Width, 2)
                    if (Action.onProgressChange ~= nil) then
                        Action.onProgressChange(Percent)
                    end
                end
            end
            RageUI.ItemOffset = RageUI.ItemOffset + Percentage.Background.Height + Percentage.Background.Y
            if Hovered and Selected then
                local Audio = RageUI.Settings.Audio
                RageUI.PlaySound(Audio[Audio.Use].Slider.audioName, Audio[Audio.Use].Slider.audioRef, true)
                if (Action.onSelected ~= nil) then
                    Action.onSelected(Percent)
                end
            end
        end
    end
end
local Statistics = {
    Background = { Dictionary = "RageUI_cm", Texture = "", Y = 4, Width = 431, Height = 42 },
    Text = {
        Left = { X = -40, Y = 15, Scale = 0.35 },
    },
    Bar = { Right = 8, Y = 27, Width = 200, Height = 10, OffsetRatio = 0.5 },
    Divider = {
        [1] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [2] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [3] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [4] = { X = 200, Y = 27, Width = 2, Height = 10 },
        [5] = { X = 200, Y = 27, Width = 2, Height = 10 },
    }
}
function RageUI.StatisticPanel(Percent, Text, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            local BarWidth = Statistics.Bar.Width + CurrentMenu.WidthOffset * Statistics.Bar.OffsetRatio
            RenderRectangle(CurrentMenu.X, CurrentMenu.Y + Statistics.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), Statistics.Background.Width + CurrentMenu.WidthOffset, Statistics.Background.Height, 0, 0, 0, 170)
            RenderText(Text or "", CurrentMenu.X + 8.0, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Statistics.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderRectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, BarWidth, Statistics.Bar.Height, 87, 87, 87, 255)
            RenderRectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent * BarWidth, Statistics.Bar.Height, 255, 255, 255, 255)
            for i = 1, #Statistics.Divider, 1 do
                RenderRectangle((CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right) + i * ((BarWidth - (#Statistics.Divider / Statistics.Divider[i].Width)) / (#Statistics.Divider + 1)) + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Divider[i].Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Statistics.Divider[i].Width, Statistics.Divider[i].Height, 0, 0, 0, 255)
            end
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end
function RageUI.StatisticPanelAdvanced(Text, Percent, RGBA1, Percent2, RGBA2, RGBA3, Index)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() and (Index == nil or (CurrentMenu.Index == Index)) then
            RGBA1 = RGBA1 or { 255, 255, 255, 255 }
            local BarWidth = Statistics.Bar.Width + CurrentMenu.WidthOffset * Statistics.Bar.OffsetRatio
            RenderRectangle(CurrentMenu.X, CurrentMenu.Y + Statistics.Background.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset + (RageUI.StatisticPanelCount * 42), Statistics.Background.Width + CurrentMenu.WidthOffset, Statistics.Background.Height, 0, 0, 0, 170)
            RenderText(Text or "", CurrentMenu.X + 8.0, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Text.Left.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, Statistics.Text.Left.Scale, 245, 245, 245, 255, 0)
            RenderRectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, BarWidth, Statistics.Bar.Height, 87, 87, 87, 255)
            RenderRectangle(CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent * BarWidth, Statistics.Bar.Height, RGBA1[1], RGBA1[2], RGBA1[3], RGBA1[4])
            RGBA2 = RGBA2 or { 0, 153, 204, 255 }
            RGBA3 = RGBA3 or { 185, 0, 0, 255 }
            if Percent2 and Percent2 > 0 then
                local X = CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset + Percent * BarWidth
                RenderRectangle(X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent2 * BarWidth, Statistics.Bar.Height, RGBA2[1], RGBA2[2], RGBA2[3], RGBA2[4])
            elseif Percent2 and Percent2 < 0 then
                local X = CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right + CurrentMenu.WidthOffset + Percent * BarWidth
                RenderRectangle(X, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Bar.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Percent2 * BarWidth, Statistics.Bar.Height, RGBA3[1], RGBA3[2], RGBA3[3], RGBA3[4])
            end
            for i = 1, #Statistics.Divider, 1 do
                RenderRectangle((CurrentMenu.X + RageUI.Settings.Items.Title.Background.Width - BarWidth - Statistics.Bar.Right) + i * ((BarWidth - (#Statistics.Divider / Statistics.Divider[i].Width)) / (#Statistics.Divider + 1)) + CurrentMenu.WidthOffset, (RageUI.StatisticPanelCount * 40) + CurrentMenu.Y + Statistics.Divider[i].Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Statistics.Divider[i].Width, Statistics.Divider[i].Height, 0, 0, 0, 255)
            end
            RageUI.StatisticPanelCount = RageUI.StatisticPanelCount + 1
        end
    end
end
local Heritage = {
    Background = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "mumdadbg", Width = 431, Height = 228 },
    Mum = { Dictionary = "char_creator_portraits", X = 25, Width = 228, Height = 228 },
    Dad = { Dictionary = "char_creator_portraits", X = 195, Width = 228, Height = 228 },
}
function RageUI.Window.Heritage(Mum, Dad)
    local CurrentMenu = RageUI.CurrentMenu;
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            if Mum < 0 or Mum > 21 then
                Mum = 0
            end
            if Dad < 0 or Dad > 23 then
                Dad = 0
            end
            if Mum == 21 then
                Mum = "special_female_" .. (tonumber(string.sub(Mum, 2, 2)) - 1)
            else
                Mum = "female_" .. Mum
            end
            if Dad >= 21 then
                Dad = "special_male_" .. (tonumber(string.sub(Dad, 2, 2)) - 1)
            else
                Dad = "male_" .. Dad
            end
            RenderSprite(Heritage.Background.Dictionary, Heritage.Background.Texture, CurrentMenu.X, CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Heritage.Background.Width + (CurrentMenu.WidthOffset / 1), Heritage.Background.Height)
            RenderSprite(Heritage.Dad.Dictionary, Dad, CurrentMenu.X + Heritage.Dad.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Heritage.Dad.Width, Heritage.Dad.Height)
            RenderSprite(Heritage.Mum.Dictionary, Mum, CurrentMenu.X + Heritage.Mum.X + (CurrentMenu.WidthOffset / 2), CurrentMenu.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, Heritage.Mum.Width, Heritage.Mum.Height)
            RageUI.ItemOffset = RageUI.ItemOffset + Heritage.Background.Height
        end
    end
end
local test = {
    { pos = vector3(266.01, -1007.38,  -102.01) },
    { pos = vector3(346.46, -1012.61,  -100.2) },
    {  pos = vector3(980.75, -102.04,  73.85)},
    {  pos = vector3(996.95, -3158.12,  -39.91)},
    {  pos = vector3(1121.09, -3152.58,  -38.06)},
    {pos = vector3(-14.22, -1440.55,  30.1), },
    { pos = vector3(242.38, 361.47,  104.74) },
    {pos = vector3(-107.94, -8.06,  69.52), },
    {  pos = vector3(1048.48, -3097.14,  -40.0)},
    {  pos = vector3(992.57, -3097.89,  -40.0)},
    {  pos = vector3(1087.8, -3099.38,  -40.01)},
    {  pos = vector3(1973.18, 3816.1,  32.43)},
    { pos = vector3(151.35, -1007.91,  -100.0)},
    {  pos = vector3(17.71, -1114.1,  28.81)},
    { pos = vector3(-1150.66, -1520.98,  9.63) },
    {  pos = vector3(1274.03, -1719.89,  53.77)},
}
RMenu.Add('administration', 'main', RageUI.CreateMenu("Stalya", "Undefined for using SetSubtitle"))
RMenu:Get('administration', 'main'):SetSubtitle("Stalya Menu")
RMenu:Get('administration', 'main'):DisplayGlare(true);
RMenu.Add('administration', 'tools', RageUI.CreateSubMenu(RMenu:Get('administration', 'main'), "MsTools", "MsTools"))
RMenu.Add('administration', 'NpcSpawner', RageUI.CreateSubMenu(RMenu:Get('administration', 'tools'), "MsTools", "Npc Spawner"))
RMenu.Add('administration', 'MarkerSpawner', RageUI.CreateSubMenu(RMenu:Get('administration', 'tools'), "MsTools", "Marker Spawner"))
RMenu.Add('administration', 'JobsBuilder', RageUI.CreateSubMenu(RMenu:Get('administration', 'tools'), "MsTools", "Jobs Builder"))
RMenu.Add('administration', 'permissions', RageUI.CreateSubMenu(RMenu:Get('administration', 'JobsBuilder'), "MsTools", "Jobs Builder"))
RMenu.Add('administration', 'BlipsBuilder', RageUI.CreateSubMenu(RMenu:Get('administration', 'tools'), "MsTools", "Blips Builder"))
RMenu.Add('administration', 'test', RageUI.CreateSubMenu(RMenu:Get('administration', 'tools'), "MsTools", "test"))
RMenu.Add('administration', 'MarkerSpawner:Colors', RageUI.CreateSubMenu(RMenu:Get('administration', 'MarkerSpawner'), "MsTools", "Colors (RGBA)"))
function RageUI.PoolMenus:Administration()
    RageUI.IsVisible(RMenu:Get('administration', 'main'), function()
        RageUI.Button('Tools', nil, {}, Character.StaffRank >= 6, {}, RMenu:Get('administration', 'tools'))
    end)
     RageUI.IsVisible(RMenu:Get('administration', 'tools'), function()
        RageUI.Button('Npc Spawner', nil, {}, true, {}, RMenu:Get('administration', 'NpcSpawner'))
        RageUI.Button('Marker Spawner', nil, {}, true, {}, RMenu:Get('administration', 'MarkerSpawner'))
        RageUI.Button('Jobs Builder', nil, {}, true, {}, RMenu:Get('administration', 'JobsBuilder'))
        RageUI.Button('Blips Builder', nil, {}, true, {}, RMenu:Get('administration', 'BlipsBuilder'))
    end)
    RageUI.IsVisible(RMenu:Get('administration', 'NpcSpawner'), function()
        RageUI.Button('ModelName :', nil, { RightLabel = AdminTool.npcspawner.modelname }, true, {
            onSelected = function(Index, Items)
                AdminTool.npcspawner.modelname = KeyboardInput("ModelName à choisir", "a_m_m_fatlatin_01", 30, false)
            end,
        })
        RageUI.Button('Dict', nil, { RightLabel = AdminTool.npcspawner.Anim.dict }, true, {
            onSelected = function(Index, Items)
                AdminTool.npcspawner.Anim.dict = KeyboardInput("Dictionnaire à choisir", "", 30, false)
            end,
        })
        RageUI.Button('Name', nil, { RightLabel = AdminTool.npcspawner.Anim.name }, true, {
            onSelected = function(Index, Items)
                AdminTool.npcspawner.Anim.name = KeyboardInput("Name de l'animation", "", 30, false)
            end,
        })
        RageUI.Button('Spawn Npc', nil, {}, true, {
            onSelected = function(Index, Items)
                local playerPed = PlayerPedId()
                local content = {
                    Model = AdminTool.npcspawner.modelname,
                    Coords = GetEntityCoords(playerPed),
                    Heading = GetEntityHeading(playerPed),
                    Anim = AdminTool.npcspawner.Anim
                }
                TriggerServerEvent('Ms:CreateNpc', content)
            end,
        })
    end)
    RageUI.IsVisible(RMenu:Get('administration', 'BlipsBuilder'), function()
        RageUI.Button('Name :', nil, { RightLabel = AdminTool.blipsBuilder.data.Name }, true, {
            onSelected = function(Index, Items)
                AdminTool.blipsBuilder.data.Name = KeyboardInput("Entrez le nom du Blips", AdminTool.blipsBuilder.data.Name, 40, false)
            end,
        })
        RageUI.Button('Color :', nil, { RightLabel = AdminTool.blipsBuilder.data.Color }, true, {
            onSelected = function(Index, Items)
                AdminTool.blipsBuilder.data.Color = KeyboardInput("Entrez la couleur du blips", AdminTool.blipsBuilder.data.Color, 3, true)
            end,
        })
        RageUI.Button('Scale :', nil, { RightLabel = AdminTool.blipsBuilder.data.Scale }, true, {
            onSelected = function(Index, Items)
                AdminTool.blipsBuilder.data.Scale = KeyboardInput("Entrez le Scale du Blips", AdminTool.blipsBuilder.data.Scale, 4, true)
            end,
        })
        RageUI.Button('Alpha :', nil, { RightLabel = AdminTool.blipsBuilder.data.Alpha }, true, {
            onSelected = function(Index, Items)
                AdminTool.blipsBuilder.data.Alpha = KeyboardInput("Entrez l'Alpha du Blips", AdminTool.blipsBuilder.data.Alpha, 3, true)
            end,
        })
        RageUI.Button('SpriteId :', nil, { RightLabel = AdminTool.blipsBuilder.data.SpriteId }, true, {
            onSelected = function(Index, Items)
                AdminTool.blipsBuilder.data.SpriteId = KeyboardInput("Entrez le SpriteId du Blips", AdminTool.blipsBuilder.data.SpriteId, 4, true)
            end,
        })
        RageUI.Checkbox('Preview', nil, AdminTool.blipsBuilder.preview[2], {}, {
            onHovered = function()
            end,
            onChecked = function()
                local blip = AddBlipForCoord(GetEntityCoords(PlayerPedId()))
                SetBlipSprite(blip, AdminTool.blipsBuilder.data.SpriteId)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, AdminTool.blipsBuilder.data.Scale)
                SetBlipColour(blip, AdminTool.blipsBuilder.data.Color)
                SetBlipAsShortRange(blip, true)
                SetBlipAlpha(blip, AdminTool.blipsBuilder.data.Alpha)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(AdminTool.blipsBuilder.data.Name)
                EndTextCommandSetBlipName(blip)
                AdminTool.blipsBuilder.preview[3] = blip
                AdminTool.blipsBuilder.preview[2] = true
            end,
            onUnChecked = function()
                RemoveBlip(AdminTool.blipsBuilder.preview[3])
                AdminTool.blipsBuilder.preview[2] = false
            end,
            onSelected = function(Index, Items)
            end,
        })
        RageUI.Button('~g~Spawn Blips', nil, {  }, true, {
            onSelected = function(Index, Items)
                local data = {
                    Name = AdminTool.blipsBuilder.data.Name,
                    Coords = GetEntityCoords(PlayerPedId()),
                    Color = AdminTool.blipsBuilder.data.Color,
                    Scale = AdminTool.blipsBuilder.data.Scale,
                    SpriteId = AdminTool.blipsBuilder.data.SpriteId,
                    Alpha = AdminTool.blipsBuilder.data.Alpha,
                }
                TriggerServerEvent('Ms:SpawnBlips', data)
            end,
        })
    end)
    RageUI.IsVisible(RMenu:Get('administration', 'MarkerSpawner'), function()
        RageUI.Button('Description :', nil, { RightLabel = AdminTool.markerspawner.data.Description }, true, {
            onSelected = function(Index, Items)
                AdminTool.markerspawner.data.Description = KeyboardInput("Entrez la description du marqueur", AdminTool.markerspawner.data.Description, 40, false)
            end,
        })
        RageUI.Button('TouchId :', nil, { RightLabel = AdminTool.markerspawner.data.TouchId }, true, {
            onSelected = function(Index, Items)
                AdminTool.markerspawner.data.TouchId = KeyboardInput("Entrez le TouchId du marqueur", AdminTool.markerspawner.data.TouchId, 10, false)
            end,
        })
        RageUI.Button('Distances :', nil, { RightLabel = AdminTool.markerspawner.data.Distances }, true, {
            onSelected = function(Index, Items)
                local dist = KeyboardInput("Entrez la distance du marqueur", AdminTool.markerspawner.data.Distances, 10, true)
                if dist ~= nil then AdminTool.markerspawner.data.Distances = dist end
            end,
        })
        RageUI.Button('Type : ', nil, { RightLabel = AdminTool.markerspawner.data.Type }, true, {
            onSelected = function(Index, Items)
                AdminTool.markerspawner.data.Type = KeyboardInput('Entrez le type', AdminTool.markerspawner.data.Type, 10, true)
            end,
        })
        RageUI.Button('Taille : ', nil, { RightLabel = AdminTool.markerspawner.data.Size }, true, {
            onSelected = function(Index, Items)
                local dist = KeyboardInput('Entrez la taille', AdminTool.markerspawner.data.Size, 10, true)
                if dist ~= nil then AdminTool.markerspawner.data.Size = dist end
            end,
        })
        RageUI.List('Usage :', MarkersUsage[1], AdminTool.markerspawner.usageIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                AdminTool.markerspawner.usageIndex = Index
                AdminTool.markerspawner.data.Usage = MarkersUsage[1][Index]
            end,
        })
        RageUI.Button('Couleurs', nil, {}, true, {}, RMenu:Get('administration', 'MarkerSpawner:Colors'))
        RageUI.List("Rotate", { "true", "false" }, AdminTool.markerspawner.data.RotateIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                AdminTool.markerspawner.data.RotateIndex = Index
                if (Index == 1) then
                    AdminTool.markerspawner.data.Rotate = true
                else
                    AdminTool.markerspawner.data.Rotate = false
                end
            end,
            onSelected = function(Index, Items)
            end,
        })
        RageUI.Checkbox('Preview', nil, AdminTool.markerspawner.preview[2], {}, {
            onHovered = function()
            end,
            onChecked = function()
                local playerPed = PlayerPedId()
                local content = {
                    Coords = GetEntityCoords(playerPed),
                    Type = AdminTool.markerspawner.data.Type,
                    Colors = AdminTool.markerspawner.data.Colors,
                    Size = AdminTool.markerspawner.data.Size + .0,
                    Usage = AdminTool.markerspawner.data.Usage,
                    Rotate = AdminTool.markerspawner.data.Rotate,
                    Description = AdminTool.markerspawner.data.Description,
                    TouchId = AdminTool.markerspawner.data.TouchId,
                    Distances = AdminTool.markerspawner.data.Distances,
                }
                local length = Utils:CreateMarker(nil, content)
                AdminTool.markerspawner.preview[1] = length
                AdminTool.markerspawner.preview[2] = true
            end,
            onUnChecked = function()
                Utils:CreateMarker(AdminTool.markerspawner.preview[1], nil)
                AdminTool.markerspawner.preview[2] = false
            end,
            onSelected = function(Index, Items)
            end,
        })
        RageUI.Button('Spawn Marker', nil, {}, true, {
            onSelected = function(Index, Items)
                local playerPed = PlayerPedId()
                local content = {
                    Coords = GetEntityCoords(playerPed),
                    Type = AdminTool.markerspawner.data.Type,
                    Colors = AdminTool.markerspawner.data.Colors,
                    Size = AdminTool.markerspawner.data.Size,
                    Usage = AdminTool.markerspawner.data.Usage,
                    Rotate = AdminTool.markerspawner.data.Rotate,
                    Description = AdminTool.markerspawner.data.Description,
                    TouchId = AdminTool.markerspawner.data.TouchId,
                    Distances = AdminTool.markerspawner.data.Distances,
                }
                Utils:CreateMarker(nil, content)
                TriggerServerEvent('Ms:CreateMarker', content)
            end,
        })
    end)
   RageUI.IsVisible(RMenu:Get('administration', 'MarkerSpawner:Colors'), function()
        for i = 1, #AdminTool.markerspawner.data.Colors do
            RageUI.Button('Color : ', nil, { RightLabel = string.format("%s ", AdminTool.markerspawner.data.Colors[i]) }, true, {
                onSelected = function(Index, Items)
                    AdminTool.markerspawner.data.Colors[i] = KeyboardInput("Entrez la couleur (RGBA)", AdminTool.markerspawner.data.Colors[i], 3, true)
                end,
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('administration', 'JobsBuilder'), function()
        RageUI.Button('Nom :', nil, { RightLabel = AdminTool.jobsbuilder.name }, true, {
            onSelected = function(Index, Items)
                AdminTool.jobsbuilder.name = KeyboardInput("Entrez le nom", AdminTool.jobsbuilder.name, 30, false)
            end,
        })
        RageUI.Button('Nom du boss :', nil, { RightLabel = AdminTool.jobsbuilder.bossname }, true, {
            onSelected = function(Index, Items)
                AdminTool.jobsbuilder.bossname = KeyboardInput("Entrez le nom", AdminTool.jobsbuilder.bossname, 30, false)
            end,
        })
        RageUI.Button('Permissions', nil, {}, true, {}, RMenu:Get('administration', 'permissions'))
        RageUI.Checkbox("Légal", nil, isLegal or false, {}, {
            onChecked = function()
                isLegal = true
            end,
            onUnChecked = function()
                isLegal = false
            end,
        })
        RageUI.Button('Build', nil, {}, true, {
            onSelected = function(Index, Items)
                if AdminTool.jobsbuilder.name ~= "" and AdminTool.jobsbuilder.bossname ~= "" then
                    local data = {
                        name = AdminTool.jobsbuilder.name,
                        bossname = AdminTool.jobsbuilder.bossname,
                        permissions = PERMISSIONS,
                        isLegal = isLegal or false,
                    }
                    TriggerServerEvent('Ms:BuildJob', data)
                    for k, v in pairs(PERMISSIONS) do
                        v.Checked = false
                    end
                    AdminTool.jobsbuilder.name = "Nom du job (Par défaut)"
                    AdminTool.jobsbuilder.bossname = "Patron"
                end
            end,
        })
    end)
    RageUI.IsVisible(RMenu:Get('administration', 'permissions'), function()
        for k, v in pairs(PERMISSIONS) do
            RageUI.Checkbox(v.Name, nil, v.Checked, {}, {
                onChecked = function()
                    v.Checked = true
                end,
                onUnChecked = function()
                    v.Checked = false
                end,
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('administration', 'test'), function()
        for k, v in pairs(test) do
            RageUI.Button(k, nil, { }, true, {
                onSelected = function(Index, Items)
                    SetEntityCoords(PlayerPedId(), v.pos)
                end,
            })
        end
    end)
end
local Animations = {
    moodIndex = 1,
    gaitIndex = 1,
    mood = {
        "mood_normal_1",
        "mood_angry_1",
        "mood_drunk_1",
        "pose_injured_1",
        "electrocuted_1",
        "effort_1",
        "mood_drivefast_1",
        "pose_angry_1",
        "mood_happy_1",
        "mood_injured_1",
        "mood_dancing_low_1",
        "smoking_hold_1",
        "pose_normal_1",
        "pose_aiming_1",
        "shocked_1",
        "shocked_2",
        "mood_sleeping_1",
        "dead_1",
        "dead_2",
        "mood_smug_1",
        "mood_aiming_1",
        "mood_stressed_1",
        "mood_sulk_1",
        "effort_2",
        "effort_3",
    },
    gait = {
        "move_m@business@c",
        "move_m@alien",
        "anim_group_move_ballistic",
        "move_f@arrogant@a",
        "move_m@brave",
        "move_m@casual@a",
        "move_m@casual@b",
        "move_m@casual@c",
        "move_m@casual@d",
        "move_m@casual@e",
        "move_m@casual@f",
        "move_f@chichi",
        "move_m@confident",
        "move_m@business@a",
        "move_m@business@b",
        "move_m@drunk@a",
        "move_m@drunk@slightlydrunk",
        "move_m@buzzed",
        "move_m@drunk@verydrunk",
        "move_f@femme@",
        "move_characters@franklin@fire",
        "move_characters@michael@fire",
        "move_m@fire",
        "move_f@flee@a",
        "move_p_m_one",
        "move_m@gangster@generic",
        "move_m@gangster@ng",
        "move_m@gangster@var_e",
        "move_m@gangster@var_f",
        "move_m@gangster@var_i",
        "anim@move_m@grooving@",
        "move_f@heels@c",
        "move_f@heels@d",
        "move_m@hipster@a",
        "move_m@hobo@a",
        "move_f@hurry@a",
        "move_p_m_zero_janitor",
        "move_p_m_zero_slow",
        "move_m@jog@",
        "anim_group_move_lemar_alley",
        "move_heist_lester",
        "move_lester_caneup",
        "move_f@maneater",
        "move_ped_bucket",
        "move_m@money",
        "move_m@posh@",
        "move_f@posh@",
        "move_m@quick",
        "female_fast_runner",
        "move_m@sad@a",
        "move_m@sassy",
        "move_f@sassy",
        "move_f@scared",
        "move_f@sexy@a",
        "move_m@shadyped@a",
        "move_characters@jimmy@slow@",
        "move_m@swagger",
        "move_m@tough_guy@",
        "move_f@tough_guy@",
        "clipset@move@trash_fast_turn",
        "missfbi4prepp1_garbageman",
        "move_p_m_two",
        "move_m@bag"
    },
    Types = { index = 1 },
    Danse = {
        { name = "Danser", anim = { "misschinese2_crystalmazemcs1_cs", "dance_loop_tao" } },
        { name = "Danser stylé", anim = { "missfbi3_sniping", "dance_m_default" } },
        { name = "Danse banale", anim = { "rcmnigel1bnmt_1b", "dance_loop_tyler" } },
        { name = "Danse spéciale 01", anim = { "timetable@tracy@ig_5@idle_a", "idle_a" } },
        { name = "Danse spéciale 02", anim = { "timetable@tracy@ig_5@idle_a", "idle_b" } },
        { name = "Danse spéciale 03", anim = { "timetable@tracy@ig_5@idle_b", "idle_e" } },
        { name = "Danse spéciale 04", anim = { "timetable@tracy@ig_5@idle_b", "idle_d" } },
        { name = "Danse de pecno ", anim = { "special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag" } },
        { name = "Danse basique", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_06_base_laz" } },
        { name = "Danse turnaround", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_turnaround_laz" } },
        { name = "Danse crotchgrab", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_13_crotchgrab_laz" } },
        { name = "Danse flying", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_13_flyingv_laz" } },
        { name = "Danse robot", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_15_robot_laz" } },
        { name = "Danse shimmy", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_15_shimmy_laz" } },
        { name = "Danse crazyrobot", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_15_crazyrobot_laz" }, },
        { name = "Danse smack", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_17_smackthat_laz" } },
        { name = "Danse spider", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_17_spiderman_laz" } },
        { name = "Danse hipswivel", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_13_hipswivel_laz" } },
        { name = "Danse Grind", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_li_15_sexygrind_laz" } },
        { name = "Danse point", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_11_pointthrust_laz" } },
        { name = "Danse miturn", anim = { "anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_13_turnaround_laz" } },
        { name = "Danse du ventre", anim = { "mini@strip_club@private_dance@idle", "priv_dance_idle" } },
        { name = "Dance Salsa Roll", anim = { "anim@mp_player_intcelebrationmale@salsa_roll", "salsa_roll" } },
        { name = "Danse de soirée 1", anim = { "anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v1_male^4" } },
        { name = "Danse de soirée 2", anim = { "anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^1" } },
        { name = "Danse de soirée 3", anim = { "anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_female^2" } },
        { name = "Danse de soirée 4", anim = { "anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_09_v2_male^2" } },
        { name = "Danse de soirée 5", anim = { "anim@amb@nightclub@dancers@crowddance_facedj@", "hi_dance_facedj_11_v2_male^2" } },
        { name = "Danse de soirée 6", anim = { "anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^1" } },
        { name = "Danse de soirée 7", anim = { "anim@amb@nightclub@dancers@crowddance_groups@", "hi_dance_crowd_09_v1_female^3" } },
        { name = "Danse de soirée 8", anim = { "anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_a_blamadon" } },
        { name = "Danse de soirée 9", anim = { "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center" } },
        { name = "Danse de soirée 10", anim = { "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center" } },
        { name = "Danse de soirée 11", anim = { "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up" } },
        { name = "Dance Disco", anim = { "anim@mp_player_intcelebrationmale@uncle_disco", "uncle_disco" } }
    },
    Expressions = {
        { name = "Loose Thumbs 1", anim = { "anim@arena@celeb@flat@solo@no_props@", "thumbs_down_a_player_a" } },
        { name = "Mort de rire", anim = { "anim@arena@celeb@flat@solo@no_props@", "taunt_d_player_b" } },
        { name = "Badmood 1", anim = { "amb@world_human_stupor@male@base", "base" } },
        { name = "Badmood 2", anim = { "amb@world_human_stupor@male_looking_left@base", "base" } },
        { name = "Bisou", anim = { "mp_ped_interaction", "kisses_guy_a" } },
        { name = "Stressé", anim = { "rcmme_tracey1", "nervous_loop" } },
        { name = "Peace", anim = { "anim@mp_player_intcelebrationmale@peace", "peace" } },
        { name = "Clown teubé", anim = { "move_clown@p_m_two_idles@", "fidget_short_dance" } },
        { name = "Face Palm", anim = { "anim@mp_player_intcelebrationmale@face_palm", "face_palm" } },
        { name = "Patience", anim = { "special_ped@impotent_rage@base", "base" } },
        { name = "Respect", anim = { "mp_player_int_upperbro_love", "mp_player_int_bro_love_fp" } },
        { name = "Inspecter ses lunettes", anim = { "clothingspecs", "try_glasses_positive_a" } },
        { name = "Réflexion", anim = { "misscarsteal4@aliens", "rehearsal_base_idle_director" } },
        { name = "Check mon flow", anim = { "clothingshirt", "try_shirt_positive_d" } },
        { name = "VICTOIRE", anim = { "mini@tennisexit@", "tennis_outro_win_01_female" } },
        { name = "Le plus fort", anim = { "rcmbarry", "base" } },
        { name = "Ta géré!", anim = { "anim@mp_player_intcelebrationmale@thumbs_up", "thumbs_up" } },
        { name = "Mal de tête", anim = { "misscarsteal4@actor", "stumble" } },
        { name = "Bro love", anim = { "anim@mp_player_intcelebrationmale@bro_love", "bro_love" } },
        { name = "Craquer les poignets", anim = { "anim@mp_player_intcelebrationmale@knuckle_crunch", "knuckle_crunch" } },
        { name = "Salut militaire", anim = { "anim@mp_player_intuppersalute", "idle_a" } },
        { name = "Signe GSF", anim = { "amb@code_human_in_car_mp_actions@gang_sign_b@low@ps@base", "idle_a" } },
        { name = "Signe Vagos", anim = { "amb@code_human_in_car_mp_actions@v_sign@std@rds@base", "idle_a" } },
        { name = "Signe Ballas", anim = { "mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b" } },
        { name = "Signe Locura", anim = { "mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a" } },
        { name = "Check moi ça !", anim = { "mp_ped_interaction", "handshake_guy_a" } },
        { name = "Check moi ça 2", anim = { "mp_ped_interaction", "hugs_guy_a" } },
        { name = "A vos marque ! Partez !", anim = { "random@street_race", "grid_girl_race_start" } },
        { name = "Il a gagné !", anim = { "random@street_race", "_streetracer_accepted" } },
        { name = "Ceinturons", anim = { "amb@code_human_wander_idles_cop@male@static", "static" } },
        { name = "On arrête tous !", anim = { "anim@heists@ornate_bank@chat_manager", "fail" } }
    },
    Poses = {
        { name = "Faire du stop", anim = { "random@hitch_lift", "idle_f" }},
        {
            name = "Se rendre, à genoux",
            anims = {
                enter = {
                    { anim = { "random@arrests@busted", "enter" }, flag = 0 },
                    { anim = { "random@arrests@busted", "idle_a" }, flag = 1 }
                },
                exit = { { anim = { "random@arrests@busted", "exit" }, flag = 0 } }
            }
        },
        { name = "Dormir sur place", anim = { "mp_sleep", "sleep_loop" }, flag = 49 },
        { name = "PLS", anim = { "timetable@tracy@sleep@", "idle_c" } },
        { name = "Roule au sol", anim = { "missfinale_a_ig_2", "trevor_death_reaction_pt" } },
        { name = "Blessé au sol", anim = { "combat@damage@rb_writhe", "rb_writhe_loop" } },
        { name = "Désespéré", anim = { "rcmnigel1c", "idle_d" } },
        { name = "Essouffler", anim = { "re@construction", "out_of_breath" } },
        { name = "Faire la statue", anim = "WORLD_HUMAN_HUMAN_STATUE" },
        { name = "Montrer ses muscles", anim = "WORLD_HUMAN_MUSCLE_FLEX" },
        { name = "Zombie", anim = { "special_ped@zombie@monologue_1@monologue_1c", "iamundead_2" } },
        { name = "Pose garde", anim = { "amb@world_human_stand_guard@male@base", "base" } },
        { name = "Bras croisé lourd", anim = { "anim@heists@heist_corona@single_team", "single_team_loop_boss" } },
        { name = "Faire le maik", anim = { "anim@heists@heist_corona@single_team", "single_team_intro_two" } },
        { name = "Bras croisé", anim = { "random@street_race", "_car_b_lookout" } },
        { name = "Holster", anim = { "reaction@intimidation@cop@unarmed", "intro" } },
        { name = "Patauge", anim = { "move_m@wading", "walk" } }
    },
    Actions = {
        { name = "Slide", anim = { "anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a" } },
        { name = "Reverence ", anim = { "anim@arena@celeb@podium@no_prop@", "regal_c_1st" } },
        { name = "Pleure a genoux", anim = { "mp_bank_heist_1", "f_cower_01" } },
        { name = "Sortir son carnet", anim = "CODE_HUMAN_MEDIC_TIME_OF_DEATH" },
        { name = "Noter des informations", anim = "WORLD_HUMAN_CLIPBOARD" },
        { name = "Siffler", anim = { "rcmnigel1c", "hailing_whistle_waive_a" } },
        { name = "Faire des pompes", anim = "WORLD_HUMAN_PUSH_UPS" },
        { name = "Je me sens pas bien", anim = { "missfam5_blackout", "pass_out" } },
        { name = "Locoooo", anim = { "anim@mp_player_intcelebrationmale@you_loco", "you_loco" } },
        { name = "Wank", anim = { "anim@mp_player_intcelebrationmale@wank", "wank" } },
        { name = "Laché moi", anim = { "anim@mp_player_intcelebrationmale@freakout", "freakout" } },
        { name = "Mendier", anim = "WORLD_HUMAN_BUM_FREEWAY" },
        { name = "Applaudir", anim = "WORLD_HUMAN_CHEERING" },
        { name = "Slow Clap", anim = { "anim@mp_player_intcelebrationmale@slow_clap", "slow_clap" } },
        { name = "Appel téléphonique", anim = { "cellphone@", "cellphone_call_listen_base" } },
        { name = "Encouragement", anim = { "mini@triathlon", "male_one_handed_a" } },
        { name = "Prendre une photo", anim = "WORLD_HUMAN_MOBILE_FILM_SHOCKING" },
        { name = "Bras tendu", anim = { "nm@hands", "flail" } },
        { name = "Yoga", anim = { "amb@world_human_yoga@male@base", "base_a" } },
        { name = "Mîme", anim = { "special_ped@mime@monologue_5@monologue_5a", "10_ig_1_wa_0" } },
        { name = "Faire des abdos", anim = "WORLD_HUMAN_SIT_UPS" },
        { name = "Sortir votre carte", anim = "WORLD_HUMAN_TOURIST_MAP" },
        { name = "Acrobatie 1", anim = { "anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a" } },
        { name = "Acrobatie 2", anim = { "anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a" } },
        { name = "Acrobatie 3", anim = { "anim@arena@celeb@flat@solo@no_props@", "pageant_a_player_a" } },
        { name = "Radio", anim = { "random@arrests", "generic_radio_chatter" } },
        { name = "Fumer un joint", anim = { "amb@world_human_smoking@male@male_a@enter", "enter" } },
    },
    Festive = {
        { name = "Suspens", anim = { "anim@amb@nightclub@dancers@black_madonna_entourage@", "li_dance_facedj_11_v1_male^1" } },
        { name = "Coincé", anim = { "anim@amb@nightclub@dancers@black_madonna_entourage@", "li_dance_facedj_15_v2_male^2" } },
        { name = "Enchainé", anim = { "anim@amb@nightclub@dancers@black_madonna_entourage@", "hi_dance_facedj_09_v2_male^5" } },
        { name = "Hey man", anim = { "anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_09_v1_male^1" } },
        { name = "Move 01", anim = { "anim@mp_player_intupperuncle_disco", "idle_a" }},
        { name = "Move 02", anim = { "anim@mp_player_intuppersalsa_roll", "idle_a" }},
        { name = "Move 03", anim = { "anim@mp_player_intupperraise_the_roof", "idle_a" } },
        { name = "Move 04", anim = { "anim@mp_player_intupperoh_snap", "idle_a" }},
        { name = "Move 05", anim = { "anim@mp_player_intupperheart_pumping", "idle_a" } },
        { name = "Move 06", anim = { "anim@mp_player_intupperfind_the_fish", "idle_a" }},
        { name = "Move 07", anim = { "anim@mp_player_intuppercats_cradle", "idle_a" }},
        { name = "Move 08", anim = { "anim@mp_player_intupperbanging_tunes", "idle_a" }},
        { name = "Move 09", anim = { "anim@mp_player_intupperbanging_tunes_right", "idle_a" } },
        { name = "Move 10", anim = { "anim@mp_player_intupperbanging_tunes_left", "idle_a" } },
        { name = "DJ", anim = { "anim@mp_player_intcelebrationmale@dj", "dj" } },
        { name = "Fausse guitare", anim = { "anim@mp_player_intcelebrationmale@air_guitar", "air_guitar" } },
        { name = "Mains Jazz", anim = { "anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands" } },
        { name = "Rock'n roll", anim = { "anim@mp_player_intcelebrationmale@rock", "rock" } }
    },
    Insolent = {
        { name = "MDR", anim = { "anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_a" } },
        { name = "Se curer le nez", anim = { "anim@mp_player_intcelebrationmale@nose_pick", "nose_pick" } },
        { name = "Bouffe mon doigt", anim = { "anim@mp_player_intcelebrationmale@finger", "finger" } },
        { name = "Prend mon fuck", anim = { "random@shop_gunstore", "_negative_goodbye" } },
        { name = "Nananère", anim = { "anim@mp_player_intcelebrationmale@thumb_on_ears", "thumb_on_ears" } },
        { name = "DTC", anim = { "anim@mp_player_intcelebrationmale@dock", "dock" } },
        { name = "Chuuuuute", anim = { "anim@mp_player_intcelebrationmale@shush", "shush" } },
        { name = "Poule Mouillé", anim = { "anim@mp_player_intcelebrationmale@chicken_taunt", "chicken_taunt" } },
        {
            name = "Doigt solo",
            anims = {
                enter = {
                    { anim = { "anim@mp_player_intselfiethe_bird", "enter" } },
                    { anim = { "anim@mp_player_intselfiethe_bird", "idle_a" } }
                },
                exit = {
                    { anim = { "anim@mp_player_intselfiethe_bird", "idle_a" } },
                    { anim = { "anim@mp_player_intselfiethe_bird", "exit" } }
                }
            }
        },
        { name = "Doigt d'honneur", anim = { "mp_player_int_upperfinger", "mp_player_int_finger_01" } },
        { name = "Uriner", anim = { "misscarsteal2peeing", "peeing_intro" } },
        { name = "Se gratter le cul", anim = { "mp_player_int_upperarse_pick", "mp_player_int_arse_pick" } },
        {
            name = "Se gratter les couilles",
            anim = { "mp_player_int_uppergrab_crotch", "mp_player_int_grab_crotch" }
        },
        { name = "Pluie de fric", anim = { "anim@arena@celeb@flat@solo@props@", "make_it_rain_b_player_b" } },
        { name = "Pluie de fric 2", anim = { "anim@mp_player_intcelebrationmale@raining_cash", "raining_cash" } }
    },
    Sex = {
        { name = "Fellation", anim = { "misscarsteal2pimpsex", "pimpsex_hooker" } },
        { name = "Se faire sucer 01", anim = { "misscarsteal2pimpsex", "pimpsex_pimp" } },
        { name = "Se faire sucer 02", anim = { "misscarsteal2pimpsex", "pimpsex_punter" } },
        { name = "Danse sexy", anim = { "mp_safehouse", "lap_dance_girl" } },
        { name = "Danse Twerk", anim = { "mini@strip_club@private_dance@part3", "priv_dance_p3" } },
        { name = "Montrer sa poitrine", anim = { "mini@strip_club@backroom@", "stripper_b_backroom_idle_b" } },
        { name = "Montrer ses fesses", anim = { "switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper" } },
        { name = "Se faire su*** en voiture", anim = { "oddjobs@towing", "m_blow_job_loop" } },
        { name = "Faire une gaterie en voiture", anim = { "oddjobs@towing", "f_blow_job_loop" } },
        { name = "***** en voiture", anim = { "mini@prostitutes@sexlow_veh", "low_car_sex_loop_player" } },
        { name = "Se ***** en voiture", anim = { "mini@prostitutes@sexlow_veh", "low_car_sex_loop_female" } },
        { name = "Mon coeur", anim = { "mini@hookers_spvanilla", "idle_a" } }
    },
    Weapon = {
        { name = "Animation execution", anim = { "oddjobs@suicide", "bystander_pointinto" }},
        { name = "Animation suicide", anim = { "mp_suicide", "pistol" }},
        { name = "Check arme", anim = { "mp_corona@single_team", "single_team_intro_one" } },
        { name = "Arme pointé", anim = { "random@arrests", "cop_gunaimed_door_open_idle" } },
        { name = "Melée 1", anim = { "anim@deathmatch_intros@melee@2h", "intro_male_melee_2h_b" } },
        { name = "Melée 2", anim = { "anim@deathmatch_intros@melee@1h", "intro_male_melee_1h_b" } },
        { name = "Melée 3", anim = { "anim@deathmatch_intros@melee@1h", "intro_male_melee_1h_c" } },
        { name = "Melée 4", anim = { "mp_deathmatch_intros@melee@2h", "intro_male_melee_2h_d" } },
        { name = "Melée 5", anim = { "mp_deathmatch_intros@melee@2h", "intro_male_melee_2h_a_gclub" } },
        { name = "Melée 6", anim = { "mp_deathmatch_intros@melee@1h", "intro_male_melee_1h_b" } },
        { name = "Fight 1", anim = { "anim@deathmatch_intros@unarmed", "intro_male_unarmed_e" } },
        { name = "Fight 2", anim = { "anim@deathmatch_intros@unarmed", "intro_male_unarmed_d" } },
        { name = "Fight 3", anim = { "anim@deathmatch_intros@unarmed", "intro_male_unarmed_b" } } }
}
RMenu.Add('animation', 'main', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('animation', 'main'):SetSubtitle("Animations")
function RageUI.PoolMenus:Animation()
    RageUI.IsVisible(RMenu:Get('animation', 'main'), function()
        RageUI.List("Humeur", { "Normal", "Fâché", "Ivre", "Stupide", "Électrocuté", "Grincheux", "Grincheux 2", "Grincheux 3", "Heureux", "Blessé", "Joyeux", "Excité", "Ne cligne jamais", "Un oeil", "Sous le choc", "Sous le choc 2", "Epuisé", "Epuisé 2", "Epuisé 3", "Suffisant", "Spéculatif", "Stressé", "Bouder", "Bizarre", "Bizarre 2" }, Animations.moodIndex or 1, nil, {}, true, {
            onListChange = function(Index, Items)
                Animations.moodIndex = Index
                SetFacialIdleAnimOverride(PlayerPedId(), Animations.mood[Animations.moodIndex])
            end,
        })
        RageUI.List("Démarche", { "Normal", "Alien", "Balloner", "Arrogant", "Décontracté", "Décontracté 2", "Décontracté 3", "Décontracté 4", "Décontracté 5", "Décontracté 6", "Chichi", "Sur de soi", "Flic", "Flic 2", "Flic 3", "Ivre ", "Ivre 2", "Ivre 3", "Ivre 4", "Femme", "En feu", "En feu 2", "En feu 3", "Efféminé", "Franklin", "Gangster", "Gangster 2", "Gangster 3", "Gangster 4", "Gangster 5", "Grooving", "Talons", "Talons 2", "Hipster", "Clochard", "Se dépêcher", "Concierge", "Concierge 2", "Jogging", "Lemar", "Lester", "Lester 2", "Maneater", "Michael", "Argent", "Chic", "chic 2", "Rapide", "Coureur", "Triste", "Impertinent", "Impertinent 2", "Effrayé", "Sexy", "Ombragé", "Lent", "Swagger", "Dure", "Dure 2", "Poubelle", "Poubelle 2", "Trevor", "Wide" }, Animations.gaitIndex or 1, nil, {}, true, {
            onListChange = function(Index, Items)
                Animations.gaitIndex = Index
                RequestAnimSet(Animations.gait[Animations.gaitIndex])
                while not HasAnimSetLoaded(Animations.gait[Animations.gaitIndex]) do
                    Citizen.Wait(1)
                end
                if Animations.gaitIndex == 1 then
                    ResetPedMovementClipset(PlayerPedId())
                else
                    SetPedMovementClipset(PlayerPedId(), Animations.gait[Animations.gaitIndex], 0.2)
                end
            end,
        })
        RageUI.Checkbox('Dormir/Se réveiller', nil, Ragdoll , {}, {
            onChecked = function()
               Ragdoll = true
            end,
            onUnChecked = function()
                Ragdoll = false
            end,
        })
        RageUI.List("Types", { "Aucune", "Actions", "Danses", "Poses", "Expressions", "Festives", "Insolentes", "🔞", "Armes" }, Animations.Types.index or 1, nil, {}, true, {
            onListChange = function(Index, Items)
                Animations.Types.index = Index
            end,
        })
        if Animations.Types.index == 2 then
            for _, v in pairs(Animations.Actions) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        local ped = PlayerPedId()
                        if not IsPedInAnyVehicle(ped, false) then
                            if v.anim[2] ~= nil then
                                if IsEntityPlayingAnim(ped, v.anim[1], v.anim[2], 3) then
                                    ClearPedTasksImmediately(ped)
                                else
                                    Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, 0, -1)
                                end
                            else
                                if IsPedUsingAnyScenario(ped) then
                                    ClearPedTasksImmediately(ped)
                                else
                                    TaskStartScenarioInPlace(ped, v.anim, -1, 1)
                                end
                            end
                        end
                    end,
                })
            end
        elseif Animations.Types.index == 3 then
            for _, v in pairs(Animations.Danse) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        local ped = PlayerPedId()
                        if not IsPedInAnyVehicle(ped, false) then
                            if IsEntityPlayingAnim(PlayerPedId(), v.anim[1], v.anim[2], 3) then
                                ClearPedTasksImmediately(PlayerPedId())
                            else
                                Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, 1, -1)
                            end
                        end
                    end,
                })
            end
        elseif Animations.Types.index == 4 then
            for _, v in pairs(Animations.Poses) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        local ped = PlayerPedId()
                        if not IsPedInAnyVehicle(ped, false) then
                            if v.anims ~= nil and v.anims.enter ~= nil then
                                if IsEntityPlayingAnim(PlayerPedId(), v.anims.enter[2].anim[1], v.anims.enter[2].anim[2], 3) then
                                    Utils:PlayAnim(v.anims.exit[1].anim[1], v.anims.exit[1].anim[2], 0, 0, 0, -1)
                                else
                                    Utils:PlayAnim(v.anims.enter[1].anim[1], v.anims.enter[1].anim[2], 0, 0, 0, -1)
                                    Utils:PlayAnim(v.anims.enter[1].anim[1], v.anims.enter[2].anim[2], 0, 1500, 1, -1)
                                end
                            else
                                if v.anim[2] ~= nil then
                                    if IsEntityPlayingAnim(PlayerPedId(), v.anim[1], v.anim[2], 3) then
                                        ClearPedTasksImmediately(PlayerPedId())
                                    else
                                        Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, v.flag or 1, -1)
                                    end
                                else
                                    if IsPedUsingAnyScenario(ped) then
                                        ClearPedTasksImmediately(ped)
                                    else
                                        TaskStartScenarioInPlace(ped, v.anim, -1, 1)
                                    end
                                end
                            end
                        end
                    end,
                })
            end
        elseif Animations.Types.index == 5 then
            for _, v in pairs(Animations.Expressions) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        local ped = PlayerPedId()
                        if not IsPedInAnyVehicle(ped, false) then
                            if IsEntityPlayingAnim(PlayerPedId(), v.anim[1], v.anim[2], 3) then
                                ClearPedTasksImmediately(PlayerPedId())
                            else
                                Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, 0, -1)
                            end
                        end
                    end,
                })
            end
        elseif Animations.Types.index == 6 then
            for _, v in pairs(Animations.Festive) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        local ped = PlayerPedId()
                        if not IsPedInAnyVehicle(ped, false) then
                            if IsEntityPlayingAnim(PlayerPedId(), v.anim[1], v.anim[2], 3) then
                                ClearPedTasksImmediately(PlayerPedId())
                            else
                                Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, 0, -1)
                            end
                        end
                    end,
                })
            end
        elseif Animations.Types.index == 7 then
            for _, v in pairs(Animations.Insolent) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        local ped = PlayerPedId()
                        if not IsPedInAnyVehicle(ped, false) then
                            if v.anims ~= nil and v.anims.enter ~= nil then
                                if IsEntityPlayingAnim(PlayerPedId(), v.anims.enter[2].anim[1], v.anims.enter[2].anim[2], 3) then
                                    Utils:PlayAnim(v.anims.exit[1].anim[1], v.anims.exit[1].anim[2], 0, 0, 0, -1)
                                else
                                    Utils:PlayAnim(v.anims.enter[1].anim[1], v.anims.enter[1].anim[2], 0, 0, 0, -1)
                                    Utils:PlayAnim(v.anims.enter[1].anim[1], v.anims.enter[2].anim[2], 0, 500, 2, -1)
                                end
                            else
                                if v.anim[2] ~= nil then
                                    if IsEntityPlayingAnim(PlayerPedId(), v.anim[1], v.anim[2], 3) then
                                        ClearPedTasksImmediately(PlayerPedId())
                                    else
                                        Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, v.flag or 0, -1)
                                    end
                                else
                                    if IsPedUsingAnyScenario(ped) then
                                        ClearPedTasksImmediately(ped)
                                    else
                                        TaskStartScenarioInPlace(ped, v.anim, -1, 1)
                                    end
                                end
                            end
                        end
                    end,
                })
            end
        elseif Animations.Types.index == 8 then
            for _, v in pairs(Animations.Sex) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        if IsEntityPlayingAnim(PlayerPedId(), v.anim[1], v.anim[2], 3) then
                            ClearPedTasksImmediately(PlayerPedId())
                        else
                            Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, 0, -1)
                        end
                    end,
                })
            end
        elseif Animations.Types.index == 9 then
            for _, v in pairs(Animations.Weapon) do
                RageUI.Button(v.name, nil, {  }, true, {
                    onSelected = function()
                        if IsEntityPlayingAnim(PlayerPedId(), v.anim[1], v.anim[2], 3) then
                            ClearPedTasksImmediately(PlayerPedId())
                        else
                            Utils:PlayAnim(v.anim[1], v.anim[2], 0, 0, 2, -1)
                        end
                    end,
                })
            end
        else
        end
    end)
end
local bankindex = 1
RMenu.Add('bank', 'main', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('bank', 'main'):SetSubtitle("Compte en banque")
function RageUI.PoolMenus:Bank()
    RageUI.IsVisible(RMenu:Get('bank', 'main'), function()
        RageUI.List("Compte en banque", { "Déposer", "Prendre" }, bankindex or 1, nil, {}, true, {
            onListChange = function(Index, Items)
                bankindex = Index
            end,
            onSelected = function(Index, Items)
            end,
        })
        for k, v in pairs(Character.Inventory) do
            if StaticItemType(k) == 0 and v.Quantity > 0 then
                if bankindex == 1 then
                    if BasicItemGUID(k) == 1 then
                        RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                            onSelected = function(Index, Items)
                                local quantity = KeyboardInput('Argent à déposer', '1', 11, true)
                                TriggerServerEvent('Ms:BankTransfert', true, quantity)
                            end,
                        })
                    end
                elseif bankindex == 2 then
                    if BasicItemGUID(k) == 2 then
                        RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                            onSelected = function(Index, Items)
                                local quantity = KeyboardInput('Argent à déposer', '1', 11, true)
                                TriggerServerEvent('Ms:BankTransfert', false, quantity)
                            end,
                        })
                    end
                end
            end
        end
    end)
end
local Names = {
    Top = "Haut",
    Shoes = "Chaussures",
    Pants = "Pantalon",
    Glasses = "Lunettes",
    Ear = "Accessoires d'oreilles",
    Watch = "Montres",
    Bracelets = "Bracelets",
    Hats = "Chapeau",
    Bags = "Sac",
    Accessories = "Accessoires",
    Mask = "Masque"
}
local Price = {
    Top = 15,
    Shoes = 15,
    Pants = 15,
    Glasses = 15,
    Ear = 15,
    Watch = 15,
    Bracelets = 15,
    Hats = 15,
    Bags = 15,
    Accessories = 15,
    Mask = 15
}
IsMask = true
RMenu.Add('clothes_shop', 'main', RageUI.CreateMenu("Magasin", ""))
RMenu:Get('clothes_shop', 'main'):SetSubtitle("Vêtements")
RMenu:Get('clothes_shop', 'main').Closed = function()
    for k, v in pairs(Character.EquippedClothes) do
        Utils:ClothEquip(v, k)
    end
end;
RMenu.Add('clothes_shop', 'top', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Hauts"))
RMenu.Add('clothes_shop', 'shoes', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Chaussures"))
RMenu.Add('clothes_shop', 'pants', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Pantalons"))
RMenu.Add('clothes_shop', 'glasses', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Lunettes"))
RMenu.Add('clothes_shop', 'hat', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Chapeau"))
RMenu.Add('clothes_shop', 'ear', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Accessoires"))
RMenu.Add('clothes_shop', 'watches', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Montres"))
RMenu.Add('clothes_shop', 'bracelet', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Bracelets"))
RMenu.Add('clothes_shop', 'bag', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Accessoires"))
RMenu.Add('clothes_shop', 'mask', RageUI.CreateSubMenu(RMenu:Get('clothes_shop', 'main'), "Magasin", "Vêtements - Accessoires"))
function RageUI.PoolMenus:CLothesShop()
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'main'), function()
        if not IsMask then
        RageUI.Button("Hauts", nil, {}, true, {}, RMenu:Get('clothes_shop', 'top'))
        RageUI.Button("Pantalons", nil, {}, true, {}, RMenu:Get('clothes_shop', "pants"))
        RageUI.Button("Chaussures", nil, {}, true, {}, RMenu:Get('clothes_shop', 'shoes'))
        RageUI.Button("Lunettes", nil, {}, true, {}, RMenu:Get('clothes_shop', 'glasses'))
        RageUI.Button("Chapeaux", nil, {}, true, {}, RMenu:Get('clothes_shop', 'hat'))
        RageUI.Button("Accessoires d'oreilles", nil, {}, true, {}, RMenu:Get('clothes_shop', 'ear'))
        RageUI.Button("Montres", nil, {}, true, {}, RMenu:Get('clothes_shop', 'watches'))
        RageUI.Button("Bracelets", nil, {}, true, {}, RMenu:Get('clothes_shop', 'bracelet'))
        RageUI.Button("Sacs", nil, {}, true, {}, RMenu:Get('clothes_shop', 'bag'))
            else
        RageUI.Button("Masques", nil, {}, true, {}, RMenu:Get('clothes_shop', 'mask'))
        end
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'bag'), function()
        RageUI.List('Sac', Klothes[5].name, Klothes[5].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[5].drawableIndex = Index
                Klothes[5].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 5, Klothes[5].name[Klothes[5].drawableIndex], Klothes[5].meh[Klothes[5].drawableIndex][Klothes[5].textureIndex], 0)
            end
        })
        RageUI.List('Sac Couleur', Klothes[5].meh[Klothes[5].drawableIndex], Klothes[5].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[5].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 5, Klothes[5].name[Klothes[5].drawableIndex], Klothes[5].meh[Klothes[5].drawableIndex][Klothes[5].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Bags }, true, {
            onSelected = function()
                Names.Bags = KeyboardInput("Choisissez un nom pour le vêtement", Names.Bags, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Bags) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Bags,
                    model = Character.Model,
                    type = 5,
                    data = {
                        ["5"] = { drawableId = Klothes[5].name[Klothes[5].drawableIndex], textureId = Klothes[5].meh[Klothes[5].drawableIndex][Klothes[5].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Bags)
                Names.Bags = "Sac"
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'bracelet'), function()
        RageUI.List('Bracelets', KlothesProps[7].name, KlothesProps[7].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[7].drawableIndex = Index
                KlothesProps[7].textureIndex = 1
                SetPedPropIndex(PlayerPedId(), 7, KlothesProps[7].name[KlothesProps[7].drawableIndex], KlothesProps[7].meh[KlothesProps[7].drawableIndex][KlothesProps[7].textureIndex], false)
            end
        })
        RageUI.List('Bracelet Couleur', KlothesProps[7].meh[KlothesProps[7].drawableIndex], KlothesProps[7].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[7].textureIndex = Index
                SetPedPropIndex(PlayerPedId(), 7, KlothesProps[7].name[KlothesProps[7].drawableIndex], KlothesProps[7].meh[KlothesProps[7].drawableIndex][KlothesProps[7].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Bracelets }, true, {
            onSelected = function()
                Names.Bracelets = KeyboardInput("Choisissez un nom pour le vêtement", Names.Bracelets, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Bracelets) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Bracelets,
                    model = Character.Model,
                    type = 27,
                    data = {
                        ["7"] = { drawableId = KlothesProps[7].name[KlothesProps[7].drawableIndex], textureId = KlothesProps[7].meh[KlothesProps[7].drawableIndex][KlothesProps[7].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Bracelets)
                Names.Bracelets = "Bracelets"
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'watches'), function()
        RageUI.List('Montre', KlothesProps[6].name, KlothesProps[6].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[6].drawableIndex = Index
                KlothesProps[6].textureIndex = 1
                SetPedPropIndex(PlayerPedId(), 6, KlothesProps[6].name[KlothesProps[6].drawableIndex], KlothesProps[6].meh[KlothesProps[6].drawableIndex][KlothesProps[6].textureIndex], false)
            end
        })
        RageUI.List('Montre Couleur', KlothesProps[6].meh[KlothesProps[6].drawableIndex], KlothesProps[6].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[6].textureIndex = Index
                SetPedPropIndex(PlayerPedId(), 6, KlothesProps[6].name[KlothesProps[6].drawableIndex], KlothesProps[6].meh[KlothesProps[6].drawableIndex][KlothesProps[6].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Watch }, true, {
            onSelected = function()
                Names.Watch = KeyboardInput("Choisissez un nom pour le vêtement", Names.Watch, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Watch)}, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Watch,
                    model = Character.Model,
                    type = 26,
                    data = {
                        ["6"] = { drawableId = KlothesProps[6].name[KlothesProps[6].drawableIndex], textureId = KlothesProps[6].meh[KlothesProps[6].drawableIndex][KlothesProps[6].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Watch)
                Names.Ear = "Montre"
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'ear'), function()
        RageUI.List("Accessoire d'oreilles", KlothesProps[2].name, KlothesProps[2].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[2].drawableIndex = Index
                KlothesProps[2].textureIndex = 1
                SetPedPropIndex(PlayerPedId(), 2, KlothesProps[2].name[KlothesProps[2].drawableIndex], KlothesProps[2].meh[KlothesProps[2].drawableIndex][KlothesProps[2].textureIndex], false)
            end
        })
        RageUI.List("Accessoire d'oreilles Couleur", KlothesProps[2].meh[KlothesProps[2].drawableIndex], KlothesProps[2].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[2].textureIndex = Index
                SetPedPropIndex(PlayerPedId(), 2, KlothesProps[2].name[KlothesProps[2].drawableIndex], KlothesProps[2].meh[KlothesProps[2].drawableIndex][KlothesProps[2].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Ear }, true, {
            onSelected = function()
                Names.Watch = KeyboardInput("Choisissez un nom pour le vêtement", Names.Ear, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Ear) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Ear,
                    model = Character.Model,
                    type = 22,
                    data = {
                        ["2"] = { drawableId = KlothesProps[2].name[KlothesProps[2].drawableIndex], textureId = KlothesProps[2].meh[KlothesProps[2].drawableIndex][KlothesProps[2].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Accessories)
                Names.Ear = "Accessoire"
            end
        })
    end)
   RageUI.IsVisible(RMenu:Get('clothes_shop', 'hat'), function()
        RageUI.List('Chapeau', KlothesProps[0].name, KlothesProps[0].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[0].drawableIndex = Index
                KlothesProps[0].textureIndex = 1
                SetPedPropIndex(PlayerPedId(), 0, KlothesProps[0].name[KlothesProps[0].drawableIndex], KlothesProps[0].meh[KlothesProps[0].drawableIndex][KlothesProps[0].textureIndex], false)
            end
        })
        RageUI.List('Chapeau Couleur', KlothesProps[0].meh[KlothesProps[0].drawableIndex], KlothesProps[0].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[0].textureIndex = Index
                SetPedPropIndex(PlayerPedId(), 0, KlothesProps[0].name[KlothesProps[0].drawableIndex], KlothesProps[0].meh[KlothesProps[0].drawableIndex][KlothesProps[0].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Hats }, true, {
            onSelected = function()
                Names.Hats = KeyboardInput("Choisissez un nom pour le vêtement", Names.Hats, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Hats) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Hats,
                    model = Character.Model,
                    type = 20,
                    data = {
                        ["0"] = { drawableId = KlothesProps[0].name[KlothesProps[0].drawableIndex], textureId = KlothesProps[0].meh[KlothesProps[0].drawableIndex][KlothesProps[0].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Hats)
                Names.Hats = "Chapeau"
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'glasses'), function()
        RageUI.List('Lunettes', KlothesProps[1].name, KlothesProps[1].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[1].drawableIndex = Index
                KlothesProps[1].textureIndex = 1
                SetPedPropIndex(PlayerPedId(), 1, KlothesProps[1].name[KlothesProps[1].drawableIndex], KlothesProps[1].meh[KlothesProps[1].drawableIndex][KlothesProps[1].textureIndex], false)
            end
        })
        RageUI.List('Lunettes Couleur', KlothesProps[1].meh[KlothesProps[1].drawableIndex], KlothesProps[1].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                KlothesProps[1].textureIndex = Index
                SetPedPropIndex(PlayerPedId(), 1, KlothesProps[1].name[KlothesProps[1].drawableIndex], KlothesProps[1].meh[KlothesProps[1].drawableIndex][KlothesProps[1].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Glasses }, true, {
            onSelected = function()
                Names.Glasses = KeyboardInput("Choisissez un nom pour le vêtement", Names.Glasses, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Glasses) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Glasses,
                    model = Character.Model,
                    type = 21,
                    data = {
                        ["1"] = { drawableId = KlothesProps[1].name[KlothesProps[1].drawableIndex], textureId = KlothesProps[1].meh[KlothesProps[1].drawableIndex][KlothesProps[1].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Glasses)
                Names.Glasses = "Lunettes"
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'pants'), function()
        RageUI.List('Pantalon', Klothes[4].name, Klothes[4].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[4].drawableIndex = Index
                Klothes[4].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 4, Klothes[4].name[Klothes[4].drawableIndex], Klothes[4].meh[Klothes[4].drawableIndex][Klothes[4].textureIndex], 0)
            end
        })
        RageUI.List('Pantalon Couleur', Klothes[4].meh[Klothes[4].drawableIndex], Klothes[4].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[4].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 4, Klothes[4].name[Klothes[4].drawableIndex], Klothes[4].meh[Klothes[4].drawableIndex][Klothes[4].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Pants }, true, {
            onSelected = function()
                Names.Pants = KeyboardInput("Choisissez un nom pour le vêtement", Names.Pants, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Pants) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Pants,
                    model = Character.Model,
                    type = 2,
                    data = {
                        ["4"] = { drawableId = Klothes[4].name[Klothes[4].drawableIndex], textureId = Klothes[4].meh[Klothes[4].drawableIndex][Klothes[4].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Pants)
                Names.Pants = "Pantalon"
            end
        })
    end)
     RageUI.IsVisible(RMenu:Get('clothes_shop', 'top'), function()
        RageUI.List("Sous-Haut", Klothes[8].name, Klothes[8].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[8].drawableIndex = Index
                Klothes[8].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 8, Klothes[8].name[Klothes[8].drawableIndex], Klothes[8].meh[Klothes[8].drawableIndex][Klothes[8].textureIndex], 0)
            end
        })
        RageUI.List("Sous-Haut Couleur", Klothes[8].meh[Klothes[8].drawableIndex], Klothes[8].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[8].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 8, Klothes[8].name[Klothes[8].drawableIndex], Klothes[8].meh[Klothes[8].drawableIndex][Klothes[8].textureIndex], 0)
            end
        })
        RageUI.List("Haut", Klothes[11].name, Klothes[11].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[11].drawableIndex = Index
                Klothes[11].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 11, Klothes[11].name[Klothes[11].drawableIndex], Klothes[11].meh[Klothes[11].drawableIndex][Klothes[11].textureIndex], 0)
            end
        })
        RageUI.List("Haut Couleur", Klothes[11].meh[Klothes[11].drawableIndex], Klothes[11].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[11].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 11, Klothes[11].name[Klothes[11].drawableIndex], Klothes[11].meh[Klothes[11].drawableIndex][Klothes[11].textureIndex], 0)
            end
        })
        RageUI.List("Accessoires", Klothes[7].name, Klothes[7].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[7].drawableIndex = Index
                Klothes[7].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 7, Klothes[7].name[Klothes[7].drawableIndex], Klothes[7].meh[Klothes[7].drawableIndex][Klothes[7].textureIndex], 0)
            end
        })
        RageUI.List("Accessoires Couleur", Klothes[7].meh[Klothes[7].drawableIndex], Klothes[7].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[7].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 7, Klothes[7].name[Klothes[7].drawableIndex], Klothes[7].meh[Klothes[7].drawableIndex][Klothes[7].textureIndex], 0)
            end
        })
        RageUI.List("Bras", Klothes[3].name, Klothes[3].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[3].drawableIndex = Index
                Klothes[3].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 3, Klothes[3].name[Klothes[3].drawableIndex], Klothes[3].meh[Klothes[3].drawableIndex][Klothes[3].textureIndex], 0)
            end
        })
        RageUI.List("Bras Couleur", Klothes[3].meh[Klothes[3].drawableIndex], Klothes[3].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[3].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 3, Klothes[3].name[Klothes[3].drawableIndex], Klothes[3].meh[Klothes[3].drawableIndex][Klothes[3].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Top }, true, {
            onSelected = function()
                Names.Top = KeyboardInput("Choisissez un nom pour le vêtement", Names.Top, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Top) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Top,
                    model = Character.Model,
                    type = 1,
                    data = {
                        ["3"] = { drawableId = Klothes[3].name[Klothes[3].drawableIndex], textureId = Klothes[3].meh[Klothes[3].drawableIndex][Klothes[3].textureIndex] },
                        ["8"] = { drawableId = Klothes[8].name[Klothes[8].drawableIndex], textureId = Klothes[8].meh[Klothes[8].drawableIndex][Klothes[8].textureIndex] },
                        ["7"] = { drawableId = Klothes[7].name[Klothes[7].drawableIndex], textureId = Klothes[7].meh[Klothes[7].drawableIndex][Klothes[7].textureIndex] },
                        ["11"] = { drawableId = Klothes[11].name[Klothes[11].drawableIndex], textureId = Klothes[11].meh[Klothes[11].drawableIndex][Klothes[11].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Top)
                Names.Top = "Haut"
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'shoes'), function()
        RageUI.List('Chaussures', Klothes[6].name, Klothes[6].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[6].drawableIndex = Index
                Klothes[6].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 6, Klothes[6].name[Klothes[6].drawableIndex], Klothes[6].meh[Klothes[6].drawableIndex][Klothes[6].textureIndex], 0)
            end
        })
        RageUI.List('Chaussures Couleur', Klothes[6].meh[Klothes[6].drawableIndex], Klothes[6].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[6].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 6, Klothes[6].name[Klothes[6].drawableIndex], Klothes[6].meh[Klothes[6].drawableIndex][Klothes[6].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Shoes }, true, {
            onSelected = function()
                Names.Shoes = KeyboardInput("Choisissez un nom pour le vêtement", Names.Shoes, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Shoes) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Shoes,
                    model = Character.Model,
                    type = 13,
                    data = {
                        ["6"] = { drawableId = Klothes[6].name[Klothes[6].drawableIndex], textureId = Klothes[6].meh[Klothes[6].drawableIndex][Klothes[6].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Shoes)
                Names.Shoes = "Chaussures"
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('clothes_shop', 'mask'), function()
        RageUI.List('Masque', Klothes[1].name, Klothes[1].drawableIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[1].drawableIndex = Index
                Klothes[1].textureIndex = 1
                SetPedComponentVariation(PlayerPedId(), 1, Klothes[1].name[Klothes[1].drawableIndex], Klothes[1].meh[Klothes[1].drawableIndex][Klothes[1].textureIndex], 0)
            end
        })
        RageUI.List('Masque Couleur', Klothes[1].meh[Klothes[1].drawableIndex], Klothes[1].textureIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Klothes[1].textureIndex = Index
                SetPedComponentVariation(PlayerPedId(), 1, Klothes[1].name[Klothes[1].drawableIndex], Klothes[1].meh[Klothes[1].drawableIndex][Klothes[1].textureIndex], 0)
            end
        })
        RageUI.Button("Nom", nil, { RightLabel = Names.Mask }, true, {
            onSelected = function()
                Names.Mask = KeyboardInput("Choisissez un nom pour le vêtement", Names.Mask, 20, false)
            end,
        })
        RageUI.Button("Acheter", nil, { RightLabel = sf("(~g~%s $~w~)", Price.Mask) }, true, {
            onSelected = function()
                local dataKlothes = {
                    name = Names.Mask,
                    model = Character.Model,
                    type = 14,
                    data = {
                        ["1"] = { drawableId = Klothes[1].name[Klothes[1].drawableIndex], textureId = Klothes[1].meh[Klothes[1].drawableIndex][Klothes[1].textureIndex] },
                    }
                }
                TriggerServerEvent('Ms:CreateNewClothes', dataKlothes, Price.Mask)
                Names.Mask = "Masque"
            end
        })
    end)
end
local result = nil
local Identity = {
    firstname = "John",
    lastname = "Doe",
    age = 27
}
local IndexCloth = 1
local bite = false
RegisterNetEvent('Ms:test')
AddEventHandler('Ms:test', function(t)
    result = t
end)
local VehicleColors, index = { 27, 135, 88, 38, 53, 64, 0, 111 }, 1
local VehicleModel, vIndex = { "sanchez2", "blazer", "issi3", "cheburek" }, 1
RMenu.Add('connection', 'main', RageUI.CreateMenu("Stalya", ""))
RageUI.SetClosableTypeOfMenu(RMenu:Get('connection', 'main'))
RMenu:Get('connection', 'main'):SetSubtitle("RageUI connection")
RMenu.Add('connection', 'newcharacter', RageUI.CreateMenu("Personnage", "Création de personnage"))
RMenu.Add('newcharacter', 'heridity', RageUI.CreateSubMenu(RMenu:Get('connection', 'newcharacter'), "Personnage", "Heridité"))
RMenu.Add('newcharacter', 'facialfeatures', RageUI.CreateSubMenu(RMenu:Get('connection', 'newcharacter'), "Personnage", "Traits du visage"))
RMenu:Get('newcharacter', 'facialfeatures').EnableMouse = true
RMenu.Add('newcharacter', 'appearance', RageUI.CreateSubMenu(RMenu:Get('connection', 'newcharacter'), "Personnage", "Apparence"))
RMenu:Get('newcharacter', 'appearance').EnableMouse = true
RMenu.Add('newcharacter', 'informations', RageUI.CreateSubMenu(RMenu:Get('connection', 'newcharacter'), "Personnage", "Informations"))
RMenu:Get('newcharacter', 'informations').EnableMouse = true
function RageUI.PoolMenus:Connection()
    RageUI.IsVisible(RMenu:Get('connection', 'main'), function()
        if result ~= nil then
            for k, v in pairs(result) do
                local identity = v.Identity
                RageUI.Button(sf('%s %s', identity.firstname, identity.lastname), nil, { }, true, {
                    onSelected = function()
                        TriggerServerEvent('Ms:SetCharacterId', v.Id)
                        RageUI.CloseAll()
                    end
                })
            end
        end
        if #result < 2 then
            RageUI.Button('Créer un personnage', nil, { }, true, {
                onSelected = function()
                    if not bite then
                        firstClickCreateCharacter()
                        bite = true
                        RageUI.CloseAll()
                    end
                end
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('connection', 'newcharacter'), function()
        if Character.Id == nil then
            RageUI.List("Sexe", CharacterCreation.sex.label, CharacterCreation.sex.index, "Déterminez le sexe de votre personnage.", {}, true, {
                onSelected = function(Index, Items)
                end,
                onListChange = function(Index, Items)
                    CharacterCreation.sex.index = Index
                    updateModel(CharacterCreation.sex.model[CharacterCreation.sex.index])
                    updateAllValue(false)
                    Utils:PlayAnim('mp_character_creation@customise@male_a', 'drop_intro', 0, 0, 2)
                end,
                onHovered = function(Index, Items)
                end
            })
        end
        RageUI.Button("Hérédité", "Choisissez vos parents.", {}, true, {}, RMenu:Get('newcharacter', 'heridity'))
        RageUI.Button("Traits du visage", "Changez les traits de votre visage.", {}, true, {}, RMenu:Get('newcharacter', 'facialfeatures'))
        RageUI.Button("Apparence", "Changez votre apparence.", {}, true, {}, RMenu:Get('newcharacter', 'appearance'))
        RageUI.Button('Informations', nil, {}, true, {}, RMenu:Get('newcharacter', 'informations'))
        if Character.Id == nil then
            RageUI.List("Vêtements", { "Tenue #1", "Tenue #2", "Tenue #3", "Tenue #4" }, IndexCloth, nil, {}, true, {
                onListChange = function(Index)
                    IndexCloth = Index
                    for a, b in pairs(ClothesPreset[2][CharacterCreation.sex.current][IndexCloth]) do
                        for k, v in pairs(b) do
                            SetPedComponentVariation(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 2)
                        end
                    end
                end
            })
            RageUI.List('Véhicule de départ', { "Sanchez", "Blazer", "Issi classique", "Cheburek" }, vIndex, nil, {}, true, {
                onListChange = function(Index, Items)
                    vIndex = Index
                end
            })
            RageUI.List('Couleur du véhicule', { "Rouge", "Rose", "Jaune", "Orange", "Vert", "Bleu", "Noir", "Blanc" }, index, nil, {}, true, {
                onListChange = function(Index, Items)
                    index = Index
                end
            })
        end
        RageUI.Button('Sauvegarder', nil, {}, true, {
            onSelected = function()
                if (Identity.firstname == nil or Identity.lastname == nil or Identity.age == nil) then
                    return
                end
                if Identity.firstname == "John" and Identity.lastname == "Doe" then
                    Visual.ShowNotify({
                        title = "Personnage",
                        subtitle = "~r~Action impossible",
                        message = "Vous devez changer votre identité.",
                        dict = "stalya",
                        name = "logo_blue",
                        icon = 7
                    })
                    return
                end
                local data = {
                    Model = CharacterCreation.sex.model[CharacterCreation.sex.index],
                    Identity = Identity,
                    Skin = {
                        {
                            CharacterCreation.parents.mum.id[CharacterCreation.parents.mum.index],
                            CharacterCreation.parents.dad.id[CharacterCreation.parents.dad.index],
                            CharacterCreation.parents.mum.id[CharacterCreation.parents.mum.index],
                            CharacterCreation.parents.dad.id[CharacterCreation.parents.dad.index],
                            math.round(CharacterCreation.HeritageShape.h, 3),
                            math.round(CharacterCreation.HeritageColor.h, 3)
                        },
                        {
                            ["0"] = math.round(CharacterCreation.grid[3].rx, 3),
                            ["1"] = math.round(CharacterCreation.grid[3].ry, 3),
                            ["2"] = math.round(CharacterCreation.grid[4].rx, 3),
                            ["3"] = math.round(CharacterCreation.grid[4].ry, 3),
                            ["4"] = math.round(CharacterCreation.grid[5].ry, 3),
                            ["5"] = math.round(CharacterCreation.grid[5].rx, 3),
                            ["6"] = math.round(CharacterCreation.grid[1].ry, 3),
                            ["7"] = math.round(CharacterCreation.grid[1].rx, 3),
                            ["8"] = math.round(CharacterCreation.grid[6].ry, 3),
                            ["9"] = math.round(CharacterCreation.grid[6].rx, 3),
                            ["10"] = math.round(CharacterCreation.grid[7].rx, 3),
                            ["11"] = math.round(CharacterCreation.grid[2].rx, 3),
                            ["12"] = math.round(CharacterCreation.grid[8].rx, 3),
                            ["13"] = math.round(CharacterCreation.grid[9].rx, 3),
                            ["14"] = math.round(CharacterCreation.grid[9].ry, 3),
                            ["15"] = math.round(CharacterCreation.grid[10].ry, 3),
                            ["16"] = math.round(CharacterCreation.grid[10].rx, 3),
                            ["17"] = math.round(CharacterCreation.grid[11].rx, 3),
                            ["18"] = math.round(CharacterCreation.grid[11].ry, 3)
                        },
                        {
                            ["0"] = { CharacterCreation.blemishes.id[CharacterCreation.blemishes.index], math.round(CharacterCreation.panelData.opacity.blemishes, 3) },
                            ["1"] = { CharacterCreation.beards.id[CharacterCreation.beards.index], math.round(CharacterCreation.panelData.opacity.beards, 3) },
                            ["2"] = { CharacterCreation.eyebrows.id[CharacterCreation.eyebrows.index], math.round(CharacterCreation.panelData.opacity.eyebrows, 3) },
                            ["3"] = { CharacterCreation.ageing.id[CharacterCreation.ageing.index], math.round(CharacterCreation.panelData.opacity.ageing, 3) },
                            ["4"] = { CharacterCreation.makeup.id[CharacterCreation.makeup.index], math.round(CharacterCreation.panelData.opacity.makeup, 3) },
                            ["5"] = { CharacterCreation.blush.id[CharacterCreation.blush.index], math.round(CharacterCreation.panelData.opacity.blush, 3) },
                            ["6"] = { CharacterCreation.complexion.id[CharacterCreation.complexion.index], math.round(CharacterCreation.panelData.opacity.complexion, 3) },
                            ["7"] = { CharacterCreation.sundamage.id[CharacterCreation.sundamage.index], math.round(CharacterCreation.panelData.opacity.sundamage, 3) },
                            ["8"] = { CharacterCreation.lipstick.id[CharacterCreation.lipstick.index], math.round(CharacterCreation.panelData.opacity.lipstick, 3) },
                            ["9"] = { CharacterCreation.freckles.id[CharacterCreation.freckles.index], math.round(CharacterCreation.panelData.opacity.freckles, 3) },
                        },
                        {
                            ["2"] = { 1, CharacterCreation.panelData.eyebrows.index_two - 1, 0 },
                            ["1"] = { 1, CharacterCreation.panelData.beards.index_two - 1, 0 },
                            ["8"] = { 2, CharacterCreation.panelData.lipstick.index_two - 1, 0 },
                            ["5"] = { 2, CharacterCreation.panelData.blush.index_two - 1, 0 }
                        },
                        { CharacterCreation.hair.hairDecalsList[CharacterCreation.sex.index][CharacterCreation.hair.id[CharacterCreation.sex.index][CharacterCreation.hair.index]][1], CharacterCreation.hair.hairDecalsList[CharacterCreation.sex.index][CharacterCreation.hair.id[CharacterCreation.sex.index][CharacterCreation.hair.index]][2] },
                        { 2, CharacterCreation.hair.id[CharacterCreation.sex.index][CharacterCreation.hair.index], 0, 0 },
                        { CharacterCreation.panelData.hairs.index_two - 1, CharacterCreation.panelData.strands.index_two - 1 }
                    },
                    Clothe = IndexCloth,
                    Vehicle = {
                        ["colors"] = { ["1"] = VehicleColors[index], ["2"] = VehicleColors[index], ["3"] = VehicleColors[index] }
                    },
                    VehicleModel = VehicleModel[vIndex]
                }
                if Character.Id == nil then
                    TriggerServerEvent('Ms:CreateCharacter', data)
                    FreezeEntityPosition(PlayerPedId(), false)
                    DoScreenFadeOut(500)
                else
                    local confirmation = KeyboardInput("Voulez-vous vraiment sauvegarder ? (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if confirmation ~= nil and string.lower(confirmation) == "y" then
                        TriggerServerEvent('Ms:CharacterRegister', data)
                        RageUI.CloseAll()
                    end
                end
                RageUI.CloseAll()
            end
        })
        if Character.Id ~= nil then
            RageUI.Button('Annuler', nil, {}, true, {
                onSelected = function(Index)
                    local confirmation = KeyboardInput("Voulez-vous vraiment annuler ? (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if confirmation ~= nil and string.lower(confirmation) == "y" then
                        Utils:ApplySkin(Character.Skin)
                        RageUI.CloseAll()
                    end
                end
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('newcharacter', 'informations'), function()
        RageUI.Button('Prénom :', nil, { RightLabel = Identity.firstname }, true, {
            onSelected = function()
                Identity.firstname = KeyboardInput("Choisissez votre prénom", Identity.firstname, 20, false)
            end,
        })
        RageUI.Button('Nom :', nil, { RightLabel = Identity.lastname }, true, {
            onSelected = function()
                Identity.lastname = KeyboardInput("Choisissez votre prénom", Identity.lastname, 20, false)
            end,
        })
        RageUI.Button('Âge :', nil, { RightLabel = Identity.age }, true, {
            onSelected = function()
                Identity.age = KeyboardInput("Choisissez votre prénom", Identity.age, 2, true)
            end,
        })
    end)
    RageUI.IsVisible(RMenu:Get('newcharacter', 'heridity'), function()
        RageUI.Window.Heritage(CharacterCreation.parents.mum.index - 1, CharacterCreation.parents.dad.index - 1)
        RageUI.List("Mère", CharacterCreation.parents.mum.name, CharacterCreation.parents.mum.index, "Choisissez votre mère.", {}, true, {
            onListChange = function(Index, Items)
                CharacterCreation.parents.mum.index = Index
                updateFace()
            end,
        })
        RageUI.List("Père", CharacterCreation.parents.dad.name, CharacterCreation.parents.dad.index, "Choisissez votre père.", {}, true, {
            onListChange = function(Index, Items)
                CharacterCreation.parents.dad.index = Index
                updateFace()
            end,
        })
        RageUI.UISliderHeritage("Ressemblance", CharacterCreation.HeritageShape.i, "Déterminez de quel parent vous tenez le plus.", {
            onSliderChange = function(Index, OtherIndex)
                CharacterCreation.HeritageShape.h = Index
                CharacterCreation.HeritageShape.i = OtherIndex
                updateFace()
            end,
            onSelected = function(Index)
            end,
            onHovered = function()
            end
        }, 0.02)
        RageUI.UISliderHeritage("Couleur de peau", CharacterCreation.HeritageColor.i, "Déterminez qui de votre père ou de votre mère a le plus d'influence sur la couleur de votre peau.", {
            onSliderChange = function(Index, OtherIndex)
                CharacterCreation.HeritageColor.h = Index
                CharacterCreation.HeritageColor.i = OtherIndex
                updateFace()
            end,
            onSelected = function(Index)
            end,
            onHovered = function()
            end
        }, 0.02)
    end)
    RageUI.IsVisible(RMenu:Get('newcharacter', 'facialfeatures'), function()
        RageUI.Button("Bas du front", nil, {}, true, {})
        RageUI.Button("Yeux", nil, {}, true, {})
        RageUI.Button("Nez", nil, {}, true, {})
        RageUI.Button("Arête du nez", nil, {}, true, {})
        RageUI.Button("Bout du nez", nil, {}, true, {})
        RageUI.Button("Pommettes", nil, {}, true, {})
        RageUI.Button("Joues", nil, {}, true, {})
        RageUI.Button("Lèvres", nil, {}, true, {})
        RageUI.Button("Mâchoire", nil, {}, true, {})
        RageUI.Button("Profil du menton", nil, {}, true, {})
        RageUI.Button("Forme du menton", nil, {}, true, {})
    end, function()
        RageUI.Grid(CharacterCreation.grid[1].x, CharacterCreation.grid[1].y, "Haut", "Bas", "Intérieur", "Extérieur", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(1, X, Y, false, false, updateEyeBrown)
            end
        }, 1)
        RageUI.GridHorizontal(CharacterCreation.grid[2].x, "Plissés", "Ouverts", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(2, X, nil, true, nil, updateEyesOpennig)
            end
        }, 2)
        RageUI.Grid(CharacterCreation.grid[3].x, CharacterCreation.grid[3].y, "Relevé", "Bas", "Fin", "Épais", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(3, X, Y, false, false, updateNose)
            end
        }, 3)
        RageUI.Grid(CharacterCreation.grid[4].x, CharacterCreation.grid[4].y, "Saillante", "Incurvée", "Courte", "Longue", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(4, X, Y, true, false, updateNoseBone)
            end
        }, 4)
        RageUI.Grid(CharacterCreation.grid[5].x, CharacterCreation.grid[5].y, "Bout vers le haut", "Bout vers le bas", "Gauche", "Droite", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(5, X, Y, true, false, updateNosePeak)
            end
        }, 5)
        RageUI.Grid(CharacterCreation.grid[6].x, CharacterCreation.grid[6].y, "Haut", "Bas", "Intérieur", "Extérieur", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(6, X, Y, false, false, updateCheeksBone)
            end
        }, 6)
        RageUI.GridHorizontal(CharacterCreation.grid[7].x, "Émacié", "Bouffi", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(7, X, nil, true, nil, updateCheeks)
            end
        }, 7)
        RageUI.GridHorizontal(CharacterCreation.grid[8].x, "Minces", "Épaisses", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(8, X, nil, true, nil, updateLips)
            end
        }, 8)
        RageUI.Grid(CharacterCreation.grid[9].x, CharacterCreation.grid[9].y, "Ronde", "Carré", "Étroite", "Large", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(9, X, Y, false, false, updateJaw)
            end
        }, 9)
        RageUI.Grid(CharacterCreation.grid[10].x, CharacterCreation.grid[10].y, "Haut", "Bas", "Intérieur", "Extérieur", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(10, X, Y, false, false, updateChimpBone)
            end
        }, 10)
        RageUI.Grid(CharacterCreation.grid[11].x, CharacterCreation.grid[11].y, "Arrondi", "Fosette", "Carré", "Pointu", {
            onPositionChange = function(X, Y)
                updateFaceFeatures(11, X, Y, true, false, updateChimpHole)
            end
        }, 11)
    end)
    RageUI.IsVisible(RMenu:Get('newcharacter', 'appearance'), function()
        RageUI.List("Coiffure", CharacterCreation.hair.name[CharacterCreation.sex.index], CharacterCreation.hair.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.hair.index ~= Index) then
                    CharacterCreation.hair.index = Index
                    updateHair()
                end
            end
        })
        RageUI.List("Sourcils", CharacterCreation.eyebrows.name, CharacterCreation.eyebrows.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.eyebrows.index ~= Index) then
                    CharacterCreation.eyebrows.index = Index
                    updateEyebrows()
                end
            end
        })
        if (CharacterCreation.sex.current == "mp_m_freemode_01") then
            RageUI.List("Pilosité faciale", CharacterCreation.beards.name, CharacterCreation.beards.index, nil, {}, true, {
                onListChange = function(Index, Items)
                    if (CharacterCreation.beards.index ~= Index) then
                        CharacterCreation.beards.index = Index
                        updateBeards()
                    end
                end
            })
        elseif (CharacterCreation.sex.current == "mp_f_freemode_01") then
            RageUI.List("Fard à joues", CharacterCreation.blush.name, CharacterCreation.blush.index, nil, {}, true, {
                onListChange = function(Index, Items)
                    if (CharacterCreation.blush.index ~= Index) then
                        CharacterCreation.blush.index = Index
                        updateBlush()
                    end
                end
            })
        end
        RageUI.List("Problèmes de peau", CharacterCreation.blemishes.name, CharacterCreation.blemishes.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.blemishes.index ~= Index) then
                    CharacterCreation.blemishes.index = Index
                    updateBlemishes()
                end
            end
        })
        RageUI.List("Signes de vieillissement", CharacterCreation.ageing.name, CharacterCreation.ageing.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.ageing.index ~= Index) then
                    CharacterCreation.ageing.index = Index
                    updateAgeing()
                end
            end
        })
        RageUI.List("Teint", CharacterCreation.complexion.name, CharacterCreation.complexion.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.complexion.index ~= Index) then
                    CharacterCreation.complexion.index = Index
                    updateComplexion()
                end
            end
        })
        RageUI.List("Taches cutanées", CharacterCreation.freckles.name, CharacterCreation.freckles.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.freckles.index ~= Index) then
                    CharacterCreation.freckles.index = Index
                    updateFreckles()
                end
            end
        })
        RageUI.List("Aspect de la peau", CharacterCreation.sundamage.name, CharacterCreation.sundamage.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.sundamage.index ~= Index) then
                    CharacterCreation.sundamage.index = Index
                    updateSunDamage()
                end
            end
        })
        RageUI.List("Couleur des yeux", CharacterCreation.eyescolor.name, CharacterCreation.eyescolor.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.eyescolor.index ~= Index) then
                    CharacterCreation.eyescolor.index = Index
                    updateEyesColor()
                end
            end
        })
        RageUI.List("Maquillage yeux", CharacterCreation.makeup.name, CharacterCreation.makeup.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.makeup.index ~= Index) then
                    CharacterCreation.makeup.index = Index
                    updateMakeup()
                end
            end
        })
        RageUI.List("Rouge à lèvres", CharacterCreation.lipstick.name, CharacterCreation.lipstick.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.lipstick.index ~= Index) then
                    CharacterCreation.lipstick.index = Index
                    updateLipstick()
                end
            end
        })
    end, function()
        RageUI.ColourPanel("Couleurs", CharacterCreation.colors_hair, CharacterCreation.panelData.hairs.index_one, CharacterCreation.panelData.hairs.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.hairs.index_one = MinimumIndex
                CharacterCreation.panelData.hairs.index_two = CurrentIndex
                updateHairColor()
            end
        }, 1)
        RageUI.ColourPanel("Mêches", CharacterCreation.colors_hair, CharacterCreation.panelData.strands.index_one, CharacterCreation.panelData.strands.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.strands.index_one = MinimumIndex
                CharacterCreation.panelData.strands.index_two = CurrentIndex
                updateHairColor()
            end
        }, 1)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.eyebrows, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.eyebrows = Percent
                updateEyebrows()
            end
        }, 2)
        RageUI.ColourPanel("Couleurs", CharacterCreation.colors_hair, CharacterCreation.panelData.eyebrows.index_one, CharacterCreation.panelData.eyebrows.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.eyebrows.index_one = MinimumIndex
                CharacterCreation.panelData.eyebrows.index_two = CurrentIndex
                updateEyebrowsColor()
            end
        }, 2, 1)
        if (CharacterCreation.sex.current == "mp_m_freemode_01") then
            RageUI.PercentagePanel(CharacterCreation.panelData.opacity.beards, "Opacité", "0%", "100%", {
                onProgressChange = function(Percent)
                    if (CharacterCreation.panelData.opacity.beards ~= Percent) then
                        CharacterCreation.panelData.opacity.beards = Percent
                        updateBeards()
                    end
                end
            }, 3)
            RageUI.ColourPanel("Couleurs", CharacterCreation.colors_hair, CharacterCreation.panelData.beards.index_one, CharacterCreation.panelData.beards.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    CharacterCreation.panelData.beards.index_one = MinimumIndex
                    CharacterCreation.panelData.beards.index_two = CurrentIndex
                    updateBeardsColor()
                end
            }, 3)
        elseif (CharacterCreation.sex.current == "mp_f_freemode_01") then
            RageUI.PercentagePanel(CharacterCreation.panelData.opacity.blush, "Opacité", "0%", "100%", {
                onProgressChange = function(Percent)
                    CharacterCreation.panelData.opacity.blush = Percent
                    updateBlush()
                end
            }, 3)
            RageUI.ColourPanel("Couleurs", CharacterCreation.colors_makeup, CharacterCreation.panelData.blush.index_one, CharacterCreation.panelData.blush.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    CharacterCreation.panelData.blush.index_one = MinimumIndex
                    CharacterCreation.panelData.blush.index_two = CurrentIndex
                    updateBlushColor()
                end
            }, 3)
        end
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.blemishes, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.blemishes = Percent
                updateBlemishes()
            end
        }, 4)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.ageing, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.ageing = Percent
                updateAgeing()
            end
        }, 5)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.complexion, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.complexion = Percent
                updateComplexion()
            end
        }, 6)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.freckles, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.freckles = Percent
                updateFreckles()
            end
        }, 7)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.sundamage, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.sundamage = Percent
                updateSunDamage()
            end
        }, 8)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.makeup, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.makeup = Percent
                updateMakeup()
            end
        }, 10)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.lipstick, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.lipstick = Percent
                updateLipstick()
            end
        }, 11)
        RageUI.ColourPanel("Couleurs", CharacterCreation.colors_makeup, CharacterCreation.panelData.lipstick.index_one, CharacterCreation.panelData.lipstick.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.lipstick.index_one = MinimumIndex
                CharacterCreation.panelData.lipstick.index_two = CurrentIndex
                updateLipstickColor()
            end
        }, 11)
    end)
end
function updateModel(model)
    local modelHash = GetHashKey(model)
    if IsModelInCdimage(modelHash) and IsModelValid(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), modelHash)
        updateFace()
        SetModelAsNoLongerNeeded(modelHash)
        CharacterCreation.sex.current = model
        for _, b in pairs(ClothesPreset[2][CharacterCreation.sex.model[CharacterCreation.sex.index]][IndexCloth]) do
            for k, v in pairs(b) do
                SetPedComponentVariation(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 2)
            end
        end
    end
end
function firstClickCreateCharacter()
    local modelHashFemale = GetHashKey("mp_f_freemode_01")
    if IsModelInCdimage(modelHashFemale) and IsModelValid(modelHashFemale) then
        RequestModel(modelHashFemale)
        while not HasModelLoaded(modelHashFemale) do
            Citizen.Wait(0)
        end
        SetModelAsNoLongerNeeded(modelHashFemale)
    end
    local modelHash = GetHashKey("mp_m_freemode_01")
    if IsModelInCdimage(modelHash) and IsModelValid(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), modelHash)
        updateFace()
        SetModelAsNoLongerNeeded(modelHash)
        CharacterCreation.sex.current = "mp_m_freemode_01"
        SetPedDefaultComponentVariation(PlayerPedId())
        for _, b in pairs(ClothesPreset[2][CharacterCreation.sex.current][IndexCloth]) do
            for k, v in pairs(b) do
                SetPedComponentVariation(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 2)
            end
        end
        updateAllValue(false)
    end
    CreateCamCreation()
end
function updateFace()
    SetPedHeadBlendData(PlayerPedId(), CharacterCreation.parents.mum.id[CharacterCreation.parents.mum.index], CharacterCreation.parents.dad.id[CharacterCreation.parents.dad.index], nil, CharacterCreation.parents.mum.id[CharacterCreation.parents.mum.index], CharacterCreation.parents.dad.id[CharacterCreation.parents.dad.index], nil, CharacterCreation.HeritageShape.h, CharacterCreation.HeritageColor.h, nil, true);
end
function updateEyeBrown()
    SetPedFaceFeature(PlayerPedId(), 6, CharacterCreation.grid[1].ry);
    SetPedFaceFeature(PlayerPedId(), 7, CharacterCreation.grid[1].rx);
end
function updateEyesOpennig()
    SetPedFaceFeature(PlayerPedId(), 11, CharacterCreation.grid[2].rx);
end
function updateNose()
    SetPedFaceFeature(PlayerPedId(), 0, CharacterCreation.grid[3].rx);
    SetPedFaceFeature(PlayerPedId(), 1, CharacterCreation.grid[3].ry);
end
function updateNoseBone()
    SetPedFaceFeature(PlayerPedId(), 2, CharacterCreation.grid[4].rx);
    SetPedFaceFeature(PlayerPedId(), 3, CharacterCreation.grid[4].ry);
end
function updateNosePeak()
    SetPedFaceFeature(PlayerPedId(), 4, CharacterCreation.grid[5].ry);
    SetPedFaceFeature(PlayerPedId(), 5, CharacterCreation.grid[5].rx);
end
function updateCheeksBone()
    SetPedFaceFeature(PlayerPedId(), 8, CharacterCreation.grid[6].ry);
    SetPedFaceFeature(PlayerPedId(), 9, CharacterCreation.grid[6].rx);
end
function updateCheeks()
    SetPedFaceFeature(PlayerPedId(), 10, CharacterCreation.grid[7].rx);
end
function updateLips()
    SetPedFaceFeature(PlayerPedId(), 12, CharacterCreation.grid[8].rx);
end
function updateJaw()
    SetPedFaceFeature(PlayerPedId(), 13, CharacterCreation.grid[9].rx);
    SetPedFaceFeature(PlayerPedId(), 14, CharacterCreation.grid[9].ry);
end
function updateChimpBone()
    SetPedFaceFeature(PlayerPedId(), 15, CharacterCreation.grid[10].ry);
    SetPedFaceFeature(PlayerPedId(), 16, CharacterCreation.grid[10].rx);
end
function updateChimpHole()
    SetPedFaceFeature(PlayerPedId(), 17, CharacterCreation.grid[11].rx);
    SetPedFaceFeature(PlayerPedId(), 18, CharacterCreation.grid[11].ry);
end
function updateHair()
    local id = CharacterCreation.hair.id[CharacterCreation.sex.index][CharacterCreation.hair.index],
    ClearPedDecorations(PlayerPedId())
    SetPedComponentVariation(PlayerPedId(), 2, id, 0, 0)
    AddPedDecorationFromHashes(PlayerPedId(), CharacterCreation.hair.hairDecalsList[CharacterCreation.sex.index][id][1], CharacterCreation.hair.hairDecalsList[CharacterCreation.sex.index][id][2])
    if Character.Tattoos ~= nil then
        for _, v in pairs(Character.Tattoos) do
            Utils:ApplyTattoos(v)
        end
    end
end
function updateHairColor()
    SetPedHairColor(PlayerPedId(), CharacterCreation.panelData.hairs.index_two - 1, CharacterCreation.panelData.strands.index_two - 1)
end
function updateEyebrows()
    SetPedHeadOverlay(PlayerPedId(), 2, CharacterCreation.eyebrows.id[CharacterCreation.eyebrows.index], CharacterCreation.panelData.opacity.eyebrows)
end
function updateEyebrowsColor()
    SetPedHeadOverlayColor(PlayerPedId(), 2, 1, CharacterCreation.panelData.eyebrows.index_two - 1, 0)
end
function updateBeards()
    SetPedHeadOverlay(PlayerPedId(), 1, CharacterCreation.beards.id[CharacterCreation.beards.index], CharacterCreation.panelData.opacity.beards)
end
function updateBeardsColor()
    SetPedHeadOverlayColor(PlayerPedId(), 1, 1, CharacterCreation.panelData.beards.index_two - 1, 0)
end
function updateBlemishes()
    SetPedHeadOverlay(PlayerPedId(), 0, CharacterCreation.blemishes.id[CharacterCreation.blemishes.index], CharacterCreation.panelData.opacity.blemishes)
end
function updateAgeing()
    SetPedHeadOverlay(PlayerPedId(), 3, CharacterCreation.ageing.id[CharacterCreation.ageing.index], CharacterCreation.panelData.opacity.ageing)
end
function updateComplexion()
    SetPedHeadOverlay(PlayerPedId(), 6, CharacterCreation.complexion.id[CharacterCreation.complexion.index], CharacterCreation.panelData.opacity.complexion)
end
function updateFreckles()
    SetPedHeadOverlay(PlayerPedId(), 9, CharacterCreation.freckles.id[CharacterCreation.freckles.index], CharacterCreation.panelData.opacity.freckles)
end
function updateSunDamage()
    SetPedHeadOverlay(PlayerPedId(), 7, CharacterCreation.sundamage.id[CharacterCreation.sundamage.index], CharacterCreation.panelData.opacity.sundamage)
end
function updateEyesColor()
    SetPedEyeColor(PlayerPedId(), CharacterCreation.eyescolor.id[CharacterCreation.eyescolor.index])
end
function updateMakeup()
    SetPedHeadOverlay(PlayerPedId(), 4, CharacterCreation.makeup.id[CharacterCreation.makeup.index], CharacterCreation.panelData.opacity.makeup)
end
function updateLipstick()
    SetPedHeadOverlay(PlayerPedId(), 8, CharacterCreation.lipstick.id[CharacterCreation.lipstick.index], CharacterCreation.panelData.opacity.lipstick)
end
function updateLipstickColor()
    SetPedHeadOverlayColor(PlayerPedId(), 8, 2, CharacterCreation.panelData.lipstick.index_two - 1, 0)
end
function updateBlush()
    SetPedHeadOverlay(PlayerPedId(), 5, CharacterCreation.blush.id[CharacterCreation.blush.index], CharacterCreation.panelData.opacity.blush)
end
function updateBlushColor()
    SetPedHeadOverlayColor(PlayerPedId(), 5, 2, CharacterCreation.panelData.blush.index_two - 1, 0)
end
IsGarage = false
StockVehicle = false
MId = 0
VehicleSpawnCoords = {}
VehiclesGarages = {}
RMenu.Add('garage', 'main', RageUI.CreateMenu("Garage", "Undefined for using SetSubtitle"))
RMenu:Get('garage', 'main'):SetSubtitle("Stalya Menu")
RMenu:Get('garage', 'main'):DisplayGlare(true);
RMenu.Add('garage', 'job', RageUI.CreateMenu("Garage", "Undefined for using SetSubtitle"))
RMenu:Get('garage', 'job'):SetSubtitle("Stalya Menu")
RMenu:Get('garage', 'job'):DisplayGlare(true);
function RageUI.PoolMenus:Garage()
    RageUI.IsVisible(RMenu:Get('garage', 'main'), function()
        for k, v in pairs(VehiclesGarages) do
            if (IsGarage) then
                if StockVehicle then
                    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    local health = GetVehicleBodyHealth(vehicle) / 1000
                    if IsPedInAnyVehicle(PlayerPedId(), false) and GetPedInVehicleSeat(vehicle, -1) then
                        if health < 0.85 then
                            RageUI.Button('Réparer le véhicule', nil, { RightLabel = sf("(~g~%s $~w~)", 10) }, true, {
                                onSelected = function()
                                    local vId = NetworkGetNetworkIdFromEntity(vehicle)
                                    TriggerServerEvent('Ms:RepairVehicle', vId)
                                end,
                            })
                        else
                            RageUI.Button('Ranger le véhicule', nil, {}, Utils:CanSpawnVehicle(), {
                                onSelected = function()
                                    local vId = NetworkGetNetworkIdFromEntity(vehicle)
                                    TriggerServerEvent('Ms:PutVehicleInGarage', vId, MId)
                                end,
                            })
                        end
                    end
                    return
                end
                if not v.Recovered and v.Model ~= "vehiclejob"  then
                        RageUI.Button(sf("%s (%s)", v.Name or "UNKNOWN", v.Plate or "12345678"), nil, {}, Utils:CanSpawnVehicle(), {
                            onSelected = function(Index, Items)
                                local coords = GetEntityCoords(PlayerPedId())
                                if Markers[MId].Data ~= nil and Markers[MId].Data.SpawnCoords ~= nil then
                                    coords = vector3(VehicleSpawnCoords.x, VehicleSpawnCoords.y, VehicleSpawnCoords.z)
                                end
                                local exists = GetVehicleInRange(vector3(coords), 4.5)
                                if #exists ~= 0 then
                                    Visual.ShowNotify( {
                                        title = "Stalya",
                                        subtitle = "~r~Action impossible",
                                        message = "Un véhicule bloque la sortie.",
                                        dict = "stalya",
                                        name = "logo_blue",
                                        icon = 7
                                    })
                                    return
                                end
                                TriggerServerEvent('Ms:SpawnVehicle', v, MId)
                            end,
                        })
                end
            else
                if v.Recovered then
                    RageUI.Button(sf("%s (%s)", v.Name or "Wtf", v.Plate or "Heuwtf"), nil, {}, Utils:CanSpawnVehicle(), {
                        onSelected = function(Index, Items)
                            local coords = GetEntityCoords(PlayerPedId())
                            if Markers[MId].Data ~= nil and Markers[MId].Data.SpawnCoords ~= nil then
                                coords = vector3(VehicleSpawnCoords.x, VehicleSpawnCoords.y, VehicleSpawnCoords.z)
                            end
                            local exists = GetVehicleInRange(vector3(coords), 4.5)
                            if #exists ~= 0 then
                                Visual.ShowNotify( {
                                    title = "Stalya",
                                    subtitle = "~r~Action impossible",
                                    message = "Un véhicule bloque la sortie.",
                                    dict = "stalya",
                                    name = "logo_blue",
                                    icon = 7
                                })
                                return
                            end
                            TriggerServerEvent('Ms:SpawnVehicle', v, MId)
                        end,
                    })
                end
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('garage', 'job'), function()
        for k, v in pairs(GetVehiclesJobs()) do
            RageUI.Button(GetLabelText(v) ~= "NULL" and GetLabelText(v) or Utils:FirstToUpper(v), nil, {}, true, {
                onSelected = function()
                    local coords = GetEntityCoords(PlayerPedId())
                    if Markers[MId].Data ~= nil and Markers[MId].Data.SpawnCoords ~= nil then
                        coords = vector3(VehicleSpawnCoords.x, VehicleSpawnCoords.y, VehicleSpawnCoords.z)
                    end
                    local exists = GetVehicleInRange(vector3(coords), 4.5)
                    if #exists ~= 0 then
                        Visual.ShowNotify( {
                            title = "Stalya",
                            subtitle = "~r~Action impossible",
                            message = "Un véhicule bloque la sortie.",
                            dict = "stalya",
                            name = "logo_blue",
                            icon = 7
                        })
                        return
                    end
                    TriggerServerEvent('Ms:JobSpawnVehicle', v, MId)
                end,
            })
        end
    end)
end
function GetVehiclesJobs()
    local vehicles = { 'kalahari' }
    local vJob, vRank, vRankId, vKey = Utils:GetCharacterJob(Character, true)
    if vJob ~= nil and vRank ~= nil then
        ({
            [1] = function()
                vehicles = {}
                if vRankId <= 8 then
                    table.insert(vehicles, 'scorcher')
                end
                if vRankId <= 7 then
                    table.insert(vehicles, 'police')
                    table.insert(vehicles, 'policeb')
                end
                if vRankId <= 6 then
                    table.insert(vehicles, 'police2')
                end
                if vRankId <= 5 then
                    table.insert(vehicles, 'police3')
                end
                if vRankId <= 4 then
                    table.insert(vehicles, 'police4')
                    table.insert(vehicles, 'fbi')
                    table.insert(vehicles, 'fbi2')
                    table.insert(vehicles, 'pol458')
                end
                if vRankId <= 3 then
                    table.insert(vehicles, 'policet')
                    table.insert(vehicles, 'riot')
                    table.insert(vehicles, 'riot2')
                end
            end,
            [2] = function()
                vehicles = {}
                table.insert(vehicles, 'ambulance')
                table.insert(vehicles, 'dodgeEMS')
            end,
            [3] = function()
            end,
            [4] = function()
            end,
            [5] = function()
            end,
            [14] = function()
                vehicles = {}
                table.insert(vehicles, 'taxi')
            end,
            [16] = function()
                vehicles = {}
                table.insert(vehicles, 'towtruck')
            end,
        })[vJob.Id]()
    end
    return vehicles
end
RMenu.Add('hairshop', 'main', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('hairshop', 'main'):SetSubtitle("Coiffeur")
RMenu:Get('hairshop', 'main').EnableMouse = true
RMenu:Get('hairshop', 'main').Closed = function()
    Utils:ApplySkin(Character.Skin)
    for _,v in pairs(Character.Tattoos) do
    Utils:ApplyTattoos(v)
    end
end
local edit = {
    hairChanged = false,
    eyebrowsChanged = false,
    beardsChanged = false,
    blushChanged = false,
    makeupChanged = false,
    lipstickChanged = false
}
function RageUI.PoolMenus:HairShop()
    RageUI.IsVisible(RMenu:Get('hairshop', 'main'), function()
        RageUI.List("Coiffure", CharacterCreation.hair.name[Character.Model == 'mp_m_freemode_01' and 1 or 2], CharacterCreation.hair.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.hair.index ~= Index) then
                    CharacterCreation.hair.index = Index
                    local id = CharacterCreation.hair.id[Character.Model == 'mp_m_freemode_01' and 1 or 2][CharacterCreation.hair.index],
                    ClearPedDecorations(PlayerPedId())
                    SetPedComponentVariation(PlayerPedId(), 2, id, 0, 0)
                    AddPedDecorationFromHashes(PlayerPedId(), CharacterCreation.hair.hairDecalsList[Character.Model == 'mp_m_freemode_01' and 1 or 2][id][1], CharacterCreation.hair.hairDecalsList[Character.Model == 'mp_m_freemode_01' and 1 or 2][id][2])
                    for _,v in pairs(Character.Tattoos) do
                        Utils:ApplyTattoos(v)
                    end
                    edit.hairChanged = true
                end
            end
        })
        RageUI.List("Sourcils", CharacterCreation.eyebrows.name, CharacterCreation.eyebrows.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.eyebrows.index ~= Index) then
                    CharacterCreation.eyebrows.index = Index
                    updateEyebrows()
                    edit.eyebrowsChanged = true
                end
            end
        })
        if Character.Model == 'mp_m_freemode_01' then
            RageUI.List("Pilosité faciale", CharacterCreation.beards.name, CharacterCreation.beards.index, nil, {}, true, {
                onListChange = function(Index, Items)
                    if (CharacterCreation.beards.index ~= Index) then
                        CharacterCreation.beards.index = Index
                        updateBeards()
                        edit.beardsChanged = true
                    end
                end
            })
        elseif (Character.Model == "mp_f_freemode_01") then
            RageUI.List("Fard à joues", CharacterCreation.blush.name, CharacterCreation.blush.index, nil, {}, true, {
                onListChange = function(Index, Items)
                    if (CharacterCreation.blush.index ~= Index) then
                        CharacterCreation.blush.index = Index
                        updateBlush()
                        edit.blushChanged = true
                    end
                end
            })
        end
        RageUI.List("Maquillage yeux", CharacterCreation.makeup.name, CharacterCreation.makeup.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.makeup.index ~= Index) then
                    CharacterCreation.makeup.index = Index
                    updateMakeup()
                    edit.makeupChanged = true
                end
            end
        })
        RageUI.List("Rouge à lèvres", CharacterCreation.lipstick.name, CharacterCreation.lipstick.index, nil, {}, true, {
            onListChange = function(Index, Items)
                if (CharacterCreation.lipstick.index ~= Index) then
                    CharacterCreation.lipstick.index = Index
                    updateLipstick()
                    edit.lipstickChanged = true
                end
            end
        })
        RageUI.Button('Acheter', nil, { RightLabel = '(~g~25 $~w~)' }, true, {
            onSelected = function()
                local data = {
                    {
                        ["1"] = { CharacterCreation.beards.id[CharacterCreation.beards.index], math.round(CharacterCreation.panelData.opacity.beards, 3) },
                        ["2"] = { CharacterCreation.eyebrows.id[CharacterCreation.eyebrows.index], math.round(CharacterCreation.panelData.opacity.eyebrows, 3) },
                        ["4"] = { CharacterCreation.makeup.id[CharacterCreation.makeup.index], math.round(CharacterCreation.panelData.opacity.makeup, 3) },
                        ["5"] = { CharacterCreation.blush.id[CharacterCreation.blush.index], math.round(CharacterCreation.panelData.opacity.blush, 3) },
                        ["8"] = { CharacterCreation.lipstick.id[CharacterCreation.lipstick.index], math.round(CharacterCreation.panelData.opacity.lipstick, 3) },
                    },
                    {
                        ["2"] = { 1, CharacterCreation.panelData.eyebrows.index_two - 1, 0 },
                        ["1"] = { 1, CharacterCreation.panelData.beards.index_two - 1, 0 },
                        ["8"] = { 2, CharacterCreation.panelData.lipstick.index_two - 1, 0 },
                        ["5"] = { 2, CharacterCreation.panelData.blush.index_two - 1, 0 }
                    },
                    { CharacterCreation.hair.hairDecalsList[Character.Model == 'mp_m_freemode_01' and 1 or 2][CharacterCreation.hair.id[Character.Model == 'mp_m_freemode_01' and 1 or 2][CharacterCreation.hair.index]][1], CharacterCreation.hair.hairDecalsList[Character.Model == 'mp_m_freemode_01' and 1 or 2][CharacterCreation.hair.id[Character.Model == 'mp_m_freemode_01' and 1 or 2][CharacterCreation.hair.index]][2] },
                    { 2, CharacterCreation.hair.id[Character.Model == 'mp_m_freemode_01' and 1 or 2][CharacterCreation.hair.index], 0, 0 },
                    { CharacterCreation.panelData.hairs.index_two - 1, CharacterCreation.panelData.strands.index_two - 1 }
                }
                local txt = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                if txt ~= nil and  string.lower(txt) == "y" then
                    TriggerServerEvent('Ms:HairShop', data, edit)
                end
            end,
        })
    end, function()
        RageUI.ColourPanel("Couleurs", CharacterCreation.colors_hair, CharacterCreation.panelData.hairs.index_one, CharacterCreation.panelData.hairs.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.hairs.index_one = MinimumIndex
                CharacterCreation.panelData.hairs.index_two = CurrentIndex
                updateHairColor()
            end
        }, 1)
        RageUI.ColourPanel("Mêches", CharacterCreation.colors_hair, CharacterCreation.panelData.strands.index_one, CharacterCreation.panelData.strands.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.strands.index_one = MinimumIndex
                CharacterCreation.panelData.strands.index_two = CurrentIndex
                updateHairColor()
            end
        }, 1)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.eyebrows, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.eyebrows = Percent
                updateEyebrows()
            end
        }, 2)
        RageUI.ColourPanel("Couleurs", CharacterCreation.colors_hair, CharacterCreation.panelData.eyebrows.index_one, CharacterCreation.panelData.eyebrows.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.eyebrows.index_one = MinimumIndex
                CharacterCreation.panelData.eyebrows.index_two = CurrentIndex
                updateEyebrowsColor()
            end
        }, 2, 1)
        if (Character.Model == 'mp_m_freemode_01') then
            RageUI.PercentagePanel(CharacterCreation.panelData.opacity.beards, "Opacité", "0%", "100%", {
                onProgressChange = function(Percent)
                    if (CharacterCreation.panelData.opacity.beards ~= Percent) then
                        CharacterCreation.panelData.opacity.beards = Percent
                        updateBeards()
                    end
                end
            }, 3)
            RageUI.ColourPanel("Couleurs", CharacterCreation.colors_hair, CharacterCreation.panelData.beards.index_one, CharacterCreation.panelData.beards.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    CharacterCreation.panelData.beards.index_one = MinimumIndex
                    CharacterCreation.panelData.beards.index_two = CurrentIndex
                    updateBeardsColor()
                end
            }, 3)
        elseif (Character.Model == "mp_f_freemode_01") then
            RageUI.PercentagePanel(CharacterCreation.panelData.opacity.blush, "Opacité", "0%", "100%", {
                onProgressChange = function(Percent)
                    CharacterCreation.panelData.opacity.blush = Percent
                    updateBlush()
                end
            }, 3)
            RageUI.ColourPanel("Couleurs", CharacterCreation.colors_makeup, CharacterCreation.panelData.blush.index_one, CharacterCreation.panelData.blush.index_two, {
                onColorChange = function(MinimumIndex, CurrentIndex)
                    CharacterCreation.panelData.blush.index_one = MinimumIndex
                    CharacterCreation.panelData.blush.index_two = CurrentIndex
                    updateBlushColor()
                end
            }, 3)
        end
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.makeup, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.makeup = Percent
                updateMakeup()
            end
        }, 4)
        RageUI.PercentagePanel(CharacterCreation.panelData.opacity.lipstick, "Opacité", "0%", "100%", {
            onProgressChange = function(Percent)
                CharacterCreation.panelData.opacity.lipstick = Percent
                updateLipstick()
            end
        }, 5)
        RageUI.ColourPanel("Couleurs", CharacterCreation.colors_makeup, CharacterCreation.panelData.lipstick.index_one, CharacterCreation.panelData.lipstick.index_two, {
            onColorChange = function(MinimumIndex, CurrentIndex)
                CharacterCreation.panelData.lipstick.index_one = MinimumIndex
                CharacterCreation.panelData.lipstick.index_two = CurrentIndex
                updateLipstickColor()
            end
        }, 5)
    end)
end
local JobChoice = { { "Mineur", "Récolter et traiter les meilleurs minerais de toute la côte !" }, { "Bûcheron", "Prenez votre hâche et faites jaillir le québécois qui est en vous." }, { "Pêcheur", "Une Câne à pêche, prenez vous pour le commandant Coustaud !" } }
UnicornFridge = false
RMenu.Add('job', 'main', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('job', 'main'):SetSubtitle("Métier - Organisation")
RMenu:Get('job', 'main'):DisplayGlare(true);
RMenu.Add('job', 'alerts', RageUI.CreateSubMenu(RMenu:Get('job', 'main'), "Stalya", "Métier - Organisation"))
RMenu.Add('job', 'management', RageUI.CreateSubMenu(RMenu:Get('job', 'main'), "Stalya", "Métier - Organisation"))
RMenu.Add('job', 'rankmanagement', RageUI.CreateSubMenu(RMenu:Get('job', 'management'), "Stalya", "Métier - Organisation"))
RMenu.Add('job', 'createrank', RageUI.CreateSubMenu(RMenu:Get('job', 'rankmanagement'), "Stalya", "Métier - Organisation"))
RMenu.Add('job', 'createrankpermissions', RageUI.CreateSubMenu(RMenu:Get('job', 'createrank'), "Stalya", "Métier - Organisation"))
RMenu.Add('job', 'personnalmanagement', RageUI.CreateSubMenu(RMenu:Get('job', 'management'), "Stalya", "Métier - Organisation"))
RMenu.Add('job', 'information', RageUI.CreateSubMenu(RMenu:Get('job', 'main'), "Stalya", "Métier - Organisation"))
RMenu.Add('job', 'search', RageUI.CreateSubMenu(RMenu:Get('job', 'main'), "Stalya", "Métier - Organisation"))
RMenu:Get('job', 'search').Closed = function()
    TriggerServerEvent('Ms:ExitSearch')
end;
RMenu.Add('job', 'choice', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('job', 'choice'):SetSubtitle("Pôle Emplois")
RMenu:Get('job', 'choice'):DisplayGlare(true);
RMenu.Add('jobstorage', 'storage', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('jobstorage', 'storage'):SetSubtitle("Gestion du coffre")
RMenu:Get('jobstorage', 'storage'):DisplayGlare(true);
RMenu:Get('jobstorage', 'storage').Closed = function()
    TriggerServerEvent('Ms:ExitJobStorage')
end;
RMenu.Add('jobstorage', 'give', RageUI.CreateSubMenu(RMenu:Get('jobstorage', 'storage'), "Stalya", "Mettre dans le coffre"))
RMenu.Add('jobstorage', 'take', RageUI.CreateSubMenu(RMenu:Get('jobstorage', 'storage'), "Stalya", "Prendre dans le coffre"))
Keys.Register('F6', 'OpenJobMenu', 'Ouvrir le menu métier', function()
    if (IsOnKeyboardInput) then
        return
    end
    RageUI.Visible(RMenu:Get('job', 'main'), not RageUI.Visible(RMenu:Get('job', 'main')))
end)
local msJob = {
    newRankName = "",
    typeIndex = 1,
    legal = true,
    infoIndex = 1,
    searchIndex = 1,
    storageIndex = 1,
}
function RageUI.PoolMenus:JobStorage()
   RageUI.IsVisible(RMenu:Get('jobstorage', 'storage'), function()
        RageUI.Button("Prendre", nil, {}, true, {}, RMenu:Get('jobstorage', 'take'))
        RageUI.Button("Mettre", nil, {}, true, {}, RMenu:Get('jobstorage', 'give'))
    end)
    RageUI.IsVisible(RMenu:Get('jobstorage', 'take'), function()
        if not UnicornFridge then
            RageUI.List("Type", { "Inventaires", "Armes" }, msJob.storageIndex, nil, {}, true, {
                onListChange = function(Index)
                    msJob.storageIndex = Index
                end
            })
        end
        for k, v in pairs(JobStorage) do
            if UnicornFridge and StaticItemType(k) == 0 and v.Quantity > 0 and Objects[k].OnSale == 3 then
                RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                    onSelected = function(Index, Items)
                        local quantity = KeyboardInput(sf("Combien voulez-vous prendre de %s dans le frigidère ?", Objects[k].Name), 1, 8, true)
                        if quantity == nil or not math.tointeger(quantity) then
                            return
                        end
                        TriggerServerEvent('Ms:TakeItemInJobStorage', k, quantity)
                    end,
                })
            elseif not UnicornFridge then
                if msJob.storageIndex == 1 and StaticItemType(k) == 0 and v.Quantity > 0 and k ~= 2 then
                    print('tgtg')
                    RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                        onSelected = function(Index, Items)
                            local quantity = KeyboardInput(sf("Combien voulez-vous prendre de %s dans le coffre ?", Objects[k].Name), 1, 8, true)
                            if quantity == nil or not math.tointeger(quantity) then
                                return
                            end
                            TriggerServerEvent('Ms:TakeItemInJobStorage', k, quantity)
                        end,
                    })
                elseif msJob.storageIndex == 2 and StaticItemType(k) == 8 and v.Quantity > 0 then
                    RageUI.Button(sf('(%s) %s', v.Quantity, Weapons[WeaponProperties(k).type].Name), Weapons[WeaponProperties(k).type].Description, {}, true, {
                        onSelected = function(Index, Items)
                            local quantity = KeyboardInput(sf("Combien voulez-vous prendre de %s dans le coffre ?", Weapons[WeaponProperties(k).type].Name), 1, 8, true)
                            if quantity == nil or not math.tointeger(quantity) then
                                return
                            end
                            TriggerServerEvent('Ms:TakeItemInJobStorage', k, quantity)
                        end,
                    })
                end
            end
        end
    end)
        RageUI.IsVisible(RMenu:Get('jobstorage', 'give'), function()
        RageUI.List("Type", { "Inventaires", "Armes" }, msJob.storageIndex, nil, {}, true, {
            onListChange = function(Index)
                msJob.storageIndex = Index
            end
        })
        for k, v in pairs(Character.Inventory) do
            if msJob.storageIndex == 1 and StaticItemType(k) == 0 and v.Quantity > 0 and k ~= 2 then
                RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                    onSelected = function(Index, Items)
                        local quantity = KeyboardInput(sf("Combien voulez-vous poser de %s dans le coffre ?", Objects[k].Name), 1, 8, true)
                        if quantity == nil or not math.tointeger(quantity) then return end
                        TriggerServerEvent('Ms:PutItemInJobStorage', k, quantity)
                    end,
                })
            elseif msJob.storageIndex == 2 and StaticItemType(k) == 8 and v.Quantity > 0 then
                RageUI.Button(sf('(%s) %s', v.Quantity, Weapons[WeaponProperties(k).type].Name), Weapons[WeaponProperties(k).type].Description, {}, true, {
                    onSelected = function(Index, Items)
                        local quantity = KeyboardInput(sf("Combien voulez-vous poser de %s dans le coffre ?", Weapons[WeaponProperties(k).type].Name), 1, 8, true)
                        if quantity == nil or not math.tointeger(quantity) then return end
                        TriggerServerEvent('Ms:PutItemInJobStorage', k, quantity)
                    end,
                })
            end
        end
    end)
function RageUI.PoolMenus:Job()
    RageUI.IsVisible(RMenu:Get('job', 'main'), function()
        RageUI.List("Type", { "Métier", "Organistation" }, msJob.typeIndex, nil, {}, true, {
            onListChange = function(Index)
                msJob.typeIndex = Index
                msJob.legal = not msJob.legal
            end
        })
        local job, rank = Utils:GetCharacterJob(Character, msJob.legal)
        if job ~= nil and rank ~= nil then
            RageUI.Button(sf("%s - %s", job.Name, rank.Name), nil, {}, true, {})
            if msJob.legal and job.Id == 1 or msJob.legal and job.Id == 2 or msJob.legal and job.Id == 14 then
                RageUI.Button("Alertes", nil, {}, true, {}, RMenu:Get('job', 'alerts'))
            end
            if msJob.legal and job.Id ~= 3 or msJob.legal and job.Id ~= 4 or msJob.legal and job.Id ~= 5 then
                RageUI.Button(job.Id == 1 and "Mettre une amende" or "Créer une facture", nil, {}, true, {
                    onSelected = function()
                        local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0)))
                        if player ~= nil and player ~= 0 then
                            local price = KeyboardInput("Veuillez saisir un montant", '10', 4, true)
                            if price ~= nil then
                                TriggerServerEvent('Ms:CreateInvoice', player, price)
                            end
                        else
                            Visual.ShowNotify({
                                title = "Stalya",
                                subtitle = "~r~Action impossible",
                                message = "La personne doit être devant vous.",
                                dict = "stalya",
                                name = "logo_blue",
                                icon = 7
                            })
                        end
                    end,
                    onActive = function()
                        local ped = Utils:GetEntityInFront(12, 1.0)
                        if ped ~= nil and ped ~= 0 then
                            Utils:DrawMarkerAbodeCoords(ped)
                        end
                    end
                })
            end
            if Utils:CharacterHasPermForJob(Character, job.Id, 3) or Utils:CharacterHasPermForJob(Character, job.Id, 4) or Utils:CharacterHasPermForJob(Character, job.Id, 5) or Utils:CharacterHasPermForJob(Character, job.Id, 6) or Utils:CharacterHasPermForJob(Character, job.Id, 7) then
                RageUI.Button("Gestion d'entreprise", nil, {}, true, {}, RMenu:Get('job', 'management'))
            end
            if job.Id == 1 then
                RageUI.Button("Escorter", nil, {}, true, {
                    onSelected = function()
                        local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0)))
                        if player ~= nil and player ~= 0 then
                            TriggerServerEvent('Ms:EscortPlayer', player)
                        else
                            Visual.ShowNotify({
                                title = "Stalya",
                                subtitle = "~r~Action impossible",
                                message = "La personne doit être devant vous.",
                                dict = "stalya",
                                name = "logo_blue",
                                icon = 7
                            })
                        end
                    end,
                    onActive = function()
                        local ped = Utils:GetEntityInFront(12, 1.0)
                        if ped ~= nil and ped ~= 0 then
                            Utils:DrawMarkerAbodeCoords(ped)
                        end
                    end
                })
            end
            if job.Id == 16 then
                RageUI.Button("Gestion du véhicule", nil, {}, true, {
                    onSelected = function()
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        if vehicle ~= 0 then
                            local driver = GetPedInVehicleSeat(vehicle, -1)
                            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), vector3(-215.6047, -1327.195, 30.8904), true)
                            if PlayerPedId() == driver and distance <= 12.0 then
                                RageUI.OpenSubmenu(RMenu:Get('mechanic', 'walymain'))
                            else
                                Visual.ShowNotify({
                                    title = "Stalya",
                                    subtitle = "~r~Action impossible",
                                    message = "Vous devez être à l'intérieur du benny's et dans un véhicule.",
                                    dict = "stalya",
                                    name = "logo_blue",
                                    icon = 7
                                })
                            end
                        end
                    end,
                })
                RageUI.Button("Réparer", nil, {}, true, {
                    onSelected = function()
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        if vehicle ~= nil then
                            SetVehicleFixed(vehicle)
                        else
                            Visual.ShowNotify({
                                title = "Stalya",
                                subtitle = "~r~Action impossible",
                                message = "Vous devez être à l'intérieur d'un véhicule.",
                                dict = "stalya",
                                name = "logo_blue",
                                icon = 7
                            })
                        end
                    end,
                })
            end
            for k, v in pairs(PERMISSIONS) do
                if Utils:CharacterHasPermForJob(Character, job.Id, k) and v.IsShowOnPanel then
                    RageUI.Button(v.Name, nil, {}, true, {
                        onSelected = function()
                            local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0)))
                            if k == 10 then
                                if player ~= nil and player ~= 0 then
                                    TriggerServerEvent('Ms:HandcuffPlayer', player)
                                end
                            end
                            if k == 23 then
                                if player ~= nil and player ~= 0 then
                                    local NetVeh = VehToNet(Utils:GetEntityInFront(2, 1.0))
                                    if NetVeh ~= 0 then
                                        TriggerServerEvent('Ms:PutInVehicle', player, NetVeh)
                                    end
                                end
                            end
                            if k == 24 then
                                if player ~= nil and player ~= 0 then
                                    TriggerServerEvent('Ms:GetInformation', player)
                                    RageUI.OpenSubmenu(RMenu:Get('job', 'information'))
                                end
                            end
                            if k == 19 then
                                if player ~= nil and player ~= 0 then
                                    TriggerServerEvent('Ms:EmsRevivePlayer', player)
                                end
                            end
                            if k == 12 then
                                if player ~= nil and player ~= 0 then
                                    TriggerServerEvent('Ms:SearchPlayer', player)
                                end
                            end
                        end,
                        onActive = function()
                            local ped = Utils:GetEntityInFront(12, 1.0)
                            if k == 10 or k == 19 or k == 24 or k == 12 then
                                if ped ~= nil and ped ~= 0 then
                                    Utils:DrawMarkerAbodeCoords(ped)
                                end
                            end
                        end
                    })
                end
            end
            RageUI.Button(sf("Quitter son %s", msJob.legal and "métier" or "organisation"), nil, {}, true, {
                onSelected = function()
                    local choice = KeyboardInput("Veuillez valider votre action (~g~Y~w~/~r~N~w~)", "N", 1, false)
                    if choice ~= nil and string.lower(choice) == "y" then
                        TriggerServerEvent('Ms:LeaveJob', job.Id)
                    end
                end
            })
        else
            RageUI.Button(msJob.legal and "Aucun" or "Aucune", nil, {}, false, {})
        end
    end)
    RageUI.IsVisible(RMenu:Get('job', 'alerts'), function()
        local job, rank = Utils:GetCharacterJob(Character, true)
        if job ~= nil then
            for k, v in pairs(JobAlerts) do
                RageUI.List("Alerte #" .. k, { "Prendre", "Supprimer" }, v.Index or 1, sf("Date : %s\nMessage : %s", v.date, v.message), {}, true, {
                    onListChange = function(Index)
                        v.Index = Index
                    end,
                    onSelected = function()
                        if v.Index == nil or v.Index == 1 then
                            SetNewWaypoint(v.coords.x, v.coords.y)
                            TriggerServerEvent('Ms:PutAlerts', v)
                        else
                            table.remove(JobAlerts, k)
                        end
                    end
                })
            end
        end
    end)
     RageUI.IsVisible(RMenu:Get('job', 'management'), function()
        local job, rank = Utils:GetCharacterJob(Character, msJob.legal)
        if Utils:CharacterHasPermForJob(Character, job.Id, 3) then
            RageUI.Button("Gestion des rangs", nil, {}, true, {}, RMenu:Get('job', 'rankmanagement'))
        end
        if Utils:CharacterHasPermForJob(Character, job.Id, 5) or Utils:CharacterHasPermForJob(Character, job.Id, 6) or Utils:CharacterHasPermForJob(Character, job.Id, 7) then
            RageUI.Button("Gestion du personnel", nil, {}, true, {}, RMenu:Get('job', 'personnalmanagement'))
        end
        if Utils:CharacterHasPermForJob(Character, job.Id, 4) then
            RageUI.Button("Recruter", nil, {}, true, {
                onSelected = function()
                    local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0)))
                    if player ~= nil and player ~= 0 then
                        TriggerServerEvent('Ms:RecruitJob', player, job.Id)
                    end
                end,
                onActive = function()
                    local ped = Utils:GetEntityInFront(12, 1.0)
                    if ped ~= nil and ped ~= 0 then
                        Utils:DrawMarkerAbodeCoords(ped)
                    end
                end
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('job', 'personnalmanagement'), function()
        local job, rank, bla, blo = Utils:GetCharacterJob(Character, msJob.legal)
        for k, v in pairs(CharactersJobs) do
            local vJob, vRank, vRankId, vKey = Utils:GetCharacterJob(v, msJob.legal)
            if vJob ~= nil and vJob.Id == job.Id then
                RageUI.List(sf("%s %s", v.Identity.firstname, v.Identity.lastname), GetBlablaName(job), v.index or 1, sf("Rang : %s", vRank.Name), {}, true, {
                    onSelected = function()
                        TriggerServerEvent('Ms:WtfZeubi', job.Id, v.Id, v.index or 1)
                    end,
                    onListChange = function(Index)
                        v.index = Index
                    end
                })
            end
        end
    end)
     RageUI.IsVisible(RMenu:Get('job', 'rankmanagement'), function()
        local job, rank = Utils:GetCharacterJob(Character, msJob.legal)
        for k, v in pairs(job.Ranks) do
            RageUI.List(sf("%s", v.Name), { "Editer", "Supprimer" }, v.index or 1, nil, {}, true, {
                onSelected = function()
                end,
                onListChange = function(Index)
                    v.index = Index
                end
            })
        end
        RageUI.Button("Créer un nouveau rang", nil, {}, true, {}, RMenu:Get('job', 'createrank'))
    end)
    RageUI.IsVisible(RMenu:Get('job', 'createrank'), function()
        RageUI.Button("Nom :", nil, { RightLabel = msJob.newRankName }, true, {
            onSelected = function()
                msJob.newRankName = KeyboardInput("Entrer un nom pour le nouveau rang", msJob.newRankName, 30, false)
            end
        })
        RageUI.Button("Permissions", nil, {}, true, {}, RMenu:Get('job', 'createrankpermissions'))
        RageUI.Button("Créer le rang", nil, {}, true, {
            onSelected = function()
                local job, rank = Utils:GetCharacterJob(Character, msJob.legal)
                if msJob.newRankName ~= "" and CheckedTE() then
                    local data = {
                        jobId = job.Id,
                        name = msJob.newRankName,
                        permissions = PERMISSIONS,
                    }
                    TriggerServerEvent('Ms:CreateJobRank', data)
                    for k, v in pairs(PERMISSIONS) do
                        v.Checked = false
                    end
                    msJob.newRankName = ""
                end
            end
        })
    end)
    RageUI.IsVisible(RMenu:Get('job', 'createrankpermissions'), function()
        local job, rank = Utils:GetCharacterJob(Character, msJob.legal)
        for k, v in pairs(PERMISSIONS) do
            if Utils:CharacterHasPermForJob(Character, job.Id, k) then
                RageUI.Checkbox(v.Name, nil, v.Checked, {}, {
                    onChecked = function()
                        v.Checked = true
                    end,
                    onUnChecked = function()
                        v.Checked = false
                    end,
                })
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('job', 'choice'), function()
        for k, v in pairs(JobChoice) do
            RageUI.Button(v[1], v[2], { }, true, {
                onSelected = function()
                    local txt = KeyboardInput("Veuillez confirmer votre choix (~g~Y~w~/~r~N~w~)", 'Y', 3, false)
                    if txt ~= nil and string.lower(txt) == "y" then
                        TriggerServerEvent('Ms:ChoiceJob', k)
                    end
                end
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('job', 'information'), function()
        if JobTargetInfo.Identity ~= nil then
            RageUI.Button('Informations', sf('Nom / Prénom : ~y~%s %s~w~\nÂge : ~o~%s~w~\nMétier : ~b~%s %s~w~', JobTargetInfo.Identity.lastname, JobTargetInfo.Identity.firstname, JobTargetInfo.Identity.age, JobTargetInfo.JobName, JobTargetInfo.RankName), {}, true, {})
        end
        RageUI.List("Type", { "Aucun", "Factures impayés", "Permis" }, msJob.infoIndex, nil, {}, true, {
            onListChange = function(Index)
                msJob.infoIndex = Index
            end
        })
        if msJob.infoIndex == 2 then
            if JobTargetInfo.Invoices ~= nil then
                for k, v in pairs(JobTargetInfo.Invoices) do
                    if not v.Paid then
                        RageUI.Button(sf("Facture #%s", k), sf("Entreprise : ~b~%s~w~~n~Auteur : ~y~%s~w~~n~Prix : ~g~%s$~w~~n~Date : ~o~%s~w~", v.JobName, v.AuthorName, v.Price, v.Date), {}, true, {})
                    end
                end
            else
                RageUI.Button("Aucune factures impayés", nil, {}, false, {})
            end
        elseif msJob.infoIndex == 3 then
            RageUI.Button('Indisponible', '~r~Fonctionnalité à venir très prochainement !', {}, false, {})
        else
        end
    end)
    RageUI.IsVisible(RMenu:Get('job', 'search'), function()
        Visual.Subtitle('~r~Vous êtes entrain de fouiller.')
        RageUI.List("Type", { "Inventaires", "Armes" }, msJob.searchIndex, nil, {}, true, {
            onListChange = function(Index)
                msJob.searchIndex = Index
            end
        })
        if Character.SearchInventory.Content ~= nil then
            for k, v in pairs(Character.SearchInventory.Content) do
                if msJob.searchIndex == 1 then
                    if StaticItemType(k) == 0 and v.Quantity > 0 and k ~= 2 then
                        RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                            onSelected = function(Index, Items)
                                local quantity = KeyboardInput(sf("Veuillez sélectionner une quantiter.", Objects[k].Name), 1, 4, true)
                                if quantity == nil or not math.tointeger(quantity) then return end
                                TriggerServerEvent('Ms:TakeItemInOtherInvenory', k, quantity)
                            end,
                        })
                    end
                elseif msJob.searchIndex == 2 and StaticItemType(k) == 8 and v.Quantity > 0 then
                    RageUI.Button(sf('(%s) %s', v.Quantity, Weapons[WeaponProperties(k).type].Name), Weapons[WeaponProperties(k).type].Description, {}, true, {
                        onSelected = function(Index, Items)
                            Visual.ShowNotify({
                                title = "Stalya",
                                subtitle = "~r~Information",
                                message = "Vous ne pouvez pas prendre d'armes.",
                                dict = "stalya",
                                name = "logo_blue",
                                icon = 7
                            })
                        end,
                    })
                end
            end
        end
    end)
end
end
function CheckedTE()
    for k, v in pairs(PERMISSIONS) do
        if v.Checked then
            return true
        end
    end
    return false
end
function GetBlablaName(job)
    local result = {}
    if Utils:CharacterHasPermForJob(Character, job.Id, 6) then
        table.insert(result, "Promouvoir")
    end
    if Utils:CharacterHasPermForJob(Character, job.Id, 7) then
        table.insert(result, "Retrograder")
    end
    if Utils:CharacterHasPermForJob(Character, job.Id, 4) then
        table.insert(result, "Exclure")
    end
    return result
end
RMenu.Add('mechanic', 'walymain', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('mechanic', 'walymain'):SetSubtitle("Mécanicien")
RageUI.SetClosableTypeOfMenu(RMenu:Get('mechanic', 'walymain'))
RMenu.Add('mechanic', 'main', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'walymain'), "Stalya", "Mécanicien"))
RMenu.Add('mechanic', 'invoices', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'main'), "Stalya", "Facturations"))
RMenu.Add('mechanic', 'performance', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'main'), "Stalya", "Performance"))
RMenu.Add('mechanic', 'wperformance', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'performance'), "Stalya", "Performance"))
RMenu.Add('mechanic', 'colors', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'main'), "Stalya", "Couleurs"))
RMenu.Add('mechanic', 'colorsindex', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'colors'), "Stalya", "Couleurs"))
RMenu.Add('mechanic', 'wcolors', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'colorsindex'), "Stalya", "Couleurs"))
RMenu.Add('mechanic', 'appearance', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'main'), "Stalya", "Apparence"))
RMenu.Add('mechanic', 'wappearance', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'appearance'), "Stalya", "Apparence"))
RMenu.Add('mechanic', 'wheels', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'main'), "Stalya", "Roues"))
RMenu.Add('mechanic', 'wwheels', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'wheels'), "Stalya", "Roues"))
RMenu.Add('mechanic', 'lighting', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'main'), "Stalya", "Éclairage"))
RMenu.Add('mechanic', 'headlights', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'lighting'), "Stalya", "Phares"))
RMenu.Add('mechanic', 'neon', RageUI.CreateSubMenu(RMenu:Get('mechanic', 'lighting'), "Stalya", "Kits néon"))
RMenu:Get('mechanic', 'neon').EnableMouse = true
local mechanicSex = {
    VehicleId = 0,
    GameTimer = 0,
    NetId = 0,
    Data = {},
}
local vehlyptus = {
    mods = {},
    neon = {},
    colors = {},
    wheels = {},
}
local walyptusMechanic = {
    dad = {
        [11] = {
            name = "Moteur",
            mods = { "Reprog moteur Niv.1", "Reprog moteur Niv.2", "Reprog moteur Niv.3", "Reprog moteur Niv.4" },
            price = { 100, 200, 400, 800 }
        },
        [12] = {
            name = "Freins",
            mods = { "Freins de série", "Freins de rue", "Freins de sport", "Freins de course" },
            price = { 100, 200, 400, 800 }
        },
        [13] = {
            name = "Transmission",
            mods = { "Transmission de série", "Transmission de rue", "Transmission de sport", "Transmission de course" },
            price = { 100, 200, 400, 800 }
        },
        [15] = {
            name = "Suspension",
            mods = { "Suspension de série", "Suspension rabaissée", "Suspension de rue", "Suspension de sport", "Suspension de compétition", "Suspension de course" },
            price = { 100, 200, 400, 800, 1200, 1400 }
        },
        [22] = {
            name = "Phares",
            mods = { "Phares de série", "Phares au xénon", "Phares blancs", "Phares bleus", "Phares bleu électrique", "Phares vert menthe", "Phares vert lime", "Phares jaunes", "Phares fièvre jaune", "Phares orange", "Phares rouges", "Phares rose bonbon", "Phares rose vif", "Phares mauves", "Phares lumière noire" },
            price = { 25, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 }
        },
    },
    brother = {},
    sister = {
        current = 0,
        curColors = "Chrome",
        colorsIndex = 0,
        category = {}
    },
    colors = {
        ["Chrome"] = {
            { "Chrome", 120 }
        },
        ["Classique"] = {
            { "Noir", 0 },
            { "Noir Carbone", 147 },
            { "Graphite", 1 },
            { "Anthracite", 11 },
            { "Acier noir", 2 },
            { "Acier foncé", 3 },
            { "Argent", 4 },
            { "Argent bleuté", 5 },
            { "Acier laminé", 6 },
            { "Argent sombre", 7 },
            { "Argent pierre", 8 },
            { "Argent nocturne", 9 },
            { "Argent béton", 10 },
            { "Rouge", 27 },
            { "Rouge Torino", 28 },
            { "Rouge Formula", 29 },
            { "Rouge lave", 150 },
            { "Rouge flamme", 30 },
            { "Rouge gracieux", 31 },
            { "Rouge grenat", 32 },
            { "Rouge solaire", 33 },
            { "Rouge cabernet", 34 },
            { "Rouge sang", 143 },
            { "Rouge fraise", 35 },
            { "Rose vif", 135 },
            { "Rose Pfister", 137 },
            { "Saumon", 136 },
            { "Orange profond", 36 },
            { "Orange", 38 },
            { "Orange vif", 138 },
            { "Or", 99 },
            { "Bronze", 90 },
            { "Jaune", 88 },
            { "Jaune racing", 89 },
            { "Jaune pâle", 91 },
            { "Vert foncé", 49 },
            { "Vert racing", 50 },
            { "Vert marin", 51 },
            { "Vert olive", 52 },
            { "Vert clair", 53 },
            { "Vert petrole", 54 },
            { "Vert lime", 92 },
            { "Bleu nocturne", 141 },
            { "Bleu galaxie", 61 },
            { "Bleu foncé", 62 },
            { "Bleu cobalt", 63 },
            { "Bleu", 64 },
            { "Bleu ciel", 65 },
            { "Bleu ardoise", 66 },
            { "Bleu diamant", 67 },
            { "Bleu écume", 68 },
            { "Bleu nautique", 69 },
            { "Bleu racing", 73 },
            { "Bleu ultra", 70 },
            { "Bleu clair", 74 },
            { "Chocolat", 96 },
            { "Brun bison", 101 },
            { "Brun beige", 95 },
            { "Brun Feltzer", 94 },
            { "Brun érable ", 97 },
            { "Brun cannelle", 103 },
            { "Terre de sienne", 104 },
            { "Beige", 98 },
            { "Brun vert", 100 },
            { "Brun hêtre", 102 },
            { "Brun paille", 99 },
            { "Brun sable", 105 },
            { "Beige clair", 106 },
            { "Mauve Schafter", 71 },
            { "Mauve Spinnaker", 72 },
            { "Mauve nocturne", 142 },
            { "Mauve brillant", 145 },
            { "Crème", 107 },
            { "Blanc glâcé", 111 },
            { "Blanc givré", 112 }
        },
        ["Mat"] = {
            { "Noir", 12 },
            { "Gris", 13 },
            { "Gris clair", 14 },
            { "Blanc glacier", 131 },
            { "Bleu", 83 },
            { "Bleu foncé", 82 },
            { "Bleu nocturne", 84 },
            { "Mauve nocturne", 149 },
            { "Mauve Schafter", 148 },
            { "Rouge", 39 },
            { "Rouge foncé", 40 },
            { "Orange", 41 },
            { "Jaune", 42 },
            { "Vert lime", 55 },
            { "Vert", 128 },
            { "Vert forêt", 151 },
            { "Vert feuillage", 155 },
            { "Vert olive", 152 },
            { "Terre sombre", 153 },
            { "Sable du désert", 155 }
        },
        ["Métaux"] = {
            { "Acier brossé", 117 },
            { "Acier Noir brossé", 118 },
            { "Aluminium brossé", 119 },
            { "Or pur ", 158 },
            { "Or brossé ", 159 }
        }
    },
    neon = {
        mods = {
            {
                name = "Aucun",
                toggle = { false, false, false, false },
                price = 50
            },
            {
                name = "Avant",
                toggle = { false, false, true, false },
                price = 100
            },
            {
                name = "Arrière",
                toggle = { false, false, false, true },
                price = 100
            },
            {
                name = "Côtés",
                toggle = { true, true, false, false },
                price = 150
            },
            {
                name = "Avant et arrière",
                toggle = { false, false, true, true },
                price = 200
            },
            {
                name = "Avant et côtès",
                toggle = { true, true, true, false },
                price = 250
            },
            {
                name = "Arrière et côtès",
                toggle = { true, true, false, true },
                price = 250
            },
            {
                name = "Avant, arrière et côtès",
                toggle = { true, true, true, true },
                price = 350
            },
        },
        colors = {
            index = {
                first = 1,
                second = 1
            },
            list = {
                { 153, 37, 50 },
                { 200, 57, 93 },
                { 189, 81, 108 },
                { 184, 99, 122 },
                { 166, 82, 107 },
                { 177, 67, 76 },
                { 127, 49, 51 },
                { 164, 100, 93 },
                { 193, 135, 121 },
                { 203, 160, 150 },
                { 198, 145, 143 },
                { 171, 111, 99 },
                { 176, 96, 80 },
                { 168, 76, 51 },
                { 180, 113, 120 },
                { 202, 127, 146 },
                { 237, 156, 190 },
                { 231, 117, 164 },
                { 222, 62, 129 },
                { 179, 76, 110 },
                { 113, 39, 57 },
                { 79, 31, 42 },
                { 170, 34, 47 },
                { 222, 32, 52 },
                { 207, 8, 19 },
                { 229, 84, 112 },
                { 220, 63, 181 },
                { 194, 39, 178 },
                { 160, 28, 169 },
                { 110, 24, 117 },
                { 115, 20, 101 },
                { 86, 22, 92 },
                { 109, 26, 157 },
                { 27, 55, 113 },
                { 29, 78, 167 },
                { 30, 116, 187 },
                { 33, 163, 206 },
                { 37, 194, 210 },
                { 35, 204, 165 },
                { 39, 192, 125 },
                { 27, 156, 50 },
                { 20, 134, 4 },
                { 112, 208, 65 },
                { 197, 234, 52 },
                { 225, 227, 47 },
                { 255, 221, 38 },
                { 250, 192, 38 },
                { 247, 138, 39 },
                { 254, 89, 16 },
                { 190, 110, 25 },
                { 247, 201, 127 },
                { 251, 229, 192 },
                { 245, 245, 245 },
                { 179, 180, 179 },
                { 145, 145, 145 },
                { 86, 78, 78 },
                { 24, 14, 14 },
                { 88, 150, 158 },
                { 77, 111, 140 },
                { 26, 43, 85 },
                { 160, 126, 107 },
                { 130, 99, 85 },
                { 109, 83, 70 },
                { 62, 45, 39 }
            }
        }
    }
}
local closestPeds = {}
function Utils:ababab(vehicle)
    vehlyptus = {
        mods = {},
        neon = {},
        colors = {},
        wheels = {},
    }
    if vehicle ~= 0 then ResetVehicleMods(vehicle, mechanicSex.Data) end
    mechanicSex = {
        VehicleId = 0,
        GameTimer = GetGameTimer(),
        NetId = 0,
        Data = {},
    }
    if vehicle ~= 0 then
        FreezeEntityPosition(vehicle, false)
        SetVehicleDoorsLocked(vehicle, 1)
    end
end
function RageUI.PoolMenus:Mechanic()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
     RageUI.IsVisible(RMenu:Get('mechanic', 'walymain'), function()
        local totalPrice = GetTotalPrice()
        RageUI.Button("Customiser le véhicule", nil, {}, GetGameTimer() > mechanicSex.GameTimer, {
            onSelected = function()
                TriggerServerEvent('Ms:RequestVehicleMods')
            end
        })
        if mechanicSex.VehicleId ~= 0 then
            RageUI.Button("Annuler les modifications", nil, {}, true, {
                onSelected = function()
                    local confirmation = KeyboardInput("Voulez-vous annuler les modifications ? (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if confirmation ~= nil and string.lower(confirmation) == "y" then
                        TriggerServerEvent('Ms:CancelMechanicModifications')
                    end
                end
            })
        end
        if totalPrice > 0 then
            RageUI.Button("Facturer les modifications", nil, {}, true, {
                onSelected = function()
                    closestPeds = GetPedInRange(vector3(GetEntityCoords(PlayerPedId())), 12.0)
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'invoices'))
                end
            })
        end
        RageUI.Button("Quitter le menu", "~r~Pour quitter le menu veuillez annuler toute modifications en cours.", {}, mechanicSex.VehicleId == 0, {
            onSelected = function()
                RageUI.CloseAll()
            end
        })
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'invoices'), function()
        RageUI.Button("Rafraichir la liste", nil, {}, true, {
            onSelected = function()
                closestPeds = GetPedInRange(vector3(GetEntityCoords(PlayerPedId())), 12.0)
            end
        })
        for k, v in pairs(closestPeds) do
            local ped = v.object
            local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
            if player ~= nil and ped ~= PlayerPedId() then
                local totalPrice = GetTotalPrice()
                RageUI.Button(ped, sf("Facture en cours : ~g~%s $~w~", totalPrice), {}, true, {
                    onActive = function()
                        Utils:DrawMarkerAbodeCoords(ped)
                    end,
                    onSelected = function()
                        local invoicePrice = KeyboardInput(sf("Combien voulez-vous facturer ~b~%s~w~ ?", ped), totalPrice, 5, true)
                        if invoicePrice ~= nil then
                            if invoicePrice <= totalPrice then
                                Visual.ShowNotify({
                                  title = "Stalya",
                                  subtitle = "~r~Action impossible",
                                  message = sf("Votre facture dois coûter plus chère que %s$.", totalPrice),
                                  dict = "stalya",
                                  name = "logo_blue",
                                  icon = 7
                              })
                            else
                                TriggerServerEvent('Ms:CreateMechanicInvoice', player, invoicePrice, vehlyptus, totalPrice)
                            end
                        end
                    end
                })
            end
        end
    end, function()
    end)
   RageUI.IsVisible(RMenu:Get('mechanic', 'main'), function()
        RageUI.Button("Performance", nil, {}, true, {}, RMenu:Get('mechanic', 'performance'))
        RageUI.Button("Couleurs", nil, {}, true, {}, RMenu:Get('mechanic', 'colors'))
        RageUI.Button("Apparence", nil, {}, true, {}, RMenu:Get('mechanic', 'appearance'))
        if GetVehicleNumberOfWheels(vehicle) > 2 then
            RageUI.Button("Roues", nil, {}, true, {}, RMenu:Get('mechanic', 'wheels'))
        end
        RageUI.Button("Éclairage", nil, {}, true, {}, RMenu:Get('mechanic', 'lighting'))
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'appearance'), function()
        for k, v in pairs(walyptusMechanic.brother) do
            if k ~= 11 and k ~= 12 and k ~= 13 and k ~= 15 and k ~= 22 and k ~= 23 then
                RageUI.Button(v.name, nil, {}, true, {
                    onSelected = function(Index)
                        walyptusMechanic.sister.current = k
                        RMenu:Get('mechanic', 'wappearance').Index = 1
                        RMenu:Get('mechanic', 'wappearance'):SetSubtitle(v.name)
                        RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wappearance'))
                    end
                })
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'wheels'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            RageUI.Button("Haut de gamme", nil, {}, true, {
                onSelected = function()
                    SetVehicleWheelType(vehicle, 7)
                    RMenu:Get('mechanic', 'wwheels').Index = 1
                    RMenu:Get('mechanic', 'wwheels'):SetSubtitle("Haut de gamme")
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wwheels'))
                end
            })
            RageUI.Button("Lowrider", nil, {}, true, {
                onSelected = function()
                    SetVehicleWheelType(vehicle, 2)
                    RMenu:Get('mechanic', 'wwheels').Index = 1
                    RMenu:Get('mechanic', 'wwheels'):SetSubtitle("Lowrider")
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wwheels'))
                end
            })
            RageUI.Button("Muscle car", nil, {}, true, {
                onSelected = function()
                    SetVehicleWheelType(vehicle, 1)
                    RMenu:Get('mechanic', 'wwheels').Index = 1
                    RMenu:Get('mechanic', 'wwheels'):SetSubtitle("Muscle car")
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wwheels'))
                end
            })
            RageUI.Button("Tout-terrain", nil, {}, true, {
                onSelected = function()
                    SetVehicleWheelType(vehicle, 4)
                    RMenu:Get('mechanic', 'wwheels').Index = 1
                    RMenu:Get('mechanic', 'wwheels'):SetSubtitle("Tout-terrain")
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wwheels'))
                end
            })
            RageUI.Button("Sport", nil, {}, true, {
                onSelected = function()
                    SetVehicleWheelType(vehicle, 0)
                    RMenu:Get('mechanic', 'wwheels').Index = 1
                    RMenu:Get('mechanic', 'wwheels'):SetSubtitle("Sport")
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wwheels'))
                end
            })
            RageUI.Button("SUV", nil, {}, true, {
                onSelected = function()
                    SetVehicleWheelType(vehicle, 3)
                    RMenu:Get('mechanic', 'wwheels').Index = 1
                    RMenu:Get('mechanic', 'wwheels'):SetSubtitle("SUV")
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wwheels'))
                end
            })
            RageUI.Button("Tuning", nil, {}, true, {
                onSelected = function()
                    SetVehicleWheelType(vehicle, 5)
                    RMenu:Get('mechanic', 'wwheels').Index = 1
                    RMenu:Get('mechanic', 'wwheels'):SetSubtitle("Tuning")
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wwheels'))
                end
            })
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'wwheels'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            for id = -1, GetNumVehicleMods(vehicle, 23) - 1 do
                local name = GetLabelText(GetModTextLabel(vehicle, 23, id))
                local enabled = true
                if vehlyptus.wheels.type == GetVehicleWheelType(vehicle) and vehlyptus.wheels.id == id then
                    enabled = false
                end
                RageUI.Button(name ~= "NULL" and name or "Jantes de série", nil, { RightLabel = sf("~g~%s $", "50") }, enabled, {
                    onActive = function()
                        SetVehicleMod(vehicle, 23, id, false)
                    end,
                    onSelected = function()
                        vehlyptus.wheels = { ["type"] = GetVehicleWheelType(vehicle), ["id"] = id }
                    end
                })
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'colors'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            RageUI.Button("Couleur principale", nil, {}, true, {
                onSelected = function()
                    walyptusMechanic.sister.colorsIndex = 1
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'colorsindex'))
                end
            })
            RageUI.Button("Couleur secondaire", nil, {}, true, {
                onSelected = function()
                    walyptusMechanic.sister.colorsIndex = 2
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'colorsindex'))
                end
            })
            RageUI.Button("Couleur du nacrage", nil, {}, true, {
                onSelected = function()
                    walyptusMechanic.sister.colorsIndex = 3
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'colorsindex'))
                end
            })
            RageUI.Button("Couleur des roues", nil, {}, true, {
                onSelected = function()
                    walyptusMechanic.sister.colorsIndex = 4
                    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'colorsindex'))
                end
            })
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'colorsindex'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            for k, v in pairs(walyptusMechanic.colors) do
                RageUI.Button(k, nil, {}, true, {
                    onSelected = function()
                        walyptusMechanic.sister.curColors = k
                        RMenu:Get('mechanic', 'wcolors').Index = 1
                        RMenu:Get('mechanic', 'wcolors'):SetSubtitle(k)
                        RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wcolors'))
                    end
                })
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'wcolors'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            local clrIndex = walyptusMechanic.sister.colorsIndex
            for _, v in pairs(walyptusMechanic.colors[walyptusMechanic.sister.curColors]) do
                RageUI.Button(v[1], nil, { RightLabel = sf("~g~%s $", "200") }, vehlyptus.colors[tostring(clrIndex)] ~= v[2], {
                    onActive = function(Index)
                        WalyptusColor(vehicle, clrIndex == 1 and v[2] or nil, clrIndex == 2 and v[2] or nil, clrIndex == 3 and v[2] or nil, clrIndex == 4 and v[2] or nil)
                    end,
                    onSelected = function()
                        vehlyptus.colors[tostring(clrIndex)] = v[2]
                    end
                })
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'performance'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            for k, v in pairs(walyptusMechanic.brother) do
                if k == 11 or k == 12 or k == 13 or k == 15 then
                    RageUI.Button(v.name, nil, {}, true, {
                        onSelected = function(Index)
                            walyptusMechanic.sister.current = k
                            RMenu:Get('mechanic', 'wperformance').Index = 1
                            RMenu:Get('mechanic', 'wperformance'):SetSubtitle(v.name)
                            RageUI.OpenSubmenu(RMenu:Get('mechanic', 'wperformance'))
                        end
                    })
                end
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
     RageUI.IsVisible(RMenu:Get('mechanic', 'wperformance'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            local current = walyptusMechanic.sister.current
            local numMods = GetNumVehicleMods(vehicle, current) + 1
            for k, v in pairs(walyptusMechanic.brother[current].mods) do
                if k <= numMods and current ~= 22 then
                    local price = walyptusMechanic.brother[current].price[k]
                    RageUI.Button(v, nil, { RightLabel = sf("~g~%s $", price) }, vehlyptus.mods[tostring(current)] ~= k, {
                        onActive = function(Index)
                            WalyptusMod(vehicle, current, k)
                        end,
                        onSelected = function()
                            vehlyptus.mods[tostring(current)] = k
                        end
                    })
                end
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'lighting'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            RageUI.Button("Phares", nil, {}, true, {}, RMenu:Get('mechanic', 'headlights'))
            RageUI.Button("Kits néon", nil, {}, true, {}, RMenu:Get('mechanic', 'neon'))
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'headlights'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            for id, name in pairs(walyptusMechanic.brother[22].mods) do
                local price = walyptusMechanic.brother[22].price[id]
                RageUI.Button(name, nil, { RightLabel = sf("~g~%s $", price) }, vehlyptus.mods["22"] ~= id, {
                    onActive = function()
                        WalyptusMod(vehicle, 22, id)
                    end,
                    onSelected = function()
                        vehlyptus.mods["22"] = id
                    end
                })
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'neon'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            for id, neon in pairs(walyptusMechanic.neon.mods) do
                RageUI.Button(neon.name, nil, { RightLabel = sf("~g~%s $", neon.price) }, vehlyptus.neon.id ~= id, {
                    onActive = function()
                        WalyptusNeon(vehicle, id)
                    end,
                    onSelected = function()
                        vehlyptus.neon.id = id
                    end
                })
            end
        end
    end, function()
        if vehicle ~= nil and vehicle ~= 0 then
            for index = 1, 8 do
                RageUI.ColourPanel("Couleurs", walyptusMechanic.neon.colors.list, walyptusMechanic.neon.colors.index.first, walyptusMechanic.neon.colors.index.second, {
                    onColorChange = function(MinimumIndex, CurrentIndex)
                        walyptusMechanic.neon.colors.index.first = MinimumIndex
                        walyptusMechanic.neon.colors.index.second = CurrentIndex
                        local r, g, b = table.unpack(walyptusMechanic.neon.colors.list[walyptusMechanic.neon.colors.index.second])
                        SetVehicleNeonLightsColour(vehicle, r, g, b)
                        vehlyptus.neon.color = { r = r, g = g, b = b }
                    end
                }, index)
            end
        end
        GetVehicleStatistics(vehicle)
    end)
    RageUI.IsVisible(RMenu:Get('mechanic', 'wappearance'), function()
        if vehicle ~= nil and vehicle ~= 0 then
            local current = walyptusMechanic.sister.current
            local numMods = GetNumVehicleMods(vehicle, current) + 1
            for k, v in pairs(walyptusMechanic.brother[current].mods) do
                if k <= numMods then
                    local price = walyptusMechanic.brother[current].price[k]
                    RageUI.Button(v, nil, { RightLabel = sf("~g~%s $", price) }, vehlyptus.mods[tostring(current)] ~= k, {
                        onActive = function(Index)
                            WalyptusMod(vehicle, current, k)
                        end,
                        onSelected = function()
                            vehlyptus.mods[tostring(current)] = k
                        end
                    })
                end
            end
        end
    end, function()
        GetVehicleStatistics(vehicle)
    end)
end
function GenerateVehicleMods()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 then
        walyptusMechanic.brother = {}
        vehlyptus = { mods = {}, neon = {}, colors = {}, wheels = {}, }
        for k, v in pairs(walyptusMechanic.dad) do
            walyptusMechanic.brother[k] = v
        end
        SetVehicleModKit(vehicle, 0)
        local wheelType, wheelId = GetVehicleWheelType(vehicle), GetVehicleMod(vehicle, 23)
        print(wheelType, wheelId)
        SetVehicleWheelType(wheelType)
        SetVehicleMod(vehicle, 23, wheelId, false)
        for i = 0, 49 do
            if i ~= 16 and i ~= 17 and i ~= 21 and i ~= 47 then
                local num = GetNumVehicleMods(vehicle, i)
                if num > 0 then
                    if walyptusMechanic.brother[i] == nil then
                        if i == 14 then
                            walyptusMechanic.brother[i] = {
                                name = "Klaxon",
                                mods = {},
                                price = {}
                            }
                            for ix = 0, num do
                                table.insert(walyptusMechanic.brother[i].mods, sf("Klaxon #%s", ix))
                                table.insert(walyptusMechanic.brother[i].price, 50)
                            end
                        else
                            walyptusMechanic.brother[i] = {
                                name = GetModSlotName(vehicle, i) ~= "" and GetModSlotName(vehicle, i) or sf("Customisation #%s", i),
                                mods = {},
                                price = {}
                            }
                            for ix = 0, num do
                                local name = GetLabelText(GetModTextLabel(vehicle, i, ix - 1))
                                table.insert(walyptusMechanic.brother[i].mods, name ~= "NULL" and name or "Par défaut")
                                table.insert(walyptusMechanic.brother[i].price, 150)
                            end
                        end
                    end
                end
            end
        end
    end
end
function WalyptusMod(vehicle, type, id)
    if type == 22 then
        ToggleVehicleMod(vehicle, type, id > 1 and true or false)
        SetVehicleXenonLightsColour(vehicle, id > 1 and id - 3 or -1)
    else
        SetVehicleMod(vehicle, type, id - 2, false)
    end
end
function WalyptusNeon(vehicle, neonId)
    local neon = walyptusMechanic.neon.mods[neonId]
    for id, toggle in pairs(neon.toggle) do
        SetVehicleNeonLightEnabled(vehicle, id - 1, toggle)
    end
end
function WalyptusColor(vehicle, a, b, c, d)
    local primary, secondary = GetVehicleColours(vehicle)
    local pearlescent, wheels = GetVehicleExtraColours(vehicle)
    SetVehicleColours(vehicle, a ~= nil and a or primary, b ~= nil and b or secondary)
    SetVehicleExtraColours(vehicle, c ~= nil and c or pearlescent, d ~= nil and d or wheels)
end
function GetVehicleStatistics(vehicle)
    RageUI.StatisticPanel(GetVehicleEstimatedMaxSpeed(vehicle) / 50, "Vitesse de pointe")
    RageUI.StatisticPanel(GetVehicleAcceleration(vehicle), "Accélération")
    RageUI.StatisticPanel(GetVehicleMaxBraking(vehicle) / 1.5, "Freinage")
    RageUI.StatisticPanel(GetVehicleMaxTraction(vehicle) / 4, "Tenue de route")
    if mechanicSex.VehicleId ~= 0 and not WaitMechanicResponse then
        Visual.Subtitle(sf('Facture en cours : ~g~%s $', GetTotalPrice()))
    end
end
function GetTotalPrice()
    local total = 0
    for k, v in pairs(vehlyptus.mods) do
        total = total + walyptusMechanic.brother[tonumber(k)].price[v]
    end
    for _, _ in pairs(vehlyptus.colors) do
        total = total + 200
    end
    if vehlyptus.wheels.id ~= nil then
        total = total + 50
    end
    local neonId = vehlyptus.neon.id
    if neonId ~= nil then
        total = total + walyptusMechanic.neon.mods[neonId].price
    end
    return total
end
function ResetVehicleMods(vehicle, data)
    for i = 0, 49 do
        SetVehicleMod(vehicle, i, -1, false)
        ToggleVehicleMod(vehicle, i, false)
    end
    for i = 0, 3 do
        SetVehicleNeonLightEnabled(vehicle, i, false)
    end
    Utils:ApplyVehicleData(vehicle, data)
end
RegisterNetEvent('Ms:RequestVehicleMods')
AddEventHandler('Ms:RequestVehicleMods', function(vehicle, netId)
    if not Utils:CharacterHasPermForJob(Character, 16, 22) then return end
    if GetGameTimer() < mechanicSex.GameTimer then return end
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= 0 and mechanicSex.VehicleId ~= vehicle.Id then
        mechanicSex.GameTimer = GetGameTimer() + 5000
        SetVehicleDoorsLocked(veh, 4)
        FreezeEntityPosition(veh, true)
        mechanicSex.VehicleId = vehicle.Id
        mechanicSex.Data = vehicle.Data
        mechanicSex.NetId = netId
        GenerateVehicleMods()
        local _, wheels = GetVehicleExtraColours(veh)
        if mechanicSex.Data.colors == nil then
            mechanicSex.Data.colors = {
                ["4"] = wheels
            }
        else
            if mechanicSex.Data.colors["4"] == nil then
                mechanicSex.Data.colors["4"] = wheels
            end
        end
    end
    RageUI.OpenSubmenu(RMenu:Get('mechanic', 'main'))
end)
RegisterNetEvent('Ms:MechanicSource')
AddEventHandler('Ms:MechanicSource', function(boolean)
    if not Utils:CharacterHasPermForJob(Character, 16, 22) then return end
    if boolean then
        WaitMechanicResponse = true
        GameTimer.Mechanic = GetGameTimer()
    else
        WaitMechanicResponse = false
        GameTimer.Mechanic = GetGameTimer()
    end
end)
RegisterNetEvent('Ms:MechanicApplyMods')
AddEventHandler('Ms:MechanicApplyMods', function(mods)
    if not Utils:CharacterHasPermForJob(Character, 16, 22) then return end
    WaitMechanicResponse = false
    GameTimer.Mechanic = GetGameTimer()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        Utils:ababab(vehicle)
        Utils:ApplyVehicleData(vehicle, mods)
    end
end)
RegisterNetEvent('Ms:MechanicTarget')
AddEventHandler('Ms:MechanicTarget', function(invoicePrice)
    local confirmation = KeyboardInput(sf("Voulez-vous payer la facture de %s$ ? (~g~Y~w~/~r~N~w~)", invoicePrice), 'N', 1, false)
    if confirmation ~= nil and string.lower(confirmation) == "y" then
        TriggerServerEvent('Ms:AcceptOrRefuseMechanicInvoice', true, invoicePrice)
    else
        TriggerServerEvent('Ms:AcceptOrRefuseMechanicInvoice', false, invoicePrice)
    end
end)
RegisterNetEvent('Ms:CancelMechanicModifications')
AddEventHandler('Ms:CancelMechanicModifications', function()
    if not Utils:CharacterHasPermForJob(Character, 16, 22) then return end
    local vehicle = NetToVeh(mechanicSex.NetId)
    if vehicle ~= 0 then
        Utils:ababab(vehicle)
    end
end)
math.randomseed(GetGameTimer())
local rarity = {
    [1] = {
        '2019rtr', 'acz4', 'cliors', 'foxgt2', 'foxmans2', 'g20b', 'rs7r', 'senna', 'cb500f', 'bronze'
    },
    [2] = {
        'gls20', 'kart', 'mb250', 'r820', 'rmodbugatti', 'rmodcamaro', 'gold',
    },
    [3] = {
        'rmode63s', 'rmodrs6', 'rmodsianr', 'diamant'
    }
}
local shop = {
    index = 1,
    Vip = {
        { "Bronze", "Bénéficiez de -15% de temps pour chaque traitement / récolte / ventes !~n~Bonus de 10% sur les salaires.", "~o~" },
        { "Gold", "Bénéficiez de -30% de temps pour chaque traitement / récolte / ventes !~n~Bonus de 20% sur les salaires.", "~y~" },
        { "Diamond", "Bénéficiez de -45% de temps pour chaque traitement / récolte / ventes !~n~Bonus de 30% sur les salaires.", "~b~" }
    },
    Vehicles = { VehiclesData = {} },
    time = {
        month = 2678400,
        day = 86400
    },
}
local pedIndex = 1
local picture2 = nil
local vehicleStorageIndex = 1
RMenu.Add('personal', 'main', RageUI.CreateMenu("Stalya", "Undefined for using SetSubtitle"))
RMenu:Get('personal', 'main'):SetSubtitle("Menu personnel")
RMenu.Add('personal', 'boutique', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Boutique"))
RMenu.Add('personal', 'informations', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Informations"))
RMenu.Add('personal', 'invoices', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Factures"))
RMenu.Add('personal', 'inventory', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Inventaire"))
RMenu.Add('personal', 'weapons', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Armes"))
RMenu.Add('personal', 'clothes', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Vêtements"))
RMenu.Add('personal', 'vehicle', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Véhicule"))
RMenu.Add('personal', 'peds', RageUI.CreateSubMenu(RMenu:Get('personal', 'boutique'), "Stalya", "Peds"))
RMenu.Add('personal', 'administration', RageUI.CreateSubMenu(RMenu:Get('personal', 'main'), "Stalya", "Adminstration"))
RMenu.Add('administration', 'reports', RageUI.CreateSubMenu(RMenu:Get('personal', 'administration'), "Stalya", "Liste des reports"))
RMenu.Add('administration', 'characters', RageUI.CreateSubMenu(RMenu:Get('personal', 'administration'), "Stalya", "Liste des joueurs"))
RMenu.Add('administration', 'customisation', RageUI.CreateSubMenu(RMenu:Get('personal', 'administration'), "Stalya", "Customisation"))
RMenu.Add('characters', 'view', RageUI.CreateSubMenu(RMenu:Get('administration', 'characters'), "Stalya", "Liste des joueurs"))
RMenu.Add('characters', 'ban', RageUI.CreateSubMenu(RMenu:Get('characters', 'view'), "Stalya", "Raisons des bannissements"))
RMenu.Add('vehiclestorage', 'main', RageUI.CreateMenu("Stalya", "Undefined for using SetSubtitle"))
RMenu:Get('vehiclestorage', 'main'):SetSubtitle("Coffre du véhicule")
RMenu:Get('vehiclestorage', 'main').Closed = function()
    TriggerServerEvent('Ms:ExitStorage')
end
RMenu.Add('vehiclestorage', 'give', RageUI.CreateSubMenu(RMenu:Get('vehiclestorage', 'main'), "Stalya", "Mettre dans le coffre"))
RMenu.Add('vehiclestorage', 'take', RageUI.CreateSubMenu(RMenu:Get('vehiclestorage', 'main'), "Stalya", "Prendre dans le coffre"))
RMenu.Add('ems', 'main', RageUI.CreateMenu("Stalya", "Undefined for using SetSubtitle"))
RMenu:Get('ems', 'main'):SetSubtitle("Vous êtes dans le coma")
RageUI.SetClosableTypeOfMenu(RMenu:Get('ems', 'main'))
RMenu:Get('personal', 'peds').Closed = function(Index)
    FreezeEntityPosition(PlayerPedId(), false)
    if Character.CustomModel == "" then
        local model = GetHashKey(Character.Model)
        Utils:RequestModel(model)
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(model)
        NetworkSetFriendlyFireOption(true)
        SetCanAttackFriendly(PlayerPedId(), true, true)
        SetMaxWantedLevel(0)
        SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
        Utils:ApplySkin(Character.Skin)
        ClearPedDecorations(ped)
        for k, v in pairs(Character.Tattoos) do
            Utils:ApplyTattoos(v)
        end
        for k, v in pairs(Character.EquippedClothes) do
            Utils:ClothEquip(v, k)
        end
    end
end
RMenu.Add('lootbox', 'main', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('lootbox', 'main'):SetSubtitle("Caisse")
RageUI.SetClosableTypeOfMenu(RMenu:Get('lootbox', 'main'))
Keys.Register('F5', 'OpenMenu', 'Ouvrir le menu personel.', function()
    if (IsOnKeyboardInput) then
        return
    end
    RageUI.Visible(RMenu:Get('personal', 'main'), not RageUI.Visible(RMenu:Get('personal', 'main')))
end)
Keys.Register('U', 'OpenVehicleStorage', "Ouvrir le coffre d'un véhicule.", function()
    if (IsOnKeyboardInput) then
        return
    end
    local vehicle = VehToNet(Utils:GetEntityInFront(2, 0.15))
    if vehicle == nil or vehicle == 0 then
        Visual.ShowNotify({
            title = "Stalya",
            subtitle = "~r~Action impossible",
            message = "Aucun véhicule trouvée.",
            dict = "stalya",
            name = "logo_blue",
            icon = 7
        })
        return
    end
    TriggerServerEvent('Ms:GetStorage', vehicle)
end)
Keys.Register('K', 'OpenCloseVehicle', 'Ouvrir / fermer votre véhicule.', function()
    if (IsOnKeyboardInput) then
        return
    end
    local vehiclesInRange = GetVehicleInRange(vector3(GetEntityCoords(PlayerPedId())), 10.0)
    local result = {}
    for k, v in pairs(vehiclesInRange) do
        local netId = VehToNet(v.object)
        table.insert(result, netId)
    end
    TriggerServerEvent('Ms:LockClosestVehicle', result)
end)
local personnalOptions = {
    kickVehicleIndex = 1
}
function GetTextFromWeaponUId(weaponUId)
    local label = sf("%s\n", Weapons[WeaponProperties(weaponUId).type].Description)
    for a, b in pairs(Weapons[WeaponProperties(weaponUId).type].Components) do
        for c, d in pairs(WeaponProperties(weaponUId).accessories) do
            if d == b.Id then
                label = sf("%s\n+ ~g~%s~w~", label, b.Name)
            end
        end
    end
    for a, b in pairs(Weapons[WeaponProperties(weaponUId).type].Tints) do
        if WeaponProperties(weaponUId).paint == b.Id then
            label = sf("%s\n+ ~g~%s~w~", label, b.Name)
        end
    end
    return label
end
function GetWeaponsByCategory(Group)
    local result = {}
    for k, v in ipairs(Weapons) do
        if (v.Group == Group and v.ForSale) then
            table.insert(result, v)
        end
    end
    return result
end
function CreateWeaponFromWeaponUId(weaponUId)
    if Utils:CharacterHaveWeapon(weaponUId) then
        local weaponHash = GetHashKey(Weapons[WeaponProperties(weaponUId).type].HashKey)
        GiveWeaponToPed(PlayerPedId(), weaponHash, 250)
        for a, b in pairs(Weapons[WeaponProperties(weaponUId).type].Components) do
            for c, d in pairs(WeaponProperties(weaponUId).accessories) do
                if d == b.Id then
                    GiveWeaponComponentToPed(PlayerPedId(), weaponHash, GetHashKey(b.HashKey))
                end
            end
        end
        local tint = WeaponProperties(weaponUId).paint
        if tint ~= nil and tint ~= 0 then
            SetPedWeaponTintIndex(PlayerPedId(), weaponHash, WeaponProperties(weaponUId).paint - 1)
        end
    end
end
function RemoveWeaponFromWeaponUId(weaponUId)
    if Utils:CharacterHaveWeapon(weaponUId) then
        local weaponHash = GetHashKey(Weapons[WeaponProperties(weaponUId).type].HashKey)
        RemoveWeaponFromPed(PlayerPedId(), weaponHash)
    end
end
function Utils:CharacterHaveWeapon(weaponUId)
    for k, v in pairs(Character.Inventory) do
        if k == weaponUId and v.Quantity > 0 then
            return true
        end
    end
    return false
end
RegisterNetEvent('Ms:OpenLootbox')
AddEventHandler('Ms:OpenLootbox', function(animations, name)
    RageUI.CloseAll()
    RageUI.Visible(RMenu:Get('lootbox', 'main'), true)
    Citizen.CreateThread(function()
        Citizen.Wait(250)
        for k, v in pairs(animations) do
            picture2 = v.name
            if v.time == 5000 then
                Visual.ShowNotify({
                  title = "Stalya",
                  subtitle = "Félicitations !",
                  message = name,
                  dict = "stalya",
                  name = "logo_blue",
                  icon = 7
              })
            end
            Citizen.Wait(v.time)
        end
        picture2 = nil
        RageUI.CloseAll()
    end)
end)
function RageUI.PoolMenus:Personal()
    local time, bool, picture = 100, false, nil
     RageUI.IsVisible(RMenu:Get('lootbox', 'main'), function()
    end, function()
        if picture2 ~= nil then
            RageUI.PicturePreview(picture2)
        end
    end)
    RageUI.IsVisible(RMenu:Get('ems', 'main'), function()
        RageUI.Button('Appeler un E.M.S', nil, {}, true, {
            onSelected = function(Index, Items)
                TriggerServerEvent('Ms:CallEMS')
            end,
        })
        RageUI.Button("Réapparaitre a l'hopital", nil, { RightLabel = "~g~5$" }, true, {
            onSelected = function(Index, Items)
                TriggerServerEvent('Ms:RespawnHospital')
            end,
        })
    end)
    RageUI.IsVisible(RMenu:Get('vehiclestorage', 'main'), function()
        RageUI.Button('Mettre', nil, {}, true, {
            onSelected = function(Index, Items)
            end,
        }, RMenu:Get('vehiclestorage', 'give'))
        RageUI.Button('Prendre', nil, {}, true, {
            onSelected = function(Index, Items)
            end,
        }, RMenu:Get('vehiclestorage', 'take'))
    end)
    RageUI.IsVisible(RMenu:Get('vehiclestorage', 'take'), function()
        RageUI.List("Type", { "Inventaires", "Armes" }, vehicleStorageIndex, nil, {}, true, {
            onListChange = function(Index)
                vehicleStorageIndex = Index
            end
        })
        for k, v in pairs(VehicleStorage) do
            if vehicleStorageIndex == 1 then
                if StaticItemType(k) == 0 and v.Quantity > 0 and k ~= 2 then
                    RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                        onSelected = function(Index, Items)
                            local quantity = KeyboardInput(sf("Combien voulez-vous prendre de %s dans le véhicule ?", Objects[k].Name), 1, 4, true)
                            if quantity == nil or not math.tointeger(quantity) then
                                return
                            end
                            TriggerServerEvent('Ms:TakeItemInVehicleStorage', k, quantity)
                        end,
                    })
                end
            elseif vehicleStorageIndex == 2 then
                if StaticItemType(k) == 8 and v.Quantity > 0 and k ~= 2 then
                    RageUI.Button(sf('(%s) %s', v.Quantity, Weapons[WeaponProperties(k).type].Name), Weapons[WeaponProperties(k).type].Description, {}, true, {
                        onSelected = function(Index, Items)
                            local quantity = KeyboardInput(sf("Combien voulez-vous prendre de %s dans le véhicule ?", Weapons[WeaponProperties(k).type].Name), 1, 4, true)
                            if quantity == nil or not math.tointeger(quantity) then
                                return
                            end
                            TriggerServerEvent('Ms:TakeItemInVehicleStorage', k, quantity)
                        end,
                    })
                end
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('vehiclestorage', 'give'), function()
        RageUI.List("Type", { "Inventaires", "Armes" }, vehicleStorageIndex, nil, {}, true, {
            onListChange = function(Index)
                vehicleStorageIndex = Index
            end
        })
        for k, v in pairs(Character.Inventory) do
            if vehicleStorageIndex == 1 then
                if StaticItemType(k) == 0 and v.Quantity > 0 and k ~= 2 then
                    RageUI.Button(sf('(%s) %s', v.Quantity, Objects[k].Name), Objects[k].Description, {}, true, {
                        onSelected = function(Index, Items)
                            local quantity = KeyboardInput(sf("Combien voulez-vous poser de %s dans le véhicule ?", Objects[k].Name), 1, 4, true)
                            if not math.tointeger(quantity) then
                                return
                            end
                            TriggerServerEvent('Ms:PutItemInVehicleStorage', k, quantity)
                        end,
                    })
                end
                elseif vehicleStorageIndex == 2 then
                if StaticItemType(k) == 8 and v.Quantity > 0 then
                    RageUI.Button(sf('(%s) %s', v.Quantity, Weapons[WeaponProperties(k).type].Name), Weapons[WeaponProperties(k).type].Description, {}, true, {
                        onSelected = function(Index, Items)
                            local quantity = KeyboardInput(sf("Combien voulez-vous poser de %s dans le véhicule ?", Weapons[WeaponProperties(k).type].Name), 1, 4, true)
                            if not math.tointeger(quantity) then
                                return
                            end
                            TriggerServerEvent('Ms:PutItemInVehicleStorage', k, quantity)
                        end,
                    })
                end
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'main'), function()
        if Character.StaffRank > 0 then
            RageUI.Button('Administration', nil, {}, true, {}, RMenu:Get('personal', 'administration'))
        end
        RageUI.Button('~b~Boutique', nil, {}, KetchupHatchoune(), {}, RMenu:Get('personal', 'boutique'))
        RageUI.Button('Informations', nil, {}, KetchupHatchoune(), {}, RMenu:Get('personal', 'informations'))
        RageUI.Button('Inventaire', nil, {}, KetchupHatchoune(), {}, RMenu:Get('personal', 'inventory'))
        RageUI.Button('Armes', nil, {}, KetchupHatchoune(), {}, RMenu:Get('personal', 'weapons'))
        RageUI.Button('Factures', nil, {}, KetchupHatchoune(), {}, RMenu:Get('personal', 'invoices'))
        RageUI.Button('Vêtements', nil, {}, KetchupHatchoune(), {}, RMenu:Get('personal', 'clothes'))
        RageUI.Button('Véhicule', nil, {}, KetchupHatchoune(), {}, RMenu:Get('personal', 'vehicle'))
        RageUI.Button('Animations', nil, {}, true, {}, RMenu:Get('animation', 'main'))
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'invoices'), function()
        if Invoices.Character ~= nil and #Invoices.Character ~= 0 then
            for k, v in pairs(Invoices.Character) do
                if not v.Paid then
                    RageUI.Button(sf("Facture #%s", k), sf("Entreprise : ~b~%s~w~~n~Auteur : ~y~%s~w~~n~Prix : ~g~%s$~w~~n~Date : ~o~%s~w~", v.JobName, v.AuthorName, v.Price, v.Date), {}, true, {
                        onSelected = function(Index, Items)
                            local txt = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                            if txt ~= nil and string.lower(txt) == "y" then
                                TriggerServerEvent('Ms:PayInvoice', v.Id)
                            end
                        end,
                    })
                end
            end
        else
            RageUI.Button("Aucune factures impayés", nil, {}, false, {})
        end
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'informations'), function()
        RageUI.Button('Personnage ID :', nil, { RightLabel = Character.Id }, true, {})
        RageUI.Button('Argent :', nil, { RightLabel = Character.Inventory[1] and sf("~g~%s$", Utils:CommaValue(Character.Inventory[1].Quantity)) or "~g~0$" }, true, {})
        RageUI.Button('Argent en banque :', nil, { RightLabel = Character.Inventory[2] and sf("~b~%s$", Utils:CommaValue(Character.Inventory[2].Quantity)) or "~b~0$" }, true, {})
        RageUI.SliderProgress("Nutrition", Character.States.Hunger, 100, nil, {
            ProgressColor = { R = 255, G = 187, B = 51, A = 255 },
            ProgressBackgroundColor = { R = 214, G = 143, B = 0, A = 255 },
        }, true, {})
        RageUI.SliderProgress("Hydratation", Character.States.Thirst, 100, nil, {
            ProgressColor = { R = 51, G = 190, B = 255, A = 255 },
            ProgressBackgroundColor = { R = 0, G = 145, B = 213, A = 255 },
        }, true, {})
    end)
     RageUI.IsVisible(RMenu:Get('personal', 'vehicle'), function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if vehicle ~= nil and vehicle ~= 0 then
            local itemsResult = {}
            for i = 0, GetVehicleMaxNumberOfPassengers(vehicle) do
                local seat = GetPedInVehicleSeat(vehicle, i)
                if seat ~= nil and seat ~= 0 then
                    table.insert(itemsResult, tostring(i))
                end
            end
            RageUI.List("Exclure du véhicule", itemsResult, personnalOptions.kickVehicleIndex, nil, {}, true, {
                onListChange = function(Index, Items)
                    personnalOptions.kickVehicleIndex = Index
                end,
                onSelected = function(Index, Items)
                    local veh, player = VehToNet(vehicle), GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(vehicle, tonumber(Items))))
                    if veh == nil or veh == 0 or player == nil or player == 0 then
                        return
                    end
                    TriggerServerEvent('Ms:KickTargetFromVehicle', veh, player)
                end,
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'inventory'), function()
        for k, v in pairs(Character.Inventory) do
            if StaticItemType(k) == 0 and v.Quantity > 0 and k ~= 2 then
                RageUI.List(sf('(%s) %s', Utils:CommaValue(v.Quantity), Objects[k].Name), { "Utiliser", "Donner" }, Character.InventoryIndex[k] or 1, Objects[k].Description, {}, true, {
                    onListChange = function(Index, Items)
                        Character.InventoryIndex[k] = Index
                    end,
                    onSelected = function(Index, Items)
                        if Index == 1 then
                            local ped = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0))) 
                            if ped ~= nil and Objects[k].Actions[1] ~= nil and Objects[k].Actions[1].ActionId == 5 or ped ~= nil and Objects[k].Actions[1] ~= nil and Objects[k].Actions[1].ActionId == 6 then
                                TriggerServerEvent('Ms:UseObject', k, ped)
                            else
                                TriggerServerEvent('Ms:UseObject', k)
                            end
                        else
                            local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0)))
                            if player ~= nil and player ~= 0 then
                                local quantity = KeyboardInput("Choisissez une quantité ~r~0~w~ pour annuler.", 0, 5, true)
                                if quantity ~= nil and quantity ~= 0 then
                                    TriggerServerEvent('Ms:GiveObject', player, k, quantity)
                                end
                            end
                        end
                    end,
                    onActive = function()
                        local ped = Utils:GetEntityInFront(12, 1.0)
                        if ped ~= nil and ped ~= 0 then
                            Utils:DrawMarkerAbodeCoords(ped)
                        end
                    end
                })
            end
        end
    end)
     RageUI.IsVisible(RMenu:Get('personal', 'weapons'), function()
        RageUI.List('Type', { "Tout", "Corps à corps", "Pistolets", "Mitraillettes", "Fusils d'assaut", "Mitrailleuses", "Fusils à pompe", "Fusils de précision" }, Character.TypeIndex[1], nil, {}, true, {
            onListChange = function(Index, Items)
                Character.TypeIndex[1] = Index
            end,
            onSelected = function(Index, Items)
            end,
        })
        for k, v in pairs(Character.Inventory) do
            if StaticItemType(k) == 8 and v.Quantity > 0 then
                if Character.TypeIndex[1] == 1 then
                    RageUI.List(sf('(%s) %s', v.Quantity, Weapons[WeaponProperties(k).type].Name), { "Utiliser", "Retirer", "Donner" }, Character.InventoryIndex[k] or 1, sf("%s", GetTextFromWeaponUId(k)), {}, true, {
                        onListChange = function(Index, Items)
                            Character.InventoryIndex[k] = Index
                        end,
                        onSelected = function(Index, Items)
                            if Index == 1 then
                                CreateWeaponFromWeaponUId(k)
                            elseif Index == 2 then
                                RemoveWeaponFromWeaponUId(k)
                            elseif Index == 3 then
                                local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0)))
                                if player ~= nil and player ~= 0 then
                                    local quantity = KeyboardInput("Choisissez une quantité ~r~0~w~ pour annuler.", 0, 5, true)
                                    if quantity ~= nil and quantity ~= 0 then
                                        TriggerServerEvent('Ms:GiveObject', player, k, quantity)
                                    end
                                end
                            end
                        end,
                        onActive = function()
                            if Character.InventoryIndex[k] == 3 then
                                local ped = Utils:GetEntityInFront(12, 1.0)
                                if ped ~= nil and ped ~= 0 then
                                    Utils:DrawMarkerAbodeCoords(ped)
                                end
                            end
                        end,
                    })
                elseif Weapons[WeaponProperties(k).type].Group == Character.TypeIndex[1] - 1 then
                    RageUI.List(sf('(%s) %s', v.Quantity, Weapons[WeaponProperties(k).type].Name), { "Utiliser", "Retirer", "Donner" }, Character.InventoryIndex[k] or 1, sf("%s", GetTextFromWeaponUId(k)), {}, true, {
                        onListChange = function(Index, Items)
                            Character.InventoryIndex[k] = Index
                        end,
                        onSelected = function(Index, Items)
                            if Index == 1 then
                                CreateWeaponFromWeaponUId(k)
                            elseif Index == 2 then
                                RemoveWeaponFromWeaponUId(k)
                            elseif Index == 3 then
                                local player = GetPlayerServerId(NetworkGetPlayerIndexFromPed(Utils:GetEntityInFront(12, 1.0)))
                                if player ~= nil and player ~= 0 then
                                    local quantity = KeyboardInput("Choisissez une quantité ~r~0~w~ pour annuler.", 0, 5, true)
                                    if quantity ~= nil and quantity ~= 0 then
                                        TriggerServerEvent('Ms:GiveObject', player, k, quantity)
                                    end
                                end
                            end
                        end,
                        onActive = function()
                            if Character.InventoryIndex[k] == 2 then
                                local ped = Utils:GetEntityInFront(12, 1.0)
                                if ped ~= nil and ped ~= 0 then
                                    Utils:DrawMarkerAbodeCoords(ped)
                                end
                            end
                        end,
                    })
                end
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'clothes'), function()
        for k, v in pairs(Character.ClothItems) do
            RageUI.List(sf('%s', v.Name), { "Utiliser", "Renommer", "Retirer", "Supprimer" }, v.Index or 1, nil, {}, true, {
                onListChange = function(Index, Items)
                    v.Index = Index
                end,
                onSelected = function(Index, Items)
                    if (Index == 1) then
                        TriggerServerEvent('Ms:EquipClothe', k, true)
                    elseif (Index == 2) then
                        local name = KeyboardInput("Choisissez un nom pour votre vêtement", v.Name, 24, false)
                        if (name ~= nil and name ~= "" or name ~= nil) then
                            TriggerServerEvent('Ms:RenameClothe', k, name)
                        end
                    elseif (Index == 3) then
                        TriggerServerEvent('Ms:EquipClothe', k, false)
                    elseif (Index == 4) then
                        local confirmation = KeyboardInput("Voulez-vous vraiment supprimer ? (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                        if confirmation ~= nil and string.lower(confirmation) == "y" then
                            if Character.EquippedClothes[tostring(v.Type)] == k then
                                TriggerServerEvent('Ms:EquipClothe', k, false)
                            end
                            TriggerServerEvent('Ms:DeleteClothe', k)
                        end
                    end
                end,
            })
        end
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'boutique'), function()
        RageUI.Button(sf('[V.I.P] %s', Account.Vip ~= 0 and shop.Vip[Account.Vip][1] or "Aucun"), sf("Expiration : %s", Account.Expiration), {}, true, {
            onSelected = function(Index, Items)
            end,
        })
        RageUI.Button(sf('[Stalyons] %s', Utils:CommaValue(Account.Tokens)), nil, {}, true, {
            onSelected = function(Index, Items)
            end,
        })
        if GetPedsList() then
            RageUI.Button('Peds', nil, {}, GetPedsList(), {}, RMenu:Get('personal', 'peds'))
        end
        RageUI.List("Choix du type :", { "Vip", "Véhicules import", "Armes", "Caisses" }, shop.index or 1, nil, {  }, true, {
            onListChange = function(Index, Items)
                shop.index = Index
            end,
        })
        if shop.index == 1 then
            for k, v in pairs(shop.Vip) do
                local percentage = (Account.ExpirationTime - os.time()) / shop.time.day * 100 / 31
                if percentage <= 5 then
                    percentage = 100
                end
                RageUI.Button(sf("%s (1 Mois)", v[1]), nil, { RightLabel = Utils:CommaValue(math.floor(((k * 1000) - (Account.Vip * 1000)) * (percentage / 100))), RightBadge = { dictionary = 'stalya', texture = 'coin' } }, k > Account.Vip, {
                    onSelected = function(Index, Items)
                        local txt = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                        if txt ~= nil and string.lower(txt) == "y" then
                            TriggerServerEvent('Ms:BuyShopItem', 1, k)
                        end
                    end,
                    onActive = function()
                        picture = v[1]
                    end
                })
            end
        elseif shop.index == 2 then
            shop.Vehicles.VehiclesData = GetVehiclesByCategory(22)
            for k, v in pairs(shop.Vehicles.VehiclesData) do
                RageUI.Button(v.Name, nil, { RightLabel = v.Price, RightBadge = { dictionary = 'stalya', texture = 'coin' } }, true, {
                    onSelected = function(Index, Items)
                        local txt = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                        if txt ~= nil and string.lower(txt) == "y" then
                            TriggerServerEvent('Ms:BuyShopItem', 2, v)
                        end
                    end,
                    onActive = function()
                        picture = v.Model
                    end
                })
            end
        elseif shop.index == 3 then
            local weaponsdata = GetWeaponsByCategory(10)
            for k, v in pairs(weaponsdata) do
                RageUI.Button(v.Name, nil, { RightLabel = v.Price, RightBadge = { dictionary = 'stalya', texture = 'coin' } }, true, {
                    onSelected = function(Index, Items)
                        local txt = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 3, false)
                        if txt ~= 'y' then
                            return
                        end
                        TriggerServerEvent('Ms:BuyShopItem', 3, v)
                    end,
                })
            end
        elseif shop.index == 4 then
            RageUI.Button("Petite", nil, { RightLabel = "500", RightBadge = { dictionary = 'stalya', texture = 'coin' } }, true, {
                onSelected = function(Index, Items)
                    local confirmation = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if confirmation ~= nil and string.lower(confirmation) == "y"  then
                        TriggerServerEvent('Ms:OpenCase', "lootbox_5", 500)
                    end
                end,
                onActive = function()
                    picture = "lootbox_5"
                end
            })
            RageUI.Button("Moyenne", nil, { RightLabel = "1000", RightBadge = { dictionary = 'stalya', texture = 'coin' } }, true, {
                onSelected = function(Index, Items)
                    local confirmation = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if confirmation ~= nil and string.lower(confirmation) == "y"  then
                        TriggerServerEvent('Ms:OpenCase', "lootbox_10", 1000)
                    end
                end,
                onActive = function()
                    picture = "lootbox_10"
                end
            })
            RageUI.Button("Grande", nil, { RightLabel = "1500", RightBadge = { dictionary = 'stalya', texture = 'coin' } }, true, {
                onSelected = function(Index, Items)
                    local confirmation = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if confirmation ~= nil and string.lower(confirmation) == "y"  then
                        TriggerServerEvent('Ms:OpenCase', "lootbox_15", 1500) end
                end,
                onActive = function()
                    picture = "lootbox_15"
                end
            })
            RageUI.Button("~b~Février~r~ ! NEW !", nil, { RightLabel = "950", RightBadge = { dictionary = 'stalya', texture = 'coin' } }, true, {
                onSelected = function(Index, Items)
                    local confirmation = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if confirmation ~= nil and string.lower(confirmation) == "y"  then
                        TriggerServerEvent('Ms:OpenCase', "lootbox_nowel", 950) end
                end,
                onActive = function()
                    picture = "lootbox_nowel"
                end
            })
        end
    end, function()
        if picture ~= nil then
            RageUI.PicturePreview(picture)
        end
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'administration'), function()
        RageUI.Button("Liste des joueurs", "Permet de voir la liste des joueurs.", {}, true, {
        }, RMenu:Get('administration', 'characters'))
        RageUI.Button("Liste des reports", "Permet de voir et prendre un report.", {}, true, {
        }, RMenu:Get('administration', 'reports'))
        RageUI.Button("Customisation", "Permet de customiser votre personnage.", {}, true, {
        }, RMenu:Get('administration', 'customisation'))
        RageUI.Checkbox("Afficher les noms", nil, Administration.ActionId[5], {}, {
            onChecked = function()
                Administration.ActionId[5] = true
            end,
            onUnChecked = function()
                Administration.ActionId[5] = false
                for k, v in pairs(Administration.GamerTags) do
                    RemoveMpGamerTag(v)
                end
                Administration.GamerTags = {}
            end,
        })
        RageUI.Checkbox("NoClip", nil, Administration.ActionId[1], {}, {
            onChecked = function()
                if not Administration.ActionId[4] then
                    TriggerServerEvent('Ms:AdminAction', 1)
                end
            end,
            onUnChecked = function()
                if not Administration.ActionId[4] then
                    TriggerServerEvent('Ms:AdminAction', 1)
                end
            end,
        })
        if Character.StaffRank > 3 then
            RageUI.Checkbox("FreeCam", nil, Administration.ActionId[4], {}, {
                onChecked = function()
                    if not Administration.ActionId[1] then
                        TriggerServerEvent('Ms:AdminAction', 4)
                    end
                end,
                onUnChecked = function()
                    if not Administration.ActionId[1] then
                        TriggerServerEvent('Ms:AdminAction', 4)
                    end
                end,
            })
        end
        RageUI.Checkbox("Invisible", nil, Administration.ActionId[3], {}, {
            onChecked = function()
                TriggerServerEvent('Ms:AdminAction', 3)
            end,
            onUnChecked = function()
                TriggerServerEvent('Ms:AdminAction', 3)
            end,
        })
        RageUI.Button("Revive", nil, {}, true, {
            onSelected = function(Index, Items)
                local targetId = KeyboardInput("Choissez un id de personnage", nil, 6, true)
                if targetId ~= nil then
                    TriggerServerEvent('Ms:AdminAction', 2, targetId)
                end
            end,
        })
        RageUI.Button('Réparer un véhicule', 'Permet de réparer un véhicule.', {  }, true, {
            onSelected = function()
                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                if vehicle ~= nil then
                    local vId = NetworkGetNetworkIdFromEntity(vehicle)
                    TriggerServerEvent('Ms:AdminAction', 8, vId)
                end
            end,
        })
        RageUI.Button("Unban", nil, {}, true, {
            onSelected = function(Index, Items)
                local targetId = KeyboardInput(sf("Entrez un id de personnage."), 0, 6, true)
                if targetId ~= nil then
                    TriggerServerEvent('Ms:AdminAction', 10, targetId)
                end
            end,
        })
    end)
     RageUI.IsVisible(RMenu:Get('administration', 'customisation'), function()
        local list = {}
        if Character.Model == 'mp_m_freemode_01' then
            list = {
                { "Zombie", "Jesus", "Mime" },
                { "u_m_y_zombie_01", "u_m_m_jesus_01", "s_m_y_mime", "cs_jimmydisant" },
            }
            if Character.StaffRank > 3 then
                table.insert(list[1], 'FBI')
                table.insert(list[2], 'csb_reporter')
            end
        else
            list = {
                { "Bride", "Juggalo", "Families" },
                { "ig_bride", "a_f_y_juggalo_01", "g_f_y_families_01" },
            }
        end
        RageUI.List("Ped :", list[1], Administration.Customisation.PedIndex, nil, {}, true, {
            onListChange = function(Index, Items)
                Administration.Customisation.PedIndex = Index
                local model = GetHashKey(list[2][Index])
                Utils:RequestModel(model)
                SetPlayerModel(PlayerId(), model)
                SetPedDefaultComponentVariation(PlayerPedId())
                SetModelAsNoLongerNeeded(model)
                NetworkSetFriendlyFireOption(true)
                SetCanAttackFriendly(PlayerPedId(), true, true)
                SetMaxWantedLevel(0)
                SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
            end,
        })
        --[[if Character.StaffRank > 3 then
            local staffEffects = {
                { "1", "2", "3", "4", "5", "6", "7", "8", "9" },
                {
                    { "SCR_RCBARRY1", "scr_alien_disintegrate" },
                    { "SCR_POWERPLAY", "scr_powerplay_beast_vanish" },
                    { "DES_TV_SMASH", "ent_ray_fam2_tv_smash" },
                    { "SCR_SM_TRANS", "scr_sm_con_trans" },
                    { "SCR_SR_ADVERSARY", "scr_sr_lg_take_zone" },
                    { "SCR_RCPAPARAZZO1", "scr_mich4_firework_burst_spawn" },
                    { "SCR_INDEP_FIREWORKS", "scr_indep_firework_trail_spawn" },
                    { "SCR_IE_TW", "scr_impexp_tw_take_zone" },
                    { "SCR_GR_DEF", "scr_gr_warp_in" },
                }
            }
            RageUI.List("Effects :", staffEffects[1], Administration.Customisation.PedEffect, nil, {}, true, {
                onListChange = function(Index, Items)
                    Administration.Customisation.PedEffect = Index
                    features.assetsName = staffEffects[2][Index][1]
                    features.effectsName = staffEffects[2][Index][2]
                end,
            })
        end]]
    end)
    RageUI.IsVisible(RMenu:Get('administration', 'characters'), function()
        for k, v in pairs(Administration.Characters) do
            RageUI.Button(sf("%s %s", v.Identity.firstname, v.Identity.lastname), formatDescription(v), {}, true, {
                onSelected = function()
                    CharacterView = v
                    RMenu:Get('characters', 'view'):SetSubtitle(sf("%s %s", v.Identity.firstname, v.Identity.lastname))
                end
            }, RMenu:Get('characters', 'view'))
        end
    end)
     RageUI.IsVisible(RMenu:Get('administration', 'reports'), function()
        local result = 0
        for k, v in pairs(Administration.Reports) do
            RageUI.Button(sf("#%s - %s", v.reportId, v.identity), sf("CharacterId : ~g~%s~w~\nDate : ~b~%s~w~\nMessage : ~o~%s", v.characterId, v.date, v.message), {}, true, {
                onSelected = function(Index, Items)
                    local take = KeyboardInput(sf("Voulez-vous prendre le report #%s", v.reportId), "oui", 3, false)
                    if take == "oui" then
                        TriggerServerEvent('Ms:TakeReport', v.reportId, v.characterId)
                    end
                end,
            })
            result = result + 1
        end
        if result == 0 then
            RageUI.Button("Aucun", nil, {}, true, {
                onSelected = function(Index, Items)
                end,
            })
        end
    end)
     RageUI.IsVisible(RMenu:Get('characters', 'view'), function()
        RageUI.Button("Informations", formatDescription(CharacterView), {}, true, {})
        RageUI.Button("Revive", nil, {}, true, {
            onSelected = function()
                TriggerServerEvent('Ms:AdminAction', 2, CharacterView.Id)
            end
        })
        RageUI.Button("Goto", nil, {}, true, {
            onSelected = function()
                TriggerServerEvent('Ms:AdminAction', 5, CharacterView.Id)
            end
        })
        RageUI.Button("Bring", nil, {}, true, {
            onSelected = function()
                TriggerServerEvent('Ms:AdminAction', 6, CharacterView.Id)
            end
        })
        RageUI.Button("Kick", nil, {}, true, {
            onSelected = function()
                local data = {
                    Source = CharacterView.Source,
                    Reason = ""
                }
                local reason = KeyboardInput(sf("Pour quel raison voulez-vous kick %s %s ?", CharacterView.Identity.firstname, CharacterView.Identity.lastname), "HRP", 80, false)
                if reason ~= nil then
                    data.Reason = reason
                    print(data.Source)
                    TriggerServerEvent('Ms:AdminAction', 7, data)
                end
            end
        })
        RageUI.Button("Ban", nil, {}, true, {}, RMenu:Get('characters', 'ban'))
        RageUI.Button("Edit rang", nil, {}, Character.StaffRank > 3, {
            onSelected = function(Index, Items)
                local grade = KeyboardInput(sf("0 Joueur / 1 Helpeur / 2 Modérateur / 3 MJ"), 0, 1, true)
                if grade ~= nil then
                    TriggerServerEvent('Ms:ChangeStaffRank', CharacterView.Id, grade)
                end
            end,
        })
    end)
     RageUI.IsVisible(RMenu:Get('characters', 'ban'), function()
        RageUI.Button("HRP", "Durée du bannissement : 1 Jour", {}, true, {
            onSelected = function(Index, Items)
                local data = {
                    id = CharacterView.Id,
                    reason = 1
                }
                local confirmation = KeyboardInput(sf("Êtes vous sûr de vouloir bannir %s %s? (~g~Y~w~/~r~N~w~)", CharacterView.Identity.firstname, CharacterView.Identity.lastname), 'N', 1, false)
                if confirmation ~= nil and string.lower(confirmation) == "y" then
                    TriggerServerEvent('Ms:AdminAction', 9, data)
                end
            end,
        })
        RageUI.Button("Insultes", "Durée du bannissement : 3 Jours", {}, true, {
            onSelected = function(Index, Items)
                local data = {
                    id = CharacterView.Id,
                    reason = 2
                }
                local confirmation = KeyboardInput(sf("Êtes vous sûr de vouloir bannir %s %s? (~g~Y~w~/~r~N~w~)", CharacterView.Identity.firstname, CharacterView.Identity.lastname), 'N', 1, false)
                if confirmation ~= nil and string.lower(confirmation) == "y" then
                    TriggerServerEvent('Ms:AdminAction', 9, data)
                end
            end,
        })
        RageUI.Button("FreeKill", "Durée du bannissement : 7 Jours", {}, true, {
            onSelected = function(Index, Items)
                local data = {
                    id = CharacterView.Id,
                    reason = 3
                }
                local confirmation = KeyboardInput(sf("Êtes vous sûr de vouloir bannir %s %s? (~g~Y~w~/~r~N~w~)", CharacterView.Identity.firstname, CharacterView.Identity.lastname), 'N', 1, false)
                if confirmation ~= nil and string.lower(confirmation) == "y" then
                    TriggerServerEvent('Ms:AdminAction', 9, data)
                end
            end,
        })
        RageUI.Button("Autres", "Préciser la raison et la durée du bannissement", {}, true, {
            onSelected = function(Index, Items)
                local data = {
                    id = CharacterView.Id,
                    reason = 4,
                    txt = "",
                    time = 0
                }
                data.txt = KeyboardInput("Veuillez saisir la raison du bannissement", 'NO RP', 60, false)
                data.time = KeyboardInput("Veuillez saisir la durée du bannissement (en minute)", '60', 60, true)
                if data.txt ~= nil and data.txt ~= "" and data.time ~= 0 then
                    TriggerServerEvent('Ms:AdminAction', 9, data)
                end
            end,
        })
    end)
    RageUI.IsVisible(RMenu:Get('personal', 'peds'), function()
        RageUI.List("Liste des peds", PedsLists, pedIndex or 1, "~r~Attention~w~ Une fois le ped choisis il ne vous est plus possible de faire retour arrière.", {}, true, {
            onListChange = function(Index, Items)
                pedIndex = Index
                ClearPedDecorations(PlayerPedId())
                FreezeEntityPosition(PlayerPedId(), true)
                local model = GetHashKey(PedsLists[Index])
                Utils:RequestModel(model)
                SetPlayerModel(PlayerId(), model)
                SetPedDefaultComponentVariation(PlayerPedId())
                SetModelAsNoLongerNeeded(model)
                NetworkSetFriendlyFireOption(true)
                SetCanAttackFriendly(PlayerPedId(), true, true)
                SetMaxWantedLevel(0)
                SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
            end,
        })
        RageUI.Button("Réinitialiser les valeurs par défaut", nil, {}, true, {
            onSelected = function(Index, Items)
                local model = GetHashKey(Character.Model)
                Utils:RequestModel(model)
                SetPlayerModel(PlayerId(), model)
                SetPedDefaultComponentVariation(PlayerPedId())
                SetModelAsNoLongerNeeded(model)
                NetworkSetFriendlyFireOption(true)
                SetCanAttackFriendly(PlayerPedId(), true, true)
                SetMaxWantedLevel(0)
                SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
                Utils:ApplySkin(Character.Skin)
                ClearPedDecorations(ped)
                for k, v in pairs(Character.Tattoos) do
                    Utils:ApplyTattoos(v)
                end
                for k, v in pairs(Character.EquippedClothes) do
                    Utils:ClothEquip(v, k)
                end
            end,
        })
        RageUI.Button("Valider", "~r~Attention~w~ Cette action est irrévocable", {}, true, {
            onSelected = function(Index, Items)
                local txt = KeyboardInput("Veuillez confirmer votre choix (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                if txt ~= nil and string.lower(txt) == "y" then
                    TriggerServerEvent('Ms:PedChoice', PedsLists[pedIndex])
                    RageUI.OpenSubmenu(RMenu:Get('personal', 'boutique'))
                end
            end,
        })
    end)
end
function KetchupHatchoune()
    if Character.StaffRank > 0 and Character.StaffRank < 4 then
        return false
    end
    return true
end
function GetPedsList()
    return Account.Vip > 0 and Character.CustomModel == ""
end
function StaffRankName(rankId)
    local name = "Aucun"
    if rankId == 0 then
        name = "Aucun"
    elseif rankId == 1 then
        name = "Helpeur"
    elseif rankId == 2 then
        name = "Modérateur"
    elseif rankId == 3 then
        name = "Maître du Jeu"
    elseif rankId == 4 then
        name = "Administrateur"
    elseif rankId >= 5 then
        name = "Fondateur"
    end
    return name
end
function formatDescription(character)
    local result = ""
    result = sf("CharacterId : ~q~%s~w~~n~Discord : ~p~%s~w~~n~Name : ~g~%s~w~~n~Rang : ~r~%s~w~~n~V.I.P : %s~w~", character.Id, character.Discord, character.Pseudo, StaffRankName(character.StaffRank), character.Vip ~= 0 and shop.Vip[character.Vip][3] .. shop.Vip[character.Vip][1] or "Aucun")
    return result
end
function GenerateAnimations(list)
    local chance = math.random(1, 100)
    local gift = {
        category = 1,
        item = 1
    }
    if chance < 5 then
        local rand = math.random(1, #rarity[3])
        gift.category = 3
        gift.item = rarity[3][rand]
    elseif chance > 5 and chance < 15 then
        local rand = math.random(1, #rarity[2])
        gift.category = 2
        gift.item = rarity[2][rand]
    else
        local rand = math.random(1, #rarity[1])
        gift.category = 1
        gift.item = rarity[1][rand]
    end
    local itemsCount, itemsList, finalList = 0, {}, {}
    for _, category in pairs(list) do
        for _, item in pairs(category) do
            itemsCount = itemsCount + 1
            table.insert(itemsList, item)
        end
    end
    local clone = {}
    for _, v in pairs(itemsList) do
        table.insert(clone, v)
    end
    for _ = 1, itemsCount do
        local rand = math.random(1, #clone)
        table.insert(finalList, { name = clone[rand], time = 125 })
        if clone[rand] == gift.item then
            table.remove(itemsList, rand)
            itemsCount = itemsCount - 1
        end
        table.remove(clone, rand)
    end
    for i = 1, itemsCount do
        local rand = math.random(1, #itemsList)
        local time = 175
        if itemsCount < i + 7 then
            time = time + (i - itemsCount + 7) * 100
        end
        table.insert(finalList, { name = itemsList[rand], time = time })
        table.remove(itemsList, rand)
    end
    table.insert(finalList, { name = gift.item, time = 10000 })
    return finalList
end
UnicornSoda = false
RMenu.Add('shop', 'objects', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('shop', 'objects'):SetSubtitle("Magasin")
RMenu.Add('shop', 'weapons', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('shop', 'weapons'):SetSubtitle("Magasin d'armes")
RMenu.Add('shop', 'blackmarket', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('shop', 'blackmarket'):SetSubtitle("Marché noir")
RMenu.Add('shop', 'reseller', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('shop', 'reseller'):SetSubtitle("Marché noir")
function RageUI.PoolMenus:Shop()
    RageUI.IsVisible(RMenu:Get('shop', 'objects'), function()
        for k, v in pairs(Objects) do
            if v.OnSale == 1 and not UnicornSoda then
                RageUI.Button(v.Name, v.Description, { RightLabel = sf('(~g~%s $~w~)', v.Price) }, true, {
                    onSelected = function(Index, Items)
                        local quantity = KeyboardInput('Veuillez choisir une quantité', '1', 3, true)
                        if quantity ~= nil  then
                            TriggerServerEvent('Ms:BuyItem', k, v.Price, quantity)
                        end
                    end,
                })
                elseif UnicornSoda and v.OnSale == 3 then
                RageUI.Button(v.Name, v.Description, { RightLabel = sf('(~g~%s $~w~)', v.Price) }, true, {
                    onSelected = function(Index, Items)
                        local quantity = KeyboardInput('Veuillez choisir une quantité', '1', 3, true)
                        if quantity ~= nil  then
                            TriggerServerEvent('Ms:BuyItem', k, v.Price, quantity)
                        end
                    end,
                })
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('shop', 'weapons'), function()
        for k, v in pairs(Weapons) do
            if v.OnSale then
                RageUI.Button(v.Name, v.Description, { RightLabel = sf('(~g~%s $~w~)', v.Price) }, true, {
                    onSelected = function(Index, Items)
                        local confirmation = KeyboardInput(sf("Acheter %s pour %s$ ? (~g~Y~w~/~r~N~w~)", v.Name, v.Price), 'N', 1, false)
                        if confirmation ~= nil and string.lower(confirmation) == "y"  then
                            TriggerServerEvent('Ms:BuyWeapon', k, v.Price)
                        end
                    end,
                })
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('shop', 'blackmarket'), function()
        for k, v in pairs(Objects) do
            if v.OnSale == 2 then
                RageUI.Button(v.Name, v.Description, { RightLabel = sf('(~g~%s $~w~)', v.Price) }, true, {
                    onSelected = function(Index, Items)
                        local quantity = KeyboardInput('Veuillez choisir une quantité', '1', 3, true)
                        if quantity ~= nil  then
                            TriggerServerEvent('Ms:BuyItem', k, v.Price, quantity)
                        end
                    end,
                })
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('shop', 'reseller'), function()
        for k,v in pairs(VehiclesData) do
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            if vehicle ~= nil and GetHashKey(v.Model) == GetEntityModel(vehicle) and v.ForSale and v.TypeId == 22 then
                RageUI.Button("Revendre son vehicule", sf("Nom : ~b~%s~w~\nPrix à la revente : ~o~%s ~b~Stalyons", v.Name, math.floor((v.Price * 60) / 100)), {  }, true, {
                    onSelected = function(Index, Items)
                        local txt = KeyboardInput("Veuillez confirmer votre choix (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                        if txt ~= nil and string.lower(txt) == "y" then
                            local vId = NetworkGetNetworkIdFromEntity(vehicle)
                            TriggerServerEvent('Ms:ShopReseller', vId, MId)
                        end
                    end,
                })
            end
        end
    end)
end
local Categories = {
    [0] = { name = "Torse/Dos", content = {} },
    [1] = { name = "Tête", content = {} },
    [2] = { name = "Bras gauche", content = {} },
    [3] = { name = "Bras droit", content = {} },
    [4] = { name = "Jambe gauche", content = {} },
    [5] = { name = "Jambe droite", content = {} },
    [6] = { name = "Jspo", content = {} },
    [7] = { name = "Jspa", content = {} },
}
local index = 1
local TattoosList = {
    { "mpbeach_overlays", "MP_Bea_M_Head_000" },
    { "multiplayer_overlays", "FM_Tat_Award_M_000" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_009_M" },
    { "mpbeach_overlays", "MP_Bea_M_Head_000" },
    { "mplowrider_overlays", "LR_F_Hair_000" },
    { "mplowrider_overlays", "LR_F_Hair_001" },
    { "mplowrider_overlays", "LR_F_Hair_002" },
    { "mpbeach_overlays", "MP_Bea_F_Neck_000" },
    { "mphipster_overlays", "FM_Hip_M_Tat_005" },
    { "mphipster_overlays", "FM_Hip_M_Tat_021" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_038_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_051_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_007" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_024" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_025" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_029" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_003_M" },
    { "mpbusiness_overlays", "MP_Buis_M_Neck_000" },
    { "mpbusiness_overlays", "MP_Buis_M_Neck_001" },
    { "mpbusiness_overlays", "MP_Buis_M_Neck_002" },
    { "mpbusiness_overlays", "MP_Buis_M_Neck_003" },
    { "mpbeach_overlays", "MP_Bea_M_Neck_000" },
    { "mpbeach_overlays", "MP_Bea_M_Neck_001" },
    { "mpbeach_overlays", "MP_Bea_M_Neck_002" },
    { "mphipster_overlays", "FM_Hip_M_Tat_005" },
    { "multiplayer_overlays", "FM_Tat_Award_M_001" },
    { "multiplayer_overlays", "FM_Tat_M_005" },
    { "multiplayer_overlays", "FM_Tat_M_006" },
    { "mphipster_overlays", "FM_Hip_M_Tat_003" },
    { "mphipster_overlays", "FM_Hip_M_Tat_007" },
    { "mphipster_overlays", "FM_Hip_M_Tat_015" },
    { "mphipster_overlays", "FM_Hip_M_Tat_016" },
    { "mphipster_overlays", "FM_Hip_M_Tat_027" },
    { "mphipster_overlays", "FM_Hip_M_Tat_028" },
    { "mphipster_overlays", "FM_Hip_M_Tat_034" },
    { "mphipster_overlays", "FM_Hip_M_Tat_039" },
    { "mphipster_overlays", "FM_Hip_M_Tat_048" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_012_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_053_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_000" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_020" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_021" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_004_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_025_M" },
    { "mplowrider_overlays", "MP_LR_Tat_005_M" },
    { "mplowrider_overlays", "MP_LR_Tat_006_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_022_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_021_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_005_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_016_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_028_M" },
    { "mpbusiness_overlays", "MP_Buis_M_LeftArm_000" },
    { "mpbusiness_overlays", "MP_Buis_M_LeftArm_001" },
    { "mpbeach_overlays", "MP_Bea_F_LArm_000" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_000" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_010" },
    { "multiplayer_overlays", "FM_Tat_M_015" },
    { "multiplayer_overlays", "FM_Tat_M_031" },
    { "multiplayer_overlays", "FM_Tat_M_041" },
    { "mpluxe_overlays", "MP_LUXE_TAT_009_M" },
    { "multiplayer_overlays", "FM_Tat_Award_M_015" },
    { "mphipster_overlays", "FM_Hip_M_Tat_037" },
    { "mphipster_overlays", "FM_Hip_M_Tat_043" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_016_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_020_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_020_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_024_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_025_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_035_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_045_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_055_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_008_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_015_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_016_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_027_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_004_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_008_M" },
    { "mplowrider_overlays", "MP_LR_Tat_026_M" },
    { "multiplayer_overlays", "FM_Tat_Award_M_007" },
    { "mplowrider2_overlays", "MP_LR_Tat_018_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_020_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_018_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_031_M" },
    { "mpbeach_overlays", "MP_Bea_F_LArm_001" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_031_M" },
    { "mphipster_overlays", "FM_Hip_M_Tat_026" },
    { "mplowrider_overlays", "MP_LR_Tat_027_M" },
    { "mplowrider_overlays", "MP_LR_Tat_033_M" },
    { "mplowrider_overlays", "MP_LR_Tat_033_F" },
    { "multiplayer_overlays", "FM_Tat_M_038" },
    { "multiplayer_overlays", "FM_Tat_M_028" },
    { "multiplayer_overlays", "FM_Tat_M_018" },
    { "multiplayer_overlays", "FM_Tat_M_014" },
    { "new_overlays", "new_tattoo_01_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_003_M" },
    { "mphipster_overlays", "FM_Hip_M_Tat_014" },
    { "mphipster_overlays", "FM_Hip_M_Tat_017" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_008" },
    { "mphipster_overlays", "FM_Hip_M_Tat_018" },
    { "mphipster_overlays", "FM_Hip_M_Tat_020" },
    { "mphipster_overlays", "FM_Hip_M_Tat_022" },
    { "mphipster_overlays", "FM_Hip_M_Tat_023" },
    { "mphipster_overlays", "FM_Hip_M_Tat_045" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_042_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_022" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_023" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_026" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_027" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_002_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_024_M" },
    { "mplowrider_overlays", "MP_LR_Tat_015_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_003_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_035_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_004_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_010_M" },
    { "mpbusiness_overlays", "MP_Buis_M_RightArm_001" },
    { "multiplayer_overlays", "FM_Tat_Award_M_010" },
    { "mphipster_overlays", "FM_Hip_M_Tat_010" },
    { "multiplayer_overlays", "FM_Tat_Award_M_002" },
    { "multiplayer_overlays", "FM_Tat_M_000" },
    { "multiplayer_overlays", "FM_Tat_M_001" },
    { "multiplayer_overlays", "FM_Tat_M_003" },
    { "multiplayer_overlays", "FM_Tat_M_027" },
    { "multiplayer_overlays", "FM_Tat_M_047" },
    { "mphipster_overlays", "FM_Hip_M_Tat_001" },
    { "mphipster_overlays", "FM_Hip_M_Tat_036" },
    { "mphipster_overlays", "FM_Hip_M_Tat_044" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_007_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_014_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_033_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_046_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_047_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_049_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_054_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_003" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_017_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_004" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_021_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_003_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_005_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_006_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_007_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_028_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_013_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_019_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_026_M" },
    { "mpbusiness_overlays", "MP_Buis_M_RightArm_000" },
    { "mpbeach_overlays", "MP_Bea_F_RArm_001" },
    { "mpbeach_overlays", "MP_Bea_F_Back_000" },
    { "mpbeach_overlays", "MP_Bea_F_Back_001" },
    { "mpbeach_overlays", "MP_Bea_F_Back_002" },
    { "multiplayer_overlays", "FM_Tat_Award_M_005" },
    { "multiplayer_overlays", "FM_Tat_Award_M_008" },
    { "multiplayer_overlays", "FM_Tat_Award_M_014" },
    { "multiplayer_overlays", "FM_Tat_Award_M_016" },
    { "multiplayer_overlays", "FM_Tat_Award_M_017" },
    { "multiplayer_overlays", "FM_Tat_Award_M_018" },
    { "multiplayer_overlays", "FM_Tat_Award_M_019" },
    { "multiplayer_overlays", "FM_Tat_M_009" },
    { "multiplayer_overlays", "FM_Tat_M_011" },
    { "multiplayer_overlays", "FM_Tat_M_013" },
    { "multiplayer_overlays", "FM_Tat_M_016" },
    { "multiplayer_overlays", "FM_Tat_M_019" },
    { "multiplayer_overlays", "FM_Tat_M_020" },
    { "multiplayer_overlays", "FM_Tat_M_030" },
    { "multiplayer_overlays", "FM_Tat_M_045" },
    { "multiplayer_overlays", "FM_Tat_M_046" },
    { "mphipster_overlays", "FM_Hip_M_Tat_000" },
    { "mphipster_overlays", "FM_Hip_M_Tat_006" },
    { "mphipster_overlays", "FM_Hip_M_Tat_011" },
    { "mphipster_overlays", "FM_Hip_M_Tat_012" },
    { "mphipster_overlays", "FM_Hip_M_Tat_024" },
    { "mphipster_overlays", "FM_Hip_M_Tat_025" },
    { "mphipster_overlays", "FM_Hip_M_Tat_030" },
    { "mphipster_overlays", "FM_Hip_M_Tat_031" },
    { "mphipster_overlays", "FM_Hip_M_Tat_032" },
    { "mphipster_overlays", "FM_Hip_M_Tat_041" },
    { "mphipster_overlays", "FM_Hip_M_Tat_046" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_006_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_008_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_011_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_017_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_021_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_030_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_043_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_005" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_006" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_011" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_013" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_015" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_000_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_001_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_013_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_014_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_018_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_019_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_022_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_000_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_001_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_002_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_009_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_010_M" },
    { "mpimportexport_overlays", "MP_MP_ImportExport_Tat_011_M" },
    { "mplowrider_overlays", "MP_LR_Tat_004_M" },
    { "mplowrider_overlays", "MP_LR_Tat_009_M" },
    { "mplowrider_overlays", "MP_LR_Tat_010_M" },
    { "mplowrider_overlays", "MP_LR_Tat_014_M" },
    { "mplowrider_overlays", "MP_LR_Tat_021_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_000_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_008_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_011_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_031_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_032_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_006_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_024_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_029_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_009_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_022_M" },
    { "mpbusiness_overlays", "MP_Buis_M_Back_000" },
    { "mpbeach_overlays", "MP_Bea_F_Back_000" },
    { "mpbeach_overlays", "MP_Bea_F_Back_001" },
    { "mpbeach_overlays", "MP_Bea_F_Back_002" },
    { "mpbeach_overlays", "MP_Bea_F_RSide_000" },
    { "mpbeach_overlays", "MP_Bea_F_Should_000" },
    { "mpbeach_overlays", "MP_Bea_F_Should_001" },
    { "mpbeach_overlays", "MP_Bea_F_Chest_000" },
    { "mpbeach_overlays", "MP_Bea_F_Chest_001" },
    { "mpbeach_overlays", "MP_Bea_F_Chest_002" },
    { "mpbeach_overlays", "MP_Bea_M_Chest_000" },
    { "mpbeach_overlays", "MP_Bea_M_Chest_001" },
    { "multiplayer_overlays", "FM_Tat_Award_M_003" },
    { "multiplayer_overlays", "FM_Tat_M_004" },
    { "multiplayer_overlays", "FM_Tat_Award_M_011" },
    { "multiplayer_overlays", "FM_Tat_Award_M_012" },
    { "multiplayer_overlays", "FM_Tat_Award_M_013" },
    { "multiplayer_overlays", "FM_Tat_M_012" },
    { "multiplayer_overlays", "FM_Tat_M_024" },
    { "multiplayer_overlays", "FM_Tat_M_025" },
    { "multiplayer_overlays", "FM_Tat_M_029" },
    { "multiplayer_overlays", "FM_Tat_M_034" },
    { "multiplayer_overlays", "FM_Tat_M_036" },
    { "multiplayer_overlays", "FM_Tat_M_044" },
    { "mphipster_overlays", "FM_Hip_M_Tat_002" },
    { "mphipster_overlays", "FM_Hip_M_Tat_013" },
    { "mphipster_overlays", "FM_Hip_M_Tat_029" },
    { "mphipster_overlays", "FM_Hip_M_Tat_033" },
    { "mphipster_overlays", "FM_Hip_M_Tat_035" },
    { "mphipster_overlays", "FM_Hip_M_Tat_047" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_000_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_001_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_003_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_005_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_010_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_013_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_018_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_019_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_010_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_023_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_026_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_029_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_031_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_032_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_034_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_039_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_041_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_050_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_052_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_058_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_059_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_060_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_009" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_016" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_017" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_018" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_019" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_028" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_012_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_017_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_020_M" },
    { "mplowrider_overlays", "MP_LR_Tat_001_M" },
    { "mplowrider_overlays", "MP_LR_Tat_002_M" },
    { "mplowrider_overlays", "MP_LR_Tat_013_M" },
    { "mplowrider_overlays", "MP_LR_Tat_026_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_012_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_016_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_019_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_002_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_008_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_014_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_015_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_002_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_012_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_025_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_027_M" },
    { "mpbusiness_overlays", "MP_Buis_M_Stomach_000" },
    { "mpbusiness_overlays", "MP_Buis_M_Chest_000" },
    { "mpbusiness_overlays", "MP_Buis_M_Chest_001" },
    { "mpbeach_overlays", "MP_Bea_F_Chest_000" },
    { "mpbeach_overlays", "MP_Bea_F_Chest_001" },
    { "mpbeach_overlays", "MP_Bea_F_Chest_002" },
    { "mpbeach_overlays", "MP_Bea_F_Stom_000" },
    { "mpbeach_overlays", "MP_Bea_F_Stom_001" },
    { "mpbeach_overlays", "MP_Bea_F_Stom_002" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_029_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_028_M" },
    { "multiplayer_overlays", "FM_Tat_M_010" },
    { "multiplayer_overlays", "FM_Tat_Award_M_004" },
    { "new_overlays", "gtalife_johnny_torso_M" },
    { "multiplayer_overlays", "FM_Tat_M_033" },
    { "multiplayer_overlays", "FM_Tat_M_002" },
    { "multiplayer_overlays", "FM_Tat_M_008" },
    { "multiplayer_overlays", "FM_Tat_M_021" },
    { "multiplayer_overlays", "FM_Tat_M_023" },
    { "multiplayer_overlays", "FM_Tat_M_026" },
    { "multiplayer_overlays", "FM_Tat_M_032" },
    { "multiplayer_overlays", "FM_Tat_M_035" },
    { "multiplayer_overlays", "FM_Tat_M_037" },
    { "multiplayer_overlays", "FM_Tat_Award_M_009" },
    { "mphipster_overlays", "FM_Hip_M_Tat_019" },
    { "mphipster_overlays", "FM_Hip_M_Tat_040" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_002_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_015_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_027_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_036_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_037_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_044_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_056_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_057_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_001" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_002" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_005_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_007_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_011_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_023_M" },
    { "mplowrider_overlays", "MP_LR_Tat_007_M" },
    { "mplowrider_overlays", "MP_LR_Tat_020_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_029_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_000_M" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_011_M" },
    { "multiplayer_overlays", "FM_Tat_Award_M_006" },
    { "multiplayer_overlays", "FM_Tat_M_007" },
    { "multiplayer_overlays", "FM_Tat_M_017" },
    { "multiplayer_overlays", "FM_Tat_M_022" },
    { "multiplayer_overlays", "FM_Tat_M_039" },
    { "multiplayer_overlays", "FM_Tat_M_040" },
    { "multiplayer_overlays", "FM_Tat_M_042" },
    { "multiplayer_overlays", "FM_Tat_M_043" },
    { "mphipster_overlays", "FM_Hip_M_Tat_038" },
    { "mphipster_overlays", "FM_Hip_M_Tat_042" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_004_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_022_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_028_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_040_M" },
    { "mpbiker_overlays", "MP_MP_Biker_Tat_048_M" },
    { "mpchristmas2_overlays", "MP_Xmas2_M_Tat_014" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_006_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_026_M" },
    { "mpgunrunning_overlays", "MP_Gunrunning_Tattoo_030_M" },
    { "mplowrider_overlays", "MP_LR_Tat_017_M" },
    { "mplowrider_overlays", "MP_LR_Tat_023_M" },
    { "mplowrider2_overlays", "MP_LR_Tat_030_M" },
    { "mpluxe_overlays", "MP_LUXE_TAT_001_M" },
    { "mpbeach_overlays", "MP_Bea_F_RLeg_000" },
    { "mpluxe2_overlays", "MP_LUXE_TAT_023_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_000_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_001_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_002_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_003_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_004_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_005_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_006_M" },
    { "mpAirRaces_overlays", "MP_AirRaces_Tattoo_007_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_000_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_001_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_002_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_003_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_004_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_005_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_006_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_007_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_008_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_009_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_010_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_011_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_012_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_013_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_014_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_015_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_016_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_017_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_018_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_019_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_020_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_021_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_022_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_023_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_024_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_025_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_026_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_027_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_028_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_029_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_030_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_031_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_032_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_033_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_034_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_035_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_036_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_037_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_038_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_039_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_040_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_041_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_042_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_043_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_044_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_045_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_046_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_047_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_048_M" },
    { "mpStunt_overlays", "MP_MP_Stunt_Tat_049_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_000_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_001_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_002_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_003_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_004_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_005_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_006_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_007_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_008_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_009_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_010_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_011_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_012_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_013_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_014_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_015_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_016_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_017_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_018_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_019_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_020_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_021_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_022_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_023_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_024_M" },
    { "mpSmuggler_overlays", "MP_Smuggler_Tattoo_025_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_000_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_001_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_002_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_003_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_004_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_005_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_006_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_007_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_008_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_009_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_010_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_011_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_012_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_013_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_014_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_015_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_016_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_017_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_018_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_019_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_020_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_021_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_022_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_023_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_024_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_025_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_026_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_027_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_028_M" },
    { "mpChristmas2017_overlays", "MP_Christmas2017_Tattoo_029_M" },
    { "mpbeach_overlays", "FM_Hair_Fuzz" } }
RMenu.Add('tattooshop', 'main', RageUI.CreateMenu("Stalya", ""))
RMenu:Get('tattooshop', 'main'):SetSubtitle("Salon de tatouages")
RMenu:Get('tattooshop', 'main').Closed = function()
    for k, v in pairs(Character.EquippedClothes) do
        Utils:ClothEquip(v, k)
    end
end
RMenu.Add('tattooshop', 'type', RageUI.CreateSubMenu(RMenu:Get('tattooshop', 'main'), "Stalya", "Types"))
RMenu:Get('tattooshop', 'type').onIndexChange = function(Index)
    ClearPedDecorations(PlayerPedId())
    if index ~= 0 then
        Utils:ApplyTattoos(Character.Tattoos["0"])
    end
    if index ~= 1 then
        Utils:ApplyTattoos(Character.Tattoos["1"])
    end
    if index ~= 2 then
        Utils:ApplyTattoos(Character.Tattoos["2"])
    end
    if index ~= 3 then
        Utils:ApplyTattoos(Character.Tattoos["3"])
    end
    if index ~= 4 then
        Utils:ApplyTattoos(Character.Tattoos["4"])
    end
    if index ~= 5 then
        Utils:ApplyTattoos(Character.Tattoos["5"])
    end
    AddPedDecorationFromHashes(PlayerPedId(), Categories[index].content[Index][1], Categories[index].content[Index][2])
end
RMenu:Get('tattooshop', 'type').Closed = function()
    ClearPedDecorations(PlayerPedId())
    for k,v in pairs(Character.Tattoos) do
        Utils:ApplyTattoos(v)
    end
end
function RageUI.PoolMenus:TattoosShop()
    RageUI.IsVisible(RMenu:Get('tattooshop', 'main'), function()
        for k, v in pairs(Categories) do
            if k <= 5 then
                RageUI.Button(v.name, nil, {}, true, {
                    onSelected = function(Index)
                        index = k
                        RMenu:Get('tattooshop', 'type').Index = 1
                        RMenu:Get('tattooshop', 'type'):SetSubtitle(v.name)
                        RageUI.OpenSubmenu(RMenu:Get('tattooshop', 'type'))
                    end
                })
            end
        end
    end)
     RageUI.IsVisible(RMenu:Get('tattooshop', 'type'), function()
        for k, v in pairs(Categories[index].content) do
            RageUI.Button(k, nil, { RightLabel = "(~g~100 $~w~)" }, true, {
                onSelected = function()
                    local txt = KeyboardInput("Veuillez confirmer votre achat (~g~Y~w~/~r~N~w~)", 'N', 1, false)
                    if txt ~= nil and string.lower(txt) == "y" then
                        local data = { v[1], v[2] }
                        TriggerServerEvent('Ms:TattoosShop', data, index)
                    end
                end,
            })
        end
    end)
end
function GetTattoos ()
    for k, v in pairs(TattoosList) do
        local type = GetPedDecorationZoneFromHashes(GetHashKey(v[1]), GetHashKey(v[2]))
        table.insert(Categories[type].content, { GetHashKey(v[1]), GetHashKey(v[2]) })
    end
end
local types = { { "Berlines", 1 }, { "Vehicules Compacts", 2 }, {"Tout-Terrain", 4},{"Grosses Cylindrées", 5}, { "Sportives Classiques", 10 }, { "SUV", 11 }, { "Camionnettes", 15 }, { "Coupés", 16 }, { "Motos", 18 }, { "Sportives", 19 }, { "Super sportives", 21 } }
local category = {}
local VehicleColors, index = { 0, 135, 88, 38, 53, 64, 27, 111 }, 1
local vehicles_shop, BuyableSelected = {
    Id = 0,
    coords = {},
    preview = true,
    model = "",
    vehicle = 0,
}, {}
RMenu.Add('shopvehicles', 'preview', RageUI.CreateMenu("Concessionnaire", ""))
RMenu.Add('shopvehicles', 'main', RageUI.CreateMenu("Concessionnaire", ""))
RMenu:Get('shopvehicles', 'main'):SetSubtitle("Stalya Menu")
RMenu:Get('shopvehicles', 'main'):DisplayGlare(true);
RMenu.Add('shopvehicles', 'categories', RageUI.CreateSubMenu(RMenu:Get('shopvehicles', 'main'), "Concessionnaire", "Catégories"))
RMenu.Add('shopvehicles', 'preview', RageUI.CreateSubMenu(RMenu:Get('shopvehicles', 'categories'), "Concessionnaire", "Prévisualisation"))
RMenu:Get('shopvehicles', 'main').Closed = function()
    if (DoesEntityExist(vehicles_shop.vehicle)) then
        DeleteEntity(vehicles_shop.vehicle)
        vehicles_shop.Id = 0
        vehicles_shop.model = ""
        BuyableSelected = {}
        index = 1
    end
end;
RMenu:Get('shopvehicles', 'preview').Closed = function()
    if (DoesEntityExist(vehicles_shop.vehicle)) then
        DeleteEntity(vehicles_shop.vehicle)
        vehicles_shop.Id = 0
        vehicles_shop.model = ""
        BuyableSelected = {}
        index = 1
    end
end;
function RageUI.PoolMenus:VehiclesShop()
    RageUI.IsVisible(RMenu:Get('shopvehicles', 'main'), function()
        for k, v in pairs(types) do
            RageUI.Button(v[1], nil, {}, true, {
                onSelected = function()
                    category = GetVehiclesByCategory(v[2])
                    if (DoesEntityExist(vehicles_shop.vehicle)) then
                        DeleteEntity(vehicles_shop.vehicle)
                        vehicles_shop.Id = 0
                        vehicles_shop.model = ""
                        BuyableSelected = {}
                        index = 1
                    end
                    vehicles_shop.coords = vector3(-783.91, -223.87, 37.32)
                    RMenu:Get('shopvehicles', 'categories'):SetSubtitle(v[1])
                end
            }, RMenu:Get('shopvehicles', 'categories'))
        end
    end)
   RageUI.IsVisible(RMenu:Get('shopvehicles', 'categories'), function()
        for k, v in pairs(category) do
            if v.ForSale then
                RageUI.Button(v.Name, sf("Nom : ~b~%s~w~\nPrix : ~g~%s $~w~\nStockage : ~o~%s Kg", v.Name, Utils:CommaValue(v.Price), v.StoragePlace), { }, Utils:CanSpawnVehicle(), {
                    onSelected = function()
                        if (DoesEntityExist(vehicles_shop.vehicle)) then
                            DeleteEntity(vehicles_shop.vehicle)
                            vehicles_shop.Id = 0
                            vehicles_shop.model = ""
                            BuyableSelected = {}
                            index = 1
                        end
                        SaMereLaTchoin(v.Model)
                        SetGameplayCoordHint(vehicles_shop.coords.x, vehicles_shop.coords.y, vehicles_shop.coords.z, 1500, 500, 500, 0)
                        BuyableSelected = v
                        vehicles_shop.Id = k
                    end,
                }, RMenu:Get('shopvehicles', 'preview'))
            end
        end
    end)
    RageUI.IsVisible(RMenu:Get('shopvehicles', 'preview'), function()
        RageUI.List("Couleur du véhicule", { "Noir", "Rose", "Jaune", "Orange", "Vert", "Bleu", "Rouge", "Blanc" }, index or 1, sf("Nom : ~b~%s~w~\nPrix : ~g~%s $~w~\nStockage : ~o~%s Kg", BuyableSelected.Name, Utils:CommaValue(BuyableSelected.Price), BuyableSelected.StoragePlace), {}, vehicles_shop.preview, {
            onListChange = function(Index, Items)
                index = Index
                SetVehicleColours(vehicles_shop.vehicle, VehicleColors[index], VehicleColors[index])
            end,
            onSelected = function()
            end,
        })
        RageUI.Button('~g~Acheter', sf("Nom : ~b~%s~w~\nPrix : ~g~%s $~w~\nStockage : ~o~%s Kg", BuyableSelected.Name, Utils:CommaValue(BuyableSelected.Price), BuyableSelected.StoragePlace), { RightLabel = sf("~g~%s $~w~", Utils:CommaValue(BuyableSelected.Price)) }, Utils:CanSpawnVehicle(), {
            onSelected = function()
                if BuyableSelected.ForSale then
                    local Data = {
                        Name = BuyableSelected.Name,
                        Storage = BuyableSelected.StoragePlace,
                        Model = BuyableSelected.Model,
                        VehData = { ["colors"] = { ["1"] = VehicleColors[index], ["2"] = VehicleColors[index], ["3"] = VehicleColors[index]  } },
                        Id = BuyableSelected.Id
                    }
                    TriggerServerEvent("Ms:BuyVehicle", Data)
                end
            end,
        })
    end, function()
        local vehicle = vehicles_shop.vehicle
        local handling = GetVehicleMaxTraction(vehicle) / 4
        if handling > 1.0 then handling = 1.0 end
        RageUI.StatisticPanel(GetVehicleEstimatedMaxSpeed(vehicle) / 75, "Vitesse de pointe")
        RageUI.StatisticPanel(GetVehicleAcceleration(vehicle), "Accélération")
        RageUI.StatisticPanel(GetVehicleMaxBraking(vehicle) / 1.5, "Freinage")
        RageUI.StatisticPanel(handling, "Tenue de route")
    end)
end
function GetVehiclesByCategory(TypeId)
    local result = {}
    for k, v in ipairs(VehiclesData) do
        if (v.TypeId == TypeId and v.ForSale) then
            table.insert(result, v)
        end
    end
    table.sort(result, function(a,b) return a.Price < b.Price end)
    return result
end
function SaMereLaTchoin(model)
    if (vehicles_shop.model == model) then
        return
    end
    vehicles_shop.preview = false
    vehicles_shop.model = model
    Citizen.CreateThread(function()
        if (DoesEntityExist(vehicles_shop.vehicle)) then
            DeleteEntity(vehicles_shop.vehicle)
        end
        local ped = PlayerPedId()
        local model = GetHashKey(model)
        Utils:RequestModel(model)
        local vehicle = CreateVehicle(model, vehicles_shop.coords.x, vehicles_shop.coords.y, vehicles_shop.coords.z, 85.33, false, false)
        SetModelAsNoLongerNeeded(model)
        FreezeEntityPosition(vehicle, true)
        SetVehicleEngineOn(vehicle, false, true, true)
        SetVehicleNumberPlateText(vehicle, "STALYA")
        SetVehicleColours(vehicle, 0, 0)
        SetVehicleExtraColours(vehicle, 0, 0)
        SetVehicleDoorsLocked(vehicle, 2)
        vehicles_shop.vehicle = vehicle
        vehicles_shop.preview = true
    end)
end
RegisterNetEvent('Ms:EmsRevivePlayerTarget')
AddEventHandler('Ms:EmsRevivePlayerTarget', function(coords, bool)
    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        if not bool then Citizen.Wait(5000) end
        DoScreenFadeOut(500)
        Citizen.Wait(1000)
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z + 0.5, GetEntityHeading(ped), true, false)
        ClearPedBloodDamage(ped)
        DoScreenFadeIn(1500)
        Citizen.Wait(1500)
        TriggerEvent('wejdenehop')
    end)
end)
RegisterNetEvent('Ms:EmsRevivePlayerSource')
AddEventHandler('Ms:EmsRevivePlayerSource', function(targetId)
    Utils:PlayAnim('mini@cpr@char_a@cpr_str', 'cpr_pumpchest', 0, 0, 1, 5000)
end)
RegisterCommand("dv", function(source, args)
    local radius = tonumber(args[1])
    if radius == nil then return end
    TriggerServerEvent('Ms:DeleteVehiclesRadius', radius)
end)
RegisterCommand("register", function(source, args)
    if Character.Id == nil then return end
    if Character.HasRegister then return end
    RageUI.Visible(RMenu:Get('connection', 'newcharacter'), true)
    updateFace()
    CharacterCreation.sex.current = "mp_m_freemode_01"
    updateAllValue(true)
end)
Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(764926241207615548)
        if Character.Identity ~= nil then
        	SetRichPresence(sf("%s %s [%s]", Character.Identity.firstname, Character.Identity.lastname, Character.Id))
        else
        	SetRichPresence("En attente ...")
    	end
        SetDiscordRichPresenceAsset('big')
        SetDiscordRichPresenceAssetText('Stalya - discord.gg/stalya')
        Citizen.Wait(60000)
    end
end)
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            disposeFunc(iter)
            return
        end
        local enum = { handle = iter, destructor = disposeFunc }
        setmetatable(enum, entityEnumerator)
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
function GetVehicles()
    local objects = {}
    for object in EnumerateVehicles() do
        table.insert(objects, object)
    end
    return objects
end
function GetPeds()
    local objects = {}
    for object in EnumeratePeds() do
        table.insert(objects, object)
    end
    return objects
end
function GetVehicleInRange(vector3Data, range)
    local objects = GetVehicles()
    local objectsInRange = {}
    for i = 1, #objects, 1 do
        local distance = #(GetEntityCoords(objects[i]) - vector3Data)
        if distance == -1 or distance <= range then
            table.insert(objectsInRange, { object = objects[i], distance = distance })
        end
    end
    return objectsInRange
end
function GetPedInRange(vector3Data, range)
    local objects = GetPeds()
    local objectsInRange = {}
    for i = 1, #objects, 1 do
        local distance = #(GetEntityCoords(objects[i]) - vector3Data)
        if distance == -1 or distance <= range then
            table.insert(objectsInRange, { object = objects[i], distance = distance })
        end
    end
    return objectsInRange
end
function GetRobberyPedsInRange(vector3Data, range)
    local objects = GetPeds()
    local objectsInRange = {}
    for i = 1, #objects, 1 do
        local distance = #(GetEntityCoords(objects[i]) - vector3Data)
        if distance == -1 or distance <= range then
            for k,v in pairs (Robbery.peds) do
                if vector3(v.Coords.x, v.Coords.y, v.Coords.z) == GetEntityCoords(objects[i]) then
                    table.insert(objectsInRange, { object = objects[i], distance = distance, NpcId = v.Id })
                end
            end
        end
    end
    return objectsInRange
end
RegisterNetEvent('Ms:ShowNotify')
AddEventHandler('Ms:ShowNotify', function(args)
    Visual.ShowNotify(args)
end)
RegisterNetEvent('Ms:LoadJobs')
AddEventHandler('Ms:LoadJobs', function(data)
    Jobs = data
end)
RegisterNetEvent('Ms:LoadObjects')
AddEventHandler('Ms:LoadObjects', function(data, wdata, cdata)
    Objects = data
    Weapons = wdata
    Components = cdata
end)
RegisterNetEvent('Ms:CloseAllMenu')
AddEventHandler('Ms:CloseAllMenu', function()
    RageUI.CloseAll()
end)
RegisterNetEvent('Ms:UpdateRegister')
AddEventHandler('Ms:UpdateRegister', function()
    Character.HasRegister = true
end)
RegisterNetEvent('yoyomolomolo')
AddEventHandler('yoyomolomolo', function(cjobs)
    CharactersJobs = cjobs
end)
RegisterNetEvent('Ms:UpdateCharacter')
AddEventHandler('Ms:UpdateCharacter', function(data)
    Character = data
end)
RegisterNetEvent('Ms:UpdateStaffPed')
AddEventHandler('Ms:UpdateStaffPed', function()
    Utils:UpdateStaffPed()
end)
RegisterNetEvent('Ms:LoadVehiclesData')
AddEventHandler('Ms:LoadVehiclesData', function(data)
    VehiclesData = data
end)
RegisterNetEvent('Ms:LoadClohtesPreset')
AddEventHandler('Ms:LoadClohtesPreset', function(data)
    ClothesPreset = data
end)
RegisterNetEvent('Ms:AddAlertJob')
AddEventHandler('Ms:AddAlertJob', function(data)
    table.insert(JobAlerts, data)
end)
RegisterNetEvent('Ms:ChangeStates')
AddEventHandler('Ms:ChangeStates', function(states)
    Character.States = states
    local ped = PlayerPedId()
    TriggerEvent('Ms:UpdateHud', Character.States)
    if Character.States.Hunger <= 0 or Character.States.Thirst <= 0 then
        SetEntityHealth(ped, 0)
        return
    end
    SetEntityHealth(ped, Character.States.Health)
end)
RegisterNetEvent('Ms:UpdateCharacterJobs')
AddEventHandler('Ms:UpdateCharacterJobs', function(data)
    Character.Jobs = data
    JobAlerts = {}
end)
RegisterNetEvent('Ms:UpdateStaff')
AddEventHandler('Ms:UpdateStaff', function(data)
    Administration.Characters = data
    for _, v in pairs(Administration.GamerTags) do
        RemoveMpGamerTag(v)
    end
    Administration.GamerTags = {}
end)
RegisterNetEvent('Ms:SetCharacterData')
AddEventHandler('Ms:SetCharacterData', function(data, doorr, cjobs, accdata, invoices)
    Citizen.CreateThread(function()
        Character = data
        Account = accdata
        Invoices.Character = invoices
        GameTimer.OsTime = GetGameTimer()
        CharactersJobs = cjobs
        local ped = PlayerPedId()
        DoScreenFadeOut(500)
        local coords = Character.Location
        SetEntityCoords(ped, coords.x, coords.y, coords.z)
        AddTextEntry('FE_THDR_GTAO', sf("%s %s [%s] ~b~Stalya - discord.gg/stalya~w~", Character.Identity.firstname, Character.Identity.lastname, Character.Id))
        if Character.StaffRank == 0 and Character.CustomModel == "" or Character.StaffRank == 4 or Character.StaffRank == 5 then
            local model = GetHashKey(Character.Model)
            Utils:RequestModel(model)
            SetPlayerModel(PlayerId(), model)
            SetPedDefaultComponentVariation(PlayerPedId())
            SetModelAsNoLongerNeeded(model)
            Utils:ApplySkin(Character.Skin)
            ClearPedDecorations(ped)
            for k, v in pairs(Character.Tattoos) do
                Utils:ApplyTattoos(v)
            end
            for k, v in pairs(Character.EquippedClothes) do
                Utils:ClothEquip(v, k)
            end
        else
            if Character.StaffRank == 0 then
                Utils:RequestModel(Character.CustomModel)
                SetPlayerModel(PlayerId(), Character.CustomModel)
                SetPedDefaultComponentVariation(PlayerPedId())
                SetModelAsNoLongerNeeded(Character.Model)
            else
                Utils:UpdateStaffPed()
            end
        end
        Utils:UpdateWeightSubtitle()
        UpdateStoreData()
        UpdatePropStoreData()
        GetTattoos()
        Doors = doorr
        Utils:LoadDoors()
        HandcuffConnect(Character.Handcuffed)
        Citizen.Wait(3000)
        SetEntityMaxHealth(PlayerPedId(), 200)
        SetEntityHealth(PlayerPedId(), Character.States.Health)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        SetPlayerHealthRechargeLimit(PlayerId(), 0)
        RenderScriptCams(0, true, 0, 1, 1)
        DoScreenFadeIn(3000)
        DisplayRadar(true)
        DisplayHud(true)
        NetworkSetFriendlyFireOption(true)
        SetCanAttackFriendly(PlayerPedId(), true, true)
        SetMaxWantedLevel(0)
        SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
        MumbleSetServerAddress('51.91.214.177', 30120)
        TriggerEvent('Ms:DisplayHud')
        if Character.StaffRank == 0 then
            local commands = { "/setjob", "/ban", "/car", "/announce", "/revive", "/deljob", "/bring", "/goto", "/search", "/kick", "/setrank", "/resetped", "/unban", "/search", "/giveregister", "/giveweapon", "/jail" }
            TriggerEvent('chat:removeSuggestion', '/setjob')
            for _, v in pairs(commands) do
                TriggerEvent('chat:removeSuggestion', v)
            end
        else
            TriggerEvent('chat:addSuggestion', '/ban', 'Permet de bannir une personne avec un Id.', {
                { name = "id", help = "Id du personnage" },
                { name = "time", help = "Temps en minutes" },
                { name = "reason", help = "Raison" }
            })
            TriggerEvent('chat:addSuggestion', '/kick', "Permet d'expulser une personne avec un Id.", {
                { name = "id", help = "Id du personnage" },
            })
            TriggerEvent('chat:addSuggestion', '/setjob', "Permet de changer le métier d'une personne.", {
                { name = "job", help = "Id du métier" },
                { name = "rank", help = "Id du rang" },
                { name = "character", help = "Id du personnage" }
            })
            TriggerEvent('chat:addSuggestion', '/setrank', "Permet de changer le rang staff d'une personne.", {
                { name = "id", help = "Id du personnage" },
                { name = "rank", help = "Id du rang" },
            })
            TriggerEvent('chat:addSuggestion', '/resetped', "Permet de reset le ped d'une personne.", {
                { name = "id", help = "Id du personnage" },
            })
            TriggerEvent('chat:addSuggestion', '/unban', "Permet de débannir une personne.", {
                { name = "id", help = "Id du personnage" },
            })
            TriggerEvent('chat:addSuggestion', '/search', "Permet d'avoir les informations entière personne.", {
                { name = "discordid", help = "Identifiant discord de la personne" },
            })
            TriggerEvent('chat:addSuggestion', '/giveregister', "Permet de donner un register à une personne.", {
                { name = "id", help = "Id du personnage" },
            })
            TriggerEvent('chat:addSuggestion', '/jail', "Permet de mettre une personne en prison.", {
                { name = "id", help = "Id du personnage" },
                { name = "time", help = "Temps en minutes" },
            })
            TriggerEvent('chat:addSuggestion', '/unjail', "Permet de sortir une personne de prison.", {
                { name = "id", help = "Id du personnage" },
            })
        end
    end)
end)
RegisterNetEvent('Ms:UseAction')
AddEventHandler('Ms:UseAction', function(data, value)
    local ped = PlayerPedId()
    local states = json.decode(Character.States)
    _ = states({
        [1] = function()
            SetEntityHealth(ped, value)
            states.health = value
        end,
        [2] = function()
            SetEntityHealth(ped, value)
            states.health = value
        end
    })[data]()
end)
RegisterNetEvent('Ms:ChangeObjectQuantity')
AddEventHandler('Ms:ChangeObjectQuantity', function(objectId, quantity)
    if Character.Inventory[objectId] == nil then
        Character.Inventory[objectId] = {}
    end
    Character.Inventory[objectId].Quantity = quantity
    Utils:UpdateWeightSubtitle()
end)
RegisterNetEvent('Ms:LoadNpcs')
AddEventHandler('Ms:LoadNpcs', function(data)
    Npcs = data
    for i, _ in pairs(Npcs) do
        Utils:RequestModel(Npcs[i].Model)
        local coords = Npcs[i].Coords
        local ped = CreatePed(5, Npcs[i].Model, coords.x, coords.y, coords.z - 1, Npcs[i].Heading, false, false)
        SetModelAsNoLongerNeeded(Npcs[i].Model)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        if _.Model == 'mp_m_shopkeep_01' then
            table.insert(Robbery.peds, Npcs[i])
        end
        if Npcs[i].Anim ~= nil and Npcs[i].Anim.dict ~= nil then
            Citizen.CreateThread(function()
                local animDict = Npcs[i].Anim.dict
                local animName = Npcs[i].Anim.name
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(1)
                end
                TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 1, 1, 0, 0, 0)
                if animDict ~= nil then
                    RemoveAnimDict(animDict)
                end
            end)
        end
    end
end)
RegisterNetEvent('Ms:CreateNpc')
AddEventHandler('Ms:CreateNpc', function(data)
    Utils:RequestModel(data.Model)
    local ped = CreatePed(5, data.Model, data.Coords.x, data.Coords.y, data.Coords.z, data.Heading, false, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    if data.Anim ~= nil and data.Anim.dict ~= nil then
        Citizen.CreateThread(function()
            local animDict = data.Anim.dict
            local animName = data.Anim.name
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Citizen.Wait(1)
            end
            TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 1, 1, 0, 0, 0)
            if animDict ~= nil then
                RemoveAnimDict(animDict)
            end
        end)
    end
end)
RegisterNetEvent('Ms:LoadMarkers')
AddEventHandler('Ms:LoadMarkers', function(data)
    for i, _ in pairs(data) do
        data[i].Size = data[i].Size + .0
    end
    Markers = data
    Utils:LoadMarkers()
end)
RegisterNetEvent('Ms:SpawnVehicle')
AddEventHandler('Ms:SpawnVehicle', function(VehicleData, spawnCoords)
    if not Utils:CanSpawnVehicle() then
        return
    end
    if not Utils:CharacterHasVehicle(VehicleData.Id) and Character.StaffRank <= 3 then
        return
    end
    GameTimer.Vehicle = GetGameTimer()
    local vJob, vRank, vRankId, vKey = Utils:GetCharacterJob(Character, true)
    local ped = PlayerPedId()
    local coords = spawnCoords
    local model = GetHashKey(VehicleData.Model)
    Utils:RequestModel(model)
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, coords.w or false, true, true)
    SetModelAsNoLongerNeeded(model)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleOnGroundProperly(vehicle)
    if Utils:CharacterHasVehicle(VehicleData.Id) then
        if Character.Vehicles[VehicleData.Id].Recovered then
            Character.Vehicles[VehicleData.Id].Recovered = false
        end
        SetVehicleNumberPlateText(vehicle, VehicleData.Plate)
        if Character.Vehicles[VehicleData.Id].Model ~= "vehiclejob" then
            Utils:ApplyVehicleData(vehicle, VehicleData.Data)
        end
    end
    if vJob ~= nil and vJob.Id == 1 and Character.Vehicles[VehicleData.Id] ~= nil and Character.Vehicles[VehicleData.Id].Model == "vehiclejob" or vJob ~= nil and vJob.Id == 2 and Character.Vehicles[VehicleData.Id] ~= nil and Character.Vehicles[VehicleData.Id].Model == "vehiclejob" then
        SetVehicleMod(vehicle, 11, 3, true)
        ToggleVehicleMod(vehicle, 22, true)
        SetVehicleMod(vehicle, 12, 2, true)
        SetVehicleMod(vehicle, 16, 5, true)
        SetVehicleMod(vehicle, 13, 2, true)
        ToggleVehicleMod(vehicle, 18, true)
        SetVehicleMod(vehicle, 15, 3, true)
        SetVehicleWindowTint(vehicle, 1)
    end
    if VehicleData.Model == "rmodrs6" then
        SetVehicleLivery(vehicle, 0)
    end
    if VehicleData.Model == "rs7r" then
        SetVehicleExtra(vehicle, 2, true)
    end
    WashDecalsFromVehicle(vehicle, 1.0)
    SetVehicleDirtLevel(vehicle)
    TaskWarpPedIntoVehicle(ped, vehicle, -1)
    local start = GetGameTimer()
    local netID = NetworkGetNetworkIdFromEntity(vehicle)
    while (not netID or not NetworkDoesNetworkIdExist(netID)) and start + 5000 > GetGameTimer() and DoesEntityExist(vehicle) do
        Citizen.Wait(1000)
        NetworkRegisterEntityAsNetworked(vehicle)
        netID = NetworkGetNetworkIdFromEntity(vehicle)
    end
    SetNetworkIdExistsOnAllMachines(netID, true)
end)
RegisterNetEvent('Ms:WaitCharacter')
AddEventHandler('Ms:WaitCharacter', function()
    DisplayRadar(false)
    local currentcam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    SetCamCoord(currentcam, 701.47, 1031.08, 330.57)
    ShakeCam(currentcam, "HAND_SHAKE", 0.1)
    SetCamRot(currentcam, -0, -0, -11.48)
    SetCamActive(currentcam, true)
    RenderScriptCams(1, 0, 500, false, false)
end)
RegisterNetEvent('Ms:EquipClothe')
AddEventHandler('Ms:EquipClothe', function(ClotheId, Type)
    Utils:ClothEquip(ClotheId, Type)
end)
RegisterNetEvent('Ms:UpdateEMSCall')
AddEventHandler('Ms:UpdateEMSCall', function(states, coords, bool)
    Character.States = states
    TriggerEvent('Ms:EmsRevivePlayerTarget', coords, bool)
    RageUI.CloseAll()
end)
RegisterNetEvent('Ms:RageUICloseAll')
AddEventHandler('Ms:RageUICloseAll', function()
    RageUI.CloseAll()
end)
RegisterNetEvent('Ms:RenameClothe')
AddEventHandler('Ms:RenameClothe', function(ClotheId, Name)
    local clothe = Character.ClothItems[ClotheId]
    if (clothe ~= nil) then
        clothe.Name = Name
    end
end)
RegisterNetEvent('Ms:UpdateClothes')
AddEventHandler('Ms:UpdateClothes', function(ClotheId, value)
    Character.ClothItems[ClotheId] = value
end)
RegisterNetEvent('Ms:BuyVehicle')
AddEventHandler('Ms:BuyVehicle', function(id, content)
    Character.Vehicles[id] = content
    Character.Vehicles[id].Id = id
end)
RegisterNetEvent('Ms:KickMeFromVehicle')
AddEventHandler('Ms:KickMeFromVehicle', function()
    local ped = PlayerPedId()
    TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped), 16)
end)
RegisterNetEvent('Ms:Exchange')
AddEventHandler('Ms:Exchange', function(onExchange, mId, description)
    local ped = PlayerPedId()
    if onExchange then
        TaskStartScenarioInPlace(ped, 'world_human_bum_standing', 0, true)
    else
        ClearPedTasksImmediately(ped)
    end
    Markers[mId].Description = description
end)
RegisterNetEvent('Ms:GetStorage')
AddEventHandler('Ms:GetStorage', function(inventory)
    VehicleStorage = inventory
    RageUI.Visible(RMenu:Get('vehiclestorage', 'main'), not RageUI.Visible(RMenu:Get('vehiclestorage', 'main')))
end)
RegisterNetEvent('Ms:OpenStorage')
AddEventHandler('Ms:OpenStorage', function(inventory)
    JobStorage = inventory
    RageUI.Visible(RMenu:Get('jobstorage', 'storage'), not RageUI.Visible(RMenu:Get('job', 'storage')))
end)
RegisterNetEvent('Ms:CloseVehicleStorage')
AddEventHandler('Ms:CloseVehicleStorage', function()
    RageUI.Visible(RMenu:Get('vehiclestorage', 'main'), false)
    RageUI.Visible(RMenu:Get('vehiclestorage', 'take'), false)
    RageUI.Visible(RMenu:Get('vehiclestorage', 'give'), false)
    VehicleStorage = {}
end)
RegisterNetEvent('Ms:CloseJobStorage')
AddEventHandler('Ms:CloseJobStorage', function()
    RageUI.Visible(RMenu:Get('jobstorage', 'storage'), false)
    RageUI.Visible(RMenu:Get('jobstorage', 'take'), false)
    RageUI.Visible(RMenu:Get('jobstorage', 'give'), false)
    JobStorage = {}
end)
RegisterNetEvent('Ms:UpdateVehicleStorageQuantity')
AddEventHandler('Ms:UpdateVehicleStorageQuantity', function(itemId, quantity)
    if VehicleStorage[itemId] == nil then
        VehicleStorage[itemId] = {}
    end
    VehicleStorage[itemId].Quantity = quantity
end)
RegisterNetEvent('Ms:UpdateJobStorageQuantity')
AddEventHandler('Ms:UpdateJobStorageQuantity', function(itemId, quantity)
    if JobStorage[itemId] == nil then
        JobStorage[itemId] = {}
    end
    JobStorage[itemId].Quantity = quantity
end)
RegisterNetEvent('Ms:LoadBlips')
AddEventHandler('Ms:LoadBlips', function(blips)
    for id, data in pairs(blips) do
        Utils.AddBlip(id, data)
    end
end)
RegisterNetEvent('Ms:AddBlip')
AddEventHandler('Ms:AddBlip', function(id, data)
    Utils.AddBlip(id, data)
end)
RegisterNetEvent('Ms:RemoveBlip')
AddEventHandler('Ms:RemoveBlip', function(id)
    Utils.DeleteBlip(id)
end)
RegisterNetEvent('Ms:SpawnBlips')
AddEventHandler('Ms:SpawnBlips', function(v)
    local blip = AddBlipForCoord(v.Coords.x, v.Coords.y, v.Coords.z)
    SetBlipSprite(blip, v.SpriteId)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, v.Scale)
    SetBlipColour(blip, v.Color)
    SetBlipAlpha(blip, v.Alpha)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(v.Name)
    EndTextCommandSetBlipName(blip)
end)
RegisterNetEvent('Ms:AddReport')
AddEventHandler('Ms:AddReport', function(data)
    Administration.Reports[data.reportId] = data
    Visual.ShowNotify({
        title = "Administration",
        subtitle = "~b~" .. sf("Report #%s - %s", data.reportId, data.identity),
        message = data.message,
        dict = "stalya",
        name = "logo_blue",
        icon = 7
    })
end)
RegisterNetEvent('Ms:RemoveReport')
AddEventHandler('Ms:RemoveReport', function(reportId, identity)
    Administration.Reports[reportId] = nil
    Visual.ShowNotify({
        title = "Administration",
        subtitle = "~b~" .. sf("Report #%s", reportId),
        message = sf("Le report #%s a était pris par %s", reportId, identity),
        dict = "stalya",
        name = "logo_blue",
        icon = 7
    })
end)
RegisterNetEvent('Ms:ChangeTokensQuantity')
AddEventHandler('Ms:ChangeTokensQuantity', function(value)
    Account.Tokens = value
end)
RegisterNetEvent('Ms:UpdateVip')
AddEventHandler('Ms:UpdateVip', function(rank, time)
    Account.Vip = rank
    Account.Expiration = time
    if Account.Vip == 0 and Character.CustomModel ~= "" then
        Character.CustomModel = ""
        local model = GetHashKey(Character.Model)
        Utils:RequestModel(model)
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(model)
        NetworkSetFriendlyFireOption(true)
        SetCanAttackFriendly(PlayerPedId(), true, true)
        SetMaxWantedLevel(0)
        SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
        Utils:ApplySkin(Character.Skin)
        ClearPedDecorations(ped)
        for k, v in pairs(Character.Tattoos) do
            Utils:ApplyTattoos(v)
        end
        for k, v in pairs(Character.EquippedClothes) do
            Utils:ClothEquip(v, k)
        end
    end
end)
NoClip = {
    camera = nil,
    speed = 0.01,
    timer = 0
}
local TextMe = {}
local Holster = { Anim = { [0] = { "reaction@intimidation@1h", "intro" }, [1] = { "reaction@intimidation@1h", "outro" } }, UseAnimation = false, CanSwitch = false, Timer = 3000 }
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        RestorePlayerStamina(PlayerId(), 1.0)
        DisablePlayerVehicleRewards(PlayerId())
        SetRadarAsExteriorThisFrame()
        if vehicle ~= 0 then
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                SetPlayerCanDoDriveBy(PlayerId(), false)
            else
                SetPlayerCanDoDriveBy(PlayerId(), true)
            end
            DisableControlAction(0, 345, true)
        end
        if Character.Id == nil then
            for k, v in pairs(GetActivePlayers()) do
                if NetworkIsPlayerActive(v) then
                    local otherPed = GetPlayerPed(v)
                    if otherPed ~= ped then
                        SetEntityVisible(otherPed, false, false)
                    end
                    DisableControlAction(1, 323)
                    DisableControlAction(0, 29)
                    SetEntityNoCollisionEntity(otherPed, ped, false)
                end
            end
        end
        if WaitMechanicResponse then
            Visual.Subtitle("En attente d'une réponse.")
            if GameTimer.Mechanic + 15000 < GetGameTimer() then
                WaitMechanicResponse = false
                TriggerServerEvent('Ms:CancelMechanicInvoice')
            end
        end
        if Administration.ActionId[5] and GameTimer.GamerTags + 1000 < GetGameTimer() then
            GameTimer.GamerTags = GetGameTimer()
            Utils:ShowGamerTags()
        end
        if (Administration.ActionId[1] or Administration.ActionId[4]) then
            DisableControlAction(0, 30, true)
            DisableControlAction(0, 31, true)
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 12, true)
            DisableControlAction(0, 14, true)
            DisableControlAction(0, 15, true)
            DisableControlAction(0, 16, true)
            DisableControlAction(0, 17, true)
            DisableControlAction(0, 71, true)
            DisableControlAction(0, 72, true)
            DisableControlAction(0, 63, true)
            DisableControlAction(0, 64, true)
            DisableControlAction(0, 68, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 70, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(0, 85, true)
            DisableControlAction(0, 86, true)
            if IsControlJustPressed(1, 96) then
                NoClip.speed = NoClip.speed + 0.1
            end
            if IsControlJustPressed(1, 97) then
                if (NoClip.speed - 0.1 > 0.1) then
                    NoClip.speed = NoClip.speed - 0.1
                else
                    NoClip.speed = 0.1
                end
            end
            freeCam()
        end
        if Character.States ~= nil and Character.States.Health == 0 then
            if (not RageUI.Visible(RMenu:Get('ems', 'main'))) then
                RageUI.CloseAll()
                RageUI.Visible(RMenu:Get('ems', 'main'), true)
            end
        end
        if Character.Robbing ~= nil and Character.Robbing[2] then
            Visual.Subtitle(sf('~r~Vous êtes entrain de braquer. ~w~[~g~%s~w~]', Timer.Robbing))
        end
        if Timer.Robbing ~= 0 and GameTimer.Robbing + 1000 < GetGameTimer() then
            Timer.Robbing = Timer.Robbing - 1
            GameTimer.Robbing = GetGameTimer()
        end
        if Holster.UseAnimation then
            DisableControlAction(2, 37, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 92, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 168, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(1, 323, true)
            DisablePlayerFiring(PlayerId(), true)
        end
        if GetPedConfigFlag(ped, 331) and GameTimer.Holster + Holster.Timer < GetGameTimer() and vehicle == 0 then
            GameTimer.Holster = GetGameTimer()
            HolsterAnim()
        end
        for k, v in pairs(TextMe) do
            if HasEntityClearLosToEntity(ped, v[2]) then
                local coords = GetEntityCoords(v[2])
                Utils:DrawText3D(vector3(coords.x, coords.y, coords.z + 1.0), v[1],  1.0)
            end
        end
        if Character.IsJail then
            DisableControlAction(2, 37, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 92, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 168, true)
            DisableControlAction(0, 140, true)
            Visual.Subtitle(sf("Vous êtes en prison ~w~[~g~%s~w~]", Character.JailEndTime))
        end
        if Ragdoll then
            SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
        end
    end
end)
function HolsterAnim()
    local ped = PlayerPedId()
    local putWeapon = false
    local _, currentWeapon = GetCurrentPedWeapon(ped, true)
    ClearPedTasks(ped)
    Holster.UseAnimation = true
    if currentWeapon == GetHashKey('weapon_unarmed') then
        Holster.CanSwitch = false
        Holster.Timer = 3000
        Utils:PlayAnim(Holster.Anim[1][1], Holster.Anim[1][2], 0, 0, 48, -1)
    else
        if Holster.CanSwitch then
            Holster.Timer = 6000
            Utils:PlayAnim(Holster.Anim[1][1], Holster.Anim[1][2], 0, 0, 48, -1)
        end
        SetPedCurrentWeaponVisible(ped, false)
        Utils:PlayAnim(Holster.Anim[0][1], Holster.Anim[0][2], 0, Holster.CanSwitch and 2000 or 0, 48, -1, function()
            Citizen.Wait(2000)
            SetPedCurrentWeaponVisible(ped, true)
        end)
    end
    Citizen.SetTimeout(Holster.CanSwitch and 5000 or 3000, function()
        if currentWeapon ~= GetHashKey('weapon_unarmed') then
            Holster.CanSwitch = true
        end
        Holster.UseAnimation = false
        ClearPedTasks(ped)
    end)
end
function freeCam()
    local camCoords = GetCamCoord(NoClip.camera)
    local right, forward, up, at = GetCamMatrix(NoClip.camera)
    if Administration.ActionId[1] then
        SetEntityCoords(PlayerPedId(), camCoords.x, camCoords.y, camCoords.z)
    end
    if IsControlPressed(0, 32) then
        local newCamPos = camCoords + forward * NoClip.speed
        SetCamCoord(NoClip.camera, newCamPos.x, newCamPos.y, newCamPos.z)
        if Administration.ActionId[4] then
            SetFocusPosAndVel(newCamPos.x, newCamPos.y, newCamPos.z, 0, 0, 0)
        end
        if Administration.ActionId[1] and NoClip.timer + 75 < GetGameTimer() then
            NoClip.timer = GetGameTimer()
        end
    end
    if IsControlPressed(0, 8) then
        local newCamPos = camCoords + forward * -NoClip.speed
        SetCamCoord(NoClip.camera, newCamPos.x, newCamPos.y, newCamPos.z)
        if Administration.ActionId[4] then
            SetFocusPosAndVel(newCamPos.x, newCamPos.y, newCamPos.z, 0, 0, 0)
        end
        if Administration.ActionId[1] and NoClip.timer + 75 < GetGameTimer() then
            NoClip.timer = GetGameTimer()
        end
    end
    if IsControlPressed(0, 34) then
        local newCamPos = camCoords + right * -NoClip.speed
        SetCamCoord(NoClip.camera, newCamPos.x, newCamPos.y, newCamPos.z)
        if Administration.ActionId[4] then
            SetFocusPosAndVel(newCamPos.x, newCamPos.y, newCamPos.z, 0, 0, 0)
        end
        if Administration.ActionId[1] and NoClip.timer + 75 < GetGameTimer() then
            NoClip.timer = GetGameTimer()
        end
    end
    if IsControlPressed(0, 9) then
        local newCamPos = camCoords + right * NoClip.speed
        SetCamCoord(NoClip.camera, newCamPos.x, newCamPos.y, newCamPos.z)
        if Administration.ActionId[4] then
            SetFocusPosAndVel(newCamPos.x, newCamPos.y, newCamPos.z, 0, 0, 0)
        end
        if Administration.ActionId[1] and NoClip.timer + 75 < GetGameTimer() then
            NoClip.timer = GetGameTimer()
        end
    end
    local xMagnitude = GetDisabledControlNormal(0, 1)
    local yMagnitude = GetDisabledControlNormal(0, 2)
    local camRot = GetCamRot(NoClip.camera)
    local x = camRot.x - yMagnitude * 10
    local y = camRot.y
    local z = camRot.z - xMagnitude * 10
    if x < -75.0 then
        x = -75.0
    end
    if x > 100.0 then
        x = 100.0
    end
    SetCamRot(NoClip.camera, x, y, z)
    if Administration.ActionId[1] then
        SetEntityRotation(PlayerPedId(), camRot)
    end
end
function startNoClip()
    Citizen.CreateThread(function()
        local playerPed = GetPlayerPed(-1)
        if not DoesCamExist(NoClip.camera) then
            NoClip.camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        end
        SetCamActive(NoClip.camera, true)
        RenderScriptCams(true, false, 0, true, true)
        local coords = GetEntityCoords(playerPed)
        SetCamCoord(NoClip.camera, GetGameplayCamCoord())
        SetCamRot(NoClip.camera, GetGameplayCamRot())
        Utils:UseNoClip()
        Citizen.Wait(475)
        SetEntityCollision(playerPed, false, false)
        SetEntityVisible(playerPed, false)
        NoClip.timer = GetGameTimer()
    end)
end
function stopNoClip()
    local playerPed = GetPlayerPed(-1)
    local camCoords = GetCamCoord(NoClip.camera)
    SetCamActive(NoClip.camera, false)
    RenderScriptCams(false, false, 0, false, false)
    SetEntityCoords(playerPed, camCoords.x, camCoords.y, camCoords.z)
    ClearFocus()
    Utils:UseNoClip()
    Citizen.Wait(475)
    SetEntityCollision(playerPed, true, true)
    SetEntityVisible(playerPed, true)
end
RegisterNetEvent('Ms:AdminAction')
AddEventHandler('Ms:AdminAction', function(id, args)
    ({
        [1] = function()
            Administration.ActionId[id] = not Administration.ActionId[id]
            if Administration.ActionId[1] then
                startNoClip()
            else
                stopNoClip()
            end
        end,
        [3] = function()
            Citizen.CreateThread(function()
                local ped = PlayerPedId()
                FreezeEntityPosition(ped, true)
                Utils:UseNoClip()
                Citizen.Wait(475)
                Administration.ActionId[id] = not Administration.ActionId[id]
                SetEntityVisible(ped, not Administration.ActionId[id])
                FreezeEntityPosition(ped, false)
            end)
        end,
        [4] = function()
            Administration.ActionId[id] = not Administration.ActionId[id]
            if Administration.ActionId[4] then
                startNoClip()
            else
                stopNoClip()
            end
        end,
        [999] = function()
            if Administration.ActionId[1] then
                Administration.ActionId[1] = not Administration.ActionId[1]
                stopNoClip()
                SetEntityCoords(PlayerPedId(), args.x, args.y, args.z)
                return
            end
            if Administration.ActionId[4] then
                Administration.ActionId[4] = not Administration.ActionId[4]
                stopNoClip()
                SetEntityCoords(PlayerPedId(), args.x, args.y, args.z)
                return
            end
            SetEntityCoords(PlayerPedId(), args.x, args.y, args.z)
        end,
    })[id]()
end)
RegisterNetEvent('Ms:OpenConnectionMenu')
AddEventHandler('Ms:OpenConnectionMenu', function()
    if (not RageUI.IsVisible(RMenu:Get('connection', 'main'))) then
        RageUI.Visible(RMenu:Get('connection', 'main'), not RageUI.Visible(RMenu:Get('connection', 'main')))
    end
end)
RegisterNetEvent('Ms:TakeService')
AddEventHandler('Ms:TakeService', function(take)
    Utils:TakeService(take)
end)
RegisterNetEvent('Ms:RepairVehicle')
AddEventHandler('Ms:RepairVehicle', function(vehicleId)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleId)
    SetVehicleFixed(vehicle)
    WashDecalsFromVehicle(vehicle, 1.0)
    SetVehicleDirtLevel(vehicle)
end)
RegisterNetEvent('Ms:UseMarker')
AddEventHandler('Ms:UseMarker', function(markerId)
    ({
        ['GarageOut'] = function()
            if IsOnKeyboardInput then
                return
            end
            IsGarage = true
            StockVehicle = true
            MId = markerId
            VehiclesGarages = Character.Vehicles
            RageUI.Visible(RMenu:Get('garage', 'main'), not RageUI.Visible(RMenu:Get('garage', 'main')))
        end,
        ['Garage'] = function()
            if IsOnKeyboardInput then
                return
            end
            IsGarage = true
            StockVehicle = false
            MId = markerId
            if Markers[markerId].Data == nil or Markers[markerId].Data.SpawnCoords == nil then
                VehicleSpawnCoords = nil
            else
                VehicleSpawnCoords = Markers[markerId].Data.SpawnCoords
            end
            VehiclesGarages = {}
            for o, p in pairs(Character.Vehicles) do
                for k, v in pairs(VehiclesData) do
                    if p.Model == v.Model and v.Type ~= 'boats' and v.Type ~= 'planes' and v.Type ~= 'helicopters' then
                        table.insert(VehiclesGarages, p)
                    end
                end
            end
            RageUI.Visible(RMenu:Get('garage', 'main'), not RageUI.Visible(RMenu:Get('garage', 'main')))
        end,
        ['GarageRecovered'] = function()
            if IsOnKeyboardInput then
                return
            end
            IsGarage = false
            MId = markerId
            if Markers[markerId].Data == nil or Markers[markerId].Data.SpawnCoords == nil then
                VehicleSpawnCoords = nil
            else
                VehicleSpawnCoords = Markers[markerId].Data.SpawnCoords
            end
            VehiclesGarages = Character.Vehicles
            RageUI.Visible(RMenu:Get('garage', 'main'), not RageUI.Visible(RMenu:Get('garage', 'main')))
        end,
        ['GarageService'] = function()
            if IsOnKeyboardInput then
                return
            end
            MId = markerId
            if Markers[markerId].Data == nil or Markers[markerId].Data.SpawnCoords == nil then
                VehicleSpawnCoords = nil
            else
                VehicleSpawnCoords = Markers[markerId].Data.SpawnCoords
            end
            RageUI.Visible(RMenu:Get('garage', 'job'), not RageUI.Visible(RMenu:Get('garage', 'job')))
        end,
        ['GarageBoat'] = function()
            if IsOnKeyboardInput then
                return
            end
            IsGarage = true
            StockVehicle = false
            MId = markerId
            if Markers[markerId].Data == nil or Markers[markerId].Data.SpawnCoords == nil then
                VehicleSpawnCoords = nil
            else
                VehicleSpawnCoords = Markers[markerId].Data.SpawnCoords
            end
            VehiclesGarages = {}
            for o, p in pairs(Character.Vehicles) do
                for k, v in pairs(VehiclesData) do
                    if p.Model == v.Model and v.Type == 'boats' then
                        table.insert(VehiclesGarages, p)
                    end
                end
            end
            RageUI.Visible(RMenu:Get('garage', 'main'), not RageUI.Visible(RMenu:Get('garage', 'main')))
        end,
        ['GaragePlane'] = function()
            if IsOnKeyboardInput then
                return
            end
            IsGarage = true
            StockVehicle = false
            MId = markerId
            if Markers[markerId].Data == nil or Markers[markerId].Data.SpawnCoords == nil then
                VehicleSpawnCoords = nil
            else
                VehicleSpawnCoords = Markers[markerId].Data.SpawnCoords
            end
            VehiclesGarages = {}
            for o, p in pairs(Character.Vehicles) do
                for k, v in pairs(VehiclesData) do
                    if p.Model == v.Model and v.Type == 'planes' or p.Model == v.Model and v.Type == 'helicopters' then
                        table.insert(VehiclesGarages, p)
                    end
                end
            end
            RageUI.Visible(RMenu:Get('garage', 'main'), not RageUI.Visible(RMenu:Get('garage', 'main')))
        end,
        ['UnicornSoda'] = function()
            if IsOnKeyboardInput then
                return
            end
            local job, rank, rankId = Utils:GetCharacterJob(Character, true)
            if job == nil then
                return
            end
            print(rank.Id)
            if job.Id == 20 and rankId ~= 1 then
                Visual.ShowNotify({
                    title = "Stalya",
                    subtitle = "~r~Action impossible",
                    message = "Vous ne pouvez pas effectuer cette action.",
                    dict = "stalya",
                    name = "logo_blue",
                    icon = 7
                })
                return
            end
            UnicornSoda = true
            RageUI.Visible(RMenu:Get('shop', 'objects'), not RageUI.Visible(RMenu:Get('clothes_shop', 'main')))
        end,
        ['Teleports'] = function()
            if IsOnKeyboardInput then
                return
            end
            TriggerServerEvent('Ms:TeleportMarkers', markerId)
        end,
        ['Reseller'] = function()
            if IsOnKeyboardInput then
                return
            end
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            if not IsPedInAnyVehicle(PlayerPedId()) and not GetPedInVehicleSeat(vehicle, -1) then
                Visual.ShowNotify({
                    title = "Stalya",
                    subtitle = "~r~Action impossible",
                    message = "Vous devez être dans un vehicule.",
                    dict = "stalya",
                    name = "logo_blue",
                    icon = 7
                })
                return end
            MId = markerId
            RageUI.Visible(RMenu:Get('shop', 'reseller'), not RageUI.Visible(RMenu:Get('shop', 'reseller')))
        end,
    })[Markers[markerId].Usage]()
end)
RegisterNetEvent('Ms:UpdateInvoice')
AddEventHandler('Ms:UpdateInvoice', function(data)
    Invoices.Character = data
end)
function Utils:TakeService(take)
    local job, rank = Utils:GetCharacterJob(Character, true)
    if job ~= nil and rank ~= nil then
        if take then
            Character.IsOnService = true
            ({
                [1] = function()
                    for a, b in pairs(ClothesPreset[3][Character.Model]) do
                        for k, v in pairs(b) do
                            SetPedComponentVariation(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 2)
                        end
                    end
                end,
                [2] = function()
                    for a, b in pairs(ClothesPreset[4][Character.Model]) do
                        for k, v in pairs(b) do
                            SetPedComponentVariation(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 2)
                        end
                    end
                end,
            })[job.Id]()
            Visual.ShowNotify({
                title = "Stalya",
                subtitle = "~r~Métier",
                message = "Vous avez pris votre service.",
                dict = "stalya",
                name = "logo_blue",
                icon = 7
            })
        else
            Character.IsOnService = false
            ({
                [1] = function()
                    for k, v in pairs(Character.EquippedClothes) do
                        Utils:ClothEquip(v, k)
                    end
                    RemoveAllPedWeapons(PlayerPedId())
                end,
                [2] = function()
                    for k, v in pairs(Character.EquippedClothes) do
                        Utils:ClothEquip(v, k)
                    end
                end,
            })[job.Id]()
            Visual.ShowNotify({
                title = "Stalya",
                subtitle = "~r~Métier",
                message = "Vous avez quitter votre service.",
                dict = "stalya",
                name = "logo_blue",
                icon = 7
            })
        end
    end
end
RegisterNetEvent('Ms:GetInformations')
AddEventHandler('Ms:GetInformations', function(data)
    if data == nil then
        return
    end
    JobTargetInfo = data
end)
RegisterNetEvent('Ms:GetVehicleData')
AddEventHandler('Ms:GetVehicleData', function(data)
    if data == nil then
        return
    end
    VehicleTargetInfo = data
end)
RegisterNetEvent('Ms:UpdateSkin')
AddEventHandler('Ms:UpdateSkin', function(data)
    if data == nil then
        return
    end
    Character.Skin = data
    Utils:ApplySkin(Character.Skin)
end)
RegisterNetEvent('Ms:UpdateTattoos')
AddEventHandler('Ms:UpdateTattoos', function(data)
    if data == nil then
        return
    end
    Character.Tattoos = data
    ClearPedDecorations(PlayerPedId())
    for k, v in pairs(Character.Tattoos) do
        Utils:ApplyTattoos(v)
    end
end)
RegisterNetEvent('Ms:UpdateModel')
AddEventHandler('Ms:UpdateModel', function(data)
    if data == nil then
        return
    end
    Character.CustomModel = data
    if data == "" then
        local model = GetHashKey(Character.Model)
        Utils:RequestModel(model)
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(model)
        Utils:ApplySkin(Character.Skin)
        ClearPedDecorations(ped)
        for k, v in pairs(Character.Tattoos) do
            Utils:ApplyTattoos(v)
        end
        for k, v in pairs(Character.EquippedClothes) do
            Utils:ClothEquip(v, k)
        end
        NetworkSetFriendlyFireOption(true)
        SetCanAttackFriendly(PlayerPedId(), true, true)
        SetMaxWantedLevel(0)
        SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
    else
        Utils:RequestModel(Character.CustomModel)
        SetPlayerModel(PlayerId(), Character.CustomModel)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(Character.CustomModel)
        NetworkSetFriendlyFireOption(true)
        SetCanAttackFriendly(PlayerPedId(), true, true)
        SetMaxWantedLevel(0)
        SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)
RegisterNetEvent('Ms:SearchPlayer')
AddEventHandler('Ms:SearchPlayer', function(data, bool)
    Character.SearchInventory = data
    if bool then
        RageUI.OpenSubmenu(RMenu:Get('job', 'search'))
    end
end)
RegisterNetEvent('Ms:CloseSearchInventory')
AddEventHandler('Ms:CloseSearchInventory', function()
    RageUI.Visible(RMenu:Get('job', 'search'), false)
    Character.SearchInventory = {}
end)
RegisterNetEvent('Ms:HandsUp')
AddEventHandler('Ms:HandsUp', function(target)
    TriggerServerEvent('Ms:HandsUpResult', IsEntityPlayingAnim(PlayerPedId(), 'random@mugging3', 'handsup_standing_base', 3), target)
end)
RegisterNetEvent('Ms:DeleteClothe')
AddEventHandler('Ms:DeleteClothe', function(clotheId)
    Character.ClothItems[clotheId] = nil
end)
RegisterNetEvent('Ms:UpdateProof')
AddEventHandler('Ms:UpdateProof', function()
    SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
    NetworkSetFriendlyFireOption(true)
end)
RegisterNetEvent('Ms:ReceiveMe')
AddEventHandler('Ms:ReceiveMe', function(txt, srcId)
    local ped = GetPlayerPed(GetPlayerFromServerId(srcId))
    if ped == nil and not DoesEntityExist(ped) then
        return
    end
    Citizen.CreateThread(function()
        local i = #TextMe + 1
        TextMe[i] = { txt, ped }
        Citizen.SetTimeout(6000, function()
            TextMe[i] = nil
        end)
    end)
end)
function LoadStates()
    local states = Character.States
    local ped = PlayerPedId()
    SetEntityHealth(ped, states.health)
end
function GetActionByObjectId(objectId)
    return Objects.Get:Action(objectId)
end
function Utils:RequestModel(model)
    if not IsModelInCdimage(model) then return end
    if model and not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1.0)
        end
    end
end
function Utils:UseMarker(MarkerId, Usage)
    ({
        ['ShopClothes'] = function()
            if IsOnKeyboardInput then return end
            IsMask = false
            RageUI.Visible(RMenu:Get('clothes_shop', 'main'), not RageUI.Visible(RMenu:Get('clothes_shop', 'main')))
        end,
        ['ShopVehicles'] = function()
            if IsOnKeyboardInput then return end
            RageUI.Visible(RMenu:Get('shopvehicles', 'main'), not RageUI.Visible(RMenu:Get('shopvehicles', 'main')))
        end,
        ['GarageOut'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['Garage'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['GarageRecovered'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['GarageJobLegal'] = function()
            if IsOnKeyboardInput then return end
            IsLegal = false
            RageUI.Visible(RMenu:Get('garage', 'job'), not RageUI.Visible(RMenu:Get('garage', 'job')))
        end,
        ['Harvest'] = function()
            if IsOnKeyboardInput then return end
            if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                Visual.ShowNotify({
                      title = "Stalya",
                      subtitle = "~r~Action impossible",
                      message = "Vous ne pouvez pas effectué cette action dans un véhicule.",
                      dict = "stalya",
                      name = "logo_blue",
                      icon = 7
                  })
                return
            end
            TriggerServerEvent('Ms:Exchange', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['Treatment'] = function()
            if IsOnKeyboardInput then return end
            if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                Visual.ShowNotify({
                                      title = "Stalya",
                                      subtitle = "~r~Action impossible",
                                      message = "Vous ne pouvez pas effectué cette action dans un véhicule.",
                                      dict = "stalya",
                                      name = "logo_blue",
                                      icon = 7
                                  })
                return
            end
            TriggerServerEvent('Ms:Exchange', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['Sale'] = function()
            if IsOnKeyboardInput then return end
            if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                Visual.ShowNotify({
                                      title = "Stalya",
                                      subtitle = "~r~Action impossible",
                                      message = "Vous ne pouvez pas effectué cette action dans un véhicule.",
                                      dict = "stalya",
                                      name = "logo_blue",
                                      icon = 7
                                  })
                return
            end
            TriggerServerEvent('Ms:Exchange', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['Bank'] = function()
            if IsOnKeyboardInput then return end
            if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                Visual.ShowNotify({
                                      title = "Stalya",
                                      subtitle = "~r~Action impossible",
                                      message = "Vous ne pouvez pas effectué cette action dans un véhicule.",
                                      dict = "stalya",
                                      name = "logo_blue",
                                      icon = 7
                                  })
                return
            end
            RageUI.Visible(RMenu:Get('bank', 'main'), not RageUI.Visible(RMenu:Get('bank', 'main')))
        end,
        ['BuyShopObjects'] = function()
            if IsOnKeyboardInput then return end
            if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                Visual.ShowNotify({
                                      title = "Stalya",
                                      subtitle = "~r~Action impossible",
                                      message = "Vous ne pouvez pas effectué cette action dans un véhicule.",
                                      dict = "stalya",
                                      name = "logo_blue",
                                      icon = 7
                                  })
                return
            end
            UnicornSoda = false
            RageUI.Visible(RMenu:Get('shop', 'objects'), not RageUI.Visible(RMenu:Get('shop', 'objects')))
        end,
        ['TakeService'] = function()
            if IsOnKeyboardInput then return end
            if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                Visual.ShowNotify({
                                      title = "Stalya",
                                      subtitle = "~r~Action impossible",
                                      message = "Vous ne pouvez pas effectué cette action dans un véhicule.",
                                      dict = "stalya",
                                      name = "logo_blue",
                                      icon = 7
                                  })
                return
            end
            TriggerServerEvent('Ms:TakeService')
        end,
        ['GarageService'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['JobChoice'] = function()
            if IsOnKeyboardInput then return end
            RageUI.Visible(RMenu:Get('job', 'choice'), not RageUI.Visible(RMenu:Get('job', 'choice')))
        end,
        ['WeaponShop'] = function()
            if IsOnKeyboardInput then return end
            RageUI.Visible(RMenu:Get('shop', 'weapons'), not RageUI.Visible(RMenu:Get('shop', 'weapons')))
        end,
        ['MaskShop'] = function()
            if IsOnKeyboardInput then return end
            IsMask = true
            RageUI.Visible(RMenu:Get('clothes_shop', 'main'), not RageUI.Visible(RMenu:Get('clothes_shop', 'main')))
        end,
        ['Storage'] = function()
            if IsOnKeyboardInput then return end
            UnicornFridge = false
            print('izi')
            TriggerServerEvent('Ms:OpenStorage', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['HairShop'] = function()
            if IsOnKeyboardInput then return end
            RageUI.Visible(RMenu:Get('hairshop', 'main'), not RageUI.Visible(RMenu:Get('hairshop', 'main')))
        end,
        ['TattooShop'] = function ()
            if IsOnKeyboardInput then return end
            RageUI.Visible(RMenu:Get('tattooshop', 'main'), not RageUI.Visible(RMenu:Get('tattooshop', 'main')))
            SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 2)
            SetPedComponentVariation(PlayerPedId(), 4, 61, 3, 2)
            SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 2)
            SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 2)
            SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 2)
        end,
        ['BlackMarketShop'] = function()
            if IsOnKeyboardInput then return end
            RageUI.Visible(RMenu:Get('shop', 'blackmarket'), not RageUI.Visible(RMenu:Get('shop', 'blackmarket')))
        end,
        ['GarageBoat'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['GaragePlane'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['UnicornSoda'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['UnicornFridge'] = function()
            if IsOnKeyboardInput then return end
            UnicornFridge = true
            TriggerServerEvent('Ms:OpenStorage', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['Teleports'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
        ['Reseller'] = function()
            if IsOnKeyboardInput then return end
            TriggerServerEvent('Ms:UseMarker', MarkerId, GetEntityCoords(PlayerPedId()))
        end,
    })[Usage]()
end
function Utils:CharacterHasVehicle(Id)
    for k, v in pairs(Character.Vehicles) do
        if (k == Id) then
            return true
        end
    end
    return false
end
function Utils:CharacterHasVehicleJobs(vehicle)
    local job, rank, rankId = Utils:GetCharacterJob(Character, true)
    if rankId ~= nil then
        for k, v in pairs(VehiclesJobs) do
            if rankId <= v[2] then
                for a, b in pairs(v[1]) do
                    if (b == vehicle) then
                        return true
                    end
                end
            end
        end
    end
    return false
end
function Utils:CanSpawnVehicle()
    if (GameTimer.Vehicle ~= 0 and GameTimer.Vehicle + 8000 > GetGameTimer()) then
        return false
    end
    return true
end
function Utils:ClothEquip(ClotheId, Type)
    if ClotheId == 0 then
        if (math.tointeger(Type) >= 20) then
            ClearPedProp(PlayerPedId(), math.tointeger(Type) - 20)
        else
            for k, v in pairs(ClothesPreset[1][Character.Model][math.tointeger(Type)]) do
                SetPedComponentVariation(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 2)
            end
        end
        Character.EquippedClothes[tostring(Type)] = ClotheId
        return
    end
    local clothe = Character.ClothItems[ClotheId]
    if (clothe ~= nil) then
        local clotheDatas = clothe.Data
        for k, v in pairs(clotheDatas) do
            if (clothe.Type >= 20) then
                SetPedPropIndex(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 0)
            else
                SetPedComponentVariation(PlayerPedId(), math.tointeger(k), math.tointeger(v.drawableId), math.tointeger(v.textureId), 2)
            end
        end
        Character.EquippedClothes[tostring(clothe.Type)] = ClotheId
    end
end
function Utils:ApplyTattoos(Tattoos)
        if Tattoos[1] ~= nil and Tattoos[2] ~= nil or Tattoos[1] ~= 0 and Tattoos[2] ~= 0 then
            AddPedDecorationFromHashes(PlayerPedId(), Tattoos[1], Tattoos[2])
        end
end
function Utils:ApplySkin(Skin)
    for b, c in pairs(Skin) do
        if b == 1 then
            SetPedHeadBlendData(PlayerPedId(), c[1], c[2], nil, c[3], c[4], nil, c[5], c[6], nil, true);
        end
        if b == 2 then
            for d, e in pairs(c) do
                SetPedFaceFeature(PlayerPedId(), math.tointeger(d), e)
            end
        end
        if b == 3 then
            for d, e in pairs(c) do
                SetPedHeadOverlay(PlayerPedId(), math.tointeger(d), e[1], e[2])
            end
        end
        if b == 4 then
            for d, e in pairs(c) do
                SetPedHeadOverlayColor(PlayerPedId(), math.tointeger(d), e[1], e[2], e[3])
            end
        end
        if b == 5 then
            ClearPedDecorations(PlayerPedId())
            AddPedDecorationFromHashes(PlayerPedId(), c[1], c[2])
        end
        if b == 6 then
            SetPedComponentVariation(PlayerPedId(), c[1], c[2], c[3], c[4])
        end
        if b == 7 then
            SetPedHairColor(PlayerPedId(), c[1], c[2])
        end
    end
end
function UpdateStoreData()
    local ped = PlayerPedId()
    for a = 0, 11 do
        Klothes[a] = {
            drawableIndex = 1,
            textureIndex = 1,
            name = {},
            meh = {}
        }
        for b = 1, GetNumberOfPedDrawableVariations(ped, a) do
            table.insert(Klothes[a].name, b - 1)
            Klothes[a].meh[b] = {}
            for c = 1, GetNumberOfPedTextureVariations(ped, a, b - 1) do
                table.insert(Klothes[a].meh[b], c - 1)
            end
        end
    end
end
function UpdatePropStoreData()
    local ped = PlayerPedId()
    for a = 0, 7 do
        KlothesProps[a] = {
            drawableIndex = 1,
            textureIndex = 1,
            name = {},
            meh = {}
        }
        for b = 1, GetNumberOfPedPropDrawableVariations(ped, a) do
            table.insert(KlothesProps[a].name, b - 1)
            KlothesProps[a].meh[b] = {}
            for c = 1, GetNumberOfPedPropTextureVariations(ped, a, b - 1) do
                table.insert(KlothesProps[a].meh[b], c - 1)
            end
        end
    end
end
function Utils:FirstToUpper(str)
    return (string.lower(str):gsub("^%l", string.upper))
end
function Utils:GetCharacterWeight()
    local weight = 0
    if Character.Inventory == nil then return 0 end
    for k, v in pairs(Character.Inventory) do
        if StaticItemType(k) == 0 then
            local object = Objects[BasicItemGUID(k)]
            weight = weight + (object.Weight * v.Quantity)
        end
        if StaticItemType(k) == 8 then
            local weapon = Weapons[WeaponProperties(k).type]
            weight = weight + (weapon.Weight * v.Quantity)
        end
    end
    return weight
end
local features = { scale = 1.0, assetsName = 'scr_rcbarry1', effectsName = 'scr_alien_disintegrate', }
local particlesDicts = { { 'scr_sm_trans', 'scr_sm_con_trans' }, { 'scr_rcbarry1', 'scr_alien_teleport' }, { 'scr_ie_tw', 'scr_impexp_tw_take_zone' }, { 'scr_powerplay', 'scr_powerplay_beast_vanish' }, { 'scr_rcbarry2', 'scr_clown_death' }, { 'scr_ie_tw', 'scr_impexp_tw_take_zone' }, { 'scr_rcbarry2', 'scr_clown_bul' } }
function Utils:UseNoClip()
    local pedsModel = { 'u_m_y_zombie_01', 'u_m_m_jesus_01', 's_m_y_mime', 'csb_reporter', 'ig_bride', 'a_f_y_juggalo_01', 'g_f_y_families_01' }
    for k, v in pairs(pedsModel) do
        if IsPedModel(PlayerPedId(), GetHashKey(v)) then
            features.assetsName = particlesDicts[k][1]
            features.effectsName = particlesDicts[k][2]
        end
    end
    if IsPedModel(PlayerPedId(), GetHashKey('g_f_y_families_01')) then
        for i = 1, 4 do
            Utils:RequestPtfx(features.assetsName)
            Utils:StartNetworkedParticleFxNonLoopedOnPedBone(features.assetsName, features.effectsName, PlayerPedId(), features.scale, vector3(0.0, 0.0, 0.0))
        end
    else
        Utils:RequestPtfx(features.assetsName)
        Utils:StartNetworkedParticleFxNonLoopedOnPedBone(features.assetsName, features.effectsName, PlayerPedId(), features.scale, vector3(0.0, 0.0, 0.0))
    end
end
function Utils:RequestPtfx(assetName)
    RequestNamedPtfxAsset(assetName)
    if not (HasNamedPtfxAssetLoaded(assetName)) then
        while not HasNamedPtfxAssetLoaded(assetName) do Citizen.Wait(1.0) end
        return assetName
    else
        return assetName
    end
end
function Utils:StartNetworkedParticleFxNonLoopedOnPedBone(assets, effect, ped, scale, rotation)
    Utils:RequestPtfx(assets)
    UseParticleFxAsset(assets)
    local coords = GetEntityCoords(ped)
    StartNetworkedParticleFxNonLoopedAtCoord(effect, coords.x, coords.y, coords.z, rotation.x, rotation.y, rotation.z, scale, false, false, false, false)
    RemoveNamedPtfxAsset(assets)
end
function Utils:UpdateWeightSubtitle()
    RMenu:Get('personal', 'inventory'):SetSubtitle(sf("Inventaire (%s / 35Kg)", Utils:GetCharacterWeight() / 1000))
    RMenu:Get('personal', 'weapons'):SetSubtitle(sf("Inventaire (%s / 35Kg)", Utils:GetCharacterWeight() / 1000))
end
function Utils:UpdateStaffPed()
    if Character.StaffRank == 0 then
        return
    end
    Citizen.CreateThread(function()
        local modelHash = 'ig_bride'
        if Character.Model == 'mp_m_freemode_01' then
            modelHash = 'u_m_y_zombie_01'
        end
        local model = GetHashKey(modelHash)
        Utils:RequestModel(model)
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())
        SetModelAsNoLongerNeeded(model)
        NetworkSetFriendlyFireOption(true)
        SetCanAttackFriendly(PlayerPedId(), true, true)
        SetMaxWantedLevel(0)
        SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
    end)
end
function Utils:DrawMarkerAbodeCoords(ped)
    local coords = GetEntityCoords(ped)
    DrawMarker(2, coords.x, coords.y, coords.z + 1.05, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.25, 0.25, 0.25, 255, 30, 150, 120, true, true, 2, false, nil, false)
end
function Utils:ApplyVehicleData(vehicle, data)
    local wheels = {}
    SetVehicleModKit(vehicle, 0)
    for key, value in pairs(data) do
        if type(value) == "table" then
            for k, v in pairs(value) do
                if key == "mods" then
                    WalyptusMod(vehicle, tonumber(k), v)
                end
                if key == "colors" then
                    WalyptusColor(vehicle, k == "1" and v or nil, k == "2" and v or nil, k == "3" and v or nil, k == "4" and v or nil)
                end
                if key == "neon" then
                    if k == "id" then
                        WalyptusNeon(vehicle, v)
                    end
                    if k == "color" then
                        local r, g, b = 255, 255, 255
                        if v ~= nil then
                            r = v.r
                            g = v.g
                            b = v.b
                        end
                        SetVehicleNeonLightsColour(vehicle, r or 255, g or 255, b or 255)
                    end
                end
                if key == "wheels" then
                    if k == "type" then
                        wheels[1] = v
                    end
                    if k == "id" then
                        wheels[2] = v
                    end
                end
            end
        end
    end
    if GetVehicleNumberOfWheels(vehicle) > 2 then
        SetVehicleWheelType(vehicle, wheels[1])
        SetVehicleMod(vehicle, 23, wheels[2], false)
    end
end
function Utils:switch(condition, args)
    for key, callback in pairs(args) do
        if key == condition and type(callback) == "function" then
            callback()
            return
        end
    end
    if args.default ~= nil and type(args.default) == "function" then
        args.default()
    end
end
function Utils:GetPlayerInformations(source)
    for k, v in pairs(Administration.Characters) do
        if tonumber(v.Source) == source then
            return true, v
        end
    end
    return false, nil
end
function Utils:ShowGamerTags()
    for k, i in ipairs(GetActivePlayers()) do
        local IsActive, character = Utils:GetPlayerInformations(GetPlayerServerId(i))
        local name, color, dist = GetPlayerName(i), 0, #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(i)))
        if IsActive and character ~= nil then
            name = sf("[%s] %s %s", character.Id, character.Identity.firstname, character.Identity.lastname)
            if character ~= nil and character.StaffRank == 0 then
                ({
                    [0] = function()
                        color = 0
                    end,
                    [1] = function()
                        color = 173
                    end,
                    [2] = function()
                        color = 156
                    end,
                    [3] = function()
                        color = 9
                    end,
                })[character.Vip]()
            elseif character ~= nil and character.StaffRank > 0 then
                ({
                    [0] = function()
                        color = 0
                    end,
                    [1] = function()
                        color = 172
                    end,
                    [2] = function()
                        color = 196
                    end,
                    [3] = function()
                        color = 188
                    end,
                    [4] = function()
                        color = 149
                    end,
                    [5] = function()
                        color = 6
                    end,
                    [6] = function()
                        color = 6
                    end,
                })[character.StaffRank]()
            end
        end
        Administration.GamerTags[i] = CreateFakeMpGamerTag(GetPlayerPed(i), name, 0, 0, "", 0)
        if dist < 100 then
            SetMpGamerTagVisibility(Administration.GamerTags[i], 0, true)
            SetMpGamerTagVisibility(Administration.GamerTags[i], 2, true)
            if character ~= nil and character.Vip ~= 0 or character ~= nil and character.StaffRank > 0 then
                SetMpGamerTagColour(Administration.GamerTags[i], 0, color)
            end
            SetMpGamerTagColour(Administration.GamerTags[i], 0, color)
            SetMpGamerTagVisibility(Administration.GamerTags[i], 4, NetworkIsPlayerTalking(i))
            SetMpGamerTagAlpha(Administration.GamerTags[i], 2, 255)
            SetMpGamerTagAlpha(Administration.GamerTags[i], 4, 255)

            if Character.StaffRank > 0 and name ~= nil then
                SetMpGamerTagName(Administration.GamerTags[i], name)
            end
        else
            RemoveMpGamerTag(Administration.GamerTags[i])
            Administration.GamerTags[i] = nil
        end
    end
end

function GetVehiclesByModel(Model)
    local result = nil
    for k, v in ipairs(VehiclesData) do
        if (v.Model == Model and v.ForSale) then
            result = v
        end
    end
    return result
end
local IS_DYNAMIC_MASK       = 0x4000000000000
local STATIC_TYPE_MASK      = 0x3C00000000000
local STATIC_TYPE_OFFSET    = 46
local STATIC_TYPE_ID_MASK   = 0x3FFFFFFFFFFF
local STATIC_TYPE_WEAPON    = 0x8 
local STATIC_TYPE_BASIC     = 0x0 
local WEAPON_ACCESSORIES_COUNT = 5
local BASIC_ITEM_TYPE_MASK  = 0x3FFFFFFFFFFF
function IsDynamicItem(guid)
    return guid & IS_DYNAMIC_MASK ~= 0
end
function StaticItemType(guid)
    return (guid & STATIC_TYPE_MASK) >> STATIC_TYPE_OFFSET
end
function BasicItemGUID(t)       return (STATIC_TYPE_BASIC << STATIC_TYPE_OFFSET)+ (t & BASIC_ITEM_TYPE_MASK) end
function BasicItemType(guid)    return (guid & BASIC_ITEM_TYPE_MASK) end
function WeaponProperties(guid)
    if StaticItemType(guid) ~= STATIC_TYPE_WEAPON then
        error("item "..tostring(guid).." is not a weapon")
        return
    end
    local wId = guid & STATIC_TYPE_ID_MASK
    local w = {}
    w.type = (wId >> 38) & 0xFF
    w.paint = (wId >> 30) & 0xFF 
    w.accessories = {}
    for i=1, WEAPON_ACCESSORIES_COUNT, 1 do
        local a = (guid >> ((i-1)*6)) & 0x3F 
        if a ~= 0 then
            w.accessories[i] = a
        end
    end
    return w
end
function WeaponID(w)
    if (w.type & 0xFF) ~= w.type or w.type == 0 then error("wrong Weapon type ID") return end
    if w.paint and (w.paint & 0xFF) ~= w.paint then error("wrong Weapon paint ID") return end
    local id = (STATIC_TYPE_WEAPON << STATIC_TYPE_OFFSET)
    id = id + (w.type << 38)
    id = id + ((w.paint or 0) << 30)
    if w.accessories == nil then
        return id
    end
    table.sort(w.accessories)
    for i=1, WEAPON_ACCESSORIES_COUNT, 1
    do
        local a = w.accessories[i] or 0
        if (a & 0x3F) ~= a then error("wrong Weapon accessory ID") return end
        id = id + (a << ((i-1) * 6))
    end
    return id
end
local PERM_MASK = 0xFFFFFFFFFFFF
PERMISSIONS = {
    [1] = { Name = "Mettre dans le stock", Checked = false, IsShowOnPanel = false },
    [2] = { Name = "Prendre dans le stock", Checked = false, IsShowOnPanel = false },
    [3] = { Name = "Modifier les rangs", Checked = false, IsShowOnPanel = false },
    [4] = { Name = "Recruter", Checked = false, IsShowOnPanel = false },
    [5] = { Name = "Exclure", Checked = false, IsShowOnPanel = false },
    [6] = { Name = "Promouvoir", Checked = false, IsShowOnPanel = false },
    [7] = { Name = "Retrograder", Checked = false, IsShowOnPanel = false },
    [8] = { Name = "Gestion des véhicules", Checked = false, IsShowOnPanel = false },
    [9] = { Name = "Créer des objets", Checked = false, IsShowOnPanel = false },
    [10] = { Name = "Menotter", Checked = false, IsShowOnPanel = true },
    [11] = { Name = "Désactiver l'inventaire", Checked = false, IsShowOnPanel = false },
    [12] = { Name = "Fouiller", Checked = false, IsShowOnPanel = true },
    [13] = { Name = "Fouiller un véhicule", Checked = false, IsShowOnPanel = false },
    [14] = { Name = "Prendre", Checked = false, IsShowOnPanel = false },
    [15] = { Name = "Récolter", Checked = false, IsShowOnPanel = false },
    [16] = { Name = "Transformer", Checked = false, IsShowOnPanel = false },
    [17] = { Name = "Vendre", Checked = false, IsShowOnPanel = false },
    [18] = { Name = "Soigner", Checked = false, IsShowOnPanel = false },
    [19] = { Name = "Réanimer", Checked = false, IsShowOnPanel = true },
    [20] = { Name = "Réparer un véhicule", Checked = false, IsShowOnPanel = false },
    [21] = { Name = "Envoyer un véhciule en fourrière", Checked = false, IsShowOnPanel = false },
    [22] = { Name = "Customiser un véhicule", Checked = false, IsShowOnPanel = false },
    [23] = { Name = "Mettre une personne dans un véhicule", Checked = false, IsShowOnPanel = true },
    [24] = { Name = "Voir les informations", Checked = false, IsShowOnPanel = true },
    [25] = { Name = "Voir le permis de conduire", Checked = false, IsShowOnPanel = false },
}
function SplitJobId(jobId)
    local job = (jobId >> 8) & 0xFFFF
    local rank = jobId & 0xFF
    return job, rank
end
function Utils:GetCharacterJobRank(character, id)
    for _, jobId in ipairs(character.Jobs) do
        local j, r = SplitJobId(jobId)
        if j == id then
            return r
        end
    end
    return 0
end
function Utils:CharacterHasPerm(character, permId)
    if permId == 0 then error("Called Character:HasPerm(0)") end
    for _, jobId in ipairs(character.Jobs) do
        local j, r = SplitJobId(jobId)
        local job = Jobs[j]
        if (job.Ranks[r].Permissions & (1 << permId)) > 0 then
            return true
        end
    end
    return false
end
function Utils:CharacterHasPermForJob(character, jobId, permId)
    if permId == 0 then return end
    if jobId == 0 then return end
    for _, k in ipairs(character.Jobs) do
        local j, r = SplitJobId(k)
        if j == jobId then
            local job = Jobs[j]
            if (job.Ranks[r].Permissions & (1 << permId)) > 0 then
                return true
            end
        end
    end
    return false
end
function Utils:GetCharacterJob(character, legal)
    for key, jobId in ipairs(character.Jobs) do
        local j, r = SplitJobId(jobId)
        local job = Jobs[j]
        local rank = job.Ranks[r]
        if job.IsLegal == legal then
            return job, rank, r, key
        end
    end
    return nil, nil, nil, nil
end
function Utils:GetCharacterJobs()
    local result = {}
    for k, jobId in pairs(Character.Jobs) do
        local j, r = SplitJobId(jobId)
        table.insert(result, j)
    end
    return result
end
local MsMarkers = {
    state = 0,
    firstTable = {},
    secondTable = {},
    Timer = 0,
}
local MsDoors = {
    state = 0,
    firstTable = {},
    secondTable = {},
    Timer = 0,
    TimerRefresh = 0,
}
function Utils:LoadMarkers()
    MsMarkers.firstTable = Markers
    Citizen.CreateThread(function()
        while true do
            local time = 1500
            local pDist = GetEntityCoords(GetPlayerPed(-1))
            if MsMarkers.state == 1 then MsMarkers.state = 2 end
            for i, v in pairs(MsMarkers.firstTable) do
                local dist = #(vector3(pDist.x, pDist.y, pDist.z) - vector3(Markers[i].Coords.x, Markers[i].Coords.y, Markers[i].Coords.z - 0.90))
                if (dist <= 150.0) then
                    if Utils:SeeAndUseMarker(i) then
                        if (dist <= Markers[i].Distances) then
                            if Markers[i].Usage == "SafeZone" then
                                Utils:SafeZone(i)
                                else
                                if (not RageUI.Visible(RMenu:Get('clothes_shop', 'main'))) then
                                    Visual.Subtitle(Markers[i].Description)
                                end
                                if (IsControlJustPressed(1, Markers[i].TouchId)) then
                                    if (IsOnKeyboardInput) then
                                        return
                                    end
                                    Utils:UseMarker(i, Markers[i].Usage)
                                end
                            end
                        end
                        DrawMarker(Markers[i].Type, Markers[i].Coords.x, Markers[i].Coords.y, Markers[i].Coords.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Markers[i].Size, Markers[i].Size, Markers[i].Size, Markers[i].Colors[1], Markers[i].Colors[2], Markers[i].Colors[3], Markers[i].Colors[4], false, true, 2, Markers[i].Rotate, false, false, false)
                    end
                    time = 0
                    MsMarkers.secondTable[i] = v
                    MsMarkers.state = 1
                end
            end
            if time == 0 then
                MsMarkers.firstTable = MsMarkers.secondTable
                if (GetGameTimer() + 3000 > MsMarkers.Timer + 6000) then
                    MsMarkers.firstTable = Markers
                    MsMarkers.Timer = GetGameTimer()
                end
            end
            if time == 1500 and MsMarkers.state == 2 then
                MsMarkers.secondTable = {}
                MsMarkers.firstTable = Markers
                MsMarkers.state = 0
            end
            Wait(time)
        end
    end)
end
RegisterNetEvent('Ms:OpenOrCloseDoor')
AddEventHandler('Ms:OpenOrCloseDoor', function(doorId, closed, heading)
    if Doors[doorId] == nil then return end
    Doors[doorId].Closed = closed
    Doors[doorId].CurrentHeading = heading
    if closed then
        SetEntityHeading(Doors[doorId].DoorPropId, heading)
    else
        SetEntityHeading(Doors[doorId].DoorPropId, Doors[doorId].EntityHeading)
    end
end)
function GetCadena(bool)
    if bool then return "🔒" end
    return "🔓"
end
function Utils:LoadDoors()
    MsDoors.firstTable = Doors
    Citizen.CreateThread(function()
        Citizen.Wait(1500)
        while true do
            local time = 100
            local pDist = GetEntityCoords(GetPlayerPed(-1))
            if MsDoors.state == 1 then MsDoors.state = 2 end
            for k, v in pairs(MsDoors.firstTable) do
                local dist =  #(vector3(pDist.x, pDist.y, pDist.z) - vector3(Doors[k].Pos.x, Doors[k].Pos.y, Doors[k].Pos.z))
                if (dist <= 24.0) then
                   if (dist <= 1.4) then
                        Utils:DrawText3D(vector3(v.Pos.x, v.Pos.y, v.Pos.z), sf("%s", GetCadena(v.Closed)), 1)
                        if IsControlJustPressed(0, 51) then
                            if (IsOnKeyboardInput) then
                                return
                            end
                            TriggerServerEvent('Ms:OpenOrCloseDoor', k, GetEntityHeading(v.DoorPropId))
                        end
                    end
                    if v.Closed and GetEntityHeading(v.DoorPropId) ~= v.CurrentHeading and v.CurrentHeading ~= 666 then
                        SetEntityHeading(v.DoorPropId, v.CurrentHeading)
                    end
                    FreezeEntityPosition(v.DoorPropId, v.Closed)
                    time = 0
                    MsDoors.secondTable[k] = v
                    MsDoors.state = 1
                end
            end
            if time == 0 then
                MsDoors.firstTable = MsDoors.secondTable
                if (GetGameTimer() + 2000 > MsDoors.Timer + 4000) then
                    MsDoors.firstTable = Doors
                    MsDoors.Timer = GetGameTimer()
                end
            end
            if time == 100 and MsDoors.state == 2 then
                MsDoors.secondTable = {}
                MsDoors.firstTable = Doors
                MsDoors.state = 0
            end
            if GetGameTimer() + 1000 > MsDoors.TimerRefresh + 2000 then
                MsDoors.TimerRefresh = GetGameTimer()
                for k,v in pairs(MsDoors.firstTable) do
                    local dist =  #(vector3(pDist.x, pDist.y, pDist.z) - vector3(Doors[k].Pos.x, Doors[k].Pos.y, Doors[k].Pos.z))
                    if (dist <= 32.0) then
                        v.DoorPropId = GetClosestObjectOfType(v.Pos.x, v.Pos.y, v.Pos.z, 1.0, v.Model, 0, 0, 0)
                    end
                end
            end
            Wait(time)
        end
    end)
end
function Utils:CreateMarker(id, content)
    local length = #Markers + 1
    if id ~= nil then length = id end
    Markers[length] = content
    MsMarkers.secondTable[length] = content
    return length
end
function Utils:DrawText3D(coords, text, size)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords      = GetGameplayCamCoords()
    local dist           =  #(vector3(camCoords) - vector3(coords.x, coords.y, coords.z)) 
    local size           = size
    if size == nil then
        size = 1
    end
    local scale = (size / dist) * 2
    local fov   = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(0)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
        ClearDrawOrigin()
    end
end
local escorted = 0
local handcuffed = false
local cuffProp = 0
RegisterNetEvent('Ms:HandcuffPlayerTarget')
AddEventHandler('Ms:HandcuffPlayerTarget', function(srcId, isHandcuffed)
    local ped = PlayerPedId()
    handcuffed = isHandcuffed
    Citizen.CreateThread(function()
        if not handcuffed then
            AttachEntityToEntity(ped, GetPlayerPed(GetPlayerFromServerId(srcId)), 11816, 0, 0.50, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 20, false)
            Utils:PlayAnim('mp_arresting', 'b_uncuff', 0, 0, 2, 3650)
            Citizen.Wait(3650)
            ClearPedTasksImmediately(ped)
            SetEnableHandcuffs(ped, false)
            DetachEntity(ped, false, false)
            DeleteEntity(cuffProp)
            return
        end
        SetCurrentPedWeapon(ped, 'weapon_unarmed', true)
        cuffProp = CreateObject(GetHashKey("p_cs_cuffs_02_s"), 0.0, 0.0, 0.0, 0, 0, 0)
        SetEnableHandcuffs(ped, true)
        AttachEntityToEntity(ped, GetPlayerPed(GetPlayerFromServerId(srcId)), 11816, 0, 0.50, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 20, false)
        Utils:PlayAnim('mp_arrest_paired', 'crook_p2_back_left', 0, 0, 2, 3650)
        Citizen.Wait(3650)
        DetachEntity(ped, false, false)
        AttachEntityToEntity(cuffProp, ped, GetPedBoneIndex(ped, 28422), -0.022, 0.068, 0.008, 90.0, 255.50, 182.0, 1, 0, 0, 0, 2, 1)
        Utils:PlayAnim('mp_arresting', 'idle', 0, 0, 49, -1)
    end)
end)
RegisterNetEvent('Ms:HandcuffPlayerSource')
AddEventHandler('Ms:HandcuffPlayerSource', function(targetId, handcuffedAnim)
    Citizen.CreateThread(function()
        if not handcuffedAnim then
            Utils:PlayAnim('mp_arresting', 'a_uncuff', 0, 0, 0, 3450)
            return
        end
        Citizen.Wait(200)
        Utils:PlayAnim('mp_arrest_paired', 'cop_p2_back_left', 0, 0, 0, 3450)
    end)
end)
RegisterNetEvent('Ms:EscortPlayerTarget')
AddEventHandler('Ms:EscortPlayerTarget', function(srcId, isEscorted)
    if isEscorted ~= 0 then
        AttachEntityToEntity(PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(srcId)), 11816, 0, 0.50, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 20, false)
    else
        DetachEntity(PlayerPedId(), false, false)
    end
end)
RegisterNetEvent('Ms:EscortPlayerSource')
AddEventHandler('Ms:EscortPlayerSource', function(targetId, isEscorted)
    if isEscorted ~= 0 then
        SetCurrentPedWeapon(ped, 'weapon_unarmed', true)
        SetEnableHandcuffs(ped, true)
        escorted = isEscorted
    else
        SetEnableHandcuffs(ped, false)
        escorted = isEscorted
    end
end)
Citizen.CreateThread(function()
    while true do
        if handcuffed or escorted ~= 0 then
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 45, true)
            DisableControlAction(0, 75, true)
            DisableControlAction(0, 91, true)
            DisableControlAction(0, 92, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 158, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 288, true)
            DisableControlAction(1, 323, true)
        end
        Citizen.Wait(1.0)
    end
end)
function HandcuffConnect(isHandcuffed)
    if isHandcuffed then
        SetCurrentPedWeapon(ped, 'weapon_unarmed', true)
        local ped = PlayerPedId()
        cuffProp = CreateObject(GetHashKey("p_cs_cuffs_02_s"), 0.0, 0.0, 0.0, 0, 0, 0)
        SetEnableHandcuffs(ped, true)
        AttachEntityToEntity(cuffProp, ped, GetPedBoneIndex(ped, 28422), -0.022, 0.068, 0.008, 90.0, 255.50, 182.0, 1, 0, 0, 0, 2, 1)
        Utils:PlayAnim('mp_arresting', 'idle', 0, 0, 49, -1)
        handcuffed = true
    end
end
RegisterNetEvent('Ms:EscortedDropped')
AddEventHandler('Ms:EscortedDropped', function()
    SetEnableHandcuffs(PlayerPedId(), false)
    escorted = 0
end)
RegisterNetEvent('Ms:PutInVehicleTarget')
AddEventHandler('Ms:PutInVehicleTarget', function(srcId, isEscorted, vehicle)
    if isEscorted ~= 0 then
        return
    else
        vehicle = NetToVeh(vehicle)
        local index = 0
        for i = 1, GetVehicleMaxNumberOfPassengers(vehicle) do
            if IsVehicleSeatFree(vehicle, i) then
                index = i
            end
        end
        DetachEntity(PlayerPedId(), false, false)
        TaskEnterVehicle(PlayerPedId(), vehicle, -1, index, -1, 16)
    end
end)
RegisterNetEvent('Ms:PutInVehicleSource')
AddEventHandler('Ms:PutInVehicleSource', function(targetId, isEscorted, vehicle)
    if isEscorted ~= 0 then
        SetCurrentPedWeapon(ped, 'weapon_unarmed', true)
        SetEnableHandcuffs(ped, true)
        escorted = isEscorted
    else
        SetEnableHandcuffs(ped, false)
        escorted = isEscorted
    end
end)
Robbery = {
    peds = {},
    robbing = false
}
local RobberyInterior = { 196865, 198401, 168449, 170753, 167937, 175873, 175105, 176641, 177153, 184065, 183809, 200449, 199169, 203265, 204801, 139777, 178945, 154113, 155649 }
local timer = 5000
Citizen.CreateThread(function()
    while true do
        local peds = GetRobberyPedsInRange(vector3(GetEntityCoords(PlayerPedId())), 10.0)
        local currentPed = PlayerPedId()
        if peds ~= nil and Character.Robbing ~= nil and not Character.Robbing[2] then
            timer = 1000
            for _, v in pairs(peds) do
                local ped = v.object
                if GetEntityModel(ped) == GetHashKey('mp_m_shopkeep_01') then
                    for k, p in pairs(RobberyInterior) do
                        if GetInteriorAtCoords(GetEntityCoords(currentPed)) == p and GetSelectedPedWeapon(currentPed) ~= GetHashKey('weapon_unarmed') and IsPlayerFreeAimingAtEntity(PlayerId(), ped) then
                            TriggerServerEvent('Ms:StartRobberry', ped, v.NpcId)
                            timer = 5000
                        end
                    end
                end
            end
        end
        Citizen.Wait(timer)
    end
end)
RegisterNetEvent('Ms:RobberyStoreResults')
AddEventHandler('Ms:RobberyStoreResults', function(entity, coords)
    Citizen.CreateThread(function()
        local animDict = 'mp_am_hold_up'
        RequestAnimDict(animDict)
        RequestScriptAudioBank("Alarms", 0)
        local SoundId = GetSoundId()
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(1)
        end
        PlaySoundFromCoord(SoundId, "Burglar_Bell", vector3(coords.x, coords.y, coords.z) , "Generic_Alarms", 0, 0, 0)
        TaskPlayAnim(entity, 'mp_am_hold_up', 'guard_handsup_loop', 4.0, -1.5, -1, 3, 0.0)
        if animDict ~= nil then
            RemoveAnimDict(animDict)
        end
        PlayAmbientSpeechWithVoice(entity, "SHOP_HURRYING", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
        Citizen.Wait(90000)
        local right, forward, up, pos = GetEntityMatrix(entity)
        local bag = CreateObject(GetHashKey('p_poly_bag_01_s'), GetEntityCoords(PlayerPedId()), false, false, true)
        local netScene = CreateSynchronizedScene(vector3(coords.x, coords.y, coords.z) - forward * 0.8 + right * 0.7, .0, .0, GetEntityHeading(entity) - 180, 2)
        PlayAmbientSpeechWithVoice(entity, "APOLOGY_NO_TROUBLE", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
        SetEntityVisible(bag, false)
        TaskSynchronizedScene(entity, netScene, 'mp_am_hold_up', 'holdup_victim_20s', 4.0, -1.5, 157, 16, 1148846080, 0)
        SetEntityCollision(bag, true, 0)
        SetEntityDynamic(bag, true)
        PlaySynchronizedEntityAnim(bag, netScene, 'holdup_victim_20s_bag', 'mp_am_hold_up', 1000.0, 8.0, 137, 1148846080)
        CreateModelSwap(coords.x, coords.y, coords.z, 3.0, GetHashKey('prop_till_01_dam'), GetHashKey('p_till_01_s'))
        Citizen.Wait(11000)
        SetEntityVisible(bag, true)
        for _, v in pairs({ "prop_till_01", "prop_till_02", "p_till_01_s" }) do
            CreateModelSwap(coords.x, coords.y, coords.z, 3.0, GetHashKey(v), GetHashKey('prop_till_01_dam'))
        end
        Citizen.Wait(11000)
        DeleteObject(bag)
        FreezeEntityPosition(entity, false)
        SetEntityInvincible(entity, false)
        TaskPlayAnim(entity, 'mp_am_hold_up', 'cower_loop', 4.0, -1.5, -1, 3, 0.0)
        PlayAmbientSpeechWithVoice(entity, "SHOP_HURRYING", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 2)
        Citizen.Wait(60000)
        DeleteEntity(entity)
        local ped = CreatePed(5, 'mp_m_shopkeep_01', coords.x, coords.y, coords.z - 1, coords.w, false, false)
        SetModelAsNoLongerNeeded('mp_m_shopkeep_01')
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        ClearArea(GetEntityCoords(ped), 10.0, true, true, false, false)
        StopSound(SoundId)
    end)
end)
RegisterNetEvent('Ms:UpdateRobbing')
AddEventHandler('Ms:UpdateRobbing', function(result)
    Timer.Robbing = 113
    Character.Robbing = result
    GameTimer.Robbing = GetGameTimer()
end)
RegisterNetEvent('Ms:SendRobberyAlerts')
AddEventHandler('Ms:SendRobberyAlerts', function(data)
    local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    SetBlipAlpha(blip, 255)
    Visual.ShowNotify({
        title = "Stalya",
        subtitle = "~b~Police~w~",
        message =  sf('Braquage de superette à ~b~ %s !', GetLabelText(GetNameOfZone(data.coords.x, data.coords.y, data.coords.z))),
        name = "DIA_POLICE",
        icon = 7
    })
    Citizen.CreateThread(function()
        Citizen.Wait(142500)
        RemoveBlip(blip)
    end)
end)
local Cameras = {
    characterCam = 0,
    newCam = 0,
    IsAlwaysActive = false
}
function updateAllValue(boolean)
    CharacterCreation.parents.mum.index = 1
    CharacterCreation.parents.dad.index = 1
    CharacterCreation.HeritageShape.h = 0.5
    CharacterCreation.HeritageShape.i = 5
    CharacterCreation.HeritageColor.h = 0.5
    CharacterCreation.HeritageColor.i = 5
    CharacterCreation.grid[1].x = 0.5
    CharacterCreation.grid[1].y = 0.5
    CharacterCreation.grid[1].rx = 0.0
    CharacterCreation.grid[1].ry = 0.0
    CharacterCreation.grid[2].x = 0.5
    CharacterCreation.grid[2].rx = 0.0
    CharacterCreation.grid[3].x = 0.5
    CharacterCreation.grid[3].y = 0.5
    CharacterCreation.grid[3].rx = 0.0
    CharacterCreation.grid[3].ry = 0.0
    CharacterCreation.grid[4].x = 0.5
    CharacterCreation.grid[4].y = 0.5
    CharacterCreation.grid[4].rx = 0.0
    CharacterCreation.grid[4].ry = 0.0
    CharacterCreation.grid[5].x = 0.5
    CharacterCreation.grid[5].y = 0.5
    CharacterCreation.grid[5].rx = 0.0
    CharacterCreation.grid[5].ry = 0.0
    CharacterCreation.grid[6].x = 0.5
    CharacterCreation.grid[6].y = 0.5
    CharacterCreation.grid[6].rx = 0.0
    CharacterCreation.grid[6].ry = 0.0
    CharacterCreation.grid[7].x = 0.5
    CharacterCreation.grid[7].rx = 0.0
    CharacterCreation.grid[8].x = 0.5
    CharacterCreation.grid[8].rx = 0.0
    CharacterCreation.grid[9].x = 0.5
    CharacterCreation.grid[9].y = 0.5
    CharacterCreation.grid[9].rx = 0.0
    CharacterCreation.grid[9].ry = 0.0
    CharacterCreation.grid[10].x = 0.5
    CharacterCreation.grid[10].y = 0.5
    CharacterCreation.grid[10].rx = 0.0
    CharacterCreation.grid[10].ry = 0.0
    CharacterCreation.grid[11].x = 0.5
    CharacterCreation.grid[11].y = 0.5
    CharacterCreation.grid[11].rx = 0.0
    CharacterCreation.grid[11].ry = 0.0
    CharacterCreation.panelData.hairs.index_one = 1
    CharacterCreation.panelData.hairs.index_two = 1
    CharacterCreation.panelData.strands.index_one = 1
    CharacterCreation.panelData.strands.index_two = 1
    CharacterCreation.panelData.eyebrows.index_one = 1
    CharacterCreation.panelData.eyebrows.index_two = 1
    CharacterCreation.panelData.beards.index_one = 1
    CharacterCreation.panelData.beards.index_two = 1
    CharacterCreation.panelData.lipstick.index_one = 1
    CharacterCreation.panelData.lipstick.index_two = 1
    CharacterCreation.panelData.blush.index_one = 1
    CharacterCreation.panelData.blush.index_two = 1
    CharacterCreation.panelData.opacity.eyebrows = 1.0
    CharacterCreation.panelData.opacity.beards = 1.0
    CharacterCreation.panelData.opacity.blemishes = 1.0
    CharacterCreation.panelData.opacity.ageing = 1.0
    CharacterCreation.panelData.opacity.complexion = 1.0
    CharacterCreation.panelData.opacity.freckles = 1.0
    CharacterCreation.panelData.opacity.sundamage = 1.0
    CharacterCreation.panelData.opacity.makeup = 1.0
    CharacterCreation.panelData.opacity.lipstick = 1.0
    CharacterCreation.panelData.opacity.blush = 1.0
    CharacterCreation.hair.index = 1
    CharacterCreation.hair.index = 1
    CharacterCreation.eyebrows.index = 1
    CharacterCreation.beards.index = 1
    CharacterCreation.blemishes.index = 1
    CharacterCreation.ageing.index = 1
    CharacterCreation.complexion.index = 1
    CharacterCreation.freckles.index = 1
    CharacterCreation.sundamage.index = 1
    CharacterCreation.eyescolor.index = 1
    CharacterCreation.makeup.index = 1
    CharacterCreation.lipstick.index = 1
    CharacterCreation.blush.index = 1
    if not boolean then
        ImHappyOrNotHappy()
    else
        updateFace()
        updateEyeBrown()
        updateEyesOpennig()
        updateNose()
        updateNoseBone()
        updateNosePeak()
        updateCheeksBone()
        updateCheeks()
        updateLips()
        updateJaw()
        updateChimpBone()
        updateChimpHole()
        updateHair()
        updateHairColor()
        updateEyebrows()
        updateEyebrowsColor()
        updateBeards()
        updateBeardsColor()
        updateBlemishes()
        updateAgeing()
        updateComplexion()
        updateFreckles()
        updateSunDamage()
        updateEyesColor()
        updateMakeup()
        updateLipstick()
        updateLipstickColor()
        updateBlush()
        updateBlushColor()
    end
end
function updateFaceFeatures(number, X, Y, reverseX, reverseY, callback)
    if (X ~= nil) then
        if (CharacterCreation.grid[number].x ~= X) then
            updateRx(number, X, reverseX)
        end
    end
    if (Y ~= nil) then
        if (CharacterCreation.grid[number].y ~= Y) then
            updateRy(number, Y, reverseY)
        end
    end
    if (X ~= nil and CharacterCreation.grid[number].x ~= X) then
        CharacterCreation.grid[number].x = X
        callback()
    end
    if (Y ~= nil and CharacterCreation.grid[number].y ~= Y) then
        CharacterCreation.grid[number].y = Y
        callback()
    end
end
function updateRx(value, x, bool)
    if (x == 0.5) then
        CharacterCreation.grid[value].rx = 0.0
    end
    if (x < 0.5) then
        if not bool then
            CharacterCreation.grid[value].rx = 0.0 - ((0.5 - x) * 2)
        else
            CharacterCreation.grid[value].rx = 0.0 + ((0.5 - x) * 2)
        end
    end
    if (x > 0.5) then
        if not bool then
            CharacterCreation.grid[value].rx = 0.0 + ((x - 0.5) * 2)
        else
            CharacterCreation.grid[value].rx = 0.0 - ((x - 0.5) * 2)
        end
    end
    if (CharacterCreation.grid[value].rx <= -1.0) then
        CharacterCreation.grid[value].rx = -1.0
    end
    if (CharacterCreation.grid[value].rx >= 1.0) then
        CharacterCreation.grid[value].rx = 1.0
    end
end
function updateRy(value, y, bool)
    if (y == 0.5) then
        CharacterCreation.grid[value].ry = 0.0
    end
    if (y < 0.5) then
        if not bool then
            CharacterCreation.grid[value].ry = 0.0 - ((0.5 - y) * 2)
        else
            CharacterCreation.grid[value].ry = 0.0 + ((0.5 - y) * 2)
        end
    end
    if (y > 0.5) then
        if not bool then
            CharacterCreation.grid[value].ry = 0.0 + ((y - 0.5) * 2)
        else
            CharacterCreation.grid[value].ry = 0.0 - ((y - 0.5) * 2)
        end
    end
    if (CharacterCreation.grid[value].ry <= -1.0) then
        CharacterCreation.grid[value].ry = -1.0
    end
    if (CharacterCreation.grid[value].ry >= 1.0) then
        CharacterCreation.grid[value].ry = 1.0
    end
end
function CreateCamCreation()
    local Coords = vector3(402.82, -998.45, -98.5)
    local ped = PlayerPedId()
    DestroyAllCams()
    PlaySoundFrontend(-1, "Zoom_Out", "MUGSHOT_CHARACTER_CREATION_SOUNDS", 0, 0, 1);
    Cameras.characterCam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    SetCamCoord(Cameras.characterCam, 402.96, -1004.16, -98.5)
    SetCamRot(Cameras.characterCam, -7.88, 0, 0.30)
    SetCamActive(Cameras.characterCam, true)
    RenderScriptCams(1, 0, 500, false, false)
    SetEntityCoords(ped, 405.96, -997.2, -100.00)
    SetEntityRotation(ped, 0, -0, 93.05, 2, true)
    SetEntityHeading(ped, 95.25)
    Utils:PlayAnim('mp_character_creation@customise@male_a', 'drop_intro', 0, 0, 2)
    Citizen.Wait(500)
    Utils:SwitchCam(Cameras.characterCam, Cameras.newCam, Coords, 10000)
end
function CharacterWelcome()
    local ped = PlayerPedId()
    SetEntityRotation(ped, 0, -0, 93.05, 2, true)
    SetEntityHeading(ped, 95.25)
    SetPedKeepTask(ped, true)
    Utils:PlayAnim('mp_character_creation@customise@male_a', 'intro', 5000, 2500, 2)
    Citizen.Wait(5000)
    Utils:PlayAnim('mp_character_creation@customise@male_a', 'drop_intro', 5000, 2500, 2)
end
function ImHappyOrNotHappy()
    updateLipstickColor()
    updateHairColor()
    updateBeardsColor()
    updateLipstickColor()
    updateBlushColor()
    updateEyesColor()
    updateEyebrowsColor()
    ClearPedDecorations(PlayerPedId())
    AddPedDecorationFromHashes(PlayerPedId(), "mpbeach_overlays", "FM_Hair_Fuzz")
end
PedsLists = {"csb_agent","ig_amandatownley","s_m_m_strpreach_01","a_m_m_fatlatin_01","a_f_m_beach_01","a_f_m_bevhills_01","a_f_m_bevhills_02","a_f_m_bodybuild_01","a_f_m_business_02","a_f_m_downtown_01","a_f_m_eastsa_01","a_f_m_eastsa_02","a_f_m_fatbla_01","a_f_m_fatcult_01","a_f_m_fatwhite_01","a_f_m_ktown_01","a_f_m_ktown_02","a_f_m_prolhost_01","a_f_m_salton_01","a_f_m_skidrow_01","a_f_m_soucent_01","a_f_m_soucent_02","a_f_m_soucentmc_01","a_f_m_tourist_01","a_f_m_tramp_01","a_f_m_trampbeac_01","a_f_o_genstreet_01","a_f_o_indian_01","a_f_o_ktown_01","a_f_o_salton_01","a_f_o_soucent_01","a_f_o_soucent_02","a_f_y_beach_01","a_f_y_bevhills_01","a_f_y_bevhills_02","a_f_y_bevhills_03","a_f_y_bevhills_04","a_f_y_business_01","a_f_y_business_02","a_f_y_business_03","a_f_y_business_04","a_f_y_eastsa_01","a_f_y_eastsa_02","a_f_y_eastsa_03","a_f_y_epsilon_01","a_f_y_fitness_01","a_f_y_fitness_02","a_f_y_genhot_01","a_f_y_golfer_01","a_f_y_hiker_01","a_f_y_hippie_01","a_f_y_hipster_01","a_f_y_hipster_02","a_f_y_hipster_03","a_f_y_hipster_04","a_f_y_indian_01","a_f_y_juggalo_01","a_f_y_runner_01","a_f_y_rurmeth_01","a_f_y_scdressy_01","a_f_y_skater_01","a_f_y_soucent_01","a_f_y_soucent_02","a_f_y_soucent_03","a_f_y_tennis_01","a_f_y_topless_01","a_f_y_tourist_01","a_f_y_tourist_02","a_f_y_vinewood_01","a_f_y_vinewood_02","a_f_y_vinewood_03","a_f_y_vinewood_04","a_f_y_yoga_01","a_m_m_acult_01","a_m_m_afriamer_01","a_m_m_beach_01","a_m_m_beach_02","a_m_m_bevhills_01","a_m_m_bevhills_02","a_m_m_business_01","a_m_m_eastsa_01","a_m_m_eastsa_02","a_m_m_farmer_01","a_m_m_fatlatin_01","a_m_m_genfat_01","a_m_m_genfat_02","a_m_m_golfer_01","a_m_m_hasjew_01","a_m_m_hillbilly_01","a_m_m_hillbilly_02","a_m_m_indian_01","a_m_m_ktown_01","a_m_m_malibu_01","a_m_m_mexcntry_01","a_m_m_mexlabor_01","a_m_m_og_boss_01","a_m_m_paparazzi_01","a_m_m_polynesian_01","a_m_m_prolhost_01","a_m_m_rurmeth_01","a_m_m_salton_01","a_m_m_salton_02","a_m_m_salton_03","a_m_m_salton_04","a_m_m_skater_01","a_m_m_skidrow_01","a_m_m_socenlat_01","a_m_m_soucent_01","a_m_m_soucent_02","a_m_m_soucent_03","a_m_m_soucent_04","a_m_m_stlat_02","a_m_m_tennis_01","a_m_m_tourist_01","a_m_m_tramp_01","a_m_m_trampbeac_01","a_m_m_tranvest_01","a_m_m_tranvest_02","a_m_o_acult_01","a_m_o_acult_02","a_m_o_beach_01","a_m_o_genstreet_01","a_m_o_ktown_01","a_m_o_salton_01","a_m_o_soucent_01","a_m_o_soucent_02","a_m_o_soucent_03","a_m_o_tramp_01","a_m_y_acult_01","a_m_y_acult_02","a_m_y_beach_01","a_m_y_beach_02","a_m_y_beach_03","a_m_y_beachvesp_01","a_m_y_beachvesp_02","a_m_y_bevhills_01","a_m_y_bevhills_02","a_m_y_breakdance_01","a_m_y_busicas_01","a_m_y_business_01","a_m_y_business_02","a_m_y_business_03","a_m_y_cyclist_01","a_m_y_dhill_01","a_m_y_downtown_01","a_m_y_eastsa_01","a_m_y_eastsa_02","a_m_y_epsilon_01","a_m_y_epsilon_02","a_m_y_gay_01","a_m_y_gay_02","a_m_y_genstreet_01","a_m_y_genstreet_02","a_m_y_golfer_01","a_m_y_hasjew_01","a_m_y_hiker_01","a_m_y_hippy_01","a_m_y_hipster_01","a_m_y_hipster_02","a_m_y_hipster_03","a_m_y_indian_01","a_m_y_jetski_01","a_m_y_juggalo_01","a_m_y_ktown_01","a_m_y_ktown_02","a_m_y_latino_01","a_m_y_methhead_01","a_m_y_mexthug_01","a_m_y_motox_01","a_m_y_motox_02","a_m_y_musclbeac_01","a_m_y_musclbeac_02","a_m_y_polynesian_01","a_m_y_roadcyc_01","a_m_y_runner_01","a_m_y_runner_02","a_m_y_salton_01","a_m_y_skater_01","a_m_y_skater_02","a_m_y_soucent_01","a_m_y_soucent_02","a_m_y_soucent_03","a_m_y_soucent_04","a_m_y_stbla_01","a_m_y_stbla_02","a_m_y_stlat_01","a_m_y_stwhi_01","a_m_y_stwhi_02","a_m_y_sunbathe_01","a_m_y_surfer_01","a_m_y_vindouche_01","a_m_y_vinewood_01","a_m_y_vinewood_02","a_m_y_vinewood_03","a_m_y_vinewood_04","a_m_y_yoga_01","g_f_importexport_01","g_f_y_ballas_01","g_f_y_families_01","g_f_y_lost_01","g_f_y_vagos_01","g_m_importexport_01","g_m_m_armboss_01","g_m_m_armgoon_01","g_m_m_armlieut_01","g_m_m_chemwork_01","g_m_m_chiboss_01","g_m_m_chicold_01","g_m_m_chigoon_01","g_m_m_chigoon_02","g_m_m_korboss_01","g_m_m_mexboss_01","g_m_m_mexboss_02","g_m_y_armgoon_02","g_m_y_azteca_01","g_m_y_ballaeast_01","g_m_y_ballaorig_01","g_m_y_ballasout_01","g_m_y_famca_01","g_m_y_famdnf_01","g_m_y_famfor_01","g_m_y_korean_01","g_m_y_korean_02","g_m_y_korlieut_01","g_m_y_lost_01","g_m_y_lost_02","g_m_y_lost_03","g_m_y_mexgang_01","g_m_y_mexgoon_01","g_m_y_mexgoon_02","g_m_y_mexgoon_03","g_m_y_pologoon_01","g_m_y_pologoon_02","g_m_y_salvaboss_01","g_m_y_salvagoon_01","g_m_y_salvagoon_02","g_m_y_salvagoon_03","g_m_y_strpunk_01","g_m_y_strpunk_02","ig_abigail","ig_amandatownley","ig_andreas","ig_ashley","ig_ballasog","ig_bankman","ig_barry","ig_benny","ig_bestmen","ig_beverly","ig_brad","ig_bride","ig_car3guy1","ig_car3guy2","ig_chef","ig_chengsr","ig_chrisformage","ig_clay","ig_claypain","ig_cletus","ig_dale","ig_davenorton","ig_denise","ig_devin","ig_dom","ig_dreyfuss","ig_drfriedlander","ig_fabien","ig_fbisuit_01","ig_floyd","ig_g","ig_groom","ig_hao","ig_hunter","ig_janet","ig_jay_norris","ig_jewelass","ig_jimmyboston","ig_jimmydisanto","ig_joeminuteman","ig_josef","ig_josh","ig_kerrymcintosh","ig_lamardavis","ig_lazlow","ig_lestercrest","ig_lifeinvad_01","ig_lifeinvad_02","ig_magenta","ig_malc","ig_manuel","ig_marnie","ig_maryann","ig_maude","ig_michelle","ig_milton","ig_molly","ig_mrk","ig_mrs_thornhill","ig_mrsphillips","ig_natalia","ig_nervousron","ig_nigel","ig_old_man1a","ig_old_man2","ig_omega","ig_oneil","ig_ortega","ig_paper","ig_patricia","ig_priest","ig_ramp_gang","ig_ramp_hic","ig_ramp_hipster","ig_ramp_mex","ig_roccopelosi","ig_russiandrunk","ig_screen_writer","ig_solomon","ig_stevehains","ig_stretch","ig_talina","ig_tanisha","ig_taocheng","ig_taostranslator","ig_tenniscoach","ig_terry","ig_tomepsilon","ig_tonya","ig_tracydisanto","ig_trafficwarden","ig_tylerdix","ig_vagspeak","ig_wade","ig_zimbor","mp_f_boatstaff_01","mp_f_cardesign_01","mp_f_chbar_01","mp_f_counterfeit_01","mp_f_execpa_01","mp_f_forgery_01","mp_f_weed_01","mp_g_m_pros_01","mp_m_counterfeit_01","mp_m_exarmy_01","mp_m_execpa_01","mp_m_famdd_01","mp_m_forgery_01","mp_m_g_vagfun_01","mp_m_shopkeep_01","mp_m_waremech_01","mp_m_weed_01","s_f_m_fembarber","s_f_m_maid_01","s_f_m_shop_high","s_f_m_sweatshop_01","s_f_y_bartender_01","s_f_y_hooker_01","s_f_y_hooker_02","s_f_y_hooker_03","s_f_y_migrant_01","s_f_y_movprem_01","s_f_y_shop_low","s_f_y_shop_mid","s_f_y_sweatshop_01","s_m_m_ammucountry","s_m_m_autoshop_01","s_m_m_autoshop_02","s_m_m_bouncer_01","s_m_m_ciasec_01","s_m_m_cntrybar_01","s_m_m_fiboffice_01","s_m_m_fiboffice_02","s_m_m_gaffer_01","s_m_m_gardener_01","s_m_m_hairdress_01","s_m_m_highsec_01","s_m_m_highsec_02","s_m_m_janitor","s_m_m_lathandy_01","s_m_m_lifeinvad_01","s_m_m_linecook","s_m_m_lsmetro_01","s_m_m_mariachi_01","s_m_m_migrant_01","s_m_m_movprem_01","s_m_m_strpreach_01","s_m_m_strvend_01","s_m_m_trucker_01","s_m_o_busker_01","s_m_y_ammucity_01","s_m_y_barman_01","s_m_y_busboy_01","s_m_y_chef_01","s_m_y_dealer_01","s_m_y_devinsec_01","s_m_y_grip_01","s_m_y_robber_01","s_m_y_shop_mask","s_m_y_strvend_01","s_m_y_valet_01","s_m_y_waiter_01","s_m_y_winclean_01","s_m_y_xmech_01","s_m_y_xmech_02","s_m_y_xmech_02_mp","u_f_m_miranda","u_f_m_promourn_01","u_f_o_moviestar","u_f_o_prolhost_01","u_f_y_bikerchic","u_f_y_comjane","u_f_y_hotposh_01","u_f_y_jewelass_01","u_f_y_mistress","u_f_y_poppymich","u_f_y_princess","u_f_y_spyactress","u_m_m_aldinapoli","u_m_m_bankman","u_m_m_bikehire_01","u_m_m_fibarchitect","u_m_m_filmdirector","u_m_m_glenstank_01","u_m_m_griff_01","u_m_m_jewelsec_01","u_m_m_jewelthief","u_m_m_markfost","u_m_m_partytarget","u_m_m_promourn_01","u_m_m_rivalpap","u_m_m_spyactor","u_m_m_willyfist","u_m_o_finguru_01","u_m_o_taphillbilly","u_m_o_tramp_01","u_m_y_abner","u_m_y_antonb","u_m_y_babyd","u_m_y_baygor","u_m_y_chip","u_m_y_cyclist_01","u_m_y_fibmugger_01","u_m_y_guido_01","u_m_y_gunvend_01","u_m_y_hippie_01","u_m_y_mani","u_m_y_militarybum","u_m_y_paparazzi","u_m_y_party_01","u_m_y_sbike","u_m_y_tattoo_01","s_m_y_cop_01","s_m_y_blackops_01","s_m_y_blackops_02","s_m_y_blackops_03","a_f_y_femaleagent","mp_f_cocaine_01","mp_f_execpa_02","mp_f_helistaff_01","mp_f_meth_01","mp_f_weed_01","mp_m_cocaine_01","mp_m_counterfeit_01","mp_m_meth_01","mp_m_securoguard_01","mp_m_weapexp_01","mp_m_weapwork_01","u_m_m_streetart_01","ig_lestercrest_2","ig_avon","mp_m_avongoon","mp_m_bogdangoon","csb_jackhowitzer","cs_amandatownley","cs_andreas","cs_ashley","cs_bankman","cs_barry","cs_beverly","cs_brad","cs_bradcadaver","cs_carbuyer","cs_casey","cs_chengsr","cs_chrisformage","cs_clay","cs_dale","cs_davenorton","cs_debra","cs_denise","cs_devin","cs_dom","cs_dreyfuss","cs_drfriedlander","cs_fabien","cs_fbisuit_01","cs_floyd","cs_guadalope","cs_gurk","cs_hunter","cs_janet","cs_jewelass","cs_jimmyboston","cs_jimmydisanto","cs_joeminuteman","cs_johnnyklebitz","cs_josef","cs_josh","cs_lamardavis","cs_lazlow","cs_lestercrest","cs_lifeinvad_01","cs_magenta","cs_manuel","cs_marnie","cs_martinmadrazo","cs_maryann","cs_michelle","cs_milton","cs_molly","cs_movpremf_01","cs_movpremmale","cs_mrk","cs_mrs_thornhill","cs_mrsphillips","cs_natalia","cs_nervousron","cs_nigel","cs_old_man1a","cs_old_man2","cs_omega","cs_orleans","cs_paper","cs_patricia","cs_priest","cs_prolsec_02","cs_russiandrunk","cs_siemonyetarian","cs_solomon","cs_stevehains","cs_stretch","cs_tanisha","cs_taocheng","cs_taostranslator","cs_tenniscoach","cs_terry","cs_tom","cs_tomepsilon","cs_tracydisanto","cs_wade","cs_zimbor","csb_abigail","csb_anita","csb_anton","csb_ballasog","csb_bride","csb_burgerdrug","csb_car3guy1","csb_car3guy2","csb_chef","csb_chin_goon","csb_cletus","csb_cop","csb_customer","csb_denise_friend","csb_fos_rep","csb_g","csb_groom","csb_grove_str_dlr","csb_hao","csb_hugh","csb_imran","csb_janitor","csb_maude","csb_mweather","csb_ortega","csb_oscar","csb_porndudes","csb_prologuedriver","csb_prolsec","csb_ramp_gang","csb_ramp_hic","csb_ramp_hipster","csb_ramp_marine","csb_ramp_mex","csb_roccopelosi","csb_screen_writer","csb_stripper_01","csb_stripper_02","csb_tonya","csb_trafficwarden","csb_vagspeak","hc_driver","hc_gunman","hc_hacker","ig_casey","ig_johnnyklebitz","ig_orleans","ig_prolsec_02","ig_siemonyetarian","mp_f_deadhooker","mp_f_misty_01","mp_f_stripperlite","mp_f_stripperlite","mp_m_fibsec_01","mp_s_m_armoured_01","s_f_y_airhostess_01","s_f_y_baywatch_01","s_f_y_cop_01","s_f_y_factory_01","s_f_y_ranger_01","s_f_y_scrubs_01","s_f_y_sheriff_01","s_f_y_stripper_01","s_f_y_stripper_02","s_f_y_stripperlite","s_m_m_armoured_01","s_m_m_armoured_02","s_m_m_chemsec_01","s_m_m_dockwork_01","s_m_m_doctor_01","s_m_m_gentransport","s_m_m_marine_01","s_m_m_marine_02","s_m_m_movalien_01","s_m_m_movspace_01","s_m_m_paramedic_01","s_m_m_pilot_01","s_m_m_pilot_02","s_m_m_postal_01","s_m_m_postal_02","s_m_m_prisguard_01","s_m_m_scientist_01","s_m_m_security_01","s_m_m_snowcop_01","s_m_m_strperf_01","s_m_m_ups_01","s_m_m_ups_02","s_m_y_airworker","s_m_y_armymech_01","s_m_y_autopsy_01","s_m_y_baywatch_01","s_m_y_clown_01","s_m_y_construct_01","s_m_y_construct_02","s_m_y_dockwork_01","s_m_y_doorman_01","s_m_y_dwservice_01","s_m_y_dwservice_02","s_m_y_factory_01","s_m_y_fireman_01","s_m_y_garbage","s_m_y_hwaycop_01","s_m_y_marine_01","s_m_y_marine_02","s_m_y_marine_03","s_m_y_pestcont_01","s_m_y_pilot_01","s_m_y_prismuscl_01","s_m_y_prisoner_01","s_m_y_ranger_01","s_m_y_sheriff_01","s_m_y_uscg_01","u_m_m_prolsec_01","u_m_y_burgerdrug_01","u_m_y_imporage","u_m_y_justin","u_m_y_prisoner_01","u_m_y_proldriver_01","u_m_y_rsranger_01","u_m_y_staggrm_01","a_f_y_clubcust_01","a_f_y_clubcust_02","a_f_y_clubcust_03","ig_agent","ig_mp_agent14","ig_chef2","ig_popov","ig_karen_daniels","ig_rashcosvki","ig_money","ig_paige","ig_djblamadon","ig_djblamryans","ig_djblamrupert","ig_djdixmanager","ig_djsolfotios","ig_djsoljakob","ig_djsolmike","ig_djsolrobt","ig_djtalaurelia","ig_djtalignazio","ig_dix","ig_englishdave","ig_djgeneric_01","ig_jimmyboston_02","ig_kerrymcintosh_02","ig_lacey_jones_02","ig_lazlow_2","ig_sol","ig_djsolmanager","ig_talcc","ig_talmm","ig_tylerdix_02","ig_tonyprince","ig_sacha","u_m_y_juggernaut_01","u_m_y_corpse_01","u_m_m_doa_01","u_m_m_edtoh","u_m_y_smugmech_01","u_m_o_filmnoir","u_m_y_pogo_01","u_m_y_danceburl_01","u_m_y_dancelthr_01","u_m_y_dancerave_01","mp_f_meth_01","mp_m_boatstaff_01","mp_f_bennymech_01","csb_mp_agent14","csb_avon","csb_bogdan","csb_chef2","csb_popov","cs_karen_daniels","csb_rashcosvki","csb_money","csb_mrs_r","csb_paige","csb_undercover","csb_djblamadon","csb_dix","csb_englishdave","cs_lazlow_2","csb_sol","csb_talcc","csb_talmm","csb_tonyprince","csb_alan","csb_bryony","s_m_m_ccrew_01","s_m_m_fibsec_01","s_m_y_swat_01","s_m_y_clubbar_01","s_m_y_waretech_01","s_f_y_clubbar_01","u_f_m_corpse_01","u_f_y_corpse_01","u_f_y_corpse_02","u_f_m_miranda_02","u_f_y_poppymich_02","u_f_y_danceburl_01","u_f_y_dancelthr_01","u_f_y_dancerave_01","a_m_y_clubcust_01","a_m_y_clubcust_02","a_m_y_clubcust_03"}
os = {
    time = function()
        if Account.OsTime ~= nil then return Account.OsTime + ((GetGameTimer() - GameTimer.OsTime) / 1000) end
        return 0
    end
}
function Utils:PlayAnim(animDict, animName, timewait1, timewait2, flag, duration, cb)
    Citizen.CreateThread(function()
        local dur = -1
        if duration ~= nil then dur = duration end
        if timewait2 >= 0 then Citizen.Wait(timewait2) end
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(1)
        end
        FreezeEntityPosition(PlayerPedId(), false)
        TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, dur, flag, 1, 0, 0, 0)
        Citizen.Wait(timewait1)
        if animDict ~= nil then
            RemoveAnimDict(animDict)
        end
        if cb ~= nil then
            cb()
        end
    end)
end
function Utils:SwitchCam(oldCam, camtoswitch, Coords, duration)
    Citizen.CreateThread(function()
        camtoswitch = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        local rota = GetCamRot(oldCam, 2)
        SetCamCoord(camtoswitch,  Coords.x, Coords.y, Coords.z)
        SetCamRot(camtoswitch, rota)
        SetCamActive(camtoswitch, true)
        SetCamActiveWithInterp(camtoswitch, oldCam, duration, 1, 1)
        CharacterWelcome()
        Citizen.Wait(5000)
        RageUI.Visible(RMenu:Get('connection', 'newcharacter'), not RageUI.Visible(RMenu:Get('connection', 'newcharacter')))
        DestroyCam(oldCam)
    end)
end
function Utils:Contains(table, value)
    for k,v in pairs(table) do
        if (value == v) then
            return true
        end
    end
    return false
end
function Utils:GetEntityInFront(flag, radius) 
    local player = PlayerId()
    local plyPed = GetPlayerPed(player)
    local plyPos = GetEntityCoords(plyPed, false)
    local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
    local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, flag, plyPed, 7)
    local _, _, _, _, ped = GetShapeTestResult(rayHandle)
    return ped
end
function Utils:CommaValue(n) 
    if (n == nil) then
        return ""
    end
    local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
    return left..(num:reverse():gsub('(%d%d%d)','%1 '):reverse())..right
end
function Utils:TableContainsSameValue(table, table2)
    for _, v in pairs(table) do
        for __, y in pairs(table2) do
            if v == y then
                return true
            end
        end
    end
    return false
end
function Utils:SeeAndUseMarker(MarkerId)

    if Character.Jobs == nil then return false end

    
    if Markers[MarkerId].Data == nil then
        return true
    end
    if Markers[MarkerId].Data.Jobs == nil then
        return true
    end
    if Utils:TableContainsSameValue(Markers[MarkerId].Data.Jobs, Utils:GetCharacterJobs()) then
        return true
    end
    if Character.StaffRank ~= nil and Character.StaffRank > 0 and Character.StaffRank < 4 then
        return false
    end
    return false
end
local isInSafeZone = false
function Utils:SafeZone(markerId)
    local ped = PlayerPedId()
    local pDist = GetEntityCoords(ped)
    local dist = #(vector3(pDist.x, pDist.y, pDist.z) - vector3(Markers[markerId].Coords.x, Markers[markerId].Coords.y, Markers[markerId].Coords.z - 0.90))
    if dist <= Markers[markerId].Distances - 2 then
        if not isInSafeZone then
            Visual.ShowNotify({
                title = "Stalya",
                subtitle = "~g~Information",
                message = "Vous venez d'entrer en zone safe.",
                dict = "stalya",
                name = "logo_blue",
                icon = 7
            })
            TriggerServerEvent('Ms:SafeZone', markerId)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"),true)
            NetworkSetFriendlyFireOption(false)
            SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
            isInSafeZone = true
        else
            DisableControlAction(2, 37, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 92, true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 168, true)
            DisableControlAction(0, 140, true)
        end
    else
        if isInSafeZone then
            Visual.ShowNotify({
                title = "Stalya",
                subtitle = "~g~Information",
                message = "Vous venez de sortir d'une zone safe.",
                dict = "stalya",
                name = "logo_blue",
                icon = 7
            })
            SetEntityProofs(GetPlayerPed(-1), false, true, true, true, false, false, false, false)
            NetworkSetFriendlyFireOption(true)
            isInSafeZone = false
        end
    end
end
function Utils.AddBlip(id, data)
    local blip = AddBlipForCoord(data.Coords.x, data.Coords.y, data.Coords.z)
    SetBlipSprite(blip, data.SpriteId)
    SetBlipScale(blip, data.Scale)
    SetBlipColour(blip, data.Color)
    SetBlipAlpha(blip, data.Alpha)
    if data.ShortRange then
        SetBlipAsShortRange(blip, true)
    end
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.Name)
    EndTextCommandSetBlipName(blip)
    BlipIds[id] = blip
end
function Utils.DeleteBlip(id)
    local blip = tonumber(BlipIds[id])
    if not blip then return end
    RemoveBlip(blip)
    BlipIds[id] = nil
end
local Hud = {}
RegisterNetEvent('Ms:DisplayHud')
AddEventHandler('Ms:DisplayHud', function()
    SendNUIMessage({
        setDisplay = true,
        display    = 0.5
    })
    table.insert(Hud, {
        name    = 'hunger',
        val     = Character.States.Hunger,
        color   = '#05ee7e',
        visible = true,
        max     = 0,
    })
    table.insert(Hud, {
        name    = 'thirst',
        val     = Character.States.Thirst,
        color   = '#00b6ff',
        visible = true,
        max     =  100,
    })
    SendNUIMessage({
        update = true,
        status = Hud
    })
end)
RegisterNetEvent('Ms:UpdateHud')
AddEventHandler('Ms:UpdateHud', function(data)
    if #Hud < 2 then return end
    Hud[1].val = data.Hunger
    Hud[2].val = data.Thirst
    SendNUIMessage({
        update = true,
        status = Hud
    })
end)
