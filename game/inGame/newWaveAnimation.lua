function newWaveAnimation()
  if inGame then
    love.graphics.setColor(love.math.colorFromBytes(255,255,255))
    if time >= 7 and wave == 0 then
      love.graphics.print("Wave "..wave, 20*((time - waveEnd)^3)+400, 200)
    elseif wave == "Endless" then
    elseif time >= waveEnd - 3 and ((round == 1 and time <= waveEnd + 3) or (round == #waves[wave].rounds and time >= nextRound - 3)) then
      love.graphics.print("Wave "..wave, 20*((time - waveEnd)^3)+400, 200)
      if time >= waveEnd + 3 then
        waveEnd = nextRound
      end
    end
  end
end

return newWaveAnimation