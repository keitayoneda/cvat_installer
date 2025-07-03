# CVATのインストールスクリプト

## install
```sh
git clone https://github.com/keitayoneda/cvat_installer.git
cd cvat_installer
bash ./install_cvat_wsl_ubuntu24.sh
```

## cvatを開始
```sh
docker compose -f docker-compose.yml -f components/serverless/docker-compose.serverless.yml -f docker-compose.override.yml up -d
```

ブラウザのurlに`localhost:8080`と打つと立ち上がったアプリにアクセスできる.

最初にアカウントを作るよう要求されるので要求に沿ってアカウントを作成する.

## cvat使い方
後で書く

## cvatを終了
```sh
docker compose -f docker-compose.yml -f components/serverless/docker-compose.serverless.yml -f docker-compose.override.yml down
```
