# Test Plan for PDR 134924
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
User Azure DevOps profile: QA Tester, Quality Assurance Analyst

## 2. DOCUMENT HISTORY
Version 1.0 - Initial test plan for PDR 134924 Custom forms saved incorrectly when Zero lines

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
**Risk:** Medium - Data integrity issue with custom forms affecting journal entry accuracy

## 5. SYNOPSIS
Version 107a (22/10/25) by developer 'ara' fixes PDR 134924 where custom forms were being incorrectly saved for journal entry lines that have zero amounts in both debit and credit fields. The fix introduces validation logic that checks for zero amounts before processing custom form data, preventing incorrect data storage while maintaining functionality for valid entries.

## 6. PROGRAM LIST
- **GENPJM.CBL** - Main GL Journal Entry program with custom forms processing logic
- **Custom forms processing routines** - Logic for handling user-defined fields
- **GENJND table operations** - Journal detail record management
- **Invalid entry detection logic** - New validation for zero-amount entries

## 7. FEATURES TO BE TESTED
- Custom forms validation and saving logic for zero-amount journal lines
- Invalid entry detection and flagging mechanism
- Custom form deletion process for zero-amount entries  
- Mixed scenario handling (valid and invalid entries in same journal)
- Custom forms processing workflow integration
- Data integrity verification for custom forms storage

## 8. FEATURES NOT TO BE TESTED
- Standard journal entry workflows for non-zero amounts (unchanged)
- Basic custom forms functionality for valid entries (regression only)
- Journal posting and authorization processes (unchanged)
- Currency calculations and conversions (unchanged)
- Standard reporting and printing functions (unchanged)
- Inter-company journal processing (unchanged)

## 9. APPROACH

### ISTQB Software Testing Techniques

**Boundary Value Analysis:**
- **Technique:** Test boundary conditions for amount values (zero, positive, negative)
- **Explanation:** Validate custom forms behavior at the exact boundary where amounts equal zero versus non-zero values

**Equivalence Partitioning:**
- **Technique:** Partition journal entries by amount validity categories
- **Explanation:** Group test scenarios into valid amounts, zero amounts, and mixed combinations to ensure comprehensive coverage

**Decision Table Testing:**
- **Technique:** Create decision tables for debit/credit amount combinations
- **Explanation:** Test all logical combinations of zero/non-zero debit and credit amounts with custom forms

### Test Approaches

**Data-Driven Testing:**
- **Description:** Use multiple datasets with various amount combinations
- **Explanation:** Create comprehensive test data covering all scenarios of zero/non-zero debit and credit combinations

**State-Based Testing:**
- **Description:** Test different journal entry states with custom forms
- **Explanation:** Validate custom forms behavior across journal creation, saving, and posting states

**Negative Testing:**
- **Description:** Test invalid scenarios and error conditions
- **Explanation:** Verify proper handling of edge cases and invalid data combinations

### Functional Areas

**Functional Suitability:** Fix appropriately addresses custom forms data integrity issue without affecting other journal functionality.

**Functional Correctness:** Code correctly identifies zero-amount entries and prevents custom form data persistence for invalid entries.

**Functional Accuracy:** Validation logic accurately detects zero amounts in both debit and credit fields before custom form processing.

**Functional Interoperability:** Changes maintain compatibility with existing journal workflows and custom forms infrastructure.

**Functional Completeness:** Solution completely addresses the PDR requirements for preventing incorrect custom forms saving on zero-amount lines.

## 10. ITEMS PASS/FAIL CRITERIA

**PASS CRITERIA:**
- Custom forms are NOT saved for journal lines with zero debit AND zero credit amounts
- Custom forms ARE saved normally for journal lines with at least one non-zero amount
- No regression in standard journal entry functionality
- No impact on custom forms functionality for valid entries
- System performance remains acceptable

**FAIL CRITERIA:**
- Custom forms are saved for zero-amount lines (original defect persists)
- Custom forms fail to save for valid amount entries (regression)
- System errors or crashes during journal processing
- Data corruption in custom forms or journal data
- Significant performance degradation

## 11. SUSPENSION/RESUMPTION CRITERIA

**SUSPENSION CRITERIA:**
- Critical system errors preventing journal entry access
- Data corruption detected in test environment
- More than 50% of test cases failing due to environment issues

**RESUMPTION CRITERIA:**
- Environment issues resolved and validated
- Test data restored to clean state
- System functionality confirmed stable

## 12. TESTING TASKS

### Manual Test Cases

**Primary Test Scenarios:**
1. **Zero Amount Custom Forms** - Verify custom forms not saved for lines with zero debit and credit
2. **Mixed Entry Scenarios** - Test journals with combination of valid and zero-amount lines
3. **Boundary Testing** - Test various zero/non-zero amount combinations
4. **Regression Validation** - Ensure standard functionality unchanged

**Previous Events Integration:**
- **Version 009 Compatibility** - Verify zero line discarding functionality still works
- **Version 065 Integration** - Ensure basic custom forms functionality preserved  
- **Version 071 Compatibility** - Confirm year/period dropdown functionality intact

### Regression Testing Focus Areas:
- Standard journal entry workflows
- Custom forms for valid amount entries
- Journal posting and authorization
- Data integrity and persistence

## 13. ENVIRONMENT
- **Development Environment:** IMP - For defect reproduction
- **Test Environment:** TST - For fix validation  
- **Configuration:** Custom forms enabled, standard GL setup
- **Data Requirements:** Test journals with various amount combinations

## 14. RESPONSIBILITIES
- **TESTER:** QA Team Lead
- **DEVELOPER:** ara (Version 107a implementer)
- **BUSINESS ANALYST:** Financial Systems Analyst
- **SIGN-OFF:** GL Module Owner

## 15. SCHEDULE (PROJECT EVENTS)
- **Test Planning:** 1 day
- **Test Case Development:** 2 days  
- **Defect Reproduction:** 1 day
- **Fix Validation:** 3 days
- **Regression Testing:** 2 days
- **Test Completion & Sign-off:** 1 day
- **Total Estimated Duration:** 10 working days