---
outline: deep
---

## 参数列表

| 短参数 | 长参数 | 类型 | 说明 |
| ------ | ------ | ---- | ---- |
| `-c`   | `--config` | `FILE` | 配置文件的路径，最低优先 |
| `-u`   | `--url` | `TEXT` | 根据模式提供相应的链接 |
| `-m`   | `--music` | `BOOLEAN` | 是否保存视频原声 |
| `-v`   | `--cover` | `BOOLEAN` | 是否保存视频封面 |
| `-d`   | `--desc` | `BOOLEAN` | 是否保存视频文案 |
| `-p`   | `--path` | `TEXT` | 作品保存位置 |
| `-f`   | `--folderize` | `BOOLEAN` | 是否将作品保存到单独的文件夹 |
| `-M`   | `--mode` | `ENUM` | 下载模式 |
| `-n`   | `--naming` | `TEXT` | 全局作品文件命名方式 |
| `-k`   | `--cookie` | `TEXT` | 登录后的cookie |
| `-i`   | `--interval` | `TEXT` | 下载日期区间 |
| `-w`   | `--keyword` | `TEXT` | 搜索关键字，用于搜索作品 |
| `-e`   | `--timeout` | `INTEGER` | 网络请求超时时间 |
| `-r`   | `--max_retries` | `INTEGER` | 网络请求超时重试数 |
| `-x`   | `--max-connections` | `INTEGER` | 网络请求并发连接数 |
| `-t`   | `--max-tasks` | `INTEGER` | 异步的任务数 |
| `-o`   | `--max-counts` | `INTEGER` | 最大作品下载数 |
| `-s`   | `--page-counts` | `INTEGER` | 每页获取作品数 |
| `-l`   | `--languages` | `ENUM` | 显示语言 |
| `-P`   | `--proxies` | `TEXT...` | 代理服务器 |
|        | `--update-config` | `BOOLEAN` | 更新配置文件 |
|        | `--init-config` | `TEXT` | 初始化配置文件 |
|        | `--auto-cookie` | `ENUM` | 自动获取cookie |
| `-h`   |               | `FLAG` | 显示富文本帮助 |
|        | `--help`      | `FLAG` | 显示帮助信息并退出 |


## 详细说明

### `--config`

指定配置文件的路径，优先级最低。默认**主配置文件**路径为 `f2/conf/app.yaml`，支持**绝对路径**与**相对路径**。

### `--url`

根据模式提供相应的链接。例如：主页、点赞、收藏作品填入主页链接，单作品填入作品链接，合集与直播同上。

### `--music`

是否保存视频原声。默认为 `true`。

### `--cover`

是否保存视频封面。默认为 `true`。仅保存原始尺寸封面。

### `--desc`

是否保存视频文案。默认为 `true`。保留原始文案信息。

### `--path`

作品保存位置。默认为当前目录下的 `Download`。支持**绝对路径**与**相对路径**。

### `--folderize`

是否将作品保存到单独的文件夹。默认为 `true`。

### `--mode`

下载模式：
- `one`：单个作品
- `post`：主页作品
- `like`：点赞作品
- `collect`：收藏作品
- `mix`：合集播放列表
- `search`：搜索
- `live`：直播

### `--naming`

全局作品文件命名方式。默认为 `{create}_{desc}`，支持的变量有：`{nickname}`，`{create}`，`{aweme_id}`，`{desc}`，`{uid}`。支持的分割符有：`_`，`-`。

- `{nickname}`：作者昵称
- `{create}`：作品创建时间
- `{aweme_id}`：作品ID
- `{desc}`：作品文案
- `{uid}`：作者ID

### `--cookie`

登录后的 `Cookie`。大部分接口需要登录后才能获取数据，所以需要提供登录后的 `Cookie`。

::: details :link: `Cookie` 获取方法请参阅下图。
![Console Cookie](https://github.com/user-attachments/assets/4523e8c7-f74e-4d5f-9da6-6bb3658f8b24)
:::

::: tip :bulb: 提示
- 无法采集或风控时请及时更新 `Cookie`。
- 不可以出现除 `ascii` 以外的字符，更新配置前请仔细检查。
:::

::: danger :bangbang: 警告 :bangbang:
- 绝对不要在 `Discussions`、`Issues`、`Discord`等公共场所分享你的 `Cookie`，注意删除敏感信息。
- 任何人获取到你的 `Cookie` 都可以直接登录你的账号。
- 当发生泄露时，请立即登出账号并重新登录。
:::

### `--interval`

下载日期区间发布的作品，格式：`年-月-日|年-月-日`。例如：`2022-01-01|2023-01-01`，设置`all` 为下载所有作品。

### `--keyword`

搜索关键字，用于搜索作品。

### `--timeout`

网络请求超时时间。默认为 `10` 秒。

### `--max_retries`

网络请求超时重试数。默认为 `5` 次。

### `--max-connections`

网络请求并发连接数。默认为 `10`。

### `--max-tasks`

异步的任务数。默认为 `5`。

### `--max-counts`

最大作品下载数。设置为 `None` 或 `0` 表示无限制。默认为 `0`。

### `--page-counts`

从接口每页可获取作品数，不建议超过 `20`。默认为 `20`。

### `--languages`

指定显示语言。默认值为 `zh_CN`，支持选项：`zh_CN` 和 `en_US`，不支持通过配置文件修改。

### `--proxies`

配置代理服务器，支持最多两个参数，分别对应 `http://` 和 `https://` 协议。

例如：`--proxies http://x.x.x.x https://x.x.x.x`。

> [!IMPORTANT] 重要 ❗❗❗
> **如果代理不支持出口 HTTPS，请使用：`--proxies http://x.x.x.x http://x.x.x.x`。**

### `--update-config`

通过 `CLI` 参数更新配置文件。详见：[配置Cookie](/site-config#配置Cookie)。

### `--init-config`

初始化高频配置文件。详见：[初始化配置文件](/site-config#初始化配置文件)。

### `--auto-cookie`

自动从浏览器获取cookie，使用该命令前请确保关闭所选的浏览器。支持的浏览器有：
- `chrome`
- `firefox`
- `edge`
- `opera`
- `opera_gx`
- `safari`
- `chromium`
- `brave`
- `vivaldi`
- `librewolf`

不支持切换浏览器用户配置。

> [!IMPORTANT] 重要 ❗❗❗
> - 近期受新版 `Chromium` 内核升级影响，更新了 `Cookie` 加密方式，导致 `F2` 无法自动获取晚于 `2024/08/15` 之后版本的浏览器 `Cookie`。
> - 在修复版本的依赖更新前请手动更新 `Cookie`。
> - 了解更多请参阅 [borisbabic/browser_cookie3#215](https://github.com/borisbabic/browser_cookie3/pull/215)。

::: details :link: 示例：手动更新 `Cookie`。
```shell [bash]
f2 tk -k "your_cookie" -c your_config.yaml --update-config
```
:::
