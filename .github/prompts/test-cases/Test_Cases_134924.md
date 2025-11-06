# Test Cases for PDR 134924
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
User Azure DevOps profile: QA Tester, Quality Assurance Analyst

## 2. DOCUMENT HISTORY
Version 1.0 - Initial test cases for PDR 134924 Custom forms saved incorrectly when Zero lines

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
- **Custom Forms**: User-defined additional fields that can be attached to journal entries
- **Zero Lines**: Journal entry lines where both debit and credit amounts are zero
- **GENPJM**: GL Journal Entry program
- **PDR**: Program Development Request

## 5. PROGRAM LIST
- GENPJM.CBL - GL Journal Entry main program
- Custom forms processing routines
- GENJND table handling

## 6. DUPLICATING THE DEFECT IN IMP ENVIRONMENT

### 6.1 DEF-134924-001
**Objective**: Reproduce custom forms being saved incorrectly for zero-amount lines
**Preconditions**: GL Journal Entry screen accessible, custom forms configured
**Steps**:
1. Open GL Journal Entry
2. Create new journal with multiple lines
3. Set one line with zero debit and zero credit amounts
4. Add custom form data to the zero-amount line
5. Save the journal
6. Verify custom form data was incorrectly saved for zero-amount line
**Expected Result**: Custom form data should be incorrectly saved (defect reproduction)

### 6.2 DEF-134924-002  
**Objective**: Verify mixed scenarios where valid and invalid entries coexist
**Preconditions**: GL Journal Entry screen accessible, custom forms enabled
**Steps**:
1. Create journal with three lines: valid debit, valid credit, and zero amounts
2. Add custom forms to all three lines
3. Save journal
4. Check which custom forms were saved
**Expected Result**: All custom forms saved including zero-amount line (defect reproduction)

## 7. TESTING THE CORRECTION IN TST ENVIRONMENT

### 7.1 TC-134924-001
**Objective**: Verify custom forms are not saved for zero-amount lines after fix
**Preconditions**: Version 107a installed, GL Journal Entry accessible, custom forms configured
**Steps**:
1. Open GL Journal Entry screen
2. Create new journal entry
3. Add line with zero debit and zero credit amounts
4. Enter custom form data for the zero-amount line
5. Add another line with valid amounts and custom form data
6. Save the journal
7. Verify custom form data storage
**Expected Result**: Custom form data saved only for valid amount line, not for zero-amount line

### 7.2 TC-134924-002
**Objective**: Test multiple zero-amount lines with custom forms
**Preconditions**: Version 107a installed, custom forms enabled
**Steps**:
1. Create journal with multiple zero-amount lines
2. Add custom form data to all zero-amount lines
3. Add one valid amount line with custom form data
4. Save journal
5. Check custom form data persistence
**Expected Result**: Only valid amount line retains custom form data

### 7.3 TC-134924-003
**Objective**: Verify mixed debit/credit zero scenarios
**Preconditions**: Version 107a installed, GL Journal Entry accessible
**Steps**:
1. Create journal lines with various zero combinations:
   - Zero debit, valid credit
   - Valid debit, zero credit  
   - Zero debit, zero credit
2. Add custom forms to all lines
3. Save journal
**Expected Result**: Custom forms saved for lines with at least one non-zero amount

## 8. REGRESSION TESTS

### 8.1 REG-134924-001
**Objective**: Ensure standard journal entry workflow unchanged
**Preconditions**: Version 107a installed
**Steps**:
1. Create standard journal entry with valid amounts
2. Complete normal journal entry process
3. Post journal
**Expected Result**: Standard functionality works as before

### 8.2 REG-134924-002  
**Objective**: Verify custom forms work normally for valid entries
**Preconditions**: Version 107a installed, custom forms configured
**Steps**:
1. Create journal with all valid amount lines
2. Add custom forms to all lines
3. Save and verify custom form persistence
**Expected Result**: All custom forms saved correctly for valid entries

### 8.3 REG-134924-003
**Objective**: Test zero line discarding functionality (Version 009 compatibility)
**Preconditions**: Version 107a installed
**Steps**:
1. Create journal with zero-amount lines
2. Save journal
3. Verify zero lines are handled per original Version 009 logic
**Expected Result**: Zero line handling maintains backward compatibility

## 9. AUTOMATION TESTS (PLAYWRIGHT TYPESCRIPT)

### 9.1 AUTO-134924-001
**Objective**: Automated test for custom forms with zero amounts
**Approach**: Create automated test to validate custom forms are not saved for zero-amount journal lines

### 9.2 AUTO-134924-002
**Objective**: Regression automation for valid custom forms
**Approach**: Automated validation that custom forms continue to work correctly for non-zero amount entries