# Test Case Template - GENPJM Custom Forms Zero Lines Fix
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
4. GLOSSARY
5. PROGRAM LIST
6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT
7. TESTING THE CORRECTION IN TST ENVIRONMENT
8. REGRESSION TESTS
9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

## 4. GLOSSARY
- **GENPJM:** GL Journal Entry program
- **Custom Forms:** User-defined fields that can be added to journal detail lines
- **Zero Lines:** Journal detail lines with both debit and credit amounts equal to zero
- **GENJND:** General Journal Detail table
- **PDR 134924:** Problem Report for custom forms saved incorrectly with zero lines
- **F3070:** GL Post Previous Years feature
- **Dimension Analysis:** Additional analysis and tagging of GL transactions

## 5. PROGRAM LIST
- **GENPJM.CBL** - GL Journal Entry main program
- **GENJND** - General Journal Detail table
- **Custom Form Tables** - Associated custom form data storage
- **GENPYR** - GL Previous Year processing components

## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT

### 6.1 DEFECT-DUPLICATION-001
**Test ID:** DEF-DUP-001
**Description:** Reproduce custom forms being saved for zero-amount journal lines
**Environment:** IMP (Implementation/Pre-fix environment)

**Steps:**
1. Access GL Journal Entry (GENPJM)
2. Create a new journal entry
3. Add journal detail line with Debit: 0.00, Credit: 0.00
4. Fill in custom form fields for the zero-amount line
5. Save the journal
6. Query the custom form tables for the journal entry

**Expected Result (Defect Present):** Custom form data is incorrectly saved for the zero-amount line
**Data Verification:** Check GENJND custom form tables for orphaned records

### 6.2 DEFECT-DUPLICATION-002
**Test ID:** DEF-DUP-002
**Description:** Reproduce data cleanup issues with mixed valid/invalid lines
**Environment:** IMP (Implementation/Pre-fix environment)

**Steps:**
1. Create journal with multiple lines: some valid (non-zero), some zero amounts
2. Add custom form data to all lines
3. Save journal
4. Edit journal and change valid lines to zero amounts
5. Save journal again
6. Check database for orphaned custom form records

**Expected Result (Defect Present):** Orphaned custom form data remains for lines changed to zero amounts
**Data Verification:** Query custom form tables for inconsistent data references

## 7. TESTING THE CORRECTION IN TST ENVIRONMENT

### 7.1 CORRECTION-TEST-001
**Test ID:** COR-TST-001
**Description:** Verify custom forms are not saved for zero-amount lines
**Environment:** TST (Test/Post-fix environment)

**Prerequisites:**
- GENPJM version 107a installed
- Custom forms enabled for GENJND
- GL Journal Entry accessible

**Test Steps:**
1. Login to SYSPRO TST environment
2. Navigate to GL Journal Entry (GENPJM)
3. Create new journal entry
4. Add detail line: Ledger Code: [Valid Code], Debit: 0.00, Credit: 0.00
5. Access custom form fields for the zero-amount line
6. Enter test data in custom form fields
7. Add another line: Ledger Code: [Valid Code], Debit: 100.00, Credit: 0.00
8. Enter custom form data for the valid line
9. Save the journal
10. Query database: SELECT * FROM [CustomFormTable] WHERE JournalKey = [JournalKey]

**Expected Result:** Only custom form data for the 100.00 debit line should be saved
**Pass Criteria:** Zero-amount line has no associated custom form records
**Fail Criteria:** Custom form data exists for zero-amount line

### 7.2 CORRECTION-TEST-002
**Test ID:** COR-TST-002
**Description:** Verify proper cleanup of previously saved custom form data
**Environment:** TST (Test/Post-fix environment)

**Prerequisites:**
- Journal with existing custom form data
- Ability to modify journal entries

**Test Steps:**
1. Open existing journal with custom form data on multiple lines
2. Verify current custom form data exists in database
3. Edit journal: change one valid line to zero amounts (Debit: 0.00, Credit: 0.00)
4. Modify custom form data on remaining valid lines
5. Save the journal
6. Query database for custom form records
7. Verify cleanup of data for line changed to zero amounts
8. Verify updated data for modified valid lines

**Expected Result:** Custom form data removed for zero-amount line, updated for valid lines
**Pass Criteria:** No orphaned custom form records; valid data updated correctly
**Fail Criteria:** Orphaned records exist or valid data not updated

### 7.3 CORRECTION-TEST-003
**Test ID:** COR-TST-003
**Description:** Test previous year posting functionality (Version 107)
**Environment:** TST (Test/Post-fix environment)

**Prerequisites:**
- F3070 (GL Post Previous Years) feature enabled
- User has authorization for previous year posting
- Previous years data available (2-5 years back)

**Test Steps:**
1. Access GL Journal Entry
2. Create new journal for previous year (Current Year - 2)
3. Add valid journal lines with amounts
4. Add custom forms to lines
5. Authorize journal (if required)
6. Post journal to previous year
7. Verify dimension analysis processing
8. Check journal appears in previous year GL data

**Expected Result:** Journal posts successfully to previous year with proper processing
**Pass Criteria:** Journal posted, dimension analysis completed, no errors
**Fail Criteria:** Journal fails to post or dimension analysis errors occur

## 8. REGRESSION TESTS

### 8.1 REGRESSION-001
**Test ID:** REG-001
**Description:** Verify standard custom form functionality unchanged
**Environment:** TST

**Test Steps:**
1. Create standard journal with only valid (non-zero) lines
2. Add various custom form field types (text, numeric, date)
3. Save journal
4. Modify custom form data
5. Save again
6. Verify all custom form data saved and updated correctly

**Expected Result:** Standard custom form functionality works as before
**Pass Criteria:** All custom form operations complete successfully
**Fail Criteria:** Any custom form functionality broken

### 8.2 REGRESSION-002
**Test ID:** REG-002
**Description:** Verify journal authorization state management (Related to Version 105)
**Environment:** TST

**Test Steps:**
1. Create journal with custom forms
2. Authorize journal
3. Add zero-amount lines with custom forms
4. Save journal
5. Verify authorization state unchanged
6. Check custom form processing doesn't affect authorization

**Expected Result:** Authorization state remains stable during custom form processing
**Pass Criteria:** Journal remains authorized; custom forms process correctly
**Fail Criteria:** Authorization state changes unexpectedly

### 8.3 REGRESSION-003
**Test ID:** REG-003
**Description:** Verify dimension analysis with custom forms (Related to Versions 104/103)
**Environment:** TST

**Test Steps:**
1. Enable dimension analysis
2. Create multiple journals with custom forms and mixed line types
3. Process journals without exiting system
4. Verify dimension tagging works for all journals
5. Check custom form processing doesn't interfere with dimensions

**Expected Result:** Dimension analysis works correctly with custom form processing
**Pass Criteria:** All dimension analysis completes successfully
**Fail Criteria:** Dimension tagging fails or is inconsistent

### 8.4 REGRESSION-004
**Test ID:** REG-004
**Description:** Verify save button functionality after Excel operations (Related to Version 106)
**Environment:** TST

**Test Steps:**
1. Create journal with custom forms and zero lines
2. Print journal to Excel
3. Return to journal entry screen
4. Verify save button is enabled
5. Make changes and save
6. Verify custom form processing works correctly

**Expected Result:** Save functionality works properly after Excel operations
**Pass Criteria:** Save button enabled; journal saves successfully
**Fail Criteria:** Save button disabled or save operation fails

## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

### 9.1 AUTOMATION-001
**Test ID:** AUTO-001
**Description:** Automated test for custom forms with zero-amount lines

```typescript
// Test: Custom forms not saved for zero amount lines
test('Custom forms zero amount validation', async ({ page }) => {
  // Navigate to GL Journal Entry
  await page.goto('/syspro/gl/journal-entry');
  
  // Create new journal
  await page.click('[data-testid="new-journal"]');
  
  // Add zero amount line
  await page.fill('[data-testid="debit-amount"]', '0.00');
  await page.fill('[data-testid="credit-amount"]', '0.00');
  
  // Fill custom form
  await page.fill('[data-testid="custom-field-1"]', 'Test Data');
  
  // Add valid amount line
  await page.click('[data-testid="add-line"]');
  await page.fill('[data-testid="debit-amount-2"]', '100.00');
  await page.fill('[data-testid="custom-field-2"]', 'Valid Data');
  
  // Save journal
  await page.click('[data-testid="save-journal"]');
  
  // Verify only valid line has custom form data
  const customFormCount = await page.evaluate(() => {
    return fetch('/api/custom-forms/count').then(r => r.json());
  });
  
  expect(customFormCount).toBe(1); // Only one custom form record
});
```

### 9.2 AUTOMATION-002
**Test ID:** AUTO-002
**Description:** Automated regression test for standard custom form functionality

```typescript
// Test: Standard custom form operations work correctly
test('Standard custom form functionality', async ({ page }) => {
  await page.goto('/syspro/gl/journal-entry');
  
  // Create journal with valid lines only
  await page.click('[data-testid="new-journal"]');
  await page.fill('[data-testid="debit-amount"]', '250.00');
  await page.fill('[data-testid="custom-field-text"]', 'Text Value');
  await page.fill('[data-testid="custom-field-number"]', '123.45');
  await page.fill('[data-testid="custom-field-date"]', '2025-11-06');
  
  // Save and verify
  await page.click('[data-testid="save-journal"]');
  await expect(page.locator('[data-testid="success-message"]')).toBeVisible();
  
  // Modify and save again
  await page.fill('[data-testid="custom-field-text"]', 'Modified Text');
  await page.click('[data-testid="save-journal"]');
  
  // Verify modification saved
  const fieldValue = await page.inputValue('[data-testid="custom-field-text"]');
  expect(fieldValue).toBe('Modified Text');
});
```

### 9.3 AUTOMATION-003
**Test ID:** AUTO-003
**Description:** Automated data integrity verification

```typescript
// Test: Database integrity after custom form processing
test('Custom form data integrity', async ({ page }) => {
  // Setup test data
  const journalId = await createTestJournal();
  
  // Process journal with mixed lines
  await page.goto(`/syspro/gl/journal-entry/${journalId}`);
  
  // Add mixed valid/invalid lines
  await addJournalLine(page, { debit: 100, credit: 0, customForm: 'Valid Line' });
  await addJournalLine(page, { debit: 0, credit: 0, customForm: 'Invalid Line' });
  
  await page.click('[data-testid="save-journal"]');
  
  // Verify database integrity
  const dbCheck = await page.evaluate(async () => {
    const response = await fetch('/api/data-integrity/check');
    return response.json();
  });
  
  expect(dbCheck.orphanedRecords).toBe(0);
  expect(dbCheck.validRecords).toBe(1);
  expect(dbCheck.inconsistencies).toHaveLength(0);
});
```