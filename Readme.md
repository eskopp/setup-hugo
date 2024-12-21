# Setup Hugo

![GitHub Marketplace](https://img.shields.io/badge/GitHub-Marketplace-blue?logo=github)
![Docker](https://img.shields.io/badge/Docker-Alpine-lightblue?logo=docker)

`setup-hugo` is a lightweight GitHub Action that installs **Hugo**, the popular static site generator, in your workflows. It supports installing specific versions of Hugo, including the **Extended Edition**, and is designed for CI/CD pipelines.

## Features

- 🚀 Installs Hugo Standard or Extended.
- 🕒 Supports dynamic fetching of the latest version.
- 🎯 Configurable for specific Hugo versions.
- 📦 Lightweight Docker-based solution.

## Inputs

| Name      | Required | Default | Description                                      |
|-----------|----------|---------|--------------------------------------------------|
| `version` | No       | `latest`| The version of Hugo to install (e.g., `0.118.2`).|
| `extend`  | No       | `true`  | Whether to install Hugo Extended (`true`/`false`).|

## Usage

To use this action in your GitHub workflows, add the following step to your workflow file:

```yaml
- name: Setup Hugo
  uses: eskopp/setup-hugo@v1
  with:
    version: latest  # Use 'latest' or a specific version like '0.118.2'
    extend: true     # Install Hugo Extended ('true') or Standard ('false')
```