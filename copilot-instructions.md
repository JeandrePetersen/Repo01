# Copilot Instructions for RND800_2025 COBOL Codebase

## Big Picture Architecture
- This codebase is a large collection of COBOL source files, organized by functional modules and business domains. Each `.CBL` file typically represents a program, batch job, or business logic unit.
- Major business areas are grouped by filename prefixes (e.g., `APS`, `ARS`, `BOM`, `CFG`, `CMS`, `GEN`, `IMP`, `INV`, `POR`, `SAL`, `SDK`, `SOR`, `SQM`, `SRSP`, `SYS`, `TEST`, `TPM`, `WHM`, `WIP`).
- Data flows and integration points are managed through file I/O, batch scripts, and shared data structures. Many programs interact via intermediate files or batch processes.

## Developer Workflows
- **Build/Compile:** Use batch files such as `COMPILE.BAT`, `COMPALL.BAT`, and module-specific scripts (e.g., `COMPBASE64.BAT`, `COMPBIN.BAT`).
  - Example: `powershell.exe -File COMPILE.BAT` to build a specific module.
- **Testing:** Test scripts are named `TEST*.BAT` and are organized by module. Run with PowerShell or CMD.
  - Example: `powershell.exe -File TESTALG.BAT` for algorithm tests.
- **Debugging:** Debugging is typically performed by inserting display statements in COBOL or using batch scripts to run programs with test data.
- **Regeneration:** Some table definitions and generated code are managed by scripts like `BuildTableDef.exe` and `RegenGS.BAT`.

## Project-Specific Conventions
- **File Naming:** Prefixes indicate business area; suffixes like `P01`, `QRY`, `SO`, `EN`, `TR`, `GI`, `MB` indicate program type (main, query, sort, entry, transaction, general interface, master batch).
- **Batch Scripts:** All build and test automation is handled via `.BAT` files. These may call external tools or compilers.
- **No Central README:** Documentation is distributed; conventions are inferred from file and script names.
- **Integration:** External dependencies are managed via batch scripts and executable tools (e.g., `BuildTableDef.exe`, `CHGCASE.EXE`).
- **Data Exchange:** Programs communicate via intermediate files, often with `.PRO`, `.WRK`, or `.TXT` extensions.

## Patterns and Examples
- To add a new business logic program, create a new `.CBL` file with the appropriate prefix and suffix, and update relevant batch scripts for build/test.
- To integrate with another module, use intermediate files and update batch scripts to include the new program in the workflow.
- For debugging, add `DISPLAY` statements in COBOL and rerun the relevant batch script.

## Key Files/Directories
- `COMPILE.BAT`, `COMPALL.BAT`, `TEST*.BAT`: Build and test automation
- `BuildTableDef.exe`, `RegenGS.BAT`: Code generation and table management
- All `.CBL` files: Source code, organized by business area
- Intermediate files: `.PRO`, `.WRK`, `.TXT` for data exchange

---
**Feedback Requested:**
- Are there undocumented workflows, naming conventions, or integration points that should be added?
- Is any part of the architecture or workflow unclear or incomplete?
- Please provide examples or corrections to improve these instructions.
