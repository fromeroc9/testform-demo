# Configuration Guide (`terratest.json`)

At the root of every TerraTest workspace lies the `terratest.json` file. This file controls how TerraTest connects to external systems (like GitHub), how it stores its state, and most importantly, how it parses your Gherkin DSL.

## Example Configuration

```json
{
  "version": "1.0",
  "github": {
    "owner": "hashicorp",
    "repository": "terraform",
    "projectId": 12,
    "tokenEnv": "GITHUB_TOKEN"
  },
  "backend": {
    "type": "local",
    "config": {}
  },
  "scope": {
    "testcase": {
      "identity": "*.case.feature::*",
      "fields": [
        { "name": "assignees", "type": "keywords" },
        { "name": "milestone", "type": "keywords" },
        { "name": "priority", "type": "keywords", "required": true }
      ]
    },
    "testrun": {
      "identity": "*.run.feature::*",
      "fields": [
        { "name": "testcases", "type": "keywords" }
      ]
    }
  }
}
```

---

## The `github` Block

Configures the connection to your GitHub repository and GitHub Projects V2 board.

- **`owner`** (string): The GitHub organization or username that owns the repository.
- **`repository`** (string): The repository name where Issues will be created.
- **`projectId`** (number, optional): The ID of your GitHub Projects V2 board. If provided, TerraTest will attempt to link all created issues to this project board, enabling the use of Custom Fields. *(Note: For monorepos or dynamic environments, this can be provided dynamically via the CLI using the `--projectId=<id>` flag).*
- **`tokenEnv`** (string): The name of the environment variable containing your GitHub Personal Access Token. Defaults to `GITHUB_TOKEN`.

---

## The `backend` Block

Defines where TerraTest stores its `terratest.state` file. The state file maps your local `.feature` scenarios to their corresponding GitHub Issue IDs.

- **`type`** (string): Currently only `"local"` is supported natively.
- **`config`** (object): Reserved for future cloud backend configurations (e.g., S3 buckets, Azure Blob Storage).

---

## The `scope` Block

This is the most critical section. It tells the TerraTest AST parser how to interpret your local filesystem and map it to TerraTest resources.

You can configure three scopes: `testcase`, `testrun`, and `testplan`.

### `identity`
The identity pattern tells TerraTest which files belong to which scope.
- **Tag-based:** `"@testcase"` (Any scenario with this tag will be parsed as a testcase).
- **File-extension based:** `"*.case.feature::*"` (Any scenario inside a file ending with `.case.feature` will be parsed as a testcase).

### `fields`
This array is your **Strict Schema Definition**. As explained in the [DSL Guide](writing-tests-dsl.md), any field you use in your `.feature` files MUST be declared here. If a user writes `* field browser = chrome` in their test, but `browser` is not declared in `fields`, TerraTest will throw an error.

Each field object takes:
- **`name`** (string): The exact name of the field (case-insensitive).
- **`type`** (string):
  - `"keywords"`: The field is expected to be declared using the step syntax (`* field name = value`).
  - `"tags"`: The field is mapped to a standard Gherkin tag (e.g., `@high-priority`).
- **`required`** (boolean, optional): If `true`, the parser will fail if the scenario does not include this field.
- **`values`** (array of strings, optional): Used exclusively for `"tags"` type. If provided, only tags matching these values will be mapped to the field.

### Field Type Examples:

**1. Keywords Type:**
```json
{ "name": "assignees", "type": "keywords" }
```
*How to use in DSL:*
```gherkin
* field assignees = @octocat
```

**2. Tags Type (Mapped to a specific tag pool):**
```json
{ 
  "name": "severity", 
  "type": "tags",
  "values": ["@critical", "@high", "@low"]
}
```
*How to use in DSL:*
```gherkin
@critical
Scenario: Server crashes on login
```
*TerraTest will automatically extract `@critical` and map it to the `severity` custom field in your GitHub Project board!*
