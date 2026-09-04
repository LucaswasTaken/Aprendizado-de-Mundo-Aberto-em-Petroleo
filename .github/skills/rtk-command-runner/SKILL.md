---
name: rtk-command-runner
description: "Run terminal commands through rtk.exe when it is installed, with an automatic direct-command fallback when it is unavailable. Use for builds, tests, formatters, scripts, and other commands where arguments and the wrapped command's exit code must be preserved."
argument-hint: "Command and arguments to run"
---

# RTK Command Runner

Use this skill whenever a terminal command needs to be executed.

## Procedure

1. Pass the command name as the first argument to [run-with-rtk.ps1](./scripts/run-with-rtk.ps1).
2. Pass every original command argument after it, unchanged and in the original order.
3. Run the wrapper with PowerShell using `-NoProfile`.
4. Treat the wrapper's exit code as the command's exit code. Do not replace a failing exit code with success.
5. Report the original command and its output normally.

Examples:

```powershell
powershell -NoProfile -File .\.github\skills\rtk-command-runner\scripts\run-with-rtk.ps1 python3.14 -m ruff format .
powershell -NoProfile -File .\.github\skills\rtk-command-runner\scripts\run-with-rtk.ps1 pytest tests/test_spec_structure.py -q
powershell -NoProfile -File .\.github\skills\rtk-command-runner\scripts\run-with-rtk.ps1 powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\new-feature.ps1 -Name <feature-name> -Kind service
```

Do not build a single command string or parse and rejoin arguments. The wrapper receives the command and arguments as separate PowerShell arguments so quoting, spaces, and option values remain intact.

## Fallback Behavior

The wrapper checks `Get-Command rtk.exe -ErrorAction SilentlyContinue`. When found, it invokes `rtk.exe proxy <original-command> <original-arguments>`, the RTK passthrough mode for arbitrary commands. When not found, it invokes the original command directly. In both cases it exits with the native process exit code.
