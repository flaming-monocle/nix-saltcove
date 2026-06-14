_: {
  programs.nvf.settings.vim = {
    globals.mapleader = " ";
    keymaps = [
      # Easy write
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<CR>";
        desc = "Quick save";
      }
      {
        mode = "n";
        key = "";
        action = "<cmd><CR>";
        desc = "<leader>";
      }
      # Buffer navigation
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<CR>";
        desc = "Next file in buffer";
      }
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<CR>";
        desc = "Previous file in buffer";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>bdelete<CR>";
        desc = "Close buffer";
      }

      # Oil (quick file edit)
      {
        mode = "n";
        key = "<leader>-";
        action = "<cmd>Oil<cr>";
        desc = "Open parent directory with Oil";
      }

      # Quick inserts
      {
        mode = "n";
        key = "<leader>/";
        action = "0wi// <esc>0w";
        desc = "Quickly adds a // to the start of the working line";
      }
      {
        mode = "n";
        key = "<leader><3>";
        action = "0wi# <esc>0w";
        desc = "Quickly adds a # to the start of the working line";
      }
      {
        mode = "n";
        key = "<leader>;";
        action = "$a;<esc>0w";
        desc = "Quickly adds a ; to the end of the working line";
      }

      # caps ctrl - remapped on system level
      # {
      #   mode = [
      #     "n"
      #     "v"
      #     "l"
      #     "t"
      #   ];
      #   key = "<caps>";
      #   action = "<esc>";
      # }

      # Linebreaks
      {
        mode = "n";
        key = "<leader>bi";
        action = "i<CR><esc>0be";
      }
      {
        mode = "n";
        key = "<leader>ba";
        action = "a<CR><esc>0be";
      }

      # Smart split navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        silent = true;
        desc = "Smart left navigation/split";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        silent = true;
        desc = "Smart down navigation/split";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        silent = true;
        desc = "Smart up navigation/split";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        silent = true;
        desc = "Smart right navigation/split";
      }

      # Splits
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

      # Treesitter
      {
        key = "<leader>tc";
        mode = "n";
        silent = true;
        action = "<cmd>TSContext toggle<CR>";
        desc = "Toggle the Treesitter context";
      }

      # Zen mode
      # {
      #   key = "<leader>z";
      #   mode = "n";
      #   silent = true;
      #   action = "<cmd>ZenMode<CR>";
      #   desc = "Toggle Zen Mode";
      # }

      # Good Habits
      {
        key = "<Left>";
        mode = "n";
        action = "";
        desc = "Nuh uh uh!";
      }
      {
        key = "<Down>";
        mode = "n";
        action = "";
        desc = "Nuh uh uh!";
      }
      {
        key = "<Up>";
        mode = "n";
        action = "";
        desc = "Nuh uh uh!";
      }
      {
        key = "<Right>";
        mode = "n";
        action = "";
        desc = "Nuh uh uh!";
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

      # Session Manager
      #{
      #  key = "<leader>sm";
      #  mode = "n";
      #  silent = true;
      #  action = "<cmd>Session<CR>";
      #  desc = "Open Session Manager";
      #}

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
