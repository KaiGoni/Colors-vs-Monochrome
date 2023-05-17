function drawProjectile()
  for i=1,#projectiles do
    if projectiles[i].type == "arrow" then
      love.graphics.setColor(love.math.colorFromBytes(255,0,0))
      love.graphics.circle("fill", projectiles[i].pos, 80+60*projectiles[i].row, 5)
    end
  end
end

return drawProjectile