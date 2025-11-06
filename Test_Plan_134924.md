# Test Plan - PDR 134924# Test Plan - PDR 134924

Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.



This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.



## 1. DOCUMENT INFORMATION## 1. DOCUMENT INFORMATION

**PDR Number:** 134924  **PDR Number:** 134924  

**Program:** GENPJM.CBL  **Program:** GENPJM.CBL  

**Module:** GL Journal Entry  **Module:** GL Journal Entry  

**Developer:** ara  **Developer:** ara  

**Issue Date:** 22/10/25  **Issue Date:** 22/10/25  



## 2. DOCUMENT HISTORY## 2. DOCUMENT HISTORY

Version 1.0 - Initial test plan for custom forms zero lines fixVersion 1.0 - Initial test plan for custom forms zero lines fix



## 3. TABLE OF CONTENTS## 3. TABLE OF CONTENTS

1. DOCUMENT INFORMATION1. DOCUMENT INFORMATION

2. DOCUMENT HISTORY2. DOCUMENT HISTORY

3. TABLE OF CONTENTS3. TABLE OF CONTENTS

4. DEVELOPMENT QUADRANT4. DEVELOPMENT QUADRANT

5. SYNOPSIS5. SYNOPSIS

6. PROGRAM LIST6. PROGRAM LIST

7. FEATURES TO BE TESTED7. FEATURES TO BE TESTED

8. FEATURES NOT TO BE TESTED8. FEATURES NOT TO BE TESTED

9. APPROACH9. APPROACH

10. ITEMS PASS/FAIL CRITERIA10. ITEMS PASS/FAIL CRITERIA

11. SUSPENSION/RESUMPTION CRITERIA11. SUSPENSION/RESUMPTION CRITERIA

12. TESTING TASKS12. TESTING TASKS

13. ENVIRONMENT13. ENVIRONMENT

14. RESPONSIBILITIES14. RESPONSIBILITIES

15. SCHEDULE15. SCHEDULE



## 4. DEVELOPMENT QUADRANT## 4. DEVELOPMENT QUADRANT

**Risk Level:** Medium**Risk Level:** Medium



This fix addresses a data integrity issue with custom forms when journal entries contain zero-amount lines. While it affects data quality and user experience, the core GL functionality remains unchanged, resulting in moderate risk.The fix addresses a data integrity issue with custom forms when journal entries have zero lines. While not critical to core functionality, it affects data quality and user experience.



## 5. SYNOPSIS## 5. SYNOPSIS

**Developer Synopsis:** Custom forms saved incorrectly when Zero lines**Developer Synopsis:** Custom forms saved incorrectly when Zero lines



**Code Analysis:** The fix introduces an `invalid-ent` validation flag that detects when journal detail lines have zero amounts in both debit and credit columns. When such invalid entries are detected, the system prevents custom form data from being processed, avoiding data corruption. The solution includes proper state management of the validation flag and selective custom form processing based on entry validity.**Code Analysis:** The fix introduces an `invalid-ent` flag to track when journal entries are in an invalid state (zero lines). This prevents custom form data from being saved incorrectly or becoming corrupted when users attempt to save journals without any detail lines.



**Change Context:** This resolves a data integrity issue where custom form data was being saved incorrectly when associated with journal entries that had no meaningful financial amounts. Users creating journals with zero-amount lines would experience custom form data corruption, leading to inconsistent or invalid form information being persisted in the system.**Change Context:** This addresses a data integrity issue where the system would attempt to persist custom form data even when journal entries were incomplete (no detail lines), leading to inconsistent or corrupted form information.



## 6. PROGRAM LIST## 6. PROGRAM LIST

- **GENPJM.CBL** - Main GL Journal Entry program- **GENPJM.CBL** - Main GL Journal Entry program

  - Version 107a changes: Added `invalid-ent` flag and zero-amount validation logic  - Version 107a changes: Added `invalid-ent` flag for zero-line validation

  - Enhanced custom form processing to skip invalid entries  - Related to custom forms processing and journal validation

  - Improved data integrity for custom form persistence

## 7. FEATURES TO BE TESTED

## 7. FEATURES TO BE TESTED- Custom forms functionality with zero journal lines

- Zero-amount journal line detection and validation- Journal entry validation for incomplete entries

- invalid-ent flag initialization and state management- Data integrity preservation for custom forms

- Custom form processing with zero-amount entries- Save functionality behavior with empty journals

- Data integrity preservation for custom forms- Transition scenarios (adding/removing all lines)

- Mixed valid/invalid entry scenarios- Custom form data persistence and retrieval

- Boundary condition validation for amount detection- Error handling for invalid journal states

- Custom form data persistence and retrieval- User workflow when creating journals without lines

- Entry validation during save operations

- State transitions of validation flag## 8. FEATURES NOT TO BE TESTED

- Standard journal posting functionality

## 8. FEATURES NOT TO BE TESTED- Authorization workflows for complete journals

- Standard journal posting functionality (unchanged)- Multi-currency journal features

- Authorization workflows- Inter-company journal processing

- Multi-currency journal processing- Standard journal templates and copying

- Inter-company journal handling- Journal reporting and printing

- Standard journal templates and copying- GL account validation and lookups

- Journal reporting and inquiry functions- Period and year validation (unchanged functionality)

- GL account validation

- Period validation (existing functionality)## 9. APPROACH

- Non-custom form journal entry processing

### ISTQB Testing Techniques

## 9. APPROACH

**Technique:** Boundary Value Analysis  

### ISTQB Testing Techniques**Explanation:** Test the critical boundary of zero journal lines to ensure custom forms behave correctly at this edge case where the system transitions from valid to invalid states.



**Technique:** Boundary Value Analysis  **Technique:** Equivalence Partitioning  

**Explanation:** Test at the exact boundary of zero amounts to ensure validation correctly identifies invalid entries when both debit and credit are precisely zero.**Explanation:** Partition test scenarios into two classes: valid journals (with lines) and invalid journals (without lines) to verify different system behaviors and custom form handling.



**Technique:** Equivalence Partitioning  **Technique:** Error Guessing  

**Explanation:** Partition test scenarios into valid entries (non-zero amounts) and invalid entries (zero amounts in both columns) to verify different processing behaviors.**Explanation:** Focus on scenarios where users might accidentally create incomplete journals and attempt operations, based on typical user error patterns.



**Technique:** Decision Table Testing  **Technique:** State Transition Testing  

**Explanation:** Create decision tables covering all combinations of debit/credit amounts (zero/non-zero) and custom form presence to validate processing logic.**Explanation:** Test transitions between journal states (empty → populated → empty) to verify custom form data integrity throughout state changes.



**Technique:** State Transition Testing  ### Test Approaches

**Explanation:** Test the `invalid-ent` flag transitions through various states as entries change from valid to invalid and back.

**Description:** Negative Testing  

### Test Approaches**Explanation:** Systematically test scenarios where journals are in invalid states (zero lines) to verify proper error handling and data protection mechanisms.



**Description:** Data Integrity Testing  **Description:** Data Integrity Testing  

**Explanation:** Systematically verify that custom form data remains consistent and uncorrupted across all scenarios involving zero-amount journal entries.**Explanation:** Verify that custom form data remains consistent and uncorrupted across all journal state transitions, with particular focus on zero-line scenarios.



**Description:** Negative Testing  **Description:** User Workflow Testing  

**Explanation:** Focus on scenarios where journal entries are invalid (zero amounts) to ensure proper error handling and prevention of data corruption.**Explanation:** Test complete user journeys from journal creation through custom form entry to final save operations, covering various line count scenarios.



**Description:** State-Based Testing  **Description:** Regression Testing  

**Explanation:** Validate the `invalid-ent` flag behavior through various state changes and ensure consistent behavior throughout the entry processing lifecycle.**Explanation:** Ensure existing custom form functionality remains unaffected while validating the new zero-line handling capability.



**Description:** Boundary Testing  ### Functional Areas Assessment

**Explanation:** Test precise boundary conditions where amounts transition between zero and non-zero values to verify validation accuracy and flag behavior.

**Functional Suitability:** Enhancement appropriately addresses custom form saving issues when journals lack detail lines, improving overall system reliability and data quality.

### Functional Areas Assessment

**Functional Correctness:** New validation mechanism should correctly identify invalid journal states and prevent inappropriate custom form data persistence in zero-line scenarios.

**Functional Suitability:** Enhancement appropriately addresses custom form data corruption issues when journal entries contain zero-amount lines, improving data quality.

**Functional Accuracy:** System should accurately detect zero-line conditions and handle associated custom form operations with precision, maintaining data accuracy.

**Functional Correctness:** Validation logic correctly identifies invalid entries and prevents inappropriate custom form processing in zero-amount scenarios without false positives.

**Functional Interoperability:** Changes should maintain compatibility with existing GL modules, custom form processors, and related journal entry systems without disruption.

**Functional Accuracy:** System accurately detects zero-amount conditions using precise validation and handles custom form data with accuracy, maintaining integrity.

**Functional Completeness:** Solution provides comprehensive handling for zero-line scenarios while preserving all existing custom form capabilities and user workflows.

**Functional Interoperability:** Changes maintain full compatibility with existing GL journal functionality and custom form processing systems without disruption.

## 10. ITEMS PASS/FAIL CRITERIA

**Functional Completeness:** Solution provides comprehensive handling for zero-amount scenarios while preserving all existing custom form capabilities and user workflows.

### PASS CRITERIA

## 10. ITEMS PASS/FAIL CRITERIA- Custom forms handle zero-line scenarios without data corruption

- System appropriately prevents or manages saving of incomplete journals

### PASS CRITERIA- Data integrity maintained across all journal state transitions

- invalid-ent flag correctly identifies zero-amount entries- No regression in existing custom form functionality

- Custom form processing skipped appropriately for invalid entries- User workflows remain intuitive and functional

- Custom form data integrity maintained for valid entries- Error messages are clear and actionable when appropriate

- No corruption of custom form data in zero-amount scenarios

- Flag state transitions work correctly throughout processing### FAIL CRITERIA

- Boundary validation performs accurately at zero amounts- Custom form data becomes corrupted in zero-line scenarios

- No regression in existing custom form functionality- System allows saving of inconsistent journal states

- Mixed valid/invalid entry scenarios handled correctly- Data loss occurs during journal state transitions

- Existing custom form features are broken or degraded

### FAIL CRITERIA- User unable to complete valid journal entry workflows

- Custom form data becomes corrupted with zero-amount entries- System crashes or produces unhandled errors

- invalid-ent flag fails to detect zero-amount conditions

- Valid entries incorrectly flagged as invalid## 11. SUSPENSION/RESUMPTION CRITERIA

- System allows custom form corruption to occur

- Flag state management fails or becomes inconsistent### SUSPENSION CRITERIA

- Performance degradation in journal entry processing- Critical data corruption issues discovered

- Existing custom form features are broken or degraded- System instability affecting test environment

- Dependencies on other modules become unavailable

## 11. SUSPENSION/RESUMPTION CRITERIA- Blocking defects prevent meaningful test execution



### SUSPENSION CRITERIA### RESUMPTION CRITERIA

- Critical data corruption issues discovered during testing- All blocking issues resolved and verified

- System instability affecting journal entry functionality- Test environment restored to stable state

- invalid-ent flag logic completely fails validation- Required test data and configurations available

- Blocking defects prevent meaningful custom form testing- Development team confirms fix readiness for testing

- Dependencies on custom form processing become unavailable

## 12. TESTING TASKS

### RESUMPTION CRITERIA

- All blocking data integrity issues resolved and verified### Manual Test Cases

- Test environment restored to stable operational state

- Custom form processing systems available and functional**Test Case TC-001: Zero Lines Custom Forms**

- invalid-ent flag logic confirmed working correctly- **Preconditions:** User has GL journal access with custom forms enabled

- Development team confirms fix readiness for comprehensive testing- **Scenario:** Create new journal, add custom form data, but add no detail lines, then save

- **Expected Result:** System handles custom forms appropriately without corruption or data loss

## 12. TESTING TASKS

**Test Case TC-002: Line Removal Impact**

### Manual Test Cases- **Preconditions:** Existing journal with lines and custom form data

- **Scenario:** Remove all journal lines while custom form data exists, then save changes

**Test Case TC-001: Zero-Amount Line Detection**- **Expected Result:** Custom form data integrity maintained throughout the process

- **Preconditions:** GL Journal Entry access with custom forms enabled

- **Scenario:** Create journal with lines having zero amounts in both debit and credit columns, add custom form data**Test Case TC-003: State Transition Validation**

- **Expected Result:** invalid-ent flag detects zero amounts and prevents custom form processing, maintaining data integrity- **Preconditions:** Journal entry capability with custom forms

- **Scenario:** Create journal, add lines and custom forms, remove all lines, add lines again

**Test Case TC-002: Mixed Valid/Invalid Entries**- **Expected Result:** Custom form data remains consistent through all state changes

- **Preconditions:** Journal entry capability with custom forms and multiple line entry

- **Scenario:** Create journal with combination of valid entries (non-zero amounts) and invalid entries (zero amounts)### Previous Events Analysis

- **Expected Result:** Custom forms processed only for valid entries, invalid entries skipped without affecting valid data

**Related Historical Issues:**

**Test Case TC-003: Flag State Management**- **Version 065:** "Add custom forms to the grid" - Original implementation

- **Preconditions:** Development access to monitor flag states during processing- **Version 023a:** "Custom forms (023a)" - Extended functionality  

- **Scenario:** Create various journal entries and monitor invalid-ent flag state changes through processing lifecycle- **Version 082:** "Unable to add custom fields on the grid" - Field addition issues

- **Expected Result:** Flag properly initializes, transitions correctly based on entry validity, and maintains consistent state

**Historical Test Cases:**

**Test Case TC-004: Boundary Validation**- **TC-065-001:** Verify custom forms can be properly added and saved with valid journal configurations

- **Preconditions:** Journal entry with custom forms and precise amount control- **TC-023a-001:** Validate custom forms functionality across different journal types and scenarios

- **Scenario:** Test entries with exact zero amounts (0.00) versus very small amounts (0.01) in debit and credit columns- **TC-082-001:** Ensure custom fields can be successfully added to journal grids without issues

- **Expected Result:** Only true zero amounts trigger invalid flag, any non-zero amount allows custom form processing

## 13. ENVIRONMENT

### Previous Events Analysis- **Development Environment:** IMP - For defect reproduction

- **Test Environment:** TST - For fix validation and regression testing  

**Related Historical Issues:**- **Requirements:** SYSPRO GL module with custom forms enabled

- **Version 065:** "Add custom forms to th grid" - Original custom forms implementation- **Test Data:** Sample journals with and without detail lines, custom form configurations

- **Version 023:** "Custom forms (023a)" - Extended custom forms functionality  

- **Version 082:** "Unable to add custom fields on the grid" - Custom field processing issues## 14. RESPONSIBILITIES

- **Version 009:** "Discard zero lines on save" - Zero line handling logic- **TESTER:** QA Team Member (To be assigned)

- **DEVELOPER:** ara (Primary developer for PDR 134924)

**Historical Test Cases:**- **BUSINESS ANALYST:** Subject Matter Expert for GL Journal Entry

- **TC-065-001:** Validate custom forms can be properly added and saved with valid journal line amounts- **TEST COORDINATOR:** QA Lead for GL module testing

- **TC-023a-001:** Test custom forms functionality across different journal types and configurations

- **TC-082-001:** Ensure custom fields can be properly processed and saved in grid structures## 15. SCHEDULE (PROJECT EVENTS)

- **TC-009-001:** Verify zero line discarding logic works correctly with enhanced custom form processing- **Test Plan Review:** [To be scheduled]

- **Test Case Execution Start:** [Upon TST environment deployment]

## 13. ENVIRONMENT- **Regression Testing:** [Following initial test completion]

- **Development Environment:** IMP - For defect reproduction and initial validation- **Sign-off Target:** [Based on test results and issue resolution]

- **Test Environment:** TST - For comprehensive fix validation and regression testing  - **Production Deployment:** [Subject to successful test completion]
- **Requirements:** SYSPRO GL module with custom forms enabled, journal entry access
- **Test Data:** Sample journals with various amount combinations, custom form configurations

## 14. RESPONSIBILITIES
- **TESTER:** QA Team Member (To be assigned)
- **DEVELOPER:** ara (Primary developer for PDR 134924)
- **BUSINESS ANALYST:** GL module subject matter expert
- **DATA SPECIALIST:** Custom forms configuration expert
- **TEST COORDINATOR:** QA Lead for GL module testing

## 15. SCHEDULE (PROJECT EVENTS)
- **Test Plan Review:** [To be scheduled upon completion]
- **Test Case Execution Start:** [Upon TST environment deployment with fix]
- **Data Integrity Testing:** [Primary focus phase for custom form validation]
- **Boundary Testing:** [Detailed validation of zero-amount detection]
- **Regression Testing:** [Following successful primary testing]
- **Flag State Validation:** [Specialized testing of invalid-ent flag behavior]
- **Sign-off Target:** [Based on successful test completion and data integrity validation]
- **Production Deployment:** [Subject to successful test validation and approval]