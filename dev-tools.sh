echo 'update system' 
sudo apt-get update && sudo apt-get upgrade

echo 'installing curl' 
sudo apt install curl -y

echo 'installing git' 
sudo apt install git-all -y

echo 'installing vim'
sudo apt install vim -y

echo 'installing wget unzip'
sudo apt-get install wget unzip -y

echo 'Installing FireCode font'
sudo apt install fonts-firacode

echo 'installing build-essential checkinstall libssl-dev'
sudo apt install build-essential checkinstall libssl-dev -y

echo 'installing apt-transport-https ca-certificates  gnupg-agent software-properties-common'
sudo apt-get install  apt-transport-https ca-certificates  gnupg-agent software-properties-common -y

echo 'installing telnet'
sudo apt-get install telnet

echo 'installing dotnet 2.x, 3.x, 5.0'
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install -y dotnet-sdk-5.0
sudo apt-get install -y dotnet-sdk-3.1
sudo apt-get install -y dotnet-sdk-2.1

echo 'installing java'
sudo apt install default-jre
sudo apt install default-jdk -y

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code -y

echo 'installing extensions'
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension eg2.vscode-npm-script
code --install-extension folke.vscode-monorepo-workspace
code --install-extension foxundermoon.shell-format
code --install-extension Gruntfuggly.todo-tree
code --install-extension hashicorp.terraform
code --install-extension ivory-lab.jenkinsfile-support
code --install-extension jmMeessen.jenkins-declarative-support
code --install-extension mhutchie.git-graph
code --install-extension mikestead.dotenv
code --install-extension ms-dotnettools.csharp
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsliveshare.vsliveshare-audio
code --install-extension ms-vsliveshare.vsliveshare-pack
code --install-extension naumovs.color-highlight
code --install-extension PKief.material-icon-theme
code --install-extension pmneo.tsimporter
code --install-extension quicktype.quicktype
code --install-extension rbbit.typescript-hero
code --install-extension ritwickdey.LiveServer
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension waderyan.gitblame
code --install-extension xabikos.JavaScriptSnippets


echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing terminator'
sudo apt-get update
sudo apt-get install terminator -y

echo 'installing python 3.8 tools'
sudo apt install python3.8 python3.8-dev python3.8-venv \
python3-venv idle-python3.8 python3-pip virtualenv gcc \
default-libmysqlclient-dev libssl-dev -y

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker jcmdsbr
sudo chmod 777 /var/run/docker.sock

echo 'installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'installing kubectl' 
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo 'installing kubectx kubens' 
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

echo 'installing aws-cli' 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo 'installing fzf'
sudo apt-get install fzf

echo 'installing snapstore'
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt install snapd
sudo snap install snap-store

echo 'installing snap packages'
sudo snap install spotify
sudo snap install discord
sudo snap install drawio
sudo snap install flameshot
sudo snap install flutter --classic
sudo snap install govendor --classic
sudo snap install gtk-common-themes
sudo snap install intellij-idea-community --classic
sudo snap install teams
sudo snap install zoom-client
sudo snap install android-studio --classic
sudo snap install redis-desktop-manager
sudo snap install slack --classic
sudo snap install postman
sudo snap install dbeaver-ce
sudo snap install go --classic
sudo snap install node --classic
sudo snap install robo3t-snap
sudo snap install powershell --classic
sudo snap install rider --classic
sudo snap install pycharm-community --classic

echo 'configuring npm environment'
sudo mkdir /usr/local/lib/node_module
sudo chown -R $(whoami) /usr/local/lib/node_modules
sudo chown -R $(whoami) /usr/local/bin
sudo chown -R $(whoami) /usr/local/share

echo 'installing redis-tools'
sudo apt-get install redis-tools -y

echo 'installing gcloud sdk'
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-sdk
gcloud init
      
