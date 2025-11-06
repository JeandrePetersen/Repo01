# Testers Checklist - PDR 134924
**GL Journal Entry - Custom Forms Zero Lines Fix**

---

## Document Information
- **PDR Number:** 134924
- **Program:** GENPJM.CBL
- **Module:** GL Journal Entry
- **Developer:** ara
- **Issue:** Custom forms saved incorrectly when Zero lines
- **Test Environment:** TST
- **Tester:** ________________
- **Test Start Date:** ________________
- **Test Completion Date:** ________________

---

## Pre-Test Setup Checklist

### Environment Verification
- [ ] TST environment is available and stable
- [ ] GENPJM program version 107a is deployed
- [ ] GL Journal Entry module is accessible
- [ ] Custom forms functionality is enabled
- [ ] Test database is available and configured

### Test Data Preparation
- [ ] Custom forms configured for GL journals
- [ ] Test GL accounts available for journal entries
- [ ] Sample journal templates prepared
- [ ] Various amount scenarios documented (zero, positive, negative)
- [ ] Custom form field types configured (text, numeric, date)

### Access and Permissions
- [ ] User access to GL Journal Entry confirmed
- [ ] Custom forms creation and editing permissions verified
- [ ] Journal entry creation and saving permissions confirmed
- [ ] Access to journal maintenance functions

---

## Defect Reproduction Checklist (IMP Environment)

### DUP-134924-001: Zero-Amount Lines Custom Form Corruption
- [ ] Navigate to GL Journal Entry
- [ ] Create new journal entry
- [ ] Enable custom forms for the journal
- [ ] Add custom form data (text, numeric, date fields)
- [ ] Add journal detail lines with 0.00 in both debit and credit columns
- [ ] Attempt to save journal
- [ ] **VERIFY:** Custom form data saves incorrectly or becomes corrupted
- [ ] Document exact nature of corruption observed
- [ ] Screenshot corruption evidence

### DUP-134924-002: Mixed Valid/Invalid Entries Issue
- [ ] Create journal entry with custom forms
- [ ] Add first line with valid debit amount (e.g., 100.00)
- [ ] Add custom form data for first line
- [ ] Add second line with zero amounts (0.00 debit, 0.00 credit)
- [ ] Add custom form data for second line
- [ ] Save journal
- [ ] **VERIFY:** Custom form data handling inconsistencies occur
- [ ] Document which entries are affected

---

## Fix Validation Checklist (TST Environment)

### TC-134924-001: Zero-Amount Detection and Prevention
**Priority: HIGH**
- [ ] Create new GL journal entry
- [ ] Add journal header information
- [ ] Add custom form data to journal
- [ ] Add detail line with debit = 0.00, credit = 0.00
- [ ] Save journal
- [ ] **VERIFY:** invalid-ent flag detects zero-amount line
- [ ] **VERIFY:** Custom form processing is skipped for zero-amount line
- [ ] **VERIFY:** No custom form data corruption occurs
- [ ] **VERIFY:** Data integrity is maintained
- [ ] Document validation behavior

### TC-134924-002: Mixed Valid/Invalid Entries Processing
**Priority: HIGH**
- [ ] Create journal entry
- [ ] Add Line 1: Debit = 100.00, Credit = 0.00 + custom forms
- [ ] Add Line 2: Debit = 0.00, Credit = 0.00 + custom forms  
- [ ] Add Line 3: Debit = 0.00, Credit = 50.00 + custom forms
- [ ] Save journal
- [ ] **VERIFY:** Custom forms processed for Lines 1 and 3 (valid)
- [ ] **VERIFY:** Custom forms skipped for Line 2 (invalid)
- [ ] **VERIFY:** No corruption in valid custom form entries
- [ ] **VERIFY:** invalid-ent flag behavior is correct
- [ ] Document processing results for each line

### TC-134924-003: Boundary Condition Validation
**Priority: MEDIUM**
- [ ] Test Scenario A: Debit = 0.00, Credit = 0.00
- [ ] **VERIFY:** Triggers invalid-ent flag = "Y"
- [ ] Test Scenario B: Debit = 0.01, Credit = 0.00
- [ ] **VERIFY:** Does NOT trigger invalid-ent flag (remains "N")
- [ ] Test Scenario C: Debit = 0.00, Credit = 0.01
- [ ] **VERIFY:** Does NOT trigger invalid-ent flag (remains "N")
- [ ] Test Scenario D: Debit = 0.001, Credit = 0.00 (if system allows)
- [ ] **VERIFY:** Boundary precision is correct
- [ ] Document exact boundary behavior

### TC-134924-004: Invalid-Ent Flag State Management
**Priority: MEDIUM**
- [ ] Monitor flag initialization (should be "N")
- [ ] Add valid entry, verify flag remains "N"
- [ ] Add invalid entry (zero amounts), verify flag becomes "Y"
- [ ] Add another valid entry, verify flag resets to "N"
- [ ] Add multiple invalid entries, verify flag behavior
- [ ] **VERIFY:** Flag initializes correctly
- [ ] **VERIFY:** Flag changes appropriately with entry validity
- [ ] **VERIFY:** Flag resets correctly for subsequent entries
- [ ] Document all state transitions observed

### TC-134924-005: Custom Form Field Types Validation
**Priority: MEDIUM**
- [ ] Test with text custom form fields
- [ ] Test with numeric custom form fields
- [ ] Test with date custom form fields
- [ ] Test with dropdown custom form fields
- [ ] Create zero-amount entries with each field type
- [ ] **VERIFY:** All custom form field types are protected from corruption
- [ ] **VERIFY:** Field type doesn't affect validation logic
- [ ] Document behavior for each field type

---

## Regression Testing Checklist

### REG-134924-001: Standard Custom Forms Functionality
- [ ] Create journal with valid entries (non-zero amounts)
- [ ] Add various custom form fields
- [ ] Save, edit, and retrieve custom form data
- [ ] **VERIFY:** All standard custom form features work normally
- [ ] **VERIFY:** No regression in field validation
- [ ] **VERIFY:** Custom form data persistence unchanged
- [ ] Document any unexpected changes

### REG-134924-002: Journal Entry Workflows
- [ ] Test complete journal creation workflow
- [ ] Test journal authorization process
- [ ] Test journal posting functionality
- [ ] Test journal copying and templates
- [ ] **VERIFY:** All standard journal processes work correctly
- [ ] **VERIFY:** No impact on authorization workflows
- [ ] **VERIFY:** Posting functionality unaffected
- [ ] Document workflow integrity

### REG-134924-003: Zero Line Handling (Historical)
- [ ] Create journals without custom forms but with zero-amount lines
- [ ] Test existing zero line discarding logic (version 009)
- [ ] **VERIFY:** Historical zero line processing works correctly
- [ ] **VERIFY:** No unintended interference with existing logic
- [ ] **VERIFY:** Version 009 functionality preserved
- [ ] Document compatibility with historical features

### REG-134924-004: Performance Impact Assessment
- [ ] Time journal creation with custom forms (before/after fix)
- [ ] Time journal saving operations with mixed entries
- [ ] Monitor system resource usage during processing
- [ ] **VERIFY:** No significant performance degradation
- [ ] **VERIFY:** Processing time remains acceptable
- [ ] **VERIFY:** Memory usage patterns unchanged
- [ ] Document performance observations

---

## Data Integrity Validation Checklist

### Data Persistence Testing
- [ ] Create journal with zero-amount entries and custom forms
- [ ] Save journal and close application
- [ ] Reopen journal and verify custom form data state
- [ ] **VERIFY:** No corrupted data persisted to database
- [ ] **VERIFY:** Valid custom forms remain intact
- [ ] **VERIFY:** Invalid entries properly excluded
- [ ] Document data persistence behavior

### Database Validation
- [ ] Query custom form tables directly after test scenarios
- [ ] Verify no orphaned or corrupted custom form records
- [ ] Check referential integrity between journal and custom form data
- [ ] **VERIFY:** Database remains clean and consistent
- [ ] **VERIFY:** No invalid relationships created
- [ ] Document database state verification

---

## Edge Case Testing Checklist

### Complex Scenarios
- [ ] Test journal with many lines (mix of valid/invalid)
- [ ] Test journal with all zero-amount lines
- [ ] Test journal with alternating valid/invalid entries
- [ ] Test editing existing journal to create zero amounts
- [ ] Test copying journal with zero-amount entries
- [ ] **VERIFY:** Complex scenarios handled correctly
- [ ] **VERIFY:** System remains stable with edge cases
- [ ] Document edge case behavior

### Error Handling
- [ ] Test system behavior with corrupted custom form data
- [ ] Test recovery from invalid-ent flag errors
- [ ] Test journal save failures during custom form processing
- [ ] **VERIFY:** Graceful error handling implemented
- [ ] **VERIFY:** User receives appropriate feedback
- [ ] **VERIFY:** System recovers properly from errors
- [ ] Document error handling effectiveness

---

## Test Completion Checklist

### Documentation Requirements
- [ ] All test cases executed and results documented
- [ ] Screenshots captured for key validation scenarios
- [ ] invalid-ent flag behavior thoroughly documented
- [ ] Performance impact assessment completed
- [ ] Any defects found logged with detailed reproduction steps
- [ ] Test results summarized with clear recommendations

### Validation Summary
- [ ] invalid-ent flag works correctly in all scenarios
- [ ] Custom form data corruption prevented
- [ ] Zero-amount detection accurate and precise
- [ ] No regression in existing functionality
- [ ] Performance impact acceptable
- [ ] Data integrity maintained

### Sign-off Criteria
- [ ] All HIGH priority test cases passed
- [ ] No critical or blocking defects identified
- [ ] Regression testing completed successfully
- [ ] Data integrity validation completed
- [ ] Performance assessment shows acceptable impact

### Final Verification
- [ ] Fix resolves original custom form corruption issue
- [ ] invalid-ent flag implementation is robust and reliable
- [ ] No new defects introduced
- [ ] GL Journal Entry functionality improved as intended
- [ ] Ready for production deployment

---

## Test Results Summary

### Defects Found
| Defect ID | Severity | Description | Status |
|-----------|----------|-------------|---------|
| | | | |
| | | | |
| | | | |

### Test Execution Summary
- **Total Test Cases:** ___
- **Passed:** ___
- **Failed:** ___
- **Blocked:** ___
- **Not Executed:** ___

### Invalid-Ent Flag Validation Results
- **Flag Initialization:** PASS/FAIL
- **Zero-Amount Detection:** PASS/FAIL  
- **State Transitions:** PASS/FAIL
- **Boundary Validation:** PASS/FAIL

### Custom Form Protection Results
- **Corruption Prevention:** PASS/FAIL
- **Data Integrity:** PASS/FAIL
- **Field Type Coverage:** PASS/FAIL
- **Database Consistency:** PASS/FAIL

### Recommendations
- [ ] **APPROVE** for production deployment
- [ ] **CONDITIONAL APPROVAL** (specify conditions)
- [ ] **REJECT** (specify blocking issues)

**Comments:**
_________________________________________________
_________________________________________________
_________________________________________________

### Sign-off
**Tester Name:** ________________  
**Date:** ________________  
**Signature:** ________________

**QA Lead Approval:** ________________  
**Date:** ________________