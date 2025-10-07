return {
  "eatgrass/maven.nvim",
  cmd = { "Maven", "MavenExec" },
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require('maven').setup({
      executable="/usr/bin/mvn"
    })
  end
}
