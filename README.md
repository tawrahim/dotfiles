### Laptop setup
Tawheed's laptop setup. Every few years, I get a new mac and have to go through the painful process of setting it up. What if I could document it and make it painless? Well today we are here.


#### Install instructions
```sh
mkdir ~/code
cd ~/code
git clone https://github.com/tawrahim/dotfiles.git
./install.sh
```

#### Syncing files across devices
```sh
cd ~/code/dotfiles
./sync.sh
git add . -all
git commit -m ""
```

#### Packages Installed
- Homebrew
- ZSH
- tmux
- tree
- youtube-dl
- sdkman
- java8
- gradle
- maven
- vim/pathogen



