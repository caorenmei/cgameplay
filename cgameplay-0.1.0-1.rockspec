package = "cgameplay"
version = "0.1.0-1"
source = {
   url = "git+https://github.com/caorenmei/cgameplay.git"
}
description = {
   summary = "A Lua-based text game project.",
   detailed = [[cgameplay is a text game project built with Lua 5.4.]],
   homepage = "https://github.com/caorenmei/cgameplay",
   license = "MIT"
}
dependencies = {
   "lua ~> 5.4"
}
build = {
   type = "builtin",
   modules = {},
   copy_directories = {
      "docs"
   }
}
test_dependencies = {
   "busted"
}
