local project_file = vim.fn.stdpath "data" .. "/snacks-projects.json"

local function normalize(path) return vim.fs.normalize(vim.fn.fnamemodify(path, ":p")) end

local function read_projects()
  if vim.fn.filereadable(project_file) == 0 then return {} end
  return vim.json.decode(table.concat(vim.fn.readfile(project_file), "\n"))
end

local function update_project(path, included)
  path = normalize(path ~= "" and path or vim.fn.getcwd())
  assert(not included or vim.fn.isdirectory(path) == 1, "Project directory does not exist: " .. path)
  local projects = read_projects()
  projects[path] = included
  vim.fn.mkdir(vim.fn.fnamemodify(project_file, ":h"), "p")
  assert(vim.fn.writefile({ vim.json.encode(projects) }, project_file) == 0, "Could not save project list")
end

return {
  "folke/snacks.nvim",
  init = function()
    vim.api.nvim_create_user_command("ProjectAdd", function(args) update_project(args.args, true) end, {
      nargs = "?",
      complete = "dir",
      desc = "Add a directory to the project list",
    })
    vim.api.nvim_create_user_command("ProjectDelete", function(args) update_project(args.args, false) end, {
      nargs = "?",
      complete = "dir",
      desc = "Remove a project record without deleting files",
    })
  end,
  opts = {
    picker = {
      sources = {
        projects = {
          config = function(opts)
            local projects = read_projects()
            opts.projects = opts.projects or {}
            for path, included in pairs(projects) do
              if included and vim.fn.isdirectory(path) == 1 then opts.projects[#opts.projects + 1] = path end
            end
            opts.transform = function(item) return projects[normalize(item.file)] ~= false end
          end,
        },
      },
    },
  },
}
