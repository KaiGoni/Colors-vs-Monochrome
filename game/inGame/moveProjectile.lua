function moveProjectile(dt)
  for i,projectile in ipairs(projectiles) do
    projectile.pos = projectile.pos + dt*projectile.speed
    for j,enemy in ipairs(enemies) do
      if projectile.row == enemy.row and projectile.pos > enemy.pos - 10 and projectile.pos < enemy.pos + 10 then
        enemies[j].health = enemies[j].health - projectile.power
        table.remove(projectiles, i)
        if enemies[j].health <= 0 then
          if wave ~= "Endless" then
            enemyCount[enemy.wave] = enemyCount[enemy.wave] - 1
          end
          if enemyCount[enemy.wave] == 0 then -- Defeat wave
            for k, tower in pairs(waves[enemy.wave].reward.towers) do
              game.towerList[k].count = game.towerList[k].count + tower
            end
          end
          table.remove(enemies, j)
        end
      end
    end
    if projectile.pos > 800 then
      table.remove(projectiles, i)
    end
  end
end

return moveProjectile