function startGame()
  inGame = true
  menu = "game"
  paused = false
  time = 0
  wave = 0
  round = 1
  nextRound = 3
  selectedTower = {["name"] = "", ["id"] = "", ["pos"] = nil, ["sprite"] = ""}
  towers = {}
  projectiles = {} --type, row, pos, power, speed
  game.towerList.archer.count = 5
  towerSelection = "Main"
  spawnList = {} -- time, enemyID
  enemies = {} -- id, entryNum, wave, sprite, health, attackCooldown, row, pos
  gameGrid = {} --towerId, sprite, health, attackCooldown
  for x=1,9 do
    gameGrid[x] = {}
    for y=1,5 do
      gameGrid[x][y] = {["towerID"] = nil,["sprite"] = nil,["health"] = 0}
    end
  end
  enemyCount = {}
  for i, wave in ipairs(waves) do
    local totalEnemies = 0
    for j, round in ipairs(wave.rounds) do
      for k, enemy in pairs(round.enemies) do
        totalEnemies = totalEnemies + enemy
      end
    end
    table.insert(enemyCount, totalEnemies)
  end
end

return startGame