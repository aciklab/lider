# Lider
Lider ile ilgili dosyalar

## Lider Deposunun Eklenmesi

> sudo wget http://repo.liderahenk.org/liderahenk-archive-keyring.asc && sudo apt-key add liderahenk-archive-keyring.asc &&  rm liderahenk-archive-keyring.asc

> sudo printf  "deb [arch=amd64] http://repo.liderahenk.org/liderahenk stable main" | sudo tee -a /etc/apt/sources.list

> sudo apt update

### Ahenk Yükleme

> sudo apt install ahenk
