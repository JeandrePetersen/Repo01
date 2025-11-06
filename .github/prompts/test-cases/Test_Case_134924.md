# Test Case Document - PDR 134924
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
**PDR Number:** 134924  
**Program:** GENPJM (GL Journal Entry)  
**Developer:** ara  
**Date:** 22/10/25  
**Issue:** Custom forms saved incorrectly when Zero lines  

## 2. DOCUMENT HISTORY
Version 1.0 - Initial test case document

## 3. TABLE OF CONTENTS
1. DOCUMENT INFORMATION
2. DOCUMENT HISTORY
3. TABLE OF CONTENTS
4. GLOSSARY
5. PROGRAM LIST
6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT
7. TESTING THE CORRECTION IN TST ENVIRONMENT
8. REGRESSION TESTS
9. AUTOMATION TESTS

## 4. GLOSSARY
- **GL:** General Ledger
- **Custom Forms:** User-defined data entry fields in journal entries
- **Zero Lines:** Journal entries with no detail line items
- **PDR:** Program Development Request

## 5. PROGRAM LIST
- GENPJM.CBL - GL Journal Entry main program

## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT

### 6.1 DUP-134924-001
**Objective:** Reproduce custom forms saving incorrectly with zero lines  
**Preconditions:** 
- Access to GL Journal Entry module
- Custom forms configured for journals
- IMP environment available

**Steps:**
1. Navigate to GL Journal Entry
2. Create new journal entry
3. Add custom form data
4. Do not add any journal detail lines
5. Attempt to save the journal

**Expected Defect:** Custom form data saves incorrectly or becomes corrupted

### 6.2 DUP-134924-002
**Objective:** Verify issue with existing journals when lines are removed  
**Preconditions:**
- Existing journal with lines and custom forms
- Edit access to journals

**Steps:**
1. Open existing journal with lines and custom forms
2. Delete all journal detail lines
3. Modify custom form data
4. Save the journal

**Expected Defect:** Custom form changes not saved properly or data corruption occurs

## 7. TESTING THE CORRECTION IN TST ENVIRONMENT

### 7.1 TC-134924-001
**Objective:** Verify custom forms handle zero lines correctly after fix  
**Priority:** High  
**Preconditions:**
- TST environment with fix applied
- Custom forms enabled for GL journals
- User with journal entry permissions

**Test Steps:**
1. Create new GL journal entry
2. Enter journal header information
3. Add custom form data in available fields
4. Do not add any journal detail lines
5. Attempt to save journal

**Expected Result:** 
- System prevents saving with appropriate error message, OR
- System saves journal but handles custom forms correctly without corruption
- No data integrity issues occur

### 7.2 TC-134924-002
**Objective:** Test transition from lines to zero lines  
**Priority:** High  
**Preconditions:**
- Journal with existing lines and custom forms
- Edit permissions

**Test Steps:**
1. Open journal with existing lines and custom form data
2. Note current custom form values
3. Delete all journal detail lines
4. Modify custom form data
5. Save journal
6. Reopen journal to verify data persistence

**Expected Result:**
- Custom form data remains consistent
- No corruption or data loss occurs
- System maintains data integrity

### 7.3 TC-134924-003
**Objective:** Validate new invalid-ent flag functionality  
**Priority:** Medium  
**Preconditions:**
- Access to journal with debugging capabilities

**Test Steps:**
1. Create journal with custom forms but no lines
2. Verify invalid-ent flag is set appropriately
3. Add lines to journal
4. Verify invalid-ent flag updates correctly
5. Remove all lines again
6. Confirm flag behavior

**Expected Result:**
- invalid-ent flag correctly identifies zero-line state
- Flag updates appropriately when lines added/removed
- System behavior aligns with flag state

## 8. REGRESSION TESTS

### 8.1 REG-134924-001
**Objective:** Ensure normal custom forms functionality unaffected  
**Test Steps:**
1. Create journal with lines and custom forms
2. Save and modify journal multiple times
3. Verify all custom form features work normally

**Expected Result:** No regression in standard custom forms functionality

### 8.2 REG-134924-002
**Objective:** Verify journal workflows remain intact  
**Test Steps:**
1. Test complete journal entry workflow
2. Test authorization process
3. Test posting functionality
4. Verify reporting functions

**Expected Result:** All standard journal processes work without issues

### 8.3 REG-134924-003
**Objective:** Test custom forms with various journal types  
**Test Steps:**
1. Test custom forms with standard journals
2. Test with inter-company journals
3. Test with sub-module journals
4. Test with copied journals

**Expected Result:** Custom forms work correctly across all journal types

## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

### 9.1 AUTO-134924-001
**Test Name:** ValidateCustomFormsZeroLines  
**Objective:** Automated test for custom forms with zero lines
```typescript
// Pseudo-code for automation test
test('Custom forms with zero lines handling', async () => {
  // Navigate to GL Journal Entry
  // Create new journal
  // Add custom form data
  // Attempt save without lines
  // Verify appropriate handling
});
```

### 9.2 AUTO-134924-002
**Test Name:** CustomFormsDataIntegrity  
**Objective:** Automated validation of custom form data integrity
```typescript
// Pseudo-code for boundary testing
test('Custom forms data integrity validation', async () => {
  // Test various line count scenarios (0, 1, multiple)
  // Verify custom form data consistency
  // Test save/reload cycles
});
```