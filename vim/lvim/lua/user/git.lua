-- Calls the git-open command to get the URL for a specific file/line
-- in the github or gitlab remote repo.
function GitUrl(line1, line2)
  local lines = ""

  -- Check if multiple lines are selected
  if line1 ~= line2 then
    lines = line1 .. "-" .. line2
  else
    lines = line1
  end

  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  local full_path = vim.fn.expand("%:p")
  local filename = string.sub(full_path, string.len(git_root) + 2)

  -- Create the shell command
  return string.format("git-open '%s' %s", filename, lines)
end

function GitOpen(line1, line2)
  local git_open_cmd = GitUrl(line1, line2)
  vim.cmd(string.format("!%s | xargs open", git_open_cmd))
end

function GitCopy(line1, line2)
  local git_open_cmd = GitUrl(line1, line2)
  vim.cmd(string.format("!%s | pbcopy", git_open_cmd))
end

function GitDiff()
  local target = vim.fn.input("Diff target: ")
  require('gitsigns').diffthis(target)
end

vim.cmd [[command! -range GitOpen :lua GitOpen(<line1>, <line2>)]]
vim.cmd [[command! -range GitCopy :lua GitCopy(<line1>, <line2>)]]
