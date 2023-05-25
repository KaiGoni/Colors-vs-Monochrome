function spawnEnemy(dt)
  enemyAction = require("game/inGame/enemyAction")
  if time >= nextRound then -- Round ends
    round = round + 1
    if wave == 0 then
      wave = 1
      round = 1
    elseif wave <= #waves then
      if round > #waves[wave].rounds then -- New wave
        wave = wave + 1
        round = 1
      end
    end
    
    -- Defines new set of enemies
    if wave <= #waves then
      for i = 1, waves[wave].rounds[round].enemies.slime do
        table.insert(spawnList, {["time"] = math.random() * waves[wave].rounds[round].time + nextRound, ["enemyID"] = 1})
      end
      for i = 1, waves[wave].rounds[round].enemies.clay do
        table.insert(spawnList, {["time"] = math.random() * waves[wave].rounds[round].time + nextRound, ["enemyID"] = 2})
      end
      nextRound = nextRound + waves[wave].rounds[round].time
    end
  end
  if wave <= #waves then
    for i, enemy in ipairs(spawnList) do
      local enemyStat = game.enemies[enemy.enemyID]
      if enemy.time <= time then
        table.insert(enemies, {["id"] = enemyStat.id, ["entryNum"] = enemy.enemyID, ["wave"] = wave, ["sprite"] = enemyStat.sprite, ["health"] = enemyStat.health, ["attackCooldown"] = enemyStat.attackSpeed, ["row"] = math.random(1,5), ["pos"] = 700})
        table.remove(spawnList, i)
      end
    end
  else
    if #spawnList <= 0 and #enemies <= 0 then
      -- Win
      paused = true
      menu = "win"
      
    end
  end
  enemyAction(dt)
end

return spawnEnemy