dofile(os.getenv("LOCALAPPDATA") .. "/nvim/lua/custom/aliases.lua")

load(io.popen('starship init cmd'):read("*a"))()
os.execute('cls')
