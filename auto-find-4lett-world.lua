function main()
::baslangic::
    local world = ""
    for i = 1,4 do
        world = world..string.char(math.random(97,122))
    end
    sleep(750)
    sendPacket(3, "action|join_request\nname|"..world)
    while getworld():lower() ~= world:lower() do
        sleep(250)
    end
    if getworld():lower() == world then
        sleep(2000)
        for _, tile in pairs(getTiles()) do
            if tile.fg == 202 or tile.fg == 204 or tile.fg == 206 or tile.fg == 4994 or tile.fg == 242 or tile.fg == 9640 or tile.fg == 1796 or tile.fg == 2408 or tile.fg == 2950 or tile.fg == 4428 or tile.fg == 5814 or tile.fg == 5260 or tile.fg == 5980 or tile.fg == 8470 or tile.fg == 10410 or tile.fg == 11550 or tile.fg or tile.fg == 11586 then
                goto baslangic
            else
                local file = io.open( "4letter.txt", "a")
                file:write("World named:" ..world.. " is not locked.", "\n")
                file:close()
                goto baslangic
            end
        end
    end
end
main()
