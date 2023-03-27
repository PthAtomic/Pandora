platId = 102        -- min plat at bp 52
delay = 150         -- break delay
posId = 880         -- tile dirt drop id

-- ================================================================================== --

for i, tile in ipairs(getTiles()) do
    if tile.fg == posId then
        dropPosX = tile.x
        dropPosY = tile.y
    end
end

function replaceLava(x,y)
    while getTile(x,y).fg == 4 do
        punch(0,1)
        sleep(delay)
    end
    place(2,0,1)
    sleep(delay)
end

function clearSide()
    for i=24,53 do  
        if getTile(1,i).bg == 14 then
            while getTile(1,i).bg == 14 do
                findPath(1,i-1)
                punch(0,1)
                sleep(delay)
            end
            while getTile(0,i).bg == 14 do
                findPath(1,i-1)
                punch(-1,1)
                sleep(delay)
            end
        end
    end
    for i=24,53 do
        if getTile(98,i).bg == 14 then
            while getTile(98,i).bg == 14 do
                findPath(98,i-1)
                punch(0,1)
                sleep(delay)
            end
            while getTile(99,i).bg == 14 do
                findPath(98,i-1)
                punch(1,1)
                sleep(delay)
            end
        end
    end
end

function platform()
    if findItem(platId) > 0 then
        if getTile(1,4).fg ~= platId then
            for i=52,2,-1 do
                if i % 2 == 0 then
                    findPath(1,i+1)
                    sleep(100)
                    place(platId,0,-1)
                    sleep(delay)
                end
            end
        end
        if getTile(98,4).fg ~= platId then
            for i=52,2,-1 do
                if i % 2 == 0 then
                    findPath(98,i+1)
                    sleep(100)
                    place(platId,0,-1)
                    sleep(delay)
                end
            end
        end
    end
end

function clearDirt()
    for i=23,51 do
        if i % 2 == 1 then
            for j=2,98 do
                if getTile(j,i+2).bg == 0 and getTile(j,i+2).fg == 0 then
                    sleep(1)
                else
                    findPath(j,i)
                    replaceLava(j,i + 1)
                    while getTile(j,i+2).bg == 14 or getTile(j,i+2).bg ~= 0 do
                        sleep(delay)
                        punch(0,2)
                    end
                end
            end
        end
    end
end

function getDirt()
    findPath(dropPosX,dropPosY)
    sleep(200)
    collectSet(true,2)
    while findItem(2) == 0 do
        sleep(200)
    end
    collectSet(false,2)
end


function placeDirt()
    for i=22,2,-1 do
        if i % 2 == 0 then
            for j=2,97 do
                if getTile(j,i).fg == 0 then
                    if findItem(2) == 0 then
                        getDirt()
                    end
                    findPath(j,i+1)
                    sleep(500)
                    place(2,0,-1)
                    sleep(500)
                end
            end
        end
    end
end

function main()
    move(2,0)
    collectSet(true,2)
    clearSide()
    platform()
    clearDirt()
    collectSet(false,2)
    placeDirt()
end

main()
