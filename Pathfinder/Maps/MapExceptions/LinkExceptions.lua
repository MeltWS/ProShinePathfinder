local linkExce = {}

linkExce["Route 2 Stop3"] = {
    ["Route 2_B"] = {3, 2}, -- top
    ["Route 2_D"] = {3, 12} -- down
}
linkExce["Tohjo Falls"] = {
    ["Route 27_A"] = {23, 32}, -- left
    ["Route 27_B"] = {46, 32} -- right
}
linkExce["Mt. Moon B2F_A"] = {
    ["Mt. Moon B1F_B"] = {17, 27}, -- left, towards route 4
    ["Mt. Moon B1F_D"] = {38, 40} -- right, towards route 3
}
linkExce["Mt. Moon 1F"] = {
    ["Mt. Moon B1F_A"] = {58, 33}, -- right, way to middle dig
    ["Mt. Moon B1F_C"] = {37, 29}, -- middle, way to top dig
    ["Mt. Moon B1F_D"] = {21, 20} -- topleft, way to route 4
}
linkExce["Route 4"] = {
    ["Cerulean City_A"] = {96, 22}, -- main City
    ["Cerulean City_B"] = {96, 14} -- Cerulean cave
    }
linkExce["Cerulean City_A"] = {
    ["Route 5_A"] = {17, 50}, -- daycare
    ["Route 5_B"] = {22, 50} -- fastest path
}
linkExce["Route 25"] = {
    ["Route 24_A"] = {9, 30}, -- water side to cerulean cave
    ["Route 24_B"] = {14, 30} -- bridge to main city
}
linkExce["Route 9"] = {
    ["Route 10_A"] = {85, 33}, -- pokecenter
    ["Route_10_B"] = {91, 33} -- power plant
}
linkExce["Rock Tunnel 1_B"] = {
    ["Rock Tunnel 2_A"] = {7, 7}, -- top left
    ["Rock Tunnel 2_B"] = {8, 15} -- middle left
}
linkExce["Rock Tunnel 2_A"] = {
    ["Rock Tunnel 1_A"] = {36, 16}, -- right, towards pokecenter
    ["Rock Tunnel 1_B"] = {7, 5} -- left, towards lavender
}
linkExce["Rock Tunnel 2_B"] = {
    ["Rock Tunnel 1_B"] = {10, 13}, -- middle, towards pokecenter
    ["Rock Tunnel 1_C"] = {8, 26} -- bottom, towards lavender
}
linkExce["Pokemon Tower B3_A"] = {
    ["Pokemon Tower B3_B"] = {23, 20},
}
linkExce["Pokemon Tower B3_B"] = {
    ["Pokemon Tower B3_C"] = {17, 23},
}
linkExce["Pokemon Tower B10_A"] = {
    ["Pokemon Tower B9_A"] = {18, 21},
    ["Pokemon Tower B9_B"] = {23, 17}
}
linkExce["Pokemon Tower B9_B"] = {
    ["Pokemon Tower B10_A"] = {23, 17},
    ["Pokemon Tower B10_B"] = {24, 21}
}
linkExce["Pokemon Tower B17_A"] = {
    ["Pokemon Tower B17_B"] = {20, 19}
}
linkExce["Pokemon Tower B18"] = {
    ["Pokemon Tower B19_A"] = {18, 17},
    ["Pokemon Tower B19_B"] = {23, 22},
    ["Pokemon Tower B19_C"] = {23, 17}
}
linkExce["Pokemon Tower B19_B"] = {
    ["Pokemon Tower B20_A"] = {18, 20},
    ["Pokemon Tower B20_B"] = {18, 22}
}
linkExce["Seafoam B1F"] = {
    ["Seafoam 1F_A"] = {85, 22}, -- to cinnabar
    ["Seafoam 1F_B"] = {15, 12}, -- to route 19
    ["Seafoam B2F_A"] = {26, 22}, -- bottom left
    ["Seafoam B2F_B"] = {36, 21}, -- middle left
    ["Seafoam B2F_D"] = {64, 25} -- middle right
}
linkExce["Seafoam B2F_C"] = {
    ["Seafoam B3F_C"] = {63, 27}, -- towards B4F double stairs
    ["Seafoam B3F_D"] = {35, 18} -- to upper middle B3F
}
linkExce["Seafoam B3F_E"] = {
    ["Seafoam B4F_D"] = {57, 26}, -- to nurse platform
    ["Seafoam B4F_C"] = {20, 25}, -- B4F middle path
    ["Seafoam B4F_B"] = {49, 7} -- dead end
}
linkExce["Seafoam B4F_A"] = {
    ["Seafoam B3F_B"] = {9, 6}, -- to B3F left side
    ["Seafoam B3F_C"] = {63, 27} -- to B2F isolated
}
linkExce["Seafoam B4F_C"] = {
    ["Seafoam B3F_D"] = {38, 16}, -- B3F upper part
    ["Seafoam B3F_E"] = {19, 23} -- main cave
}
linkExce["Bike Road Stop"] = {
    ["Route 18_A"] = {0, 6}, -- bike road
    ["Route 18_B"] = {10, 6} -- to fuchsia
}
linkExce["Route 16 Stop House"] = {
    ["Route 16_A"] = {0, 6}, -- bike road
    ["Route 16_B"] = {20, 6} -- to celadon
}
linkExce["Player House Pallet"] = {
    ["Pallet Town"] = {4, 10} -- to pallet
}
linkExce["Victory Road Kanto 2F_A"] = {
    ["Victory Road Kanto 3F_A"] = {14, 9}, -- to kanto league
    ["Victory Road Kanto 3F_D"] = {57, 25} -- deeper in caves
}
linkExce["Victory Road Kanto 2F_D"] = {
    ["Victory Road Kanto 3F_C"] = {62, 11} -- to isolated areas
}
linkExce["Victory Road Kanto 3F_B"] = {
    ["Victory Road Kanto 2F_C"] = {34, 37}, -- to enclosed stair zone
    ["Victory Road Kanto 2F_A"] = {29, 17} -- main path
}
linkExce["Victory Road Kanto 3F_C"] = {
    ["Victory Road Kanto 2F_B"] = {35, 33}, -- to brother npc zone
    ["Victory Road Kanto 2F_C"] = {38, 37}, -- to enclosed stair zone
    ["Victory Road Kanto 2F_D"] = {62, 24} -- back
}
linkExce["Victory Road Kanto 3F_D"] = {
    ["Victory Road Kanto 2F_A"] = {56, 32}, -- main path
    ["Victory Road Kanto 2F_D"] = {61, 35} -- right path
}
linkExce["Mt. Silver Exterior"] = {
    ["Route 28_A"] = {35, 19}, -- main
    ["Route 28_B"] = {35, 11}
}
linkExce["Mt. Silver Lower Mountainside"] = {
    ["Mt. Silver 1F_A"] = {22, 34},
    ["Mt. Silver 1F_B"] = {18, 28},
    ["Mt. Silver 1F_E"] = {14, 12},
}
linkExce["Mt. Silver 2F_C"] = {
    ["Mt. Silver Upper Mountainside_A"] = {51, 32},
    ["Mt. Silver Upper Mountainside_B"] = {51, 45},
}
linkExce["Mt. Silver Upper Mountainside_A"] = {
    ["Mt. Silver 2F_A"] = {22, 25},
    ["Mt. Silver 2F_B"] = {39, 30},
    ["Mt. Silver 2F_C"] = {39, 43},
}
linkExce["Mt. Silver Upper Mountainside_B"] = {
    ["Mt. Silver 2F_C"] = {39, 56},
    ["Mt. Silver 2F_D"] = {34, 61},
}
linkExce["Route 28_B"] = {
    ["Route 28 House"] = {19, 11},
}
linkExce["Route 27_B"] = {
    ["Route 26_A"] = {217, 23}, -- always go to the main road
}
linkExce["Cinnabar mansion 2"] = {
    ["Cinnabar mansion 3_A"] = {9, 19},
    ["Cinnabar mansion 3_B"] = {9, 4},
}
linkExce["Cinnabar mansion 3_B"] = {
    ["Cinnabar mansion B1F_A"] = {21, 19},
}
linkExce[""] = {
    [""] = {},
}

return linkExce