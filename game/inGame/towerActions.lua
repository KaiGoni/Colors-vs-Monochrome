function towerActions(dt)
  for x = 1,9 do
    for y = 1,5 do
      local tower = gameGrid[x][y] -- Switch for towers
      if gameGrid[x][y].towerID == "alchemist" then 
      elseif gameGrid[x][y].towerID == "archer" then
        if findTower(y, y%2 == 0 and x*2*math.sqrt(1200) - 40 or x*2*math.sqrt(1200) - 40 + math.sqrt(1200), "forward") then
          gameGrid[x][y].attackCooldown = tower.attackCooldown - dt
          if tower.attackCooldown <= 0 then
            gameGrid[x][y].attackCooldown = 2
            table.insert(projectiles, {["type"] = "arrow", ["power"] = 20, ["speed"] = 100, ["row"] = y, ["pos"] = y % 2 == 0 and x*2*math.sqrt(1200) - 40 or x*2*math.sqrt(1200) - 40 + math.sqrt(1200)})
          end
        end
      end
    end
  end
end

function findTower(row,pos,dir)
  for i, enemy in ipairs(enemies) do
    if enemy.row == row then
      if dir == "forward" then
        if enemy.pos > pos then
          return true
        end
      end
    end
  end
  return false
end

return towerActions