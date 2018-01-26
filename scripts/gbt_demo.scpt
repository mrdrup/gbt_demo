#!/usr/bin/env osascript

tell application "iTerm"
    activate
    set myterm to (create window with default profile)
    tell first session of first tab of myterm
        set columns to 96
        set rows to 23
        write text "cd " & (system attribute "CWD")
        write text "clear"
        write text "ttyrec artifacts/ttygif_gbt_demo.rec"
        delay 1

        set commands to {¬
            {wtime:3.0, ttime:0.04, cmd:"vagrant ssh debian"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"ssh centos"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.5, ttime:0.04, cmd:"clear"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"cat ./assets/gbt_demo_profile"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"source ./assets/gbt_demo_profile"}, ¬
            {wtime:0.5, ttime:0.04, cmd:"clear"}, ¬
            {wtime:3.0, ttime:0.04, cmd:"vagrant ssh debian"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"ssh centos"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"sudo su - nobody"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"ssh ubuntu"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"sudo su -"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"docker shell percona"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"hint"}, ¬
            {wtime:0.5, ttime:0.04, cmd:"clear"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"mysql -p$MYSQL_ROOT_PASSWORD"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"show databases;"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"use mysql"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"use performance_schema"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.5, ttime:0.04, cmd:"clear"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"export GBT__THEME=\"$(PWD)/assets/gbt_demo_remote_theme\""}, ¬
            {wtime:3.0, ttime:0.04, cmd:"vagrant ssh centos"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"ssh ubuntu"}, ¬
            {wtime:1.0, ttime:0.04, cmd:"docker shell percona"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"ttygif artifacts/ttygif_gbt_demo.rec -f"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"mv tty.gif artifacts/gbt_demo_raw.gif"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}}
        set num to count of commands

        repeat with i from 1 to num
            tell application "System Events"
                repeat with ch in characters of (cmd of item i of commands)
                    keystroke ch
                    delay (ttime of item i of commands)
                end repeat
                delay 0.1
                keystroke return
                delay (wtime of item i of commands)
            end tell
        end repeat

    end tell
end tell
