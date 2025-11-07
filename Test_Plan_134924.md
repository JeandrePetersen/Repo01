# Test Plan Document - PDR 134924
**GENPJM - Custom Forms Saved Incorrectly When Zero Lines**

Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
User Azure DevOps profile: QA Lead, Quality Assurance Manager

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
15. SCHEDULE

## 4. DEVELOPMENT QUADRANT
**Risk Level:** Medium

## 5. SYNOPSIS

**Developer Synopsis:** Custom forms saved incorrectly when Zero lines (PDR 134924)

**Code Changes Analysis:** 
The fix addresses an issue where custom form fields were being incorrectly saved and associated with journal entry lines that contain zero amounts in both debit and credit fields. The solution implements validation to detect zero-amount lines and prevents custom form data from being saved for these invalid entries, while ensuring proper cleanup of previously saved custom form data.

## 6. PROGRAM LIST

**Primary Program:**
- GENPJM.CBL (GL Journal Entry) - Version 107a dated 22/10/25

**Related Components:**
- GENJND (General Journal Detail file structure)
- Custom Form framework components
- Journal entry validation routines

**Code Changes Summary:**
The implementation adds validation logic to check debit and credit amounts before processing custom form data, ensuring only lines with actual monetary values retain their custom form associations.

## 7. FEATURES TO BE TESTED

**Primary Features:**
- Custom form field saving functionality for journal entries
- Zero-amount line detection and validation
- Custom form data cleanup and deletion processes
- Journal entry line validation with custom forms
- Data association integrity between journal lines and custom forms

**Secondary Features:**
- Journal modification workflows with custom forms
- Custom form field validation and error handling
- Journal copying functionality with custom form data
- Performance impact of additional validation logic

## 8. FEATURES NOT TO BE TESTED

**Out of Scope:**
- Core journal posting functionality (unchanged by this fix)
- Standard journal entry workflows without custom forms
- Journal authorization and approval processes (unaffected)
- Currency conversion and multi-currency handling
- Inter-company journal functionality
- Journal printing and reporting (unless custom form related)
- User access control and security features

## 9. APPROACH

### 9.1 ISTQB Software Testing Techniques

**Equivalence Partitioning:**
- **Technique:** Partition journal line amounts into valid (non-zero) and invalid (zero) equivalence classes
- **Explanation:** Test custom form behavior systematically by dividing input data into meaningful groups based on amount values

**Boundary Value Analysis:**
- **Technique:** Test boundary conditions around zero amounts (0.00, 0.01, -0.01)
- **Explanation:** Verify the system correctly identifies true zero amounts and handles edge cases near the zero boundary

**Decision Table Testing:**
- **Technique:** Create comprehensive decision tables for debit/credit amount combinations
- **Explanation:** Systematically test all possible combinations of zero and non-zero debit/credit amounts to ensure complete logic coverage

**State Transition Testing:**
- **Technique:** Test journal entry states with and without custom form data
- **Explanation:** Verify correct transitions between states when custom form data is added, modified, or removed

### 9.2 Test Approaches

**Risk-Based Testing:**
- **Description:** Prioritize testing based on the risk of custom form data corruption
- **Explanation:** Focus testing efforts on scenarios most likely to cause data integrity issues or user impact

**Data-Driven Testing:**
- **Description:** Test with comprehensive data sets covering various amount combinations
- **Explanation:** Create systematic test data matrices to ensure thorough coverage of amount scenarios and custom form configurations

**Negative Testing:**
- **Description:** Test error scenarios and invalid input conditions
- **Explanation:** Verify system handles edge cases gracefully and provides appropriate error messages when custom form processing encounters issues

**Regression Testing:**
- **Description:** Comprehensive testing of existing functionality
- **Explanation:** Ensure the fix doesn't introduce new issues in core journal entry or custom form functionality

### 9.3 Functional Areas

**Functional Suitability:** ≤50 words
The fix ensures custom form functionality is suitable for its intended purpose by preventing inappropriate data associations with zero-amount journal lines, maintaining data integrity standards.

**Functional Correctness:** ≤50 words  
Zero-amount line detection accurately identifies invalid entries and prevents custom form data corruption, ensuring correct behavior according to business requirements.

**Functional Accuracy:** ≤50 words
Custom form data associations are now precisely limited to journal lines with actual monetary values, eliminating false data relationships and improving accuracy.

**Functional Interoperability:** ≤50 words
Changes maintain full compatibility with existing journal entry workflows, custom form frameworks, and related system components without disrupting integration points.

**Functional Completeness:** ≤50 words
The solution provides comprehensive handling of zero-amount scenarios in custom form processing, addressing all identified edge cases and validation requirements.

## 10. ITEMS PASS/FAIL CRITERIA

**PASS CRITERIA:**
- Custom form data is NOT saved for journal lines with zero debit AND zero credit amounts
- Custom form data IS correctly saved for journal lines with non-zero amounts  
- Existing custom form data for valid lines remains intact during journal modifications
- No regression issues in core journal entry functionality
- Performance impact is within acceptable limits (< 5% degradation)
- All boundary value tests pass (0.00, 0.01, -0.01 scenarios)

**FAIL CRITERIA:**
- Custom form data saved for any zero-amount journal lines
- Loss of custom form data for valid non-zero amount lines
- System errors or crashes during custom form processing
- Significant performance degradation (> 5%)
- Data corruption in journal or custom form tables
- Any regression failures in core functionality

## 11. SUSPENSION/RESUMPTION CRITERIA

**SUSPENSION CRITERIA:**
- Critical system instability preventing test execution
- Database corruption affecting test data integrity
- Blocking defects that prevent core functionality testing
- Test environment unavailability for extended periods

**RESUMPTION CRITERIA:**
- System stability restored and verified
- Test environment fully functional and accessible
- All blocking defects resolved and verified
- Test data restored to known good state

## 12. TESTING TASKS

### 12.1 Manual Test Cases

**TC-001: Zero Amount Line Validation**
- **Preconditions:** GL Journal Entry accessible, custom forms configured
- **Scenario:** User creates journal entry with lines containing zero debit and credit amounts, enters custom form data for all lines including zero-amount lines
- **Expected Result:** System saves custom form data only for non-zero amount lines, zero-amount lines are excluded from custom form processing

**TC-002: Mixed Amount Line Processing**  
- **Preconditions:** Access to journal entry with custom form capability
- **Scenario:** User creates journal with combination of zero-amount and valid amount lines, enters custom form data for all lines, saves journal
- **Expected Result:** Custom form data persists only for lines with actual monetary values, providing clear data integrity

**TC-003: Journal Modification Impact**
- **Preconditions:** Existing journal with custom form data, modification permissions
- **Scenario:** User modifies existing journal by adding zero-amount lines and entering custom form data, saves changes
- **Expected Result:** New zero-amount lines do not retain custom form data, existing valid line data remains unchanged

**TC-004: Boundary Value Verification**
- **Preconditions:** Journal entry capability with custom forms enabled
- **Scenario:** User creates journal lines with boundary amounts (0.00, 0.01, -0.01) in various debit/credit combinations, enters custom form data
- **Expected Result:** Only true zero-amount lines (0.00 debit AND 0.00 credit) exclude custom form data, all other combinations save data normally

### 12.2 Previous Events Linked to This Event

**Related Version History:**
- Version 065: Initial custom forms implementation in GL Journal Entry
- Version 023a: Custom form status handling and validation enhancements  
- Any intermediate versions affecting custom form data processing

**Historical Test Cases:**
- **TC-HIST-001:** Verify custom form deletion functionality from version 065 remains intact
- **TC-HIST-002:** Confirm custom form field validation from version 023a continues to function properly
- **TC-HIST-003:** Ensure backward compatibility with journals created before this fix implementation

## 13. ENVIRONMENT

**Test Environment:** TST (Test)
**System Requirements:** SYSPRO ERP with GL module enabled
**Database:** Test database with custom form tables configured
**Access Requirements:** GL Journal Entry permissions, custom form configuration access
**Test Data:** Sample journal entries with various amount combinations

## 14. RESPONSIBILITIES

**TESTER:** QA Team Member  
**DEVELOPER:** ara (PDR 134924 implementer)
**QA LEAD:** QA Manager
**BUSINESS ANALYST:** GL Module SME

## 15. SCHEDULE (PROJECT EVENTS)

**Planning Phase:** Test plan creation and review
**Setup Phase:** Test environment preparation and data setup
**Execution Phase:** Test case execution and defect tracking
**Reporting Phase:** Results analysis and sign-off documentation
**Target Completion:** Within development sprint timeline