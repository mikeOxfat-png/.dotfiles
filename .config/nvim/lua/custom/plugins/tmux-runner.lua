return { 
    'karshPrime/tmux-compile.nvim', 
    event = 'VeryLazy', 
    opts = {
        -- Overriding Default Configurations. [OPTIONAL]
        save_session = true,             -- Save file before action (:wall)
        build_run_window_title = "build", -- Tmux window name for Build/Run
        local_config = "tmux-compile.lua",-- Set local commands file name
        ---- same window pane
        new_pane_everytime = false,       -- Use existing side panes for action, when false
        side_width_percent = 50,          -- Side pane width percentage
        bottom_height_percent = 30,       -- Bottom pane height percentage
        ---- overlay window
        overlay_width_percent = 80,       -- Overlay width percentage
        overlay_height_percent = 80,      -- Overlay height percentage
        overlay_sleep = 1,                -- Pause before overlay autoclose; seconds
        -- By default it sets value to -1,
        -- indicating not to autoclose overlay

        -- Languages' Run and Build actions.  [REQUIRED]
        build_run_config = {
            {
                extension = {'c', 'cpp', 'h'},
                build = 'make',
                run   = 'make run',
                debug = 'lldb',
            },
            {
                extension = {'rs'},
                build = 'cargo build',
                run   = 'cargo run',
                -- not all properties are required for all extensions
            },
            {
                extension = {'go'},
                run = 'go run .',
                -- Run would work for golang
                -- but Build and Debug will return errors informing configs are
                -- missing
            },
        },

        -- Directory override config. [OPTIONAL] -- Set actions for a specific directory (per project basis)
        project_override_config = {
            --[[ {
                project_base_dir = '~/codin/code-coverage-analyser/',
                build = 'make',
                run   = '~/codin/code-coverage-analyser/src/getGitInfo.ts',
            }, ]]
            --[[ {
                project_base_dir = '~/Projects/ESP32/',
                build = 'idf.py build',
                run   = 'idf.py flash /dev/cu.usbmodem1101'
                -- Only build will work for this path
            } ]]
        }
    },
    keys = {
        {'<leader>x', ':TMUXcompile RunH<cr>', desc="run in split pane"}
    },
    command = 'TMUXCompile',
}
