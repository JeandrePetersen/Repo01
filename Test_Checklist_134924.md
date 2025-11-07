# Testers Checklist - PDR 134924
**GENPJM - Custom Forms Saved Incorrectly When Zero Lines**

---

## Document Information
- **PDR Number:** 134924
- **Program:** GENPJM.CBL (GL Journal Entry)
- **Module:** General Ledger Journal Entry
- **Developer:** ara
- **Issue:** Custom forms saved incorrectly when zero amount lines present
- **Test Environment:** TST
- **Tester:** ________________
- **Test Start Date:** ________________
- **Test Completion Date:** ________________

---

## Pre-Test Setup Checklist

### Environment Verification
- [ ] TST environment is available and stable
- [ ] GENPJM program version 107a is deployed  
- [ ] Custom form configuration is properly set up
- [ ] GL Journal Entry module is accessible and functional
- [ ] Database tables (GENJND, custom form tables) are available

### Test Data Preparation
- [ ] Sample journal entries with various amount combinations prepared
- [ ] Custom form field definitions configured for journal details
- [ ] Test GL accounts and ledger codes available
- [ ] Zero-amount and non-zero amount test scenarios planned
- [ ] Boundary value test data prepared (0.00, 0.01, -0.01)

### Access and Permissions
- [ ] GL Journal Entry access confirmed
- [ ] Custom form configuration access verified
- [ ] Journal creation and modification permissions validated
- [ ] Database query access for verification testing
- [ ] Test environment login credentials validated

---

## Defect Reproduction Checklist (IMP Environment)

### DUP-134924-001: Custom Forms Saved with Zero Amount Lines
- [ ] Navigate to GL Journal Entry (GENPJM)
- [ ] Create new journal entry with header information
- [ ] Add multiple journal lines including zero-amount lines (0.00 debit, 0.00 credit)
- [ ] Enter custom form data for all lines including zero-amount lines
- [ ] Save the journal entry
- [ ] **VERIFY:** Custom form data incorrectly saved for zero-amount lines (defect behavior)
- [ ] Document specific error behavior observed
- [ ] Screenshot defect for reference

### DUP-134924-002: Data Association Verification  
- [ ] Query journal detail records with custom form data
- [ ] Identify journal lines with zero amounts in both debit and credit
- [ ] Check custom form associations for these zero-amount lines
- [ ] **VERIFY:** Zero-amount lines have incorrect custom form data associations
- [ ] Document data corruption evidence

---

## Fix Validation Checklist (TST Environment)

### TC-134924-001: Zero Amount Line Custom Form Handling
**Priority: HIGH**
- [ ] Access GL Journal Entry via TST environment
- [ ] Create new journal entry with complete header information
- [ ] Add first line with valid debit amount (e.g., 100.00 debit, 0.00 credit)
- [ ] Add second line with zero amounts (0.00 debit, 0.00 credit)  
- [ ] Add third line with valid credit amount (0.00 debit, 100.00 credit)
- [ ] Enter custom form data for all three lines
- [ ] Save journal entry successfully
- [ ] **VERIFY:** Custom form data saved only for lines 1 and 3 (non-zero amounts)
- [ ] **VERIFY:** Line 2 (zero amounts) has no custom form data saved
- [ ] **VERIFY:** No system errors during save process
- [ ] Document successful validation results

### TC-134924-002: Edit Existing Journal with Zero Lines
**Priority: HIGH**  
- [ ] Open existing journal entry for modification
- [ ] Note current custom form data associations
- [ ] Add new journal line with zero debit and credit amounts
- [ ] Enter custom form data for the new zero-amount line
- [ ] Save journal modifications
- [ ] **VERIFY:** New zero-amount line does not retain custom form data
- [ ] **VERIFY:** Existing non-zero lines maintain their custom form data
- [ ] **VERIFY:** No data corruption in existing custom form associations
- [ ] Document modification results

### TC-134924-003: Boundary Value Testing
**Priority: MEDIUM**
- [ ] Create journal entry with comprehensive boundary value scenarios:
  - [ ] Line with 0.00 debit, 0.00 credit
  - [ ] Line with 0.01 debit, 0.00 credit
  - [ ] Line with 0.00 debit, 0.01 credit  
  - [ ] Line with -0.01 debit, 0.00 credit
  - [ ] Line with 0.00 debit, -0.01 credit
- [ ] Enter custom form data for all boundary value lines
- [ ] Save journal entry
- [ ] **VERIFY:** Only true zero-amount lines (0.00/0.00) skip custom form saving
- [ ] **VERIFY:** All other boundary values save custom form data normally
- [ ] Document boundary behavior results

### TC-134924-004: Custom Form Data Cleanup
**Priority: MEDIUM**
- [ ] Create journal with existing custom form data
- [ ] Modify journal to include zero-amount lines
- [ ] Verify custom form deletion process works correctly
- [ ] **VERIFY:** Previously saved custom form data is properly cleaned up
- [ ] **VERIFY:** No orphaned custom form records remain
- [ ] **VERIFY:** Data integrity maintained throughout cleanup process
- [ ] Document cleanup process effectiveness

---

## Regression Testing Checklist

### REG-134924-001: Core Journal Entry Functionality  
- [ ] Create standard journal entry without custom forms
- [ ] Test journal posting functionality
- [ ] Test journal authorization workflows
- [ ] Test journal printing capabilities
- [ ] **VERIFY:** No impact on core journal functionality
- [ ] **VERIFY:** All standard workflows function normally
- [ ] **VERIFY:** No performance degradation observed
- [ ] Document regression test results

### REG-134924-002: Custom Forms with Non-Zero Lines
- [ ] Create journal entry with all non-zero amount lines
- [ ] Enter custom form data for all lines
- [ ] Save and retrieve journal entry
- [ ] **VERIFY:** All custom form data retained correctly
- [ ] **VERIFY:** Custom form validation works normally
- [ ] **VERIFY:** No changes to existing custom form behavior for valid entries
- [ ] Document normal functionality preservation

### REG-134924-003: Journal Management Operations
- [ ] Test journal copying functionality with custom forms
- [ ] Test journal deletion and cleanup processes
- [ ] Test journal modification workflows
- [ ] Test journal inquiry and reporting functions
- [ ] **VERIFY:** All journal management operations work correctly
- [ ] **VERIFY:** Custom form data handled appropriately in all operations
- [ ] Document operation test results

---

## Performance and Stability Checklist

### Performance Testing
- [ ] Time journal creation with custom forms before and after fix
- [ ] Monitor system response during custom form processing
- [ ] **VERIFY:** No significant performance degradation (< 5%)
- [ ] **VERIFY:** Custom form validation doesn't cause delays  
- [ ] **VERIFY:** Database operations remain efficient
- [ ] Document performance metrics

### Stability Testing
- [ ] Create multiple journals with various custom form scenarios
- [ ] Process high volume of journal entries with custom forms
- [ ] **VERIFY:** No system crashes or freezing
- [ ] **VERIFY:** Memory usage remains stable
- [ ] **VERIFY:** No database connection issues
- [ ] Document stability observations

---

## Data Integrity Verification Checklist

### Database Validation
- [ ] Query GENJND table for test journal entries
- [ ] Verify custom form table associations
- [ ] Check for orphaned custom form records
- [ ] **VERIFY:** Data relationships are correct
- [ ] **VERIFY:** No data corruption in journal or custom form tables
- [ ] **VERIFY:** Foreign key relationships maintained
- [ ] Document data integrity status

### Cross-Reference Testing  
- [ ] Verify custom form data displays correctly in journal inquiry
- [ ] Check custom form data in journal reports
- [ ] Test custom form data in journal copying scenarios
- [ ] **VERIFY:** Data consistency across all access methods
- [ ] **VERIFY:** Custom form data accurately reflects journal line associations
- [ ] Document cross-reference validation results

---

## User Experience Validation Checklist

### Usability Testing
- [ ] Navigate through complete journal creation workflow
- [ ] **VERIFY:** Custom form entry process is intuitive
- [ ] **VERIFY:** Clear indication when custom form data is not saved for zero lines
- [ ] **VERIFY:** No confusing error messages or behavior
- [ ] **VERIFY:** User workflow remains efficient
- [ ] Document user experience observations

### Error Handling
- [ ] Test various error scenarios with custom forms and zero amounts
- [ ] **VERIFY:** Appropriate error messages displayed when needed
- [ ] **VERIFY:** Error messages are clear and actionable
- [ ] **VERIFY:** Users can recover gracefully from error situations
- [ ] Document error handling effectiveness

---

## Test Completion Checklist

### Documentation Requirements
- [ ] All test cases executed and results documented
- [ ] Screenshots captured for key validation scenarios
- [ ] Any issues found logged with detailed descriptions
- [ ] Test results summarized with clear conclusions
- [ ] Recommendations provided for production deployment

### Sign-off Criteria
- [ ] All HIGH priority test cases passed
- [ ] No blocking defects identified
- [ ] Regression testing completed successfully
- [ ] Data integrity validation passed
- [ ] Performance impact within acceptable limits

### Final Verification
- [ ] Fix resolves original issue (custom forms with zero lines)
- [ ] No new defects introduced by the fix
- [ ] Custom form functionality improved as intended
- [ ] Core journal functionality preserved
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

### Custom Form Validation Results
- **Zero-amount line handling:** PASS/FAIL
- **Non-zero amount line handling:** PASS/FAIL  
- **Data integrity verification:** PASS/FAIL
- **Boundary value testing:** PASS/FAIL
- **Regression testing:** PASS/FAIL

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