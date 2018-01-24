#!/usr/bin/env osascript

tell application "iTerm"
    activate
    set myterm to (create window with default profile)
    tell first session of first tab of myterm
        set columns to 96
        set rows to 23

        tell current session of myterm
            write text "cd ~/tmp/gbt_demo"
            write text "ssh-add ~/.vagrant.d/insecure_private_key"
            write text "clear"
            write text "ttyrec ttygif_gbt_demo.rec"
            delay 1
        end tell

        set commands to {¬
            {wtime:3.0, ttime:0.04, cmd:"vagrant ssh debian"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"ssh centos"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"clear"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"cat ./gbt_demo_profile"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"source ./gbt_demo_profile"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"clear"}, ¬
            {wtime:3.0, ttime:0.04, cmd:"vagrant ssh debian"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"ssh centos"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"sudo su - nobody"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"ssh ubuntu"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"sudo su -"}, ¬
            {wtime:3.0, ttime:0.04, cmd:"docker shell percona"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"hint"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"clear"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"mysql -p$MYSQL_ROOT_PASSWORD"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"show databases;"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"use mysql"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"use performance_schema"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"clear"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"export GBT__THEME=\"$(PWD)/gbt_demo_remote_theme\""}, ¬
            {wtime:3.0, ttime:0.04, cmd:"vagrant ssh centos"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"ssh ubuntu"}, ¬
            {wtime:2.0, ttime:0.04, cmd:"docker shell percona"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"exit"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"ttygif ttygif_gbt_demo.rec -f"}, ¬
            {wtime:0.2, ttime:0.04, cmd:"mv tty.gif gbt_demo_raw.gif"}, ¬
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
