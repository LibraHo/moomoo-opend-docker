# moomoo OpenD Docker

极空间 NAS 上运行的 moomoo OpenD 容器配置。仓库保存 `Dockerfile` 和 `compose.yaml`；行情程序本体由 moomoo 提供，需要自行下载。此仓库不包含 OpenD 二进制、登录状态、RSA 私钥或账户信息。

## 部署

1. 从 moomoo 官方渠道下载适合 Linux 的 OpenD 压缩包，解压并把程序文件放到本目录的 `app/`，确保存在可执行的 `app/OpenD`。不要把 `app/` 提交到 Git。
2. 创建 `home/` 目录，供容器保存运行状态。首次登录和 OpenD 的配置按 moomoo 官方说明完成。
3. 在本目录运行 `docker compose up -d --build`，然后用 `docker compose ps` 查看状态。

`compose.yaml` 把 OpenD 的 API 端口仅绑定到 NAS 的 `127.0.0.1:11111`。同一 Docker 网络中的其他容器可以使用 `moomoo-opend:11111` 连接。若要从其他机器访问，请先规划认证、加密及网络隔离，再调整端口绑定。

`app/`、`home/` 和 `package/` 已加入 `.gitignore`。其中可能包含账户状态和密钥，不能上传到公开仓库。
