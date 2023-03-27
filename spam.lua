local payy =  {}

function main()
    payy.autoSpam{
        text_1 = "`2Donate some wl at payyAsakin",      --> type(string)
        text_2 = "`2Donate some wl at payyAsakin",      --> type(string)
        text_3 = "/love",                               --> type(string)
        text_4 = "/love",                               --> type(string)
        delay = 4000                                    --> type(number)
    }
end

-- #auto-spam
function payy.autoSpam(args)
    if type(args.text_1) ~= "string" or type(args.text_2) ~= "string" or type(args.text_3) ~= "string"
            or type(args.text_4) ~= "string" or type(args.delay) ~= "number" then
        return
    end
    local currentWorld = string.upper(getworld())
    local currentPositionX = math.floor(getposx()/32+1)
    local currentPositionY = math.floor(getposy()/32+1)
    local x = 1
    local arrayText = {args.text_1,args.text_2,args.text_3,args.text_4}
    while true do
        if string.find(currentWorld,string.upper(getworld())) == nil then
            sendPacket(3,"action|join_request\nname|"..currentWorld)
            sleep(5000)
        elseif math.floor(getposx()/32+1) ~= currentPositionX or math.floor(getposy()/32+1) ~= currentPositionY then
            while true do
                local valueGetPosX = math.floor(getposx()/32)
                local valueGetPosY = math.floor(getposy()/32)
                if currentPositionX-1 > valueGetPosX then
                   move(1,0)
                   sleep(50)
                elseif currentPositionX-1 < valueGetPosX then
                    move(-1,0)
                    sleep(50)
                elseif currentPositionY-1 > valueGetPosY then
                    move(0,1)
                    sleep(50)
                elseif currentPositionY-1 < valueGetPosY then 
                    move(0,-1)
                    sleep(50)
                elseif currentPositionX-1 == valueGetPosX and currentPositionY-1 == valueGetPosY then 
                    break
                end
            end
        else
            say(arrayText[x])
            sleep(args.delay)
            x=x+1
            if x == 5 then
                x = 1
            end
        end
        sleep(10)
    end
end

main()
