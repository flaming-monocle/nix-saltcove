_: {
  programs.btop = {
    enable = true;
    settings = {
      shown_boxes = "cpu mem net proc gpu";
      selected_gpu = 0;
      show_gpu_info = true;
      update_ms = 1000;
    };
  };
}
