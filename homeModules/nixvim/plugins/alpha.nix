base16: vaultDir: { config, pkgs, lib, ... }:
let
  colors = config.lib.stylix.colors;

  obsidianNew.__raw = ''
      function()
        local path = vim.fn.expand("${vaultDir}")
        vim.cmd("cd " .. path)
        vim.schedule(function()
          vim.cmd("Obsidian new")
        end)
      end
    '';

  obsidianSearch.__raw = ''
      function ()
        require('telescope.builtin').find_files({
          cwd = "${vaultDir}",
          prompt_title = "󱓧  Vault Files",
        })
      end
    '';

  obsidianRestore.__raw = ''
      function()
        vim.cmd("cd ${vaultDir}")
        require("persistence").load()
        require("neo-tree")
        vim.cmd("Neotree show")
      end
    '';

  obsidianGrep.__raw = ''
      function()
        require('telescope.builtin').live_grep({
          cwd = "${vaultDir}",
          prompt_title = "󱎸  Search in Notes",
        })
      end
    '';

  projectRestore.__raw = ''
      function()
         vim.cmd("Telescope projects")
         require("persistence").load()
      end
    '';

  lastRestore.__raw = ''
      function()
        require("persistence").load()
      end
    '';

  button = shortcut: desc: action: {
    type = "button";
    val = desc;
    on_press = action;
    opts = {
      shortcut = shortcut;
      width = 30;
      align_shortcut = "right";
      hl_shortcut = "Keyword";
      position = "center";
      keymap = [ 
        "n" 
        shortcut 
        (if lib.isAttrs action && action ? __raw 
          then action 
          else "<cmd>${action}<cr>"
        )
        { noremap = true; silent = true; } 
      ];
    };
  };
in
{
  programs.nixvim = {
    highlight = {
      Base16_00 = { fg = "#${colors.base00}"; };
      Base16_01 = { fg = "#${colors.base01}"; };
      Base16_02 = { fg = "#${colors.base02}"; };
      Base16_03 = { fg = "#${colors.base03}"; };
      Base16_04 = { fg = "#${colors.base04}"; };
      Base16_05 = { fg = "#${colors.base05}"; };
      Base16_06 = { fg = "#${colors.base06}"; };
      Base16_07 = { fg = "#${colors.base07}"; };
      Base16_08 = { fg = "#${colors.base08}"; };
      Base16_09 = { fg = "#${colors.base09}"; };
      Base16_0A = { fg = "#${colors.base0A}"; };
      Base16_0B = { fg = "#${colors.base0B}"; };
      Base16_0C = { fg = "#${colors.base0C}"; };
      Base16_0D = { fg = "#${colors.base0D}"; };
      Base16_0E = { fg = "#${colors.base0E}"; };
      Base16_0F = { fg = "#${colors.base0F}"; };
    };

    plugins.alpha = {
      enable = true;
      theme = null;
      settings = {
        layout = [
          { type = "padding"; val = 10; }
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
            opts = { 
              hl = "Type"; 
              position = "center"; 
            };
          }
          { type = "padding"; val = 2; }
          {
            type = "text";
            val = "Base16 - Everbox Dark";
            opts = { 
              hl = "Comment"; 
              position = "center"; 
            };
          }
          {
            type = "text";
            val = " ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██ ";
            #val = "            ██   ██   ██   ██   ██   ██   ██   ██               ";
            #val = "----------------------------------------------------------------";
            opts = {
              position = "center";
              hl = [
                [ "Base16_00" 1 7 ]
                [ "Base16_01" 9 15 ]
                [ "Base16_02" 17 23 ]
                [ "Base16_03" 25 31 ]
                [ "Base16_04" 33 39 ]
                [ "Base16_05" 41 47 ]
                [ "Base16_06" 49 55 ]
                [ "Base16_07" 57 63 ]
                [ "Base16_08" 65 71 ]
                [ "Base16_09" 73 79 ]
                [ "Base16_0A" 81 87 ]
                [ "Base16_0B" 89 95 ]
                [ "Base16_0C" 97 103 ]
                [ "Base16_0D" 105 111 ]
                [ "Base16_0E" 113 119 ]
                [ "Base16_0F" 121 127 ]
              ];
            };
          }
          { type = "padding"; val = 3; }
          {
            type = "group";
            val = [
              (button "R" "󰑓   Restore Last" lastRestore)
              (button "n" "   New File" "ene | startinsert")
              (button "r" "   Recent Files" "Telescope oldfiles")
              (button "f" "   Find File" "Telescope find_files")
              (button "g" "   Live Grep" "Telescope live_grep")
              (button "t" "󰙅  Tree View" "Neotree filesystem reveal left")
              { type = "padding"; val = 1; }
              (button "k" "󰮋  New Note" obsidianNew)
              (button "o" "󰮊  Restore Vault" obsidianRestore)
              (button "l" "󰇈  Search Vault" obsidianSearch)
              (button "h" "󱘟  Grep Vault" obsidianGrep)
              { type = "padding"; val = 1; }
              #(button "x" "  NixOS" #TODO)
              (button "p" "󱓧   Projects" "Telescope projects")
              (button "[" "󱓵   Restore Project" projectRestore)
              { type = "padding"; val = 1; }
              (button "m" "  Keymaps" "Telescope keymaps")
              (button "i" "  LSP Info" "LspInfo")
              (button "q" "󰅙  Quit" "qa")
            ];
          }
          { type = "padding"; val = 3; }
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
  };
}
