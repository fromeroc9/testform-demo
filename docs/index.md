# TerraTest Documentation

Welcome to the official documentation for **TerraTest**, an Infrastructure-as-Code (IaC) approach to Test Management.

## Why TerraTest?

Test management tools today are often completely decoupled from the developer's workflow. QA engineers write test cases in external web portals (like Jira, Xray, or QMetry), while developers write code in their IDEs. This separation leads to "drift": the test cases drift out of sync with reality, traceability becomes a chore, and managing test execution across environments is a manual nightmare.

TerraTest solves this by treating your test cases as infrastructure. Inspired by HashiCorp's Terraform, TerraTest allows you to define your Test Cases, Test Runs, and Test Plans locally using the ubiquitous Gherkin (`.feature`) syntax. It then intelligently plans and applies those changes directly to GitHub Issues and GitHub Projects.

### Key Benefits

1. **Git-ops for QA:** Your test cases live in Git alongside your application code. Pull requests naturally review test changes along with application code changes.
2. **Declarative State:** You declare the desired state in Gherkin. TerraTest figures out how to make GitHub match that state, without you having to manually click around web UIs.
3. **Idempotency & Drift Detection:** TerraTest remembers what it applied using a `terratest.state` file. If someone manually changes a test case in GitHub, TerraTest detects the "drift" and can reconcile it.
4. **Native GitHub Integration:** Test cases are GitHub Issues. Bugs are GitHub Issues. Developers don't need to learn a new tool—it all lives where they already work.
5. **Multi-dimensional Reporting:** Generate coverage, execution, and traceability reports directly from your local state, bridging the gap between technical execution and management visibility.

---

## Table of Contents

Follow this guide to master TerraTest from installation to advanced analytics.

### 1. Getting Started
* [Getting Started](getting-started.md)
  * Installation
  * GitHub Credentials Setup
  * Your First `plan` and `apply`

### 2. Core Concepts & DSL
* [Writing Tests (DSL)](writing-tests-dsl.md)
  * Gherkin Syntax (`.feature` files)
  * Scopes (Test Cases, Test Runs, Test Plans)
  * Tags vs Fields
  * Native Fields (`assignees`, `milestone`) vs Custom Fields

### 3. Configuration
* [Configuration Guide](configuration.md)
  * The `terratest.json` file
  * Backend configuration (Local, S3, Azure)
  * GitHub Adapter setup
  * Field mapping rules

### 4. Command Line Interface
* [CLI Reference](cli-reference.md)
  * Overview of commands (`init`, `plan`, `apply`, `destroy`)
  * Workspaces (`workspace`)
  * State Management (`state`, `import`, `refresh`, `taint`)
  * Formatting & Graphing (`fmt`, `graph`)

### 5. Reporting & Analytics
* [Reporting & Analytics](reporting-and-analytics.md)
  * Using the `report` command
  * Available reports (Summary, Traceability, Coverage, 2D-Matrix)
  * Filtering data
  * Exporting to JSON and CSV

### 6. Architecture & Internals
* [Architecture Overview](architecture.md)
  * How the AST parser works
  * State management mechanics
  * REST API vs GraphQL (Projects V2) integration
