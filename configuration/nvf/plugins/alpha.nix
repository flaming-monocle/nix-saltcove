{
  pkgs,
  lib,
  ...
}:
let
  #stylixColors = config.lib.stylix.colors;

  # vaultDir = "/home/kobi/Documents/secondBrain/";
  # obsidianNew.__raw = ''
  #   function()
  #     local path = vim.fn.expand("${vaultDir}")
  #     vim.cmd("cd " .. path)
  #     vim.schedule(function()
  #       vim.cmd("Obsidian new")
  #     end)
  #   end
  # '';
  # obsidianSearch.__raw = ''
  #   function ()
  #     require('telescope.builtin').find_files({
  #       cwd = "${vaultDir}",
  #       prompt_title = "󱓧  Vault Files",
  #     })
  #   end
  # '';
  # obsidianRestore.__raw = ''
  #   function()
  #     vim.cmd("cd ${vaultDir}")
  #     require("persistence").load()
  #     require("neo-tree")
  #     vim.cmd("Neotree show")
  #    end
  # '';
  # obsidianGrep.__raw = ''
  #   function()
  #     require('telescope.builtin').live_grep({
  #       cwd = "${vaultDir}",
  #       prompt_title = "󱎸  Search in Notes",
  #     })
  #   end
  # '';

  # projectRestore.__raw = ''
  #   function()
  #      vim.cmd("Telescope projects")
  #      require("persistence").load()
  #   end
  # '';
  # lastRestore.__raw = ''
  #   function()
  #     require("persistence").load()
  #   end
  # '';

  button = shortcut: desc: action: {
    type = "button";
    val = desc;
    on_press = action;
    opts = {
      inherit shortcut;
      width = 30;
      align_shortcut = "right";
      hl_shortcut = "Keyword";
      position = "center";
      keymap = [
        "n"
        shortcut
        (if lib.isAttrs action && action ? __raw then action else "<cmd>${action}<cr>")
        {
          noremap = true;
          silent = true;
        }
      ];
    };
  };
in
{
  programs.nvf.settings.vim = {
    startPlugins = [
      pkgs.vimPlugins.alpha-nvim
      pkgs.vimPlugins.plenary-nvim # dependency
    ];

    # visuals.nvim-web-devicons.enable = true;

    dashboard.alpha = {
      enable = true;
      theme = null;
      layout = [
        {
          type = "text";
          val = [
            "              db                          db                    "
            ""
            "`7MMpMMMb.  `7MM  `7M'   `MF'`7M'   `MF'`7MM  `7MMpMMMb.pMMMb.  "
            "  MM    MM    MM    `VA ,V'    VA   ,V    MM    MM    MM    MM  "
            "  MM    MM    MM      XMX       VA ,V     MM    MM    MM    MM  "
            "  MM    MM    MM    ,V' VA.      VVV      MM    MM    MM    MM  "
            ".JMML  JMML..JMML..AM.   .MA.     W     .JMML..JMML  JMML  JMML."
          ];
          opts.hl = "Type";
          opts.position = "center";
        }
        {
          type = "padding";
          val = 4;
        }
        # {
        #   type = "text";
        #   val = "Base16 - Everforest Dark Hard";
        #   opts = {
        #     hl = "Comment";
        #     position = "center";
        #   };
        # }
        # {
        #   type = "text";
        #   val = " ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██ ";
        #   opts = {
        #     position = "center";
        #     hl = [
        #       [
        #         "#${stylixColors.base00}"
        #         1
        #         7
        #       ]
        #       [
        #         "#${stylixColors.base01}"
        #         9
        #         15
        #       ]
        #       [
        #         "#${stylixColors.base02}"
        #         17
        #         23
        #       ]
        #       [
        #         "#${stylixColors.base03}"
        #         25
        #         31
        #       ]
        #       [
        #         "#${stylixColors.base04}"
        #         33
        #         39
        #       ]
        #       [
        #         "#${stylixColors.base05}"
        #         41
        #         47
        #       ]
        #       [
        #         "#${stylixColors.base06}"
        #         49
        #         55
        #       ]
        #       [
        #         "#${stylixColors.base07}"
        #         57
        #         63
        #       ]
        #       [
        #         "#${stylixColors.base08}"
        #         65
        #         71
        #       ]
        #       [
        #         "#${stylixColors.base09}"
        #         73
        #         79
        #       ]
        #       [
        #         "#${stylixColors.base0A}"
        #         81
        #         87
        #       ]
        #       [
        #         "#${stylixColors.base0B}"
        #         89
        #         95
        #       ]
        #       [
        #         "#${stylixColors.base0C}"
        #         97
        #         103
        #       ]
        #       [
        #         "#${stylixColors.base0D}"
        #         105
        #         111
        #       ]
        #       [
        #         "#${stylixColors.base0E}"
        #         113
        #         119
        #       ]
        #       [
        #         "#${stylixColors.base0F}"
        #         121
        #         127
        #       ]
        #     ];
        #   };
        # }
        # {
        #   type = "padding";
        #   val = 3;
        # }
        {
          type = "group";
          val = [
            # (button "R" "󰑓   Restore Last" lastRestore)
            (button "n" "   New File" "ene | startinsert")
            (button "r" "   Recent Files" "Telescope oldfiles")
            (button "f" "   Find File" "Telescope find_files")
            (button "g" "   Live Grep" "Telescope live_grep")
            (button "t" "󰙅   Tree View" "Neotree filesystem reveal left")
            {
              type = "padding";
              val = 1;
            }
            # (button "k" "󰮋   New Note" obsidianNew)
            # (button "o" "󰮊   Restore Vault" obsidianRestore)
            # (button "l" "󰇈   Search Vault" obsidianSearch)
            # (button "h" "󱘟   Grep Vault" obsidianGrep)
            # {
            #   type = "padding";
            #   val = 1;
            # }
            # #(button "x" "   NixOS" #TODO)
            # (button "p" "󱓧   Projects" "Telescope projects")
            # (button "[" "󱓵   Restore Project" projectRestore)
            # {
            #   type = "padding";
            #   val = 1;
            # }
            (button "m" "   Keymaps" "Telescope keymaps")
            (button "i" "   LSP Info" "LspInfo")
            (button "q" "󰅙   Quit" "qa")
          ];
        }
        {
          type = "padding";
          val = 3;
        }
        {
          type = "text";
          val = "";
          opts = {
            position = "center";
            hl = "Comment";
            __raw = ''
              function()
                return os.date("%Y %m %d - %A %H:%M")
              end
            '';
          };
        }
      ];
    };
  };
}
