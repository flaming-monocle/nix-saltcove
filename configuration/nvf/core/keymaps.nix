{ ... }:
{
  programs.nvf.settings.vim = {
    globals.mapleader = " ";
    keymaps = [
      # Good Habits
      {
        key = "<Left>";
        mode = "n";
        silent = true;
        action = "";
        desc = "Nuh uh uh!";
      }
      {
        key = "<Down>";
        mode = "n";
        silent = true;
        action = "";
        desc = "Nuh uh uh!";
      }
      {
        key = "<Up>";
        mode = "n";
        silent = true;
        action = "";
        desc = "Nuh uh uh!";
      }
      {
        key = "<Right>";
        mode = "n";
        silent = true;
        action = "";
        desc = "Nuh uh uh!";
      }
      # Yanky
      {
        key = "p";
        mode = [
          "n"
          "x"
        ];
        silent = true;
        action = "<Plug>(YankyPutAfter)";
        desc = "Pastes after the cursor";
      }
      {
        key = "P";
        mode = [
          "n"
          "x"
        ];
        silent = true;
        action = "<Plug>(YankyPutBefore)";
        desc = "Pastes before the cursor";
      }
      {
        key = "<C-p>";
        mode = "n";
        silent = true;
        action = "<Plug>(YankyPreviousEntry)";
        desc = "Select previous entry in clipboard";
      }
      {
        key = "C-n";
        mode = "n";
        silent = true;
        action = "<Plug>(YankyNextEntry)";
        desc = "Select next entry in clipboard";
      }
      {
        key = "<leader>p";
        mode = "n";
        silent = true;
        action = ''<cmd>lua require("telescope").extensions.yank_history.yank_history()'';
        desc = "Open clipboard history";
      }

      # Telescope
      {
        key = "<leader>ff";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope find_files<CR>";
        desc = "Find Files by name";
      }
      {
        key = "<leader>fp";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope projects<CR>";
        desc = "Find Projects";
      }
      {
        key = "<leader>fb";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope file_browser<CR>";
        desc = "File Browser";
      }
      {
        key = "<leader>fg";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope live_grep<CR>";
        desc = "Find files with Grep";
      }
      {
        key = "<leader>jt";
        mode = "n";
        silent = true;
        action = "<cmd>Telescope diagnostics<CR>";
        desc = "";
      }

      # Neotree
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>Neotree toggle<CR>";
        desc = "toggle neotrEe filesystem show";
      }

      # LSP
      {
        key = "<leader>gh";
        mode = "n";
        silent = true;
        action = "<cmd>vim.lsp.buf.hover<CR>";
        desc = "Go to Hover documentation";
      }
      {
        key = "<leader>gd";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        desc = "Go to Definition";
      }
      {
        key = "<leader>gr";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        desc = "Go to References";
      }
      {
        key = "<leader>gf";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.formatting()<CR>";
        desc = "Go to Formatting";
      }
      {
        key = "<leader>ca";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        desc = "LSP Code Action (Normal)";
      }
      {
        key = "<leader>ca";
        mode = "v";
        silent = true;
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        desc = "LSP Code Action (Visual)";
      }

      # cmp
      {
        key = "<C-Space>";
        mode = "i";
        silent = true;
        action = "<cmd>lua require'cmp'.complete()<CR>";
        desc = "Insert selected completion";
      }
      {
        key = "<Tab>";
        mode = "i";
        silent = true;
        action = "<cmd>lua require'cmp'.select_next_item()<CR>";
        desc = "Select next completion";
      }
      {
        key = "<S-Tab>";
        mode = "i";
        silent = true;
        action = "<cmd>lua require'cmp'.select_prev_item()<CR>";
        desc = "Select previous completion";
      }
      {
        key = "<S-Space>";
        mode = "i";
        silent = true;
        action = "<cmd>lua require'cmp'.close()<CR>";
        desc = "Close completion menu";
      }

      # Diagnostics
      {
        key = "<leader>d";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        desc = "Open diagnostics";
      }
      {
        key = "]d";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        desc = "Next diagnostic";
      }
      {
        key = "[d";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        desc = "Previous diagnostic";
      }
      {
        key = "]D";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.goto_last()<CR>";
        desc = "Last diagnostic";
      }
      {
        key = "[D";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.goto_first()<CR>";
        desc = "First diagnostic";
      }
      {
        key = "<leader>jl";
        mode = "n";
        silent = true;
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
        desc = "";
      }

      # Neotree
      {
        key = "<leader>e";
        mode = "n";
        silent = true;
        action = "<cmd>Neotree<CR>";
        desc = "";
      }

      # Session Manager
      #{
      #  key = "<leader>sm";
      #  mode = "n";
      #  silent = true;
      #  action = "<cmd>Session<CR>";
      #  desc = "Open Session Manager";
      #}

      # Smart Split
      {
        key = "<leader>sv";
        mode = "n";
        silent = true;
        action = "<cmd>vsplit<CR>";
        desc = "Split Vertical";
      }
      {
        key = "<leader>sh";
        mode = "n";
        silent = true;
        action = "<cmd>split<CR>";
        desc = "Split Horizontal";
      }
      {
        key = "<leader>sq";
        mode = "n";
        silent = true;
        action = "<cmd>q<CR>";
        desc = "Close Split";
      }

      # Treesitter
      {
        key = "<leader>tc";
        mode = "n";
        silent = true;
        action = "<cmd>TSContext toggle<CR>";
        desc = "Toggle the Treesitter context";
      }

      # Floatterm
      #{
      #  key = "<leader>tt";
      #  mode = [ "n" "t" ];
      #  silent = true;
      #  action = "<cmd>FloatermToggle<CR>";
      #  desc = "Toggle Floaterm";
      #}
    ];
  };
}
