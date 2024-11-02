#!/bin/bash

# Menginstal conky
sudo apt update && sudo apt install -y conky

# Menjalankan skrip instalasi dari GitHub
bash <(wget -qO- https://raw.githubusercontent.com/AweGuy22/simple-conky-clock/master/install-from-internet.sh)

# Membuat direktori konfigurasi conky jika belum ada
mkdir -p ~/.config/conky

# Menghapus konfigurasi default conky jika ada
rm -f ~/.config/conky/conky.conf

# Menambahkan konfigurasi baru ke dalam file conky.conf
cat << EOF > ~/.config/conky/conky.conf
conky.config = {
    background=true,
    update_interval=1,
    double_buffer=true,
    no_buffers=true,
    imlib_cache_size=10,

    draw_shades=false,
    draw_outline=false,
    draw_borders=false,

    gap_x=20,
    gap_y=130,
    alignment="bottom_left",

    own_window=true,
    own_window_type="desktop",
    own_window_transparent=true,
    own_window_hints="undecorated,below,sticky,skip_taskbar,skip_pager",

    own_window_argb_visual=true,
    own_window_argb_value=0,

    use_xft=true,
    xftalpha=1,
    text_buffer_size=256,
    override_utf8_locale=true,

    default_color='#ffffff',

    color0='#ffffff',
}

conky.text = [[
\${font Osake:style=Regular:size=45}\${color0}\${time %A}
\${voffset -20}\${font Night in Tokyo:style=Regular:size=20}\${color0}\${time %B, %d}.
]]
EOF

# Menjalankan conky
conky &

