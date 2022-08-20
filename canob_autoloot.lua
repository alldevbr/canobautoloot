dofile("canob_monsters_loot.lua")
storage.autoLoot = {lastMonster="", lastmonsterloot={}}

defaultItems = {
    "celestial key",
    "mana scroll",
    "celestial key fragment",
    "dodge skill book",
    "hourglass of experience"
} 

UI.Separator()
UI.Label("AutoLoot Canob (by Albert)")
UI.Button("Loot Raids", function()
    doIt("Raid Monsters")
end)
UI.Separator()
monsterLabel = UI.Label("Waiting monster... ")
monsterLabel:setColor("red")
UI.Separator()
UI.Label("Loot:")
itensLabel = UI.Label("Empty")
itensLabel:setColor("red")

function autoLootCommand(mobName)
    local itensString = ""
    local items = getMonsterItems(mobName)
    
    if items == nil then 
        itensString = "~ DEFAULT ITEMS ~\n"
        items = defaultItems 
    end
    
    say("!autoloot clear")
    for _, item in pairs(items) do
        itensString = itensString.. _ .." - "..  item.. "\n"
        say("!autoloot " .. item)
        delay(200)
    end
    itensLabel:setText(itensString)
    itensLabel:setColor("green")
    storage.autoLoot.lastmonsterloot = items
end

function getMonsterItems(mobName)
    for _, monster in pairs(list) do
        if monster.monster_name == mobName then
            return monster.items
        end
    end
end

function saySomething(mode, text)
    local mobName = nil
    local reg = { "Loot of a (.*):", "Loot of an (.*):", "Loot of the (.*):"}
    for x = 1, #reg do
        _, _, mobName = string.find(text, reg[x])
        if mobName and mobName ~= storage.autoLoot.lastmonster then
            doIt(mobName)
            break
        end
    end
end

function doIt(mobName)
    updateActualMonster(mobName)
    autoLootCommand(mobName)
end

function updateActualMonster(mobName)
    monsterLabel:setText("Monster: " .. mobName)
    monsterLabel:setColor("green")
    storage.autoLoot.lastmonster = mobName
end

onTalk(function(name, level, mode, text, channelId, pos)
    if channelId == 12 then 
        saySomething(mode, text)
    end
end)