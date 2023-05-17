game = {
  ["towerList"] = {
    ["alchemist"] = {
      ["name"] = "Alchemist",
      ["health"] = 100,
      ["attackSpeed"] = nil,
      ["description"] = "The Alchemist is a tower that can be used to create mana from other resources. It can also be used to create other resources from mana.",
      ["count"] = 0,
      ["icon"] = love.graphics.newImage("assets/textures/gui/alchemist.png"),
      ["sprite"] = love.graphics.newImage("assets/textures/colors/alchemist.png")
    },
    ["archer"] = {
      ["name"] = "Archer",
      ["health"] = 100,
      ["attackSpeed"] = 2,
      ["description"] = "The Archer is a tower that can be used to shoot arrows at enemies.",
      ["count"] = 0,
      ["icon"] = love.graphics.newImage("assets/textures/gui/archer.png"),
      ["sprite"] = love.graphics.newImage("assets/textures/colors/archer.png")
    }
  },
  ["towers"] = {{
    ["name"] = "Mana",
    ["id"] = "mana",
    ["color"] = {0, 0, 128},
    ["guiHitbox"] = {10, 160},
    ["icon"] = love.graphics.newImage("assets/textures/gui/mana.png"),
    ["towers"] = {{
      ["name"] = "Alchemist",
      ["id"] = "alchemist",
      ["health"] = 100,
      ["attackSpeed"] = nil,
      ["description"] = "The Alchemist is a tower that can be used to create mana from other resources. It can also be used to create other resources from mana.",
      ["icon"] = love.graphics.newImage("assets/textures/gui/alchemist.png"),
      ["sprite"] = love.graphics.newImage("assets/textures/colors/alchemist.png")
    }}
  }, {
    ["name"] = "Shooter",
    ["id"] = "shooter",
    ["color"] = {150, 0, 0},
    ["guiHitbox"] = {170, 320},
    ["icon"] = love.graphics.newImage("assets/textures/gui/shooter.png"),
    ["towers"] = {{
      ["name"] = "Archer",
      ["id"] = "archer",
      ["health"] = 100,
      ["attackSpeed"] = 2,
      ["description"] = "The Archer is a tower that can be used to shoot arrows at enemies.",
      ["icon"] = love.graphics.newImage("assets/textures/gui/archer.png"),
      ["sprite"] = love.graphics.newImage("assets/textures/colors/archer.png")
    }}
  }},
  ["enemies"] = {
    {
      ["name"] = "Slime",
      ["id"] = "slime",
      ["entryNum"] = 1,
      ["health"] = 100,
      ["speed"] = 20,
      ["strength"] = 20,
      ["attackSpeed"] = 1,
      ["icon"] = nil,
      ["sprite"] = love.graphics.newImage("assets/textures/monochromes/slime.png")
    },
    {
      ["name"] = "Clay",
      ["id"] = "clay",
      ["entryNum"] = 2,
      ["health"] = 200,
      ["speed"] = 15,
      ["strength"] = 15,
      ["attackSpeed"] = 2,
      ["icon"] = nil,
      ["sprite"] = nil
    }
  }
}

return game