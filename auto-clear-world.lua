trashList = {2,3,4,5,10,11,14,15,5028}

function trash()
    for i, trash in ipairs(trashList) do
        if findItem(trash) > 190 then
            sendPacket(2, "action|trash\n|itemID|"..trash)
            sleep(1000)
            sendPacket(2, "action|dialog_return\ndialog_name|trash_item\nitemID|"..trash.."|\ncount|"..findItem(trash))
            sleep(1000)
        end
    end
end

function clear()
    trash()
    for _, tile in pairs(getTiles()) do
        if tile.fg == 2 or tile.bg == 14 or tile.fg == 10 or tile.fg == 4 then
            if tile.fg ~= 8 then
            if getTile(tile.x, tile.y - 1).fg == 0 then
            findPath(tile.x, tile.y - 1)
            sleep(90)
            while getTile(tile.x, tile.y).fg ~= 0 or getTile(tile.x, tile.y).bg ~= 0 do
            punch(0,1)
            sleep(150)
            end
            return true
            elseif getTile(tile.x - 1, tile.y).fg == 0 and tile.x-1 >= 0 then
            findPath(tile.x - 1, tile.y)
            sleep(90)
            while getTile(tile.x, tile.y).fg ~= 0 or getTile(tile.x, tile.y).bg ~= 0 do
            punch(1,0)
            sleep(150)
            end
            return true
            elseif getTile(tile.x + 1, tile.y).fg == 0 then
            findPath(tile.x + 1, tile.y)
            sleep(90)
            while getTile(tile.x, tile.y).fg ~= 0 or getTile(tile.x, tile.y).bg ~= 0 do
            punch(-1,0)
            sleep(150)
            end
            return true
            end
            end
        end
    end
    return false
end

collectSet(true,3)
while clear() do 
clear()
end
