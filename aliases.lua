-- General System mappings
io.popen "doskey v=nvim $*"
io.popen "doskey ls=dir /B $*"
io.popen "doskey rm=del /q $*"
io.popen "doskey cat=more $*"
io.popen "doskey rmdir=rmdir /q /s $*"
io.popen 'doskey touch=cmd.exe /c "echo. > $*"'
io.popen "doskey clear=cls"
io.popen "doskey reboot=shutdown /r -t 0"

-- Utility
io.popen "doskey sp=spotify_player"
io.popen "doskey aliases=nvim %LOCALAPPDATA%/nvim/lua/custom/aliases.lua"
io.popen 'doskey clinkconfig=cmd /c "cd %LOCALAPPDATA%/clink && v"'
io.popen "doskey inputrc=nvim %USERPROFILE%/.inputrc"
io.popen 'doskey nvconfig=cmd /c "cd %LOCALAPPDATA%/nvim/lua/custom && v"'

-- Project Specific
io.popen 'doskey battery=cmd /c "cd C:/Users/zachs/Projects/battery && v"'
io.popen 'doskey bcalc=cmd /c "cd C:/Users/zachs/Projects/b-calc && v"'
io.popen 'doskey fuzzy=cmd /c "cd C:/Users/zachs/Projects/fuzzy-disco && v"'
io.popen 'doskey tracksy=wsl bash -i -c "cd ~/Tracksy_BE && v"'
io.popen 'doskey toylang=wsl bash -i -c "cd ~/toylang && v"'

-- Git
io.popen "doskey gs=git status"
io.popen "doskey ga=git add ."
io.popen "doskey gc=git commit -m $*"
io.popen "doskey gps=git push"
io.popen "doskey gpl=git pull"
io.popen "doskey gd=git diff $*"
io.popen "doskey gr=git reset"

-- System folders navigation
io.popen "doskey ex-home=start %USERPROFILE%"
io.popen "doskey home=cd %USERPROFILE%"
io.popen "doskey ex-downloads=start %USERPROFILE%/Downloads"
io.popen "doskey downloads=cd %USERPROFILE%/Downloads"
io.popen "doskey ex-documents=start %USERPROFILE%/Documents"
io.popen "doskey documents=cd %USERPROFILE%/Documents"

-- TU Graz
io.popen "doskey tu=wsl -d Ubuntu-20.04"
io.popen "doskey ex-tug=start %USERPROFILE%/Projects/tugraz"
io.popen "doskey tug=cd %USERPROFILE%/Projects/tugraz"
io.popen 'doskey esp-a3=wsl -d Ubuntu-20.04 bash -i -c "cd ~/espws23-a3-711 && nvim"'
io.popen 'doskey oop1-a1=wsl -d Ubuntu-20.04 bash -i -c "cd ~/oop1ss24-a1-530 && nvim"'
io.popen 'doskey oop1-a2=wsl -d Ubuntu-20.04 bash -i -c "cd ~/oop1ss24-a2-042 && nvim"'
