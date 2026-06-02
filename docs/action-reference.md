# Terratest GitHub Action Reference

The official GitHub action for Terratest enables seamless execution of plan, apply, and sync workflows in your CI/CD pipelines.

## Usage

```yaml
name: Terratest Sync
on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  terratest:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Terratest
        uses: ht360/terratest-action@v1
        with:
          version: 'latest'

      - name: Terratest Plan (Testcases)
        if: github.event_name == 'pull_request'
        run: terratest plan -scope testcase -out tfplan.json

      - name: Terratest Apply (Testcases)
        if: github.event_name == 'push'
        run: terratest apply -auto-approve -scope testcase
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Available Inputs (for the Action)

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `version` | The version of the CLI to install (e.g., `1.0.0`, `latest`) | No | `latest` |

## Authentication

Terratest reads the `GITHUB_TOKEN` environment variable automatically, or you can configure a custom environment variable name in your `terratest.json`.

```json
{
  "github": {
    "owner": "MyOrg",
    "repository": "MyRepo",
    "tokenEnv": "GITHUB_TOKEN"
  }
}
```

## Automated PR Comments

When run in a Pull Request context, it is common to output the Terratest Plan as JSON (`-json` flag) and use a secondary step to parse the JSON and post a PR comment showing the exact issues that will be created or modified.
