botPos = "left" -- set left or right. this is where the bot starts from

plantid1 = 5667
plantid2 = 1

delay = 360

function autosplice()
  if botPos == "left" then
    place(plantid1,0,0)
    sleep(delay)
    place(plantid2,0,0)
    move(1,0)
    sleep(delay)
  elseif botPos == "right" then
    place(plantid1,0,0)
    sleep(delay)
    place(plantid2,0,0)
    move(-1,0)
    sleep(delay)
  end

  if (getposx()/32) >= 97.4 then
    place(plantid1,0,0)
    sleep(delay)
    place(plantid2,0,0)
    sleep(delay)
    move(0,-2)
    sleep(delay)
    botPos = "right"
  elseif (getposx()/32) < 2 then
    place(plantid1,0,0)
    sleep(delay)
    place(plantid2,0,0)
    sleep(delay)
    move(0,-2)
    sleep(delay)
    botPos = "left"
  end
end

while true do
  autosplice()
end
