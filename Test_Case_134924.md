# Test Case Document - PDR 134924
**GENPJM - Custom Forms Saved Incorrectly When Zero Lines**

Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
User Azure DevOps profile: QA Tester, Quality Assurance Engineer

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
9. AUTOMATION TESTS

## 4. GLOSSARY
- **Custom Forms**: User-defined fields that can be added to journal entries for additional data capture
- **Zero Lines**: Journal entry lines where both debit and credit amounts are zero
- **GENJND**: General Journal Detail table containing journal line items
- **GL Journal Entry**: General Ledger journal entry module (GENPJM)

## 5. PROGRAM LIST
- GENPJM.CBL - GL Journal Entry program (Version 107a)
- GENJND - General Journal Detail file structure

## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT

### 6.1 DUP-134924-001: Custom Forms Saved with Zero Amount Lines
**Preconditions:** 
- Access to GL Journal Entry (GENPJM)
- Custom forms configured for journal detail lines
- Ability to create journal entries with zero amounts

**Test Steps:**
1. Navigate to GL Journal Entry
2. Create new journal entry
3. Add multiple journal lines including lines with zero debit and credit amounts
4. Enter custom form data for all lines including zero-amount lines
5. Save the journal
6. Verify custom form data is saved for zero-amount lines (defect behavior)

**Expected Result:** Custom form data should NOT be saved for zero-amount lines
**Actual Result (Defect):** Custom form data incorrectly saved for zero-amount lines

### 6.2 DUP-134924-002: Data Association Verification
**Preconditions:**
- Journal created with mixed zero and non-zero amount lines
- Custom form data entered for all lines

**Test Steps:**
1. Query journal detail records with custom form data
2. Identify which lines have zero amounts
3. Verify custom form associations

**Expected Result:** Zero-amount lines should not have custom form associations
**Actual Result (Defect):** Zero-amount lines incorrectly have custom form data

## 7. TESTING THE CORRECTION IN TST ENVIRONMENT

### 7.1 TC-134924-001: Custom Forms Correctly Handle Zero Amount Lines
**Priority:** HIGH
**Preconditions:**
- TST environment with GENPJM version 107a deployed
- Custom forms configured for journal details
- Access to GL Journal Entry functionality

**Test Steps:**
1. Access GL Journal Entry screen
2. Create new journal entry with header information
3. Add first line with valid debit amount (e.g., 100.00 debit, 0.00 credit)
4. Add second line with zero amounts (0.00 debit, 0.00 credit)
5. Add third line with valid credit amount (0.00 debit, 100.00 credit)
6. Enter custom form data for all three lines
7. Save journal entry
8. Verify only lines 1 and 3 retain custom form data
9. Confirm line 2 (zero amounts) has no custom form data saved

**Expected Result:** Custom form data saved only for lines with non-zero amounts

### 7.2 TC-134924-002: Edit Existing Journal with Zero Lines
**Priority:** HIGH
**Preconditions:**
- Existing journal with custom form data
- Ability to modify journal entries

**Test Steps:**
1. Open existing journal for modification
2. Add new line with zero debit and credit amounts
3. Enter custom form data for the zero-amount line
4. Save journal modifications
5. Verify zero-amount line does not retain custom form data
6. Confirm existing non-zero lines maintain their custom form data

**Expected Result:** Zero-amount lines added to existing journals do not save custom form data

### 7.3 TC-134924-003: Boundary Value Testing
**Priority:** MEDIUM
**Preconditions:**
- Access to GL Journal Entry
- Custom forms configured

**Test Steps:**
1. Create journal with lines containing:
   - 0.00 debit, 0.00 credit
   - 0.01 debit, 0.00 credit  
   - 0.00 debit, 0.01 credit
   - -0.01 debit, 0.00 credit
   - 0.00 debit, -0.01 credit
2. Enter custom form data for all lines
3. Save journal
4. Verify custom form saving behavior

**Expected Result:** Only true zero-amount lines (0.00/0.00) should skip custom form saving

## 8. REGRESSION TESTS

### 8.1 REG-134924-001: Standard Journal Entry Functionality
**Priority:** HIGH
**Test Steps:**
1. Create standard journal entry without custom forms
2. Verify all journal entry functions work normally
3. Test posting, authorization, and printing functions

**Expected Result:** No impact on core journal functionality

### 8.2 REG-134924-002: Custom Forms with Non-Zero Lines
**Priority:** HIGH
**Test Steps:**
1. Create journal entry with all non-zero amount lines
2. Enter custom form data for all lines
3. Save and verify all custom form data is retained

**Expected Result:** Normal custom form functionality unchanged for valid entries

### 8.3 REG-134924-003: Journal Modification Workflows
**Priority:** MEDIUM
**Test Steps:**
1. Test journal copying functionality
2. Test journal deletion and cleanup
3. Test journal authorization with custom forms

**Expected Result:** All existing workflows function normally

## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

### 9.1 AUTO-134924-001: Zero Amount Custom Form Validation
**Test Description:** Automated test to verify custom forms are not saved for zero-amount journal lines
**Test Data:** Journal entries with mixed zero and non-zero amounts
**Validation:** Database verification of custom form associations

### 9.2 AUTO-134924-002: Custom Form Data Integrity
**Test Description:** Automated validation of custom form data cleanup and proper associations
**Test Data:** Various journal configurations with custom form data
**Validation:** End-to-end custom form data flow verification