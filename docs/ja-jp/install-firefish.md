# Firefish のインストール

## インストール前の準備

## パッケージインストール

### リポジトリの登録

```
apt update
apt install -y ca-certificates lsb-release curl
curl --output /usr/share/keyrings/firefish-dist-pkg.gpg \
    -fsSL https://mizunashi-mana.github.io/firefish-dist-pkg/repo.gpg
echo "deb [signed-by=/usr/share/keyrings/firefish-dist-pkg.gpg] https://mizunashi-mana.github.io/firefish-dist-pkg $(lsb_release --short --codename) main" \
    | tee /etc/apt/sources.list.d/firefish-dist-pkg.list
```

### Node.js リポジトリの登録

```
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
```

### Firefish パッケージインストール

```
apt update
apt install -y firefish
```
