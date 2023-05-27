function spawnEnemy(dt)
  enemyAction = require("game/inGame/enemyAction")
  if wave ~= "Endless" then
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
        for enemyID, enemyCount in pairs(waves[wave].rounds[round].enemies) do
          for i = 1, #game.enemies do
            if game.enemies[i].id == enemyID then
              enemyNum = i
            end
          end
          for i = 1, enemyCount do
            table.insert(spawnList, {["time"] = math.random() * waves[wave].rounds[round].time + nextRound, ["enemyID"] = enemyNum})
          end
        end
        nextRound = round == #waves[wave].rounds and nextRound + waves[wave].rounds[round].time + waves[wave].rounds[round].delay + waveDelay or nextRound + waves[wave].rounds[round].time + waves[wave].rounds[round].delay
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
  else -- Endless Mode
    timeTillNextEnemy = timeTillNextEnemy - dt
    if timeTillNextEnemy <= 0 then
      if math.random() < slimeChance then
        table.insert(enemies, {["id"] = "slime", ["entryNum"] = 1, ["wave"] = wave, ["sprite"] = game.enemies[1].sprite, ["health"] = 100, ["attackCooldown"] = 1, ["row"] = math.random(1,5), ["pos"] = 700})
      else
        table.insert(enemies, {["id"] = "clay", ["entryNum"] = 2, ["wave"] = wave, ["sprite"] = game.enemies[2].sprite, ["health"] = 200, ["attackCooldown"] = 2, ["row"] = math.random(1,5), ["pos"] = 700})
      end
      deltaSummonTime = deltaSummonTime * (.9 + math.random()*.1)
      timeTillNextEnemy = deltaSummonTime
      slimeChance = slimeChance * (math.random()*.1+.92)
      clayChance = 1 - slimeChance
    end
    -- function test() {
    --   var i = 10,
    --   t = 0
    --   do {
    --       i = i - math.random()/10
    --       t = t + i
    --       console.log(t)
    --   } while (i > .1)
    -- }
  end
  enemyAction(dt)
end

return spawnEnemy