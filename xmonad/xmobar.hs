-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

Config {
    font = "xft:Monospace-11,rgba=rgb,style=regular,hinting=true,antialias=true,hintstyle=hintfull"
    --font = "xft:Ubuntu Mono:-Pixelsize=18,dpi=96,rgba=rgb,style=regular,hinting=true,antialias=true,hintstyle=hintfull"
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = TopW L 83,
    lowerOnStart = True,
    commands = [
--        Run Weather "KATL" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","C:<total0>,<total1>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","M:<usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Date "%a %b %_d %l:%M %p" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu% <fc=#FFB6B0>:</fc> %memory% <fc=#FFB6B0>:</fc> <fc=#FFFFCC>%date%</fc>  "
}
