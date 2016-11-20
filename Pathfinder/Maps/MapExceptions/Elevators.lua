local elevatorExceptions = {}

elevatorExceptions["Celadon Mart Elevator"] = {
    ["Celadon Mart 1"] = {{1, 1}, {"1"}, "Which floor would you like to go to?", "You have arrived on the first floor.", false, {2, 5}},
    ["Celadon Mart 2"] = {{1, 1}, {"2"}, "Which floor would you like to go to?", "You have arrived on the second floor.", false, {2, 5}},
    ["Celadon Mart 3"] = {{1, 1}, {"3"}, "Which floor would you like to go to?", "You have arrived on the third floor.", false, {2, 5}},
    ["Celadon Mart 4"] = {{1, 1}, {"4"}, "Which floor would you like to go to?", "You have arrived on the fourth floor.", false, {2, 5}},
    ["Celadon Mart 5"] = {{1, 1}, {"5"}, "Which floor would you like to go to?", "You have arrived on the fifth floor.", false, {2, 5}}
}
elevatorExceptions["Celadon Office Elevator 1"] = {
    ["Celadon Office 1F"] = {{1, 2}, {"1F"}, "What floor would you like to transport to?", "You have arrived on 1 F", false, {2, 5}},
    ["Celadon Office 2F"] = {{1, 2}, {"2F"}, "What floor would you like to transport to?", "You have arrived on 2 F", false, {2, 5}}, 
    ["Celadon Office 3F"] = {{1, 2}, {"3F"}, "What floor would you like to transport to?", "You have arrived on 3 F", false, {2, 5}}, 
}
elevatorExceptions["Celadon Office Elevator 2"] = {
    ["Celadon Office 2F"] = {{3, 2}, {"2F"}, "What floor would you like to transport to?", "You have arrived on 2 F", false, {3, 5}},
    ["Celadon Office 3F"] = {{3, 2}, {"3F"}, "What floor would you like to transport to?", "You have arrived on 3 F", false, {3, 5}},
    ["Celadon Office Roof Top"] = {{3, 2}, {"Roof Top"}, "What floor would you like to transport to?", "You have arrived on 4 F", false, {3, 5}}
}
elevatorExceptions["Goldenrod Mart Elevator"] = {
    ["Goldenrod Mart B1F"] = {{1,6}, {"B1F"}, "Which floor would you like to go to?", "You have arrived on the Underground.", false, {3,6}},
    ["Goldenrod Mart 1"] = {{1,6}, {" 1F"}, "Which floor would you like to go to?", "You have arrived on the first floor.", false, {3,6}},
    ["Goldenrod Mart 2"] = {{1,6}, {" 2F"}, "Which floor would you like to go to?", "You have arrived on the second floor.", false, {3,6}},
    ["Goldenrod Mart 3"] = {{1,6}, {" 3F"}, "Which floor would you like to go to?", "You have arrived on the third floor.", false, {3,6}},
    ["Goldenrod Mart 4"] = {{1,6}, {" More Options", " 4F"}, "Which floor would you like to go to?", "You have arrived on the fourth floor.", false, {3,6}},
    ["Goldenrod Mart 5"] = {{1,6}, {" More Options", " 5F"}, "Which floor would you like to go to?", "You have arrived on the fifth floor.", false, {3,6}},
    ["Goldenrod Mart 6"] = {{1,6}, {" More Options", " 6F"}, "Which floor would you like to go to?", "You have arrived on the sixth floor.", false, {3,6}},
}
elevatorExceptions["Lilycove Department Store Elevator"] = {
    ["Lilycove Department Store 1F"] = {{1, 1}, {"1F."}, "What floor would you like to shift to today?", "You are now on floor 1!", false, {2, 5}},
    ["Lilycove Department Store 2F"] = {{1, 1}, {"2F."}, "What floor would you like to shift to today?", "You are now on floor 2!", false, {2, 5}},
    ["Lilycove Department Store 3F"] = {{1, 1}, {"3F."}, "What floor would you like to shift to today?", "You are now on floor 3!", false, {2, 5}},
    ["Lilycove Department Store 4F"] = {{1, 1}, {"4F."}, "What floor would you like to shift to today?", "You are now on floor 4!", false, {2, 5}},
    ["Lilycove Department Store 5F"] = {{1, 1}, {"5F."}, "What floor would you like to shift to today?", "You are now on floor 5!", false, {2, 5}}
}
return elevatorExceptions