# DWM-ArchLinux

### 依赖安装

```shell
sudo pacman -S xorg
```

### qv2ray

```shell
wget https://archlinuxstudio.github.io/ArchLinuxTutorial/res/qv2ray-static-bin-nightly-20211215-1-x86_64.pkg.tar.zst
sudo pacman -U qv2ray-static-bin-nightly-20211215-1-x86_64.pkg.tar.zst

# 内核
https://github.com/v2fly/v2ray-core/releases
# wget 相应版本
```



### DWM本体

[dwm官网](https://dwm.suckless.org/)

```shell
git clone https://github.com/zyfrontend/dwm.git
# 进入dwm目录
cd dwm
# 编译
make && sudo make

cd ~
# 编辑 .xinitrc
vim .xinitrc
# 添加以下内容
exec dwm
# 启动
startx
```

### 状态栏

[slstatus](https://tools.suckless.org/slstatus/)

```shell
git clone https://git.suckless.org/slstatus

cd slstatus

make && sudo make clean install
```

> 个性化配置,在`config.h`文件最底下添加如下代码，图标字体为[nerdfonts](https://www.nerdfonts.com/cheat-sheet)

```shell
static const struct arg args[] = {
        { run_command, 		" %s | ",  	"uname -r |awk -F \"-\" '{ print $1 }'"},
        { run_command, 		" %s%% | ", 	"amixer get Master | sed -n '5p' | cut -d'[' -f2 | cut -d\% -f1"},
        { run_command, 		"ﯦ %s%% | ",  	"light | awk -F \".\" '{ print $1}'" },
        { ram_perc, 		" %s%% | ", 	"NULL"},
        { battery_state, 	"%s ",  		"BAT1" },
        { battery_perc, 	" %s%% | ",  	"BAT1" },
        { datetime, 		"%s",           "%F %T" },
};
```



### 应用搜索启动器(dmenu)

```shell
git clone https://git.suckless.org/dmenu

cd dmenu

make && sudo make

# 使用dmenu启动自定义脚本
# 创建test.sh
# 软连接到 /usr/bin下
```

### 中文字体

```shell
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts-extra adobe-source-han-serif-cn-fonts wqy-zenhei
```

### AUR

[paru](https://github.com/Morganamilo/paru)

```shell
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### 浏览器

```shell
sudo pacman -S firefox chromium
yay -S google-chrome
```

### 登录界面添加dwm选项

```shell
cd /usr/stare/xsessions/
```

![image-20211219225844034](https://zyfullstack-images.oss-cn-shanghai.aliyuncs.com/img/image-20211219225844034.png)

> 新建`dwm.desktop`并添加如下内容

```shell
[Desktop Entry]
Encoding=UTF-8
Name=Dwm
Comment=Dynamic window manager
Exec=dwm
Icon=dwm
Type=XSession
```

![image-20211219231805950](https://zyfullstack-images.oss-cn-shanghai.aliyuncs.com/img/image-20211219231805950.png)

### dwm 使用goland webstorm等程序

> 这两个都是java程序，并且在dwm这类程序上会有显示一片灰的bug，在wiki上有[解决方案](https://wiki.archlinux.org/title/Java#Gray_window,_applications_not_resizing_with_WM,_menus_immediately_closing)

```shell
sudo pacman -S wmname
# 终端运行以下代码
wmname compiz
```

### 触摸板

```shell
sudo pacman -S libinput
sudo pacman -S xf86-input-synaptics
```

> 配置文件

```shell
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d
```

> 修改配置

```shell
sudo vim /etc/X11/xorg.conf.d/70-synaptics.conf
# 添加如下内容
Section "InputClass"
	Identifier "touchpad"
	Driver "synaptics"
	MatchIsTouchpad "on"
	Option "TapButton1" "1"
	Option "TapButton2" "3"
	Option "TapButton3" "0"
	Option "VertEdgeScroll" "on"
	Option "VertTwoFingerScroll" "on"
	Option "HorizEdgeScroll" "on"
	Option "HorizTwoFingerScroll" "on"
	Option "VertScrollDelta" "-112"
	Option "HorizScrollDelta" "-114"
	Option "MaxTapTime" "125"
EndSection
```

### picom 透明

> picom的配置文件在`/etc/xdg/picom.conf`

```shell
mkdir -p ~/.config/picom
cp /etc/xdg/picom.conf ~/.config/picom/

# picom配置文件的每一项都示例及说明，一共包含五个部份。
# 第一部份：Shadows（阴影设置）
# 第二部份：Fading（渐变设置）
# 第三部份：Transparency/Opacity（透明度设置）
# 第四部份：Background-Blurring（背景模糊设置）
# 第五部份：General Setting（常规设置）
```

> 正常安装完picom，会出现一些软件透明化，导致看不清楚之类的问题，这时就需要个别设置一下透明化了

```shell
# xprop 或者 xwininfo 确定窗口值
# 例如设置firefox浏览器不透明
nvim ~/.config/picom/picom.conf

opacity-rule = [
"100:class_g = 'firefox'",
"100:name *? = 'firefox'",
"100:class_g = 'google-chrome'",
"100:name *? = 'google-chrome'",
"100:class_g = 'flameshot'",
"100:name *? = 'flameshot'",
"100:class_g = 'Typora'",
"100:name *? = 'Typora'",
"100:class_g = 'Visual Studio Code'",
"100:name *? = 'Visual Studio Code'",
"100:class_g = 'goland'",
"100:name *? = 'goland'",
"100:class_g = 'webstorm'",
"100:name *? = 'webstorm'",
"100:class_g = 'fcitx5'",
"100:name *? = 'fcitx5'",






];
```



### 笔记本省电模式

```shell
# aur源 安装
# 保持电量在 50-60
paru ipman

sudo impan --enable

```



### ranger配置

```shell
sudo pacman -S highlight w3m ueberzug
```

