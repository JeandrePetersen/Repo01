# Test Plan Template

## 1. DOCUMENT INFORMATION
User Azure DevOps profile Jeandre Petersen, QA Analyst

## 2. DOCUMENT HISTORY
<Version 1.0>

## 3. TABLE OF CONTENTS
1. DOCUMENT INFORMATION
2. DOCUMENT HISTORY
3. TABLE OF CONTENTS
4. DEVELOPMENT QUADRANT
5. SYNOPSIS
6. PROGRAM LIST
7. FEATURES TO BE TESTED
8. FEATURES NOT TO BE TESTED
9. APPROACH
10. ITEMS PASS/FAIL CRITERIA
11. SUSPENSION/RESUMPTION CRITERIA
12. TESTING TASKS
13. ENVIRONMENT
14. RESPONSIBILITIES
15. SCHEDULE (PROJECT EVENTS)

## 4. DEVELOPMENT QUADRANT
Risk: **Low**

## 5. SYNOPSIS
**Developer Synopsis:** PDR 134924 - Custom forms saved incorrectly when Zero lines

**Code Analysis:** The latest change addresses an issue where custom forms were not being saved correctly if there were zero lines present in the journal entry. This fix ensures that even when no lines are entered, custom forms are handled properly.

**Context:** This update improves reliability for users who work with custom forms in the GL Journal Entry program, especially in cases where journals may not have any lines entered.

## 6. PROGRAM LIST
**Program:** GENPJM.CBL (GL Journal Entry)

**Code Review (Layman Terms):**
- **What the code does:** Fixes a bug where custom forms would not save properly when a journal entry has no detail lines
- **Alignment with developer synopsis:** The code change directly addresses the described issue with custom forms and zero lines
- **Broader explanation:** Users can now reliably save custom form data even when their journal entries don't contain any transaction lines, improving the overall user experience and data integrity

## 7. FEATURES TO BE TESTED
- Saving custom forms when journal entry has zero lines
- Saving custom forms after removing all lines from an existing journal
- Custom form data persistence in zero-line scenarios
- Journal save functionality with custom forms enabled

## 8. FEATURES NOT TO BE TESTED
- Journal posting, authorization, or other unrelated features
- Custom forms with non-zero lines (unless affected by the change)
- Standard journal functionality without custom forms
- Inter-company journal processing
- Dimension analysis features

## 9. APPROACH

### ISTQB Software Testing Techniques

**Technique:** Boundary Value Analysis  
**Explanation:** Test saving custom forms at the boundary condition (zero lines) to ensure correct handling of edge cases.

**Technique:** Error Guessing  
**Explanation:** Attempt to save custom forms in unusual scenarios (e.g., after deleting all lines) to uncover hidden issues based on experience with similar defects.

### Test Approaches

**Description:** Manual Functional Testing  
**Explanation:** Manually verify that custom forms are saved correctly when there are zero lines through systematic test case execution.

**Description:** Regression Testing  
**Explanation:** Ensure that previous functionality for saving custom forms with lines is unaffected by the bug fix.

### Functional Areas

**Functional Suitability:** Ensures custom forms can be saved in all valid journal entry scenarios.

**Functional Correctness:** Fixes a bug where custom forms were not saved with zero lines.

**Functional Accuracy:** Custom forms are now reliably saved regardless of journal line count.

**Functional Interoperability:** No impact on integration with other modules.

**Functional Completeness:** Addresses all cases for saving custom forms in journal entries.

## 10. ITEMS PASS/FAIL CRITERIA

**PASS CRITERIA:**
- Custom forms save successfully when journal has zero lines
- Custom form data is retained after save operation
- No errors or exceptions occur during save process
- Journal can be reopened with custom form data intact

**FAIL CRITERIA:**
- Custom forms fail to save with zero lines
- Custom form data is lost during save operation
- System errors or crashes occur
- Data corruption in custom form fields

## 11. SUSPENSION/RESUMPTION CRITERIA

**SUSPENSION CRITERIA:**
- Test environment unavailable
- Critical blocking defects discovered
- Required test data not available

**RESUMPTION CRITERIA:**
- Test environment restored and validated
- Blocking defects resolved
- Test data requirements met

## 12. TESTING TASKS

### Suggested Manual Test Cases

**Test Case 1**  
**Preconditions:** User has access to GL Journal Entry and custom forms are enabled.  
**Scenario:** Create a new journal entry with zero lines and attempt to save custom forms.  
**Expected Result:** Custom forms are saved correctly without errors.

**Test Case 2**  
**Preconditions:** Existing journal entry with lines; user removes all lines before saving.  
**Scenario:** Save the journal and custom forms.  
**Expected Result:** Custom forms are still saved correctly.

### Previous Events Linked to This Event

**Related Previous Versions:**
- 106: Save button enabling after printing from Excel
- 105: Journal authorization and save logic  
- 065: Add custom forms to the grid

**Test Case 3 (Regression)**  
**Preconditions:** Journal entry with custom forms and lines.  
**Scenario:** Save after printing from Excel.  
**Expected Result:** Save button enables and custom forms are saved.

**Test Case 4 (Regression)**  
**Preconditions:** Journal entry is authorized.  
**Scenario:** Save the journal.  
**Expected Result:** Journal remains authorized and custom forms are saved.

### Potential Tables Changed
- **GENJND (Journal Detail):** Custom form fields, line count indicators
- **GENJNC (Journal Control):** Custom form status, save flags

## 13. ENVIRONMENT
- SYSPRO ERP Test Environment
- GL Journal Entry Module
- Custom Forms enabled
- Test database with appropriate permissions

## 14. RESPONSIBILITIES
**TESTER:** Jeandre Petersen  
**DEVELOPER:** ara (134924)

## 15. SCHEDULE (PROJECT EVENTS)
- Test Plan Creation: November 6, 2025
- Test Execution: TBD
- Defect Resolution: TBD
- Test Completion: TBD