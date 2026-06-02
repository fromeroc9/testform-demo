# Reporting & Analytics

TerraTest isn't just about provisioning test infrastructure; it's also a powerful engine for extracting metrics. Because TerraTest stores the exact execution status and metadata of all your tests in the local `terratest.state` file, you can generate multi-dimensional reports instantly without needing to make slow API queries to GitHub.

## The `report` Command

You generate reports using the `terratest report` CLI command:

```bash
terratest report <type> [options]
```

### Report Types

TerraTest comes with 6 built-in report types designed to answer specific QA management questions:

1. **`testcase-summary`**: A comprehensive inventory of all your test cases, displaying their latest execution status, labels, and assignees.
2. **`execution-summary`**: Groups data by **Test Run**. It shows the pass/fail/blocked metrics for each execution cycle (e.g., Sprint 1 Regression).
3. **`defects`**: An exclusive list of only the tests that have a `failed` or `blocked` status, complete with direct clickable links to the corresponding GitHub Issue.
4. **`traceability`**: Maps tests back to their requirements. It groups test executions by specific tags (e.g., `@feature-login`) so you can trace which features are fully covered.
5. **`coverage`**: A percentage-based aggregation. It calculates the success rate (e.g., 85% passed) grouped by tags.
6. **`two-dimensional`**: A powerful dual-axis matrix that distributes the exact count of statuses (passed, failed, unexecuted) across your components (labels or milestones).

### Output Formats

You can export your reports into three different formats using the `--format` flag:

- **Markdown (`--format md`)**: The default format. Perfect for pasting into GitHub PR comments, Wikis, or Slack. Uses visual emojis (✅, ❌, ⚠️) for quick scanning.
- **CSV (`--format csv`)**: Comma-separated values. Ideal for downloading raw data and opening it in Microsoft Excel or Google Sheets to build your own pivot tables.
- **JSON (`--format json`)**: A hierarchical, machine-readable format. Perfect if you want to pipe the output into another tool or a custom dashboard.

*(Tip: Use the `--out <path>` flag to save the report directly to a file, e.g., `--out my-report.csv`).*

## Advanced Filtering

You can slice and dice your data using the `--filter` flag. TerraTest supports filtering by *any* state attribute, including native fields (`status`, `milestone`, `assignees`) and your `custom_fields`.

You can pass the `--filter` flag multiple times to apply "AND" logic.

### Filtering Examples

**1. Show defects only for a specific milestone:**
```bash
terratest report defects --filter milestone=v1.0
```

**2. See execution metrics for tests assigned to a specific user:**
```bash
terratest report execution-summary --filter assignees=@alice
```

**3. Filter by a Custom Field (e.g., Priority):**
*(Assuming you defined `priority` in your `terratest.json`)*
```bash
terratest report testcase-summary --filter priority=high
```

**4. Export a highly filtered matrix to CSV for Excel:**
```bash
terratest report two-dimensional --filter status=passed --filter labels=@sprint-2 --format csv --out sprint2_passed.csv
```

With TerraTest Reporting, you bring the analytical power of enterprise test management tools straight to your terminal, completely decoupled from vendor lock-in.
