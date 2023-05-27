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
        ["delay"] = 0,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 8,
          ["clay"] = 0,
          ["sand"] = 0
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
        ["delay"] = 0,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 10,
          ["clay"] = 0,
          ["sand"] = 0
        }
      }
    }
  },
  { -- Wave 3
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 2
      }
    },
    ["rounds"] = {
      { -- Round 1
        ["time"] = 10,
        ["delay"] = 0,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 5,
          ["clay"] = 0,
          ["sand"] = 0
        }
      },
      { -- Round 2
        ["time"] = 20,
        ["delay"] = 0,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
          ["clay"] = 3,
          ["sand"] = 0
        }
      }
    }
  },
  { -- Wave 4
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 2
      }
    },
    ["rounds"] = {
      { -- Round 1
        ["time"] = 10,
        ["delay"] = 5,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 10,
          ["clay"] = 0,
          ["sand"] = 0
        }
      },
      { -- Round 2
        ["time"] = 20,
        ["delay"] = 0,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
          ["clay"] = 8,
          ["sand"] = 0
        }
      }
    }
  },
  { -- Wave 5
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 2
      }
    },
    ["rounds"] = {
      { -- Round 1
        ["time"] = 20,
        ["delay"] = 0,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 20,
          ["clay"] = 10,
          ["sand"] = 0
        }
      }
    }
  },
  { -- Wave 6
    ["reward"] = {
      ["towers"] = {
        ["archer"] = 0
      }
    },
    ["rounds"] = {
      { -- Round 1
        ["time"] = 20,
        ["delay"] = 0,
        ["spread"] = "random",
        ["enemies"] = {
          ["slime"] = 0,
          ["clay"] = 0,
          ["sand"] = 10
        }
      }
    }
  }
}

return waves