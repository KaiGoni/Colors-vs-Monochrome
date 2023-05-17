function enemyAction(dt)
  if #enemies ~= 0 then test = findEnemyBlock(enemies[1]) end 
  for i,enemy in ipairs(enemies) do
    local enemyPos = findEnemyBlock(enemy)
    if enemyPos.x >= 1 and enemyPos.x <= 9 then
      if gameGrid[enemyPos.x][enemyPos.y].towerID == nil then -- move enemy
        enemies[i].attackCooldown = game.enemies[enemy.entryNum].attackSpeed
        enemy.pos = enemy.pos - dt*game.enemies[enemy.entryNum].speed
      else -- Tower in the way
        if enemies[i].attackCooldown ~= nil then
          enemies[i].attackCooldown = enemies[i].attackCooldown - dt
        end
        if enemies[i].attackCooldown <= 0 then -- kills tower
          enemies[i].attackCooldown = game.enemies[enemy.entryNum].attackSpeed
          gameGrid[enemyPos.x][enemyPos.y].health = gameGrid[enemyPos.x][enemyPos.y].health - game.enemies[enemy.entryNum].strength
          if gameGrid[enemyPos.x][enemyPos.y].health <= 0 then
            gameGrid[enemyPos.x][enemyPos.y].towerID = nil
            gameGrid[enemyPos.x][enemyPos.y].sprite = nil
          end
        end
      end
    elseif enemyPos.x > 9 then
      enemy.attackCooldown = game.enemies[enemy.entryNum].attackSpeed
      enemy.pos = enemy.pos - dt*game.enemies[enemy.entryNum].speed
    elseif enemyPos.x < 1 then -- Lose(temperary deletes enemy)
      table.remove(enemies, i)
    end
  end
end

function findEnemyBlock(enemy)
  if enemy.row % 2 == 0 then
    return {["x"] = math.floor((enemy.pos - 10) / (2*math.sqrt(1200)))+1, ["y"] = enemy.row}
  else
    return {["x"] = math.floor((enemy.pos - 10 - math.sqrt(1200)) / (2*math.sqrt(1200)))+1, ["y"] = enemy.row}
  end
end

return enemyAction