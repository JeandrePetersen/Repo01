# Test Plan Template
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
User Azure DevOps profile: QA Tester, Quality Assurance Analyst

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
Risk: **Medium**

## 5. SYNOPSIS
**Latest Version (107a - 22/10/25):** Custom forms saved incorrectly when Zero lines (PDR 134924)
**Previous Version (107 - 27/08/25):** GL Post Previous Years functionality (F3070, PDR 133470)

The system has been enhanced to properly handle custom form data when journal entries contain zero-value lines. Previously, the system would incorrectly save custom form information for journal lines with zero debit and credit amounts, leading to data inconsistencies. The fix ensures that custom forms are only processed and saved for valid journal entries (those with actual monetary amounts) while properly cleaning up previously saved custom form data.

Additionally, the system now supports posting journals to previous years (2-5 years back) with appropriate authorization controls and dimension analysis handling.

## 6. PROGRAM LIST
**Code Review (Layman Terms)**

The latest changes address a data integrity issue in the GL Journal Entry system. When users create journal entries, they can add custom form fields to capture additional information. However, the system was previously saving this custom form data even for journal lines that had zero amounts in both debit and credit fields.

The code now includes:
- A validation flag (`invalid-ent`) to identify journal lines with zero amounts
- Logic to skip custom form processing for zero-value entries
- Enhanced cleanup procedures to remove previously saved custom form data before saving new data
- Proper handling of mixed valid and invalid journal lines

The changes align with the developer's intent to prevent data corruption and improve system reliability by ensuring custom forms are only associated with meaningful journal entries.

## 7. FEATURES TO BE TESTED
- Custom form field validation and saving logic for journal entries
- Zero-amount line detection and exclusion from custom form processing
- Custom form data cleanup and deletion procedures
- Journal entry validation with mixed line types (valid and zero amounts)
- Previous year posting functionality (2-5 years back)
- Dimension analysis processing for previous year transactions
- Authorization controls for previous year journals
- Data integrity for custom form tables
- Journal saving and updating with custom forms

## 8. FEATURES NOT TO BE TESTED
- Standard journal posting for current year without custom forms
- Basic custom form functionality without zero-amount lines
- Standard dimension analysis for current year transactions
- Unrelated journal types and workflows (not affected by changes)
- General ledger account validation and setup
- Currency and exchange rate processing
- Standard authorization workflows (not impacted by changes)

## 9. APPROACH

### ISTQB Software Testing Techniques

**Technique:** Boundary Value Analysis
**Explanation:** Test custom form processing at critical boundaries - exactly zero amounts, very small positive/negative amounts (0.01), and normal amounts to ensure proper threshold detection and handling.

**Technique:** Equivalence Partitioning
**Explanation:** Partition journal lines into equivalence classes: valid entries (non-zero amounts), invalid entries (zero amounts), and edge cases to systematically test different processing paths.

**Technique:** State Transition Testing
**Explanation:** Test the state changes of custom form data as journal lines are created, modified, and deleted with various amount combinations, ensuring proper state management.

**Technique:** Decision Table Testing
**Explanation:** Create decision tables covering combinations of zero/non-zero amounts, custom form presence/absence, and previous year posting flags to ensure all logical combinations are tested.

### Test Approaches

**Description:** Data-Driven Testing
**Explanation:** Create comprehensive test datasets with various combinations of zero and non-zero journal lines, different custom form configurations, and multiple year scenarios to systematically verify all processing paths.

**Description:** Regression Testing
**Explanation:** Execute existing custom form and journal processing test suites to ensure the zero-line fix and previous year functionality don't break previously working features.

**Description:** Integration Testing
**Explanation:** Test the interaction between custom form processing, journal validation, database persistence, dimension analysis, and authorization systems to ensure seamless integration.

**Description:** Negative Testing
**Explanation:** Deliberately create scenarios with invalid data combinations, malformed custom forms, and boundary violations to ensure robust error handling.

### Functional Areas

**Functional Suitability:** The system correctly identifies and processes only valid journal entries for custom form data storage, improving data accuracy and preventing unnecessary data persistence for zero-value transactions.

**Functional Correctness:** Custom form validation logic properly distinguishes between valid and invalid journal lines based on amount criteria, ensuring accurate data processing and maintaining referential integrity.

**Functional Accuracy:** The system maintains data integrity by preventing custom form data association with zero-value journal entries while preserving valid custom form relationships and cleanup procedures.

**Functional Interoperability:** The changes maintain compatibility with existing journal posting workflows, dimension analysis systems, previous year processing, and authorization controls without disrupting established integrations.

**Functional Completeness:** All custom form processing scenarios are addressed, including creation, modification, deletion, and validation of custom form data across various journal line configurations and year scenarios.

## 10. ITEMS PASS/FAIL CRITERIA

**PASS CRITERIA:**
- Custom form data is only saved for journal lines with non-zero debit or credit amounts
- Zero-amount journal lines do not have associated custom form records in the database
- Previously saved custom form data is properly cleaned up when journals are modified
- Mixed journals (valid and zero lines) process correctly with appropriate custom form handling
- Previous year journals (2-5 years back) post successfully with proper authorization
- No data corruption or orphaned custom form records exist after processing
- System performance remains acceptable with the additional validation logic

**FAIL CRITERIA:**
- Custom form data is saved for zero-amount journal lines
- Data corruption occurs in custom form tables
- Previously working custom form functionality is broken
- System crashes or hangs during journal processing
- Authorization controls fail for previous year posting
- Database integrity constraints are violated
- Significant performance degradation occurs

## 11. SUSPENSION/RESUMPTION CRITERIA

**SUSPENSION CRITERIA:**
- Critical system crashes preventing journal processing
- Data corruption detected in live database tables
- Security vulnerabilities discovered in authorization logic
- Performance degradation exceeding 50% of baseline
- More than 25% of test cases failing

**RESUMPTION CRITERIA:**
- All critical defects resolved and verified
- System stability restored and confirmed
- Database integrity validated and confirmed
- Performance meets acceptable thresholds
- Test environment fully functional and available

## 12. TESTING TASKS

### Suggested Manual Test Cases

**Test Case TC-107a-001: Custom Forms with Zero Amount Lines**
- **Preconditions:** GL Journal Entry screen is accessible with custom forms enabled for journal detail lines
- **Scenario:** Create a new journal entry with multiple lines including some with zero debit and credit amounts, enter custom form data for all lines including zero-amount lines
- **Expected Result:** Custom form data should only be saved for lines with non-zero amounts; zero-amount lines should not have associated custom form data in the database

**Test Case TC-107a-002: Custom Forms Data Cleanup**
- **Preconditions:** An existing journal with saved custom form data exists in the system
- **Scenario:** Edit the journal by changing some lines to zero amounts and modifying custom forms on existing non-zero lines
- **Expected Result:** Custom form data for lines changed to zero amounts should be removed; modified custom form data for valid lines should be updated correctly

**Test Case TC-107a-003: Mixed Valid and Invalid Lines**
- **Preconditions:** GL Journal Entry system with custom forms functionality enabled
- **Scenario:** Create a journal with alternating valid (non-zero) and invalid (zero) amount lines, populate custom forms for all lines, then save the journal
- **Expected Result:** Only valid lines should retain custom form data; journal should save successfully without errors or data integrity issues

**Test Case TC-107a-004: Custom Form Validation Edge Cases**
- **Preconditions:** Custom forms configured with various field types (text, numeric, date) on journal lines
- **Scenario:** Enter journal lines with amounts like 0.00, 0.01, -0.01, and populate complex custom form data
- **Expected Result:** Lines with exactly 0.00 amounts should not save custom forms; lines with 0.01 amounts should save custom forms correctly

**Test Case TC-107-005: Previous Year Journal Processing**
- **Preconditions:** GL system configured to allow previous year posting (F3070 enabled), user has appropriate authorization
- **Scenario:** Create and post a journal entry for a year that is 2-5 years prior to the current year
- **Expected Result:** Journal should process correctly with appropriate authorization checks and dimension analysis handling

### Previous Events Linked to This Event

**Related Version 106 (133692):** Save button enabling issues after Excel printing
**Related Version 105 (132493):** Journal authorization state management after saving
**Related Version 104/103 (132311/131815):** Dimension tagging for multiple journal processing

**Test Case TC-REG-106: Save Button State with Custom Forms**
- **Preconditions:** Journal with custom forms and Excel printing capability enabled
- **Scenario:** Create journal with mixed zero/non-zero lines, print to Excel, then attempt to save
- **Expected Result:** Save button should remain properly enabled; custom forms should process correctly without interfering with save functionality

**Test Case TC-REG-105: Authorization State After Custom Form Processing**
- **Preconditions:** Journal authorization enabled in system, journal with custom forms exists
- **Scenario:** Create authorized journal with custom forms, save with zero-amount lines present
- **Expected Result:** Journal authorization state should remain unchanged; custom form processing should not affect authorization status

**Test Case TC-REG-104: Dimension Analysis with Custom Forms**
- **Preconditions:** Dimension analysis enabled, multiple journals in processing queue
- **Scenario:** Process multiple journals with custom forms and zero lines without exiting the system
- **Expected Result:** Dimension analysis should work correctly for all journals; custom form processing should not interfere with dimension tagging

## 13. ENVIRONMENT
- Test Environment: SYSPRO Test (TST) Environment
- Database: SQL Server with GL module installed
- Custom Forms: Enabled and configured for GENJND table
- Authorization: GL Journal authorization enabled
- Previous Year Posting: F3070 feature enabled
- Dimension Analysis: F3010 project features enabled

## 14. RESPONSIBILITIES
**TESTER:** QA Analyst Team
**DEVELOPER:** ara (Version 107a), lch (Version 107)

## 15. SCHEDULE (PROJECT EVENTS)
- Test Plan Review: [Date TBD]
- Test Case Execution Start: [Date TBD]
- Regression Testing: [Date TBD] 
- Test Completion: [Date TBD]
- Sign-off: [Date TBD]