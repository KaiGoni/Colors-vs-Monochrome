function moveProjectile(dt)
  for i = #projectiles, 1, -1 do
    projectiles[i].pos = projectiles[i].pos + dt*projectiles[i].speed
    for j,enemy in ipairs(enemies) do
      if projectiles[i].row == enemy.row and projectiles[i].pos > enemy.pos - 10 and projectiles[i].pos < enemy.pos + 10 then
        enemies[j].health = enemies[j].health - projectiles[i].power
        table.remove(projectiles, i)
        if enemies[j].health <= 0 then
          enemyCount[enemy.wave] = enemyCount[enemy.wave] - 1
          if enemyCount[enemy.wave] == 0 then -- Defeat wave
            for k, tower in pairs(waves[enemy.wave].reward.towers) do
              game.towerList[k].count = game.towerList[k].count + tower
            end
          end
          table.remove(enemies, j)
        end
      end
    end
    if projectiles[i].pos > 800 then
      table.remove(projectiles, i)
    end
  end
end

return moveProjectile