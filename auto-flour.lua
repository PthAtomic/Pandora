local payy={}

function main()
    payy.fullAutoFarmFlour()
end

--#auto-farm-flour
function payy.fullAutoFarmFlour()
    local CheckDisplayBox = nil
    local DisplayBox = {}
    local CounterDropFlour = 1
    local GrinderX, GrinderY
    local indexDBox = 1
    for _, tile in pairs(getTiles()) do
        if tile.fg == 4582 then
            GrinderX = math.floor(tile.x) + 1
            GrinderY = math.floor(tile.y) + 1
            say("`6Found food grinder at X:"..tostring(GrinderX).." Y:"..tostring(GrinderY))
            sleep(5000)
        elseif tile.fg == 1422 then
            DisplayBox[indexDBox] = math.floor(tile.x)
            DisplayBox[indexDBox+1] = math.floor(tile.y)
            CheckDisplayBox = true
            indexDBox = indexDBox+2
        end
    end
    if CheckDisplayBox ~= nil then
        if #DisplayBox == 2 then
            say("`6Found 1 Display box")
            sleep(3700)
        elseif #DisplayBox == 4 then
            say("`6Found 2 Display box")
            sleep(3700)
        elseif #DisplayBox == 6 then
            say("`6Found 3 Display box")
            sleep(3700)
        elseif #DisplayBox == 8 then
            say("`6Found 4 Display box")
            sleep(3700)
        elseif #DisplayBox == 10 then
            say("`6Found 5 Display box")
            sleep(3700)
        elseif #DisplayBox == 12 then
            say("`6Found 6 Display box")
            sleep(3700)
        end
    end
    if GrinderX ~= nil and GrinderY ~= nil and CheckDisplayBox ~= nil then
        say("`2START")
        while true do
            local stockWheatBlock = math.floor(findItem(880))
            local stockWheatSeed = math.floor(findItem(881))
            if stockWheatSeed >= 40 and stockWheatBlock >= 50 then
                collectSet(false,3)
                local valueToGrind
                local firstPosX = math.floor(getposx()/32+1)
                local firstPosY = math.floor(getposy()/32+1)
                if stockWheatBlock >= 150 then
                    valueToGrind = 3
                elseif stockWheatBlock >= 100 then
                    valueToGrind = 2
                elseif stockWheatBlock >= 50 then
                    valueToGrind = 1
                end
                payy.goToTile{
                    x = GrinderX,
                    y = GrinderY+1
                }
                sleep(400)
                place(880,0,-1)
                sleep(1000)
                sendPacket(2,"action|dialog_return\ndialog_name|grinder\ntilex|"..tostring(math.floor(getposx()/32))..
                "|\ntiley|"..tostring(math.floor(getposy()/32-1)).."|\nitemID|880|\ncount|"..tostring(valueToGrind))
                sleep(1000)
                -- droping flour
                local totalDisplayBox = #DisplayBox/2
                local dropTileX,dropTileY
                if totalDisplayBox == 1 then
                    dropTileX = DisplayBox[1]
                    dropTileY = DisplayBox[2]
                elseif totalDisplayBox == 2 then
                    if CounterDropFlour == 1 then
                        dropTileX = DisplayBox[1]
                        dropTileY = DisplayBox[2]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 2 then
                        dropTileX = DisplayBox[3]
                        dropTileY = DisplayBox[4]
                        CounterDropFlour = 1
                    end
                elseif totalDisplayBox == 3 then
                    if CounterDropFlour == 1 then
                        dropTileX = DisplayBox[1]
                        dropTileY = DisplayBox[2]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 2 then
                        dropTileX = DisplayBox[3]
                        dropTileY = DisplayBox[4]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 3 then
                        dropTileX = DisplayBox[5]
                        dropTileY = DisplayBox[6]
                        CounterDropFlour = 1
                    end
                elseif totalDisplayBox == 4 then
                    if CounterDropFlour == 1 then
                        dropTileX = DisplayBox[1]
                        dropTileY = DisplayBox[2]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 2 then
                        dropTileX = DisplayBox[3]
                        dropTileY = DisplayBox[4]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 3 then
                        dropTileX = DisplayBox[5]
                        dropTileY = DisplayBox[6]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 4 then
                        dropTileX = DisplayBox[7]
                        dropTileY = DisplayBox[8]
                        CounterDropFlour = 1
                    end
                elseif totalDisplayBox == 5 then
                    if CounterDropFlour == 1 then
                        dropTileX = DisplayBox[1]
                        dropTileY = DisplayBox[2]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 2 then
                        dropTileX = DisplayBox[3]
                        dropTileY = DisplayBox[4]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 3 then
                        dropTileX = DisplayBox[5]
                        dropTileY = DisplayBox[6]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 4 then
                        dropTileX = DisplayBox[7]
                        dropTileY = DisplayBox[8]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 5 then
                        dropTileX = DisplayBox[9]
                        dropTileY = DisplayBox[10]
                        CounterDropFlour = 1
                    end
                elseif totalDisplayBox == 6 then
                    if CounterDropFlour == 1 then
                        dropTileX = DisplayBox[1]
                        dropTileY = DisplayBox[2]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 2 then
                        dropTileX = DisplayBox[3]
                        dropTileY = DisplayBox[4]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 3 then
                        dropTileX = DisplayBox[5]
                        dropTileY = DisplayBox[6]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 4 then
                        dropTileX = DisplayBox[7]
                        dropTileY = DisplayBox[8]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 5 then
                        dropTileX = DisplayBox[9]
                        dropTileY = DisplayBox[10]
                        CounterDropFlour = CounterDropFlour+1
                    elseif CounterDropFlour == 6 then
                        dropTileX = DisplayBox[11]
                        dropTileY = DisplayBox[12]
                        CounterDropFlour = 1
                    end
                end
                payy.goToTile{
                    x = dropTileX,
                    y = dropTileY+1
                }
                sleep(1000)
                if math.floor(findItem(4562)) > 0 then
                    local count = math.floor(findItem(4562))
                    sendPacket(2,"action|drop\n|itemID|4562")
                    sleep(1500)
                    sendPacket(2,"action|dialog_return\ndialog_name|drop_item\nitemID|4562|\ncount|"..tostring(count))
                    sleep(2000)
                end
                --# drop end-flour
                payy.goToTile{
                    x = firstPosX,
                    y = firstPosY
                }
                sleep(500)
                collectSet(true,3)
            elseif stockWheatSeed >=30 and stockWheatBlock <= 5 then
                for i=1,8 do
                    move(-5,0)
                    sleep(200)
                end 
                for i=1,40 do
                    place(881,0,0)
                    sleep(200)
                    move(1,0)
                    sleep(200)
                end
                for i=1,8 do
                    move(-5,0)
                    sleep(200)
                end
                payy.wait(107)
                collectSet(true,3)
                sleep(2000)
                for i=1,40 do
                    place(18,0,0)
                    sleep(200)
                    move(1,0)
                    sleep(200)
                end
                if math.floor(findItem(881)) < 40 then
                    payy.placeBreakItem{
                        itemID = 880,
                        hit = 3,
                        x = -2,
                        y = -1,
                        bool_fullautofarm = true
                    }
                end
            elseif stockWheatBlock > 5 then
                payy.placeBreakItem{
                    itemID = 880,
                    hit = 3,
                    x = -2,
                    y = -1,
                    bool_fullautofarm = true
                }
            elseif stockWheatSeed < 30 and stockWheatBlock < 5 then
                say("You must have wheat seed atleast 30 seed")
                break
            end
            sleep(100)
        end
    elseif GrinderX == nil and GrinderY == nil then
        say("`4Didn't find food grinder , maybe you place it too far")
        sleep(5000)
    elseif CheckDisplayBox == nil then
        say("`4Didn't find display box, maybe you place it too far")
        sleep(5000)
    end
    if GrinderX == nil or GrinderY == nil then
        return
    end
end

function payy.wait(second)
    local duration = os.time() + second
    while os.time() < duration do 
        sleep(1)
    end
end

function payy.goToTile(args)
    if type(args.x) ~= "number" or type(args.y) ~= "number" then
        return
    end
    while true do
        local valueGetPosX = math.floor(getposx()/32)
        local valueGetPosY = math.floor(getposy()/32)
        if args.x-1 > valueGetPosX then
           move(1,0)
           sleep(50)
        elseif args.x-1 < valueGetPosX then
            move(-1,0)
            sleep(50)
        elseif args.y-1 > valueGetPosY then
            move(0,1)
            sleep(50)
        elseif args.y-1 < valueGetPosY then 
            move(0,-1)
            sleep(50)
        elseif args.x-1 == valueGetPosX and args.y-1 == valueGetPosY then 
            break 
        end
    end
end

-- #place-break-item
function payy.placeBreakItem(args)
    if type(args.itemID) ~= "number" or type(args.hit) ~= "number" or type(args.x) ~= "number" 
            or type(args.y) ~= "number" or type(args.bool_fullautofarm) ~= "boolean" then
        return
    end
    while true do
    	local stockItem = math.floor(findItem(args.itemID))
    	if stockItem > 5 then
    	    for i=1,5 do
    		    place(args.itemID,args.x,args.y)
    		    args.x = args.x + 1
    		    if args.x == 3 then
    		        args.x = -2
    		    end
    		    sleep(200)
    	    end
    	    for i=1,5 do
    		    for x=1,args.hit do
    		        place(18,args.x,args.y)
    		        sleep(200)
    		    end
    		    args.x = args.x + 1
    		    if args.x == 3 then
    		        args.x = -2
    		    end
    	    end
        elseif stockItem <= 5 and args.bool_fullautofarm == false then
            collect(3)
            sleep(100)
        elseif stockItem <= 5 and args.bool_fullautofarm then
            break
        end
    end
end

main()
