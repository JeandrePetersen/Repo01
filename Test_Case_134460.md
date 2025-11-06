# Test Case Document - PDR 134460
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
**PDR Number:** 134460  
**Program:** ARSPIN.CBL  
**Module:** AR Sales Invoice Posting  
**Developer:** MPR  
**Date:** 28/08/25  
**Issue:** WEB UI: When posting invoice with extended tax information, City field validation fails  

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
- **AR:** Accounts Receivable
- **WEB UI:** Web User Interface
- **Extended Tax:** Tax systems requiring state/county/city information (primarily USA tax)
- **City Field Validation:** System validation of city entries in tax calculations
- **PDR:** Program Development Request

## 5. PROGRAM LIST
- ARSPIN.CBL - AR Sales Invoice Posting main program
- ARSPINL3.XML - WEB UI configuration file (contains the actual fix)

## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT

### 6.1 DUP-134460-001
**Objective:** Reproduce city field validation failure in WEB UI with extended tax  
**Preconditions:** 
- Access to AR Invoice Posting via WEB UI
- Extended tax system enabled (USA tax preferred)
- IMP environment available
- Customer with extended tax requirements

**Steps:**
1. Navigate to AR Invoice Posting in WEB UI
2. Create new invoice for customer requiring extended tax
3. Enter invoice header information
4. Add invoice lines with extended tax information
5. Enter state, county, and city information
6. Attempt to post the invoice

**Expected Defect:** City field validation fails preventing successful invoice posting

### 6.2 DUP-134460-002
**Objective:** Verify issue occurs specifically in WEB UI vs Desktop  
**Preconditions:**
- Access to both WEB UI and Desktop GUI
- Same customer and tax setup

**Steps:**
1. Attempt same invoice posting process in Desktop GUI
2. Note if city validation works correctly in Desktop
3. Switch to WEB UI and repeat same process
4. Compare validation behavior between interfaces

**Expected Defect:** WEB UI shows city validation failure while Desktop works correctly

## 7. TESTING THE CORRECTION IN TST ENVIRONMENT

### 7.1 TC-134460-001
**Objective:** Verify city field validation works correctly after fix  
**Priority:** High  
**Preconditions:**
- TST environment with fix applied
- Extended tax system enabled
- WEB UI access available
- Test customer with extended tax requirements

**Test Steps:**
1. Access AR Invoice Posting via WEB UI
2. Create new invoice for extended tax customer
3. Enter complete invoice header information
4. Add invoice line items
5. Enter extended tax information (state, county, city)
6. Use various city name formats (standard, with spaces, special characters)
7. Attempt to post invoice

**Expected Result:** 
- City field validation accepts valid city entries
- Invoice posts successfully without validation errors
- Extended tax calculations complete correctly

### 7.2 TC-134460-002
**Objective:** Test city field validation with edge cases  
**Priority:** High  
**Preconditions:**
- WEB UI access with extended tax enabled
- Various test scenarios prepared

**Test Steps:**
1. Test city field with maximum length entry
2. Test city field with minimum length entry
3. Test city field with special characters (apostrophes, hyphens, spaces)
4. Test city field with numeric characters
5. Test empty city field (if allowed by tax rules)
6. Test city field with mixed case entries
7. Attempt posting for each scenario

**Expected Result:**
- Valid city entries are accepted and processed
- Invalid entries show appropriate error messages
- Validation is consistent and user-friendly

### 7.3 TC-134460-003
**Objective:** Validate extended tax workflow integration  
**Priority:** Medium  
**Preconditions:**
- Multiple customers with different tax requirements
- Mix of extended tax and basic tax scenarios

**Test Steps:**
1. Process invoice with extended tax (state/county/city required)
2. Process invoice with basic tax only
3. Process invoice with GST tax system
4. Process invoice with no tax
5. Verify each posts successfully
6. Check tax calculations are accurate

**Expected Result:**
- All tax scenarios process correctly
- No regression in basic tax functionality
- Extended tax calculations remain accurate

## 8. REGRESSION TESTS

### 8.1 REG-134460-001
**Objective:** Ensure Desktop GUI functionality unaffected  
**Test Steps:**
1. Test identical invoice posting scenarios in Desktop GUI
2. Verify all extended tax functionality works as before
3. Confirm city field validation operates normally
4. Test various tax system combinations

**Expected Result:** No regression in Desktop GUI functionality

### 8.2 REG-134460-002
**Objective:** Verify core invoice posting logic intact  
**Test Steps:**
1. Test standard invoice posting workflows
2. Verify customer validation
3. Test product class validation
4. Confirm exchange rate handling
5. Test authorization workflows

**Expected Result:** All core posting functionality operates without issues

### 8.3 REG-134460-003
**Objective:** Test other WEB UI invoice functions  
**Test Steps:**
1. Test invoice inquiry via WEB UI
2. Test invoice modification via WEB UI
3. Test invoice printing via WEB UI
4. Test other AR functions in WEB UI

**Expected Result:** No impact on other WEB UI functionality

## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

### 9.1 AUTO-134460-001
**Test Name:** ExtendedTaxCityValidationWEBUI  
**Objective:** Automated test for city field validation in WEB UI
```typescript
// Pseudo-code for automation test
test('City field validation with extended tax in WEB UI', async () => {
  // Navigate to AR Invoice Posting WEB UI
  // Create invoice with extended tax requirements
  // Enter various city field values
  // Verify validation behavior
  // Confirm successful posting
});
```

### 9.2 AUTO-134460-002
**Test Name:** ExtendedTaxWorkflowValidation  
**Objective:** Automated validation of complete extended tax workflow
```typescript
// Pseudo-code for workflow testing
test('Complete extended tax invoice workflow', async () => {
  // Test end-to-end invoice creation with extended tax
  // Validate all field interactions
  // Verify posting and tax calculations
  // Check integration with accounting records
});
```

### 9.3 AUTO-134460-003
**Test Name:** CrossPlatformValidationComparison  
**Objective:** Automated comparison of WEB UI vs Desktop validation
```typescript
// Pseudo-code for cross-platform testing
test('Compare WEB UI and Desktop validation behavior', async () => {
  // Execute same test scenarios in both interfaces
  // Compare validation results
  // Ensure consistency where expected
  // Verify platform-specific behavior is appropriate
});
```