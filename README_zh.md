# PocketFlow-Tutorial-Codebase-Knowledge 部署与使用手册（中文版）

---

## 1. 环境准备

### 1.1 克隆项目

```bash
git clone https://github.com/yourname/PocketFlow-Tutorial-Codebase-Knowledge.git
cd PocketFlow-Tutorial-Codebase-Knowledge
```

### 1.2 安装 Python 依赖

建议使用 Python 3.10+，推荐用虚拟环境：

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

### 1.3 安装阿里 dashscope SDK（已在 requirements.txt 中）

如未自动安装，可手动：

```bash
pip install dashscope
```

---

## 2. 配置环境变量

### 2.1 配置 LLM API Key

阿里通义千问 Qwen3 需要 dashscope 平台的 API Key：

```bash
export DASHSCOPE_API_KEY=你的阿里云dashscope API Key
```

建议将其写入 `~/.zshrc` 或 `~/.bashrc` 以便自动加载。

### 2.2 配置 PocketFlow 主目录（可选）

如需自定义主目录，可设置：

```bash
export POCKETFLOW_HOME=/your/absolute/path/to/PocketFlow-Tutorial-Codebase-Knowledge
```

### 2.3 配置文档输出目录（可选）

默认输出到当前目录。若需统一输出到指定目录：

```bash
export POCKETFLOW_OUTPUT=/Users/eric.zhao/github/GlassesAssistantSDK/
```

---

## 3. 脚本部署与全局调用

### 3.1 赋予脚本可执行权限

```bash
chmod +x pocketflow_docgen.sh
```

### 3.2 添加项目目录到 PATH（推荐）

将项目根目录加入 PATH，便于全局调用：

```bash
export PATH="/your/absolute/path/to/PocketFlow-Tutorial-Codebase-Knowledge:$PATH"
```
（建议写入 `~/.zshrc` 或 `~/.bashrc`）

---

## 4. 使用方法

### 4.1 在任意项目根目录下生成文档

进入你要分析的项目根目录，直接执行：

```bash
pocketflow_docgen.sh
```

- 会自动激活虚拟环境
- 以当前目录为分析对象
- 输出文档到 `${POCKETFLOW_OUTPUT}`（如未设置则为当前目录下的 output/ 文件夹）

### 4.2 参数说明（如需自定义）

- `POCKETFLOW_HOME`：PocketFlow 主目录（一般无需手动设置）
- `POCKETFLOW_OUTPUT`：文档输出目录
- `DASHSCOPE_API_KEY`：阿里云 dashscope API Key

---

## 5. 常见问题与排查

- **LLM 报错 `Arrearage`**：账户欠费或额度不足，请充值或检查 dashscope 控制台。
- **未生成 output**：检查脚本是否有执行权限，环境变量是否配置正确。
- **依赖缺失**：重新执行 `pip install -r requirements.txt`。
- **全局命令不可用**：确认项目目录已加入 PATH，或用绝对路径调用脚本。

---

## 6. 进阶用法

- 支持自定义 include/exclude 文件类型，详见 `main.py --help`
- 支持分析本地目录或 GitHub 仓库
- 支持多语言文档生成（`--language` 参数）

---

## 7. 参考命令速查

```bash
# 进入项目目录
cd /your/target/project

# 生成文档（输出到 POCKETFLOW_OUTPUT 或当前目录）
pocketflow_docgen.sh
```

---

如有更多问题，欢迎随时咨询！  
**祝你使用愉快，项目高效落地！** 