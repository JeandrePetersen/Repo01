# Test Plan - PDR 134924
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
**PDR Number:** 134924  
**Program:** GENPJM.CBL  
**Module:** GL Journal Entry  
**Developer:** ara  
**Issue Date:** 22/10/25  

## 2. DOCUMENT HISTORY
Version 1.0 - Initial test plan for custom forms zero lines fix

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
15. SCHEDULE

## 4. DEVELOPMENT QUADRANT
**Risk Level:** Medium

The fix addresses a data integrity issue with custom forms when journal entries have zero lines. While not critical to core functionality, it affects data quality and user experience.

## 5. SYNOPSIS
**Developer Synopsis:** Custom forms saved incorrectly when Zero lines

**Code Analysis:** The fix introduces an `invalid-ent` flag to track when journal entries are in an invalid state (zero lines). This prevents custom form data from being saved incorrectly or becoming corrupted when users attempt to save journals without any detail lines.

**Change Context:** This addresses a data integrity issue where the system would attempt to persist custom form data even when journal entries were incomplete (no detail lines), leading to inconsistent or corrupted form information.

## 6. PROGRAM LIST
- **GENPJM.CBL** - Main GL Journal Entry program
  - Version 107a changes: Added `invalid-ent` flag for zero-line validation
  - Related to custom forms processing and journal validation

## 7. FEATURES TO BE TESTED
- Custom forms functionality with zero journal lines
- Journal entry validation for incomplete entries
- Data integrity preservation for custom forms
- Save functionality behavior with empty journals
- Transition scenarios (adding/removing all lines)
- Custom form data persistence and retrieval
- Error handling for invalid journal states
- User workflow when creating journals without lines

## 8. FEATURES NOT TO BE TESTED
- Standard journal posting functionality
- Authorization workflows for complete journals
- Multi-currency journal features
- Inter-company journal processing
- Standard journal templates and copying
- Journal reporting and printing
- GL account validation and lookups
- Period and year validation (unchanged functionality)

## 9. APPROACH

### ISTQB Testing Techniques

**Technique:** Boundary Value Analysis  
**Explanation:** Test the critical boundary of zero journal lines to ensure custom forms behave correctly at this edge case where the system transitions from valid to invalid states.

**Technique:** Equivalence Partitioning  
**Explanation:** Partition test scenarios into two classes: valid journals (with lines) and invalid journals (without lines) to verify different system behaviors and custom form handling.

**Technique:** Error Guessing  
**Explanation:** Focus on scenarios where users might accidentally create incomplete journals and attempt operations, based on typical user error patterns.

**Technique:** State Transition Testing  
**Explanation:** Test transitions between journal states (empty → populated → empty) to verify custom form data integrity throughout state changes.

### Test Approaches

**Description:** Negative Testing  
**Explanation:** Systematically test scenarios where journals are in invalid states (zero lines) to verify proper error handling and data protection mechanisms.

**Description:** Data Integrity Testing  
**Explanation:** Verify that custom form data remains consistent and uncorrupted across all journal state transitions, with particular focus on zero-line scenarios.

**Description:** User Workflow Testing  
**Explanation:** Test complete user journeys from journal creation through custom form entry to final save operations, covering various line count scenarios.

**Description:** Regression Testing  
**Explanation:** Ensure existing custom form functionality remains unaffected while validating the new zero-line handling capability.

### Functional Areas Assessment

**Functional Suitability:** Enhancement appropriately addresses custom form saving issues when journals lack detail lines, improving overall system reliability and data quality.

**Functional Correctness:** New validation mechanism should correctly identify invalid journal states and prevent inappropriate custom form data persistence in zero-line scenarios.

**Functional Accuracy:** System should accurately detect zero-line conditions and handle associated custom form operations with precision, maintaining data accuracy.

**Functional Interoperability:** Changes should maintain compatibility with existing GL modules, custom form processors, and related journal entry systems without disruption.

**Functional Completeness:** Solution provides comprehensive handling for zero-line scenarios while preserving all existing custom form capabilities and user workflows.

## 10. ITEMS PASS/FAIL CRITERIA

### PASS CRITERIA
- Custom forms handle zero-line scenarios without data corruption
- System appropriately prevents or manages saving of incomplete journals
- Data integrity maintained across all journal state transitions
- No regression in existing custom form functionality
- User workflows remain intuitive and functional
- Error messages are clear and actionable when appropriate

### FAIL CRITERIA
- Custom form data becomes corrupted in zero-line scenarios
- System allows saving of inconsistent journal states
- Data loss occurs during journal state transitions
- Existing custom form features are broken or degraded
- User unable to complete valid journal entry workflows
- System crashes or produces unhandled errors

## 11. SUSPENSION/RESUMPTION CRITERIA

### SUSPENSION CRITERIA
- Critical data corruption issues discovered
- System instability affecting test environment
- Dependencies on other modules become unavailable
- Blocking defects prevent meaningful test execution

### RESUMPTION CRITERIA
- All blocking issues resolved and verified
- Test environment restored to stable state
- Required test data and configurations available
- Development team confirms fix readiness for testing

## 12. TESTING TASKS

### Manual Test Cases

**Test Case TC-001: Zero Lines Custom Forms**
- **Preconditions:** User has GL journal access with custom forms enabled
- **Scenario:** Create new journal, add custom form data, but add no detail lines, then save
- **Expected Result:** System handles custom forms appropriately without corruption or data loss

**Test Case TC-002: Line Removal Impact**
- **Preconditions:** Existing journal with lines and custom form data
- **Scenario:** Remove all journal lines while custom form data exists, then save changes
- **Expected Result:** Custom form data integrity maintained throughout the process

**Test Case TC-003: State Transition Validation**
- **Preconditions:** Journal entry capability with custom forms
- **Scenario:** Create journal, add lines and custom forms, remove all lines, add lines again
- **Expected Result:** Custom form data remains consistent through all state changes

### Previous Events Analysis

**Related Historical Issues:**
- **Version 065:** "Add custom forms to the grid" - Original implementation
- **Version 023a:** "Custom forms (023a)" - Extended functionality  
- **Version 082:** "Unable to add custom fields on the grid" - Field addition issues

**Historical Test Cases:**
- **TC-065-001:** Verify custom forms can be properly added and saved with valid journal configurations
- **TC-023a-001:** Validate custom forms functionality across different journal types and scenarios
- **TC-082-001:** Ensure custom fields can be successfully added to journal grids without issues

## 13. ENVIRONMENT
- **Development Environment:** IMP - For defect reproduction
- **Test Environment:** TST - For fix validation and regression testing  
- **Requirements:** SYSPRO GL module with custom forms enabled
- **Test Data:** Sample journals with and without detail lines, custom form configurations

## 14. RESPONSIBILITIES
- **TESTER:** QA Team Member (To be assigned)
- **DEVELOPER:** ara (Primary developer for PDR 134924)
- **BUSINESS ANALYST:** Subject Matter Expert for GL Journal Entry
- **TEST COORDINATOR:** QA Lead for GL module testing

## 15. SCHEDULE (PROJECT EVENTS)
- **Test Plan Review:** [To be scheduled]
- **Test Case Execution Start:** [Upon TST environment deployment]
- **Regression Testing:** [Following initial test completion]
- **Sign-off Target:** [Based on test results and issue resolution]
- **Production Deployment:** [Subject to successful test completion]