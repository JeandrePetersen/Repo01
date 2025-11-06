# Test Case Document - PDR 134924
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
User Azure DevOps profile Jeandre Petersen, QA Analyst

## 2. DOCUMENT HISTORY
<Version 1.0 - November 6, 2025>

## 3. TABLE OF CONTENTS
1. DOCUMENT INFORMATION
2. DOCUMENT HISTORY
3. TABLE OF CONTENTS
4. GLOSSARY
5. PROGRAM LIST
6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT
7. TESTING THE CORRECTION IN TST ENVIRONMENT
8. REGRESSION TESTS
9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

## 4. GLOSSARY
- **PDR**: Problem/Defect Report
- **GL**: General Ledger
- **Custom Forms**: User-defined form fields for additional data capture
- **Zero Lines**: Journal entries with no detail transaction lines
- **GENPJM**: GL Journal Entry program

## 5. PROGRAM LIST
- **GENPJM.CBL** - GL Journal Entry (Version 107a)
- **PDR 134924** - Custom forms saved incorrectly when Zero lines

## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT

### 6.1 DUP-134924-001: Reproduce Custom Forms Save Issue with Zero Lines
**Test ID:** DUP-134924-001  
**Objective:** Reproduce the original defect where custom forms fail to save when journal has zero lines  
**Prerequisites:** 
- Access to IMP environment
- Custom forms enabled for GL Journal Entry
- User permissions for journal creation

**Test Steps:**
1. Navigate to GL Journal Entry (GENPJM)
2. Create a new journal entry
3. Enter journal header information (type, date, reference)
4. Add custom form data but do not add any detail lines
5. Attempt to save the journal
6. Verify custom form data is not saved (reproduces defect)

**Expected Result:** Custom forms should fail to save (defect behavior)  
**Environment:** IMP  
**Priority:** High

### 6.2 DUP-134924-002: Reproduce Issue After Removing All Lines
**Test ID:** DUP-134924-002  
**Objective:** Reproduce defect when removing all lines from existing journal  
**Prerequisites:**
- Access to IMP environment
- Existing journal with lines and custom forms

**Test Steps:**
1. Open existing journal with detail lines and custom forms
2. Delete all detail lines from the journal
3. Modify custom form data
4. Save the journal
5. Verify custom form changes are not saved (reproduces defect)

**Expected Result:** Custom form modifications should be lost (defect behavior)  
**Environment:** IMP  
**Priority:** High

## 7. TESTING THE CORRECTION IN TST ENVIRONMENT

### 7.1 TC-134924-001: Verify Custom Forms Save with Zero Lines
**Test ID:** TC-134924-001  
**Objective:** Verify that custom forms save correctly when journal has zero lines  
**Prerequisites:**
- Access to TST environment with fix applied
- Custom forms enabled for GL Journal Entry

**Test Steps:**
1. Navigate to GL Journal Entry (GENPJM)
2. Create a new journal entry
3. Enter journal header information:
   - Journal Type: Normal (N)
   - Journal Date: Current date
   - Reference: "TEST-ZERO-LINES"
4. Add custom form data:
   - Fill in all available custom form fields
   - Include text, numeric, and date fields if available
5. Do NOT add any detail lines (keep zero lines)
6. Save the journal
7. Close and reopen the journal
8. Verify all custom form data is preserved

**Expected Result:** Custom forms should save successfully and data should be retained  
**Environment:** TST  
**Priority:** High

### 7.2 TC-134924-002: Verify Custom Forms Save After Removing Lines
**Test ID:** TC-134924-002  
**Objective:** Verify custom forms save correctly after removing all detail lines  
**Prerequisites:**
- Access to TST environment with fix applied
- Existing journal with detail lines

**Test Steps:**
1. Open existing journal with detail lines
2. Note existing custom form data
3. Delete all detail lines from the journal
4. Modify custom form data:
   - Change existing values
   - Add new data to empty fields
5. Save the journal
6. Close and reopen the journal
7. Verify all custom form modifications are preserved

**Expected Result:** Custom form changes should be saved and retained correctly  
**Environment:** TST  
**Priority:** High

## 8. REGRESSION TESTS

### 8.1 REG-134924-001: Custom Forms with Normal Journal Lines
**Test ID:** REG-134924-001  
**Objective:** Ensure custom forms still work correctly with normal journal entries containing lines  
**Prerequisites:**
- Access to TST environment
- GL accounts available for testing

**Test Steps:**
1. Create new journal entry
2. Enter header information
3. Add custom form data
4. Add multiple detail lines:
   - Debit entries
   - Credit entries
   - Ensure journal balances
5. Save the journal
6. Reopen and verify custom forms are preserved
7. Modify custom forms and save again
8. Verify modifications are retained

**Expected Result:** Custom forms should work normally with journal lines (no regression)  
**Environment:** TST  
**Priority:** Medium

### 8.2 REG-134924-002: Journal Authorization with Custom Forms
**Test ID:** REG-134924-002  
**Objective:** Verify journal authorization process works correctly with custom forms (regression for PDR 105)  
**Prerequisites:**
- Authorization enabled
- User with authorization permissions

**Test Steps:**
1. Create journal with custom forms and detail lines
2. Save the journal
3. Authorize the journal
4. Verify journal remains authorized after save
5. Attempt to modify custom forms
6. Save and verify authorization status is maintained

**Expected Result:** Authorization should work correctly with custom forms  
**Environment:** TST  
**Priority:** Medium

## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

### 9.1 AUTO-134924-001: Automated Custom Forms Zero Lines Test
**Test ID:** AUTO-134924-001  
**Objective:** Automate the primary test case for custom forms with zero lines  

**Automation Script Outline:**
```typescript
// Test: Custom forms save with zero lines
describe('PDR 134924 - Custom Forms Zero Lines', () => {
  test('should save custom forms when journal has zero lines', async ({ page }) => {
    // Navigate to GL Journal Entry
    await page.goto('/gl-journal-entry');
    
    // Create new journal
    await page.click('[data-testid="new-journal"]');
    
    // Fill header information
    await page.fill('[data-testid="journal-type"]', 'N');
    await page.fill('[data-testid="journal-date"]', getCurrentDate());
    await page.fill('[data-testid="reference"]', 'AUTO-TEST-ZERO');
    
    // Fill custom forms
    await page.fill('[data-testid="custom-field-1"]', 'Test Value 1');
    await page.fill('[data-testid="custom-field-2"]', '12345');
    
    // Save without adding lines
    await page.click('[data-testid="save-journal"]');
    
    // Verify save success
    await expect(page.locator('[data-testid="save-success"]')).toBeVisible();
    
    // Reopen and verify data
    await page.reload();
    await expect(page.locator('[data-testid="custom-field-1"]')).toHaveValue('Test Value 1');
  });
});
```

**Environment:** TST  
**Priority:** High

### 9.2 AUTO-134924-002: Automated Regression Test Suite
**Test ID:** AUTO-134924-002  
**Objective:** Automate regression tests for custom forms functionality  

**Automation Script Outline:**
```typescript
// Test: Regression test for custom forms with lines
describe('PDR 134924 - Regression Tests', () => {
  test('should maintain custom forms functionality with journal lines', async ({ page }) => {
    // Navigate to GL Journal Entry
    await page.goto('/gl-journal-entry');
    
    // Create journal with lines and custom forms
    await createJournalWithLines(page);
    await fillCustomForms(page);
    
    // Save and verify
    await page.click('[data-testid="save-journal"]');
    await verifyCustomFormsData(page);
    
    // Test authorization workflow
    await authorizeJournal(page);
    await verifyAuthorizationStatus(page);
  });
});
```

**Environment:** TST  
**Priority:** Medium