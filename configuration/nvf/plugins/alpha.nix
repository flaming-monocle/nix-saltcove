{
  pkgs,
  # config,
  lib,
  ...
}:
let
  # Stylix = config.lib.stylix;
  # inherit (config.lib.stylix) colors;

  ##-- Obsidian-specific functions --##
  ##-- Should be rewritten to follow parakasten's lead

  # vaultDir = "/home/kobi/Documents/secondbrain/";

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

  ##-- Project-specific functions --##
  ##-- Requires the Projects extension, which I should look into
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
          type = "padding";
          val = 4;
        }
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
        #   val = "base16 - ${stylixScheme}";
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
        #         "#${colors.base00}"
        #         1
        #         7
        #       ]
        #       [
        #         "#${colors.base01}"
        #         9
        #         15
        #       ]
        #       [
        #         "#${colors.base02}"
        #         17
        #         23
        #       ]
        #       [
        #         "#${colors.base03}"
        #         25
        #         31
        #       ]
        #       [
        #         "#${colors.base04}"
        #         33
        #         39
        #       ]
        #       [
        #         "#${colors.base05}"
        #         41
        #         47
        #       ]
        #       [
        #         "#${colors.base06}"
        #         49
        #         55
        #       ]
        #       [
        #         "#${colors.base07}"
        #         57
        #         63
        #       ]
        #       [
        #         "#${colors.base08}"
        #         65
        #         71
        #       ]
        #       [
        #         "#${colors.base09}"
        #         73
        #         79
        #       ]
        #       [
        #         "#${colors.base0A}"
        #         81
        #         87
        #       ]
        #       [
        #         "#${colors.base0B}"
        #         89
        #         95
        #       ]
        #       [
        #         "#${colors.base0C}"
        #         97
        #         103
        #       ]
        #       [
        #         "#${colors.base0D}"
        #         105
        #         111
        #       ]
        #       [
        #         "#${colors.base0E}"
        #         113
        #         119
        #       ]
        #       [
        #         "#${colors.base0F}"
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
            (button "r" "   Recent Files ( fr)" "Telescope oldfiles")
            (button "f" "   Find File ( ff)" "Telescope find_files")
            (button "g" "   Live Grep ( fg)" "Telescope live_grep")
            (button "t" "󰙅   Tree View ( e)" "Neotree filesystem reveal left")
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
            # (button "x" "   NixOS" #TODO)
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
                return os.date(" %A, %Y-%m-%d %H:%M")
              end
            '';
          };
        }
      ];
    };
  };
}
