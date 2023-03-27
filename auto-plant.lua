-- autoplant made by rayniel based on HamdhaniSaKa's autoharvest script, iknow its easy but noone made it yet lol
botPos = "left" -- set left or right. this is where the bot starts from
plantid = 5667
-- ALWAYS start from bottom.. if you want to start from the top then change move(0,-2) to move(0,2).
delay = 200

function autoplant()
  if botPos == "left" then
    place(plantid,0,0)
    sleep(delay)
    move(1,0)
    sleep(delay)
  elseif botPos == "right" then
    place(plantid,0,0)
    sleep(delay)
    move(-1,0)
    sleep(delay)
  end

  if (getposx()/32) >= 97.4 then
    place(plantid,0,0)
    sleep(delay)
    move(0,-2)
    sleep(delay)
    botPos = "right"
  elseif (getposx()/32) < 2 then
    place(plantid,0,0)
    sleep(delay)
    move(0,-2)
    sleep(delay)
    botPos = "left"
  end
end

while true do
  autoplant()
end
