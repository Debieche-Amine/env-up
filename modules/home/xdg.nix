{pkgs, ...}: {
  home.packages = [
    pkgs.zathura
    pkgs.imv
    pkgs.mpv
    # pkgs.vivaldi
    # pkgs.file-roller
    # pkgs.thunar
  ];
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Web
      "text/html" = ["vivaldi-stable.desktop"];
      "application/xhtml+xml" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/http" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/https" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/about" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/unknown" = ["vivaldi-stable.desktop"];

      # PDF & PostScript
      "application/pdf" = ["org.pwmt.zathura.desktop"];
      "application/postscript" = ["org.pwmt.zathura.desktop"];
      "application/epub+zip" = ["org.pwmt.zathura.desktop"];

      # Images
      "image/jpeg" = ["swayimg.desktop"];
      "image/png" = ["swayimg.desktop"];
      "image/gif" = ["swayimd.desktop"];
      "image/webp" = ["swayimd.desktop"];
      "image/bmp" = ["swayimd.desktop"];
      "image/tiff" = ["swayimd.desktop"];
      "image/svg+xml" = ["swayimd.desktop"];
      "image/x-portable-pixmap" = ["swayimd.desktop"];
      "image/x-portable-graymap" = ["swayimd.desktop"];
      "image/x-portable-bitmap" = ["swayimg.desktop"];
      "image/x-xpixmap" = ["swayimg.desktop"];
      "image/x-xbitmap" = ["swayimg.desktop"];
      "image/avif" = ["swayimg.desktop"];
      "image/heif" = ["swayimg.desktop"];

      # Video
      "video/mp4" = ["mpv.desktop"];
      "video/x-matroska" = ["mpv.desktop"];
      "video/webm" = ["mpv.desktop"];
      "video/x-msvideo" = ["mpv.desktop"];
      "video/quicktime" = ["mpv.desktop"];
      "video/mpeg" = ["mpv.desktop"];
      "video/ogg" = ["mpv.desktop"];

      # Audio
      "audio/mpeg" = ["mpv.desktop"];
      "audio/flac" = ["mpv.desktop"];
      "audio/ogg" = ["mpv.desktop"];
      "audio/opus" = ["mpv.desktop"];
      "audio/wav" = ["mpv.desktop"];
      "audio/x-wav" = ["mpv.desktop"];
      "audio/x-m4a" = ["mpv.desktop"];
      "audio/aac" = ["mpv.desktop"];

      # Archives
      "application/zip" = ["org.gnome.FileRoller.desktop"];
      "application/x-tar" = ["org.gnome.FileRoller.desktop"];
      "application/x-7z-compressed" = ["org.gnome.FileRoller.desktop"];
      "application/x-rar" = ["org.gnome.FileRoller.desktop"];
      "application/gzip" = ["org.gnome.FileRoller.desktop"];
      "application/x-bzip2" = ["org.gnome.FileRoller.desktop"];
      "application/x-xz" = ["org.gnome.FileRoller.desktop"];

      # Text
      "text/plain" = ["nvim.desktop"];
      "text/markdown" = ["nvim.desktop"];
      "text/x-python" = ["nvim.desktop"];
      "application/json" = ["nvim.desktop"];
      "application/xml" = ["nvim.desktop"];
      "text/xml" = ["nvim.desktop"];

      # Directories
      "inode/directory" = ["thunar.desktop"];
    };
  };
}
