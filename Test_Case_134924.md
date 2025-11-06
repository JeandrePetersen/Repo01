# Test Case Document - PDR 134924# Test Case Document - PDR 134924

Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.



This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.



## 1. DOCUMENT INFORMATION## 1. DOCUMENT INFORMATION

**PDR Number:** 134924  **PDR Number:** 134924  

**Program:** GENPJM.CBL  **Program:** GENPJM (GL Journal Entry)  

**Module:** GL Journal Entry  **Developer:** ara  

**Developer:** ara  **Date:** 22/10/25  

**Date:** 22/10/25  **Issue:** Custom forms saved incorrectly when Zero lines  

**Issue:** Custom forms saved incorrectly when Zero lines  

## 2. DOCUMENT HISTORY

## 2. DOCUMENT HISTORYVersion 1.0 - Initial test case document

Version 1.0 - Initial test case document

## 3. TABLE OF CONTENTS

## 3. TABLE OF CONTENTS1. DOCUMENT INFORMATION

1. DOCUMENT INFORMATION2. DOCUMENT HISTORY

2. DOCUMENT HISTORY3. TABLE OF CONTENTS

3. TABLE OF CONTENTS4. GLOSSARY

4. GLOSSARY5. PROGRAM LIST

5. PROGRAM LIST6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT

6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT7. TESTING THE CORRECTION IN TST ENVIRONMENT

7. TESTING THE CORRECTION IN TST ENVIRONMENT8. REGRESSION TESTS

8. REGRESSION TESTS9. AUTOMATION TESTS

9. AUTOMATION TESTS

## 4. GLOSSARY

## 4. GLOSSARY- **GL:** General Ledger

- **GL:** General Ledger- **Custom Forms:** User-defined data entry fields in journal entries

- **Custom Forms:** User-defined data entry fields in journal entries- **Zero Lines:** Journal entries with no detail line items

- **Zero Lines:** Journal entries with zero amounts in both debit and credit columns- **PDR:** Program Development Request

- **invalid-ent:** New validation flag to track invalid journal entries

- **PDR:** Program Development Request## 5. PROGRAM LIST

- GENPJM.CBL - GL Journal Entry main program

## 5. PROGRAM LIST

- GENPJM.CBL - GL Journal Entry main program (contains the fix)## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT



## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT### 6.1 DUP-134924-001

**Objective:** Reproduce custom forms saving incorrectly with zero lines  

### 6.1 DUP-134924-001**Preconditions:** 

**Objective:** Reproduce custom forms saving incorrectly with zero-amount lines  - Access to GL Journal Entry module

**Preconditions:** - Custom forms configured for journals

- Access to GL Journal Entry module- IMP environment available

- Custom forms configured for journals

- IMP environment available**Steps:**

1. Navigate to GL Journal Entry

**Steps:**2. Create new journal entry

1. Navigate to GL Journal Entry3. Add custom form data

2. Create new journal entry with custom forms enabled4. Do not add any journal detail lines

3. Add custom form data to the journal5. Attempt to save the journal

4. Add journal detail lines with zero amounts in both debit and credit columns

5. Attempt to save the journal**Expected Defect:** Custom form data saves incorrectly or becomes corrupted



**Expected Defect:** Custom form data saves incorrectly or becomes corrupted when zero-amount lines exist### 6.2 DUP-134924-002

**Objective:** Verify issue with existing journals when lines are removed  

### 6.2 DUP-134924-002**Preconditions:**

**Objective:** Verify issue with mixed valid/invalid entries  - Existing journal with lines and custom forms

**Preconditions:**- Edit access to journals

- Journal with custom forms capability

- Mix of valid and invalid journal lines**Steps:**

1. Open existing journal with lines and custom forms

**Steps:**2. Delete all journal detail lines

1. Create journal entry3. Modify custom form data

2. Add custom form data4. Save the journal

3. Add some lines with valid amounts (non-zero debit or credit)

4. Add some lines with zero amounts in both debit and credit columns**Expected Defect:** Custom form changes not saved properly or data corruption occurs

5. Save the journal

6. Review custom form data persistence## 7. TESTING THE CORRECTION IN TST ENVIRONMENT



**Expected Defect:** Custom form data handling inconsistencies or corruption occurs### 7.1 TC-134924-001

**Objective:** Verify custom forms handle zero lines correctly after fix  

## 7. TESTING THE CORRECTION IN TST ENVIRONMENT**Priority:** High  

**Preconditions:**

### 7.1 TC-134924-001- TST environment with fix applied

**Objective:** Verify zero-amount line detection prevents custom form corruption  - Custom forms enabled for GL journals

**Priority:** High  - User with journal entry permissions

**Preconditions:**

- TST environment with fix applied**Test Steps:**

- Custom forms enabled for GL journals1. Create new GL journal entry

- User with journal entry permissions2. Enter journal header information

3. Add custom form data in available fields

**Test Steps:**4. Do not add any journal detail lines

1. Create new GL journal entry5. Attempt to save journal

2. Enter journal header information

3. Add custom form data in available fields**Expected Result:** 

4. Add journal detail lines with zero amounts in both debit and credit columns- System prevents saving with appropriate error message, OR

5. Attempt to save journal- System saves journal but handles custom forms correctly without corruption

6. Verify custom form data handling- No data integrity issues occur



**Expected Result:** ### 7.2 TC-134924-002

- System detects zero-amount lines using invalid-ent flag**Objective:** Test transition from lines to zero lines  

- Custom form processing is skipped for invalid entries**Priority:** High  

- No custom form data corruption occurs**Preconditions:**

- Data integrity is maintained- Journal with existing lines and custom forms

- Edit permissions

### 7.2 TC-134924-002

**Objective:** Test mixed valid and invalid entries scenario  **Test Steps:**

**Priority:** High  1. Open journal with existing lines and custom form data

**Preconditions:**2. Note current custom form values

- Journal with custom forms enabled3. Delete all journal detail lines

- Ability to create multiple journal lines4. Modify custom form data

5. Save journal

**Test Steps:**6. Reopen journal to verify data persistence

1. Create journal entry with custom forms

2. Add first line with valid debit amount and custom form data**Expected Result:**

3. Add second line with zero amounts in both debit and credit columns- Custom form data remains consistent

4. Add third line with valid credit amount and custom form data- No corruption or data loss occurs

5. Save journal- System maintains data integrity

6. Verify custom form data processing for each line

### 7.3 TC-134924-003

**Expected Result:****Objective:** Validate new invalid-ent flag functionality  

- Custom forms processed correctly for valid entries (lines 1 and 3)**Priority:** Medium  

- Custom forms skipped for invalid entry (line 2)**Preconditions:**

- No data corruption in valid custom form entries- Access to journal with debugging capabilities

- invalid-ent flag functions correctly

**Test Steps:**

### 7.3 TC-134924-0031. Create journal with custom forms but no lines

**Objective:** Validate boundary conditions for amount validation  2. Verify invalid-ent flag is set appropriately

**Priority:** Medium  3. Add lines to journal

**Preconditions:**4. Verify invalid-ent flag updates correctly

- Access to journal with custom forms5. Remove all lines again

6. Confirm flag behavior

**Test Steps:**

1. Test entries with debit = 0.00, credit = 0.00**Expected Result:**

2. Test entries with debit = 0.01, credit = 0.00  - invalid-ent flag correctly identifies zero-line state

3. Test entries with debit = 0.00, credit = 0.01- Flag updates appropriately when lines added/removed

4. Test entries with very small amounts (0.001)- System behavior aligns with flag state

5. Verify custom form processing for each scenario

## 8. REGRESSION TESTS

**Expected Result:**

- Only true zero amounts (0.00 in both columns) trigger invalid-ent flag### 8.1 REG-134924-001

- Any non-zero amount allows custom form processing**Objective:** Ensure normal custom forms functionality unaffected  

- Boundary validation is precise and accurate**Test Steps:**

1. Create journal with lines and custom forms

### 7.4 TC-134924-0042. Save and modify journal multiple times

**Objective:** Test state transitions of invalid-ent flag  3. Verify all custom form features work normally

**Priority:** Medium  

**Preconditions:****Expected Result:** No regression in standard custom forms functionality

- Development or debug access to monitor flag states

### 8.2 REG-134924-002

**Test Steps:****Objective:** Verify journal workflows remain intact  

1. Create journal and monitor invalid-ent flag initialization**Test Steps:**

2. Add valid entry and verify flag remains "N"1. Test complete journal entry workflow

3. Add invalid entry (zero amounts) and verify flag becomes "Y"2. Test authorization process

4. Add another valid entry and verify flag resets to "N"3. Test posting functionality

5. Verify flag behavior through multiple state changes4. Verify reporting functions



**Expected Result:****Expected Result:** All standard journal processes work without issues

- invalid-ent flag properly initializes to "N"

- Flag correctly changes to "Y" for zero-amount entries### 8.3 REG-134924-003

- Flag resets to "N" for subsequent valid entries**Objective:** Test custom forms with various journal types  

- State transitions work as designed**Test Steps:**

1. Test custom forms with standard journals

## 8. REGRESSION TESTS2. Test with inter-company journals

3. Test with sub-module journals

### 8.1 REG-134924-0014. Test with copied journals

**Objective:** Ensure normal custom forms functionality unaffected  

**Test Steps:****Expected Result:** Custom forms work correctly across all journal types

1. Create journals with valid entries and custom forms

2. Test all standard custom form features## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

3. Verify saving, editing, and retrieval of custom form data

4. Test various custom form field types (text, numeric, date)### 9.1 AUTO-134924-001

**Test Name:** ValidateCustomFormsZeroLines  

**Expected Result:** No regression in standard custom forms functionality**Objective:** Automated test for custom forms with zero lines

```typescript

### 8.2 REG-134924-002// Pseudo-code for automation test

**Objective:** Verify journal entry workflows remain intact  test('Custom forms with zero lines handling', async () => {

**Test Steps:**  // Navigate to GL Journal Entry

1. Test complete journal entry workflow from creation to posting  // Create new journal

2. Test authorization processes  // Add custom form data

3. Test journal copying and templates  // Attempt save without lines

4. Verify reporting functions  // Verify appropriate handling

});

**Expected Result:** All standard journal processes work without issues```



### 8.3 REG-134924-003### 9.2 AUTO-134924-002

**Objective:** Test zero line handling for non-custom form scenarios  **Test Name:** CustomFormsDataIntegrity  

**Test Steps:****Objective:** Automated validation of custom form data integrity

1. Create journals without custom forms but with zero-amount lines```typescript

2. Test existing zero line discarding logic (version 009)// Pseudo-code for boundary testing

3. Verify no unintended impacts on zero line processingtest('Custom forms data integrity validation', async () => {

  // Test various line count scenarios (0, 1, multiple)

**Expected Result:** Existing zero line handling works correctly without interference  // Verify custom form data consistency

  // Test save/reload cycles

## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)});

```
### 9.1 AUTO-134924-001
**Test Name:** ValidateZeroAmountCustomFormHandling  
**Objective:** Automated test for zero-amount line detection
```typescript
// Pseudo-code for automation test
test('Custom forms with zero-amount lines handling', async () => {
  // Navigate to GL Journal Entry
  // Create journal with custom forms
  // Add lines with zero amounts in both debit and credit
  // Verify invalid-ent flag behavior
  // Confirm custom form processing is skipped
});
```

### 9.2 AUTO-134924-002
**Test Name:** MixedValidInvalidEntriesTest  
**Objective:** Automated testing of mixed entry scenarios
```typescript
// Pseudo-code for mixed scenario testing
test('Mixed valid and invalid entries custom form processing', async () => {
  // Create journal with both valid and invalid entries
  // Verify custom forms processed only for valid entries
  // Test boundary conditions
  // Validate data integrity
});
```

### 9.3 AUTO-134924-003
**Test Name:** InvalidFlagStateTransitionsTest  
**Objective:** Automated validation of invalid-ent flag state management
```typescript
// Pseudo-code for flag state testing
test('invalid-ent flag state transitions', async () => {
  // Monitor flag initialization and state changes
  // Test flag behavior with various entry combinations
  // Verify proper state management throughout processing
  // Validate flag resets correctly
});
```

### 9.4 AUTO-134924-004
**Test Name:** CustomFormDataIntegrityValidation  
**Objective:** Automated verification of custom form data integrity
```typescript
// Pseudo-code for data integrity testing
test('Custom form data integrity with zero-amount protection', async () => {
  // Test various combinations of entries and custom forms
  // Verify no data corruption occurs
  // Test save/reload cycles
  // Validate data consistency
});
```