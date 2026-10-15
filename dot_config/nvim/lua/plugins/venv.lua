return {
  "linux-cultist/venv-selector.nvim",
  opts = {
    search = {
      micromamba = {
        command = "$FD '/bin/python$' ~/micromamba/envs --full-path --color never -HI -a -L",
        type = "anaconda",
      },
    },
  },
}
