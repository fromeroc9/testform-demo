# CLI Reference

The TerraTest Command Line Interface (CLI) is your primary tool for managing testing infrastructure. It follows a syntax very similar to HashiCorp's Terraform.

```bash
terratest [global options] <command> [arguments]
```

## Global Options

These options can be used with any command, placed before the subcommand:
- `-chdir=DIR`: Switch to a different working directory before executing.
- `--projectId=ID`: Override the GitHub Projects V2 ID (useful for monorepos with multiple project boards).
- `-help`: Show help output.
- `-version`: Show the current TerraTest version.

---

## Core Workflow Commands

### `init`
Initializes a new or existing TerraTest working directory by creating the necessary configuration files (`terratest.json`) and preparing the local backend.
*Run this command first on any new project.*

### `plan`
Generates a speculative execution plan. It compares your local `.feature` files against the `terratest.state` file and outputs exactly what actions it will take (e.g., creating 2 test cases, destroying 1, updating 1). **It will not modify GitHub.**
*Options:*
- `-out=path`: Write the plan to a file to guarantee exact execution during `apply`.
- `-destroy`: Generate a plan to delete all tracked resources.
- `-replace=resource`: Force the replacement of a specific resource instance.

### `apply`
Executes the actions proposed by a `plan`. It connects to GitHub via the API, creates/updates/closes Issues, and updates your `terratest.state` file.
*Options:*
- `-auto-approve`: Skip the interactive confirmation prompt.
- `-parallelism=n`: Number of concurrent API requests to GitHub (Default: 10).

### `destroy`
Convenience alias for `terratest apply -destroy`. Soft-deletes (closes) all GitHub Issues managed by your current TerraTest workspace.

---

## Advanced Commands

### `report`
Generates multi-dimensional test analytics from your local state without needing to query GitHub.
*Usage:* `terratest report <type> [options]`
*(See the [Reporting & Analytics](reporting-and-analytics.md) guide for full details on types and filters).*

### `refresh`
Updates your local `terratest.state` file by querying GitHub. If someone manually modified an Issue title in GitHub, `refresh` will pull that change into your state (which will then show up as "drift" the next time you run `plan`).

### `import`
Associates an existing GitHub Issue with a TerraTest resource.
*Usage:* `terratest import <identity> <issue_number>`
*Example:* `terratest import login.case.feature::Successful_login 145`

### `diff`
Shows the drift between your local `.feature` files and your `terratest.state`. 

### `fmt`
Rewrites all `.feature` files in your workspace to standard Gherkin indentation and canonical formatting.

### `graph`
Generates an ASCII dependency graph showing the relationship between your Test Plans, Test Runs, and Test Cases.
*Options:*
- `-draw-cycles`: Highlights dependency edges with colors.

### `workspace`
Manage multiple isolated states in the same directory (e.g., separating `staging` and `production` test environments).
*Subcommands:* `new`, `list`, `select`, `delete`, `show`.

### `state`
Advanced state management.
*Subcommands:* `list`, `rm`, `show`, `mv`, `pull`, `push`.

### `taint` / `untaint`
Marks a resource instance as "tainted" (not fully functional). A tainted resource will be forced to be destroyed and recreated on the next `apply`.
