# Test Plan — GENPJM.CBL (PDR 134924)

## Change Summary
Fixes issue with saving custom forms when journal entry has zero lines.

## Risk Level
Low

## Potential Issues
- Edge cases with custom forms and line count may still exist.
- Unintended impact on journal save workflow.

## Test Cases
### Test Case 1
**Preconditions:** User has access to GL Journal Entry and custom forms are enabled.
**Scenario:** Create a new journal entry with zero lines and attempt to save custom forms.
**Expected Result:** Custom forms are saved correctly without errors.

### Test Case 2
**Preconditions:** Existing journal entry with lines; user removes all lines before saving.
**Scenario:** Save the journal and custom forms.
**Expected Result:** Custom forms are still saved correctly.

### Test Case 3 (Regression)
**Preconditions:** Journal entry with custom forms and lines.
**Scenario:** Save after printing from Excel.
**Expected Result:** Save button enables and custom forms are saved.

### Test Case 4 (Regression)
**Preconditions:** Journal entry is authorized.
**Scenario:** Save the journal.
**Expected Result:** Journal remains authorized and custom forms are saved.

## Edge Cases
- Saving custom forms after deleting all lines.
- Saving with mixed line states.

## Regression Areas
- Custom form saving logic.
- Journal entry save workflow.

## Recommended Automation
Automate tests for saving custom forms with zero and non-zero lines.

## Scope Definition
**Features to Be Tested:**
- Saving custom forms when journal entry has zero lines.
- Saving custom forms after removing all lines from an existing journal.

**Features Not to Be Tested:**
- Journal posting, authorization, or other unrelated features.
- Custom forms with non-zero lines (unless affected by the change).

## ISTQB Software Testing Techniques
**Boundary Value Analysis:** Test saving custom forms at the boundary condition (zero lines) to ensure correct handling.
**Error Guessing:** Attempt to save custom forms in unusual scenarios (e.g., after deleting all lines) to uncover hidden issues.

## Test Approaches
**Manual Functional Testing:** Manually verify that custom forms are saved correctly when there are zero lines.
**Regression Testing:** Ensure that previous functionality for saving custom forms with lines is unaffected.

## Functional Areas
**Functional Suitability:** Ensures custom forms can be saved in all valid journal entry scenarios.
**Functional Correctness:** Fixes a bug where custom forms were not saved with zero lines.
**Functional Accuracy:** Custom forms are now reliably saved regardless of journal line count.
**Functional Interoperability:** No impact on integration with other modules.
**Functional Completeness:** Addresses all cases for saving custom forms in journal entries.

## Potential Tables Changed
**GENJND (Journal Detail):** Custom form fields, line count indicators
**GENJNC (Journal Control):** Custom form status, save flags

## Previous Events Linked to This Event
- 106: Save button enabling after printing from Excel
- 105: Journal authorization and save logic
- 065: Add custom forms to the grid

### Suggested Test Cases for Previous Versions
**Test Case 3**
Preconditions: Journal entry with custom forms and lines.
Scenario: Save after printing from Excel.
Expected Result: Save button enables and custom forms are saved.

**Test Case 4**
Preconditions: Journal entry is authorized.
Scenario: Save the journal.
Expected Result: Journal remains authorized and custom forms are saved.
