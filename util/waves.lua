waves = {
  { -- Wave 1
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 2
      }
    },
    ["rounds"] = {
      {
        ["time"] = 30,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 8,
          ["clay"] = 0
        }
      }
    }
  },
  { -- Wave 2
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 2
      }
    },
    ["rounds"] = {
      {
        ["time"] = 20,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 10,
          ["clay"] = 0
        }
      }
    }
  },
  { -- Wave 3
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 1
      }
    },
    ["rounds"] = {
      {
        ["time"] = 10,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 5,
          ["clay"] = 0
        }
      },
      {
        ["time"] = 20,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
          ["clay"] = 3
        }
      }
    }
  }
}

return waves