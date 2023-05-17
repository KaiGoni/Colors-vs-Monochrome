function moveProjectile(dt)
  for i = #projectiles, 1, -1 do
    projectiles[i].pos = projectiles[i].pos + dt*projectiles[i].speed
    for j,enemy in ipairs(enemies) do
      if projectiles[i].row == enemy.row and projectiles[i].pos > enemy.pos - 10 and projectiles[i].pos < enemy.pos + 10 then
        table.remove(projectiles, i)
        enemies[j].health = enemies[j].health - projectiles[i].power
        if enemies[j].health <= 0 then
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