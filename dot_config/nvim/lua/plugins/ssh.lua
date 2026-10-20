return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*", -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim", -- For standard functions
      "MunifTanjim/nui.nvim", -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    opts = {
      client_callback = function(port, _)
        vim.fn.jobstart({
          "kitty",
          "nvim",
          "--server",
          ("localhost:%s"):format(port),
          "--remote-ui",
        }, { detach = true })
      end,

      ssh_config = {
        ssh_prompts = {
          -- Default prompts
          { match = "password:", type = "secret", value_type = "static", value = "" },
          { match = "Password:", type = "secret", value_type = "static", value = "" },
          { match = "Password for", type = "secret", value_type = "static", value = "" },
          { match = "Enter passphrase", type = "secret", value_type = "static", value = "" },
          {
            match = "continue connecting (yes/no/[fingerprint])?",
            type = "plain",
            value_type = "static",
            value = "",
          },

          -- Okta
          {
            match = "Okta passcode (leave blank to initiate a push):",
            type = "secret",
            value_type = "dynamic",
            value = "",
          },

          -- Continue
          {
            match = "Press enter to continue:",
            type = "plain",
            value_type = "dynamic",
            value = "",
          },
        },
      },
    },
    config = true,
  },
}
