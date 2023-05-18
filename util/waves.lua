waves = {
  { -- Wave 1
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 2
      }
    },
    ["rounds"] = {
      { -- Round 1
        ["time"] = 30,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 8,
          ["clay"] = 0
        }
      },
      { -- Round 2
        ["time"] = 10,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
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
      { -- Round 1
        ["time"] = 20,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 10,
          ["clay"] = 0
        }
      },
      { -- Round 2
        ["time"] = 10,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
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
      { -- Round 1
        ["time"] = 10,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 5,
          ["clay"] = 0
        }
      },
      { -- Round 2
        ["time"] = 20,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
          ["clay"] = 3
        }
      },
      { -- Round 3
        ["time"] = 10,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
          ["clay"] = 0
        }
      }
    }
  },
  { -- Wave 4
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 0
      }
    },
    ["rounds"] = {
      { -- Round 1
        ["time"] = 10,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 10,
          ["clay"] = 0
        }
      },
      { -- Round 2
        ["time"] = 20,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
          ["clay"] = 8
        }
      }
    }
  },
}

return waves