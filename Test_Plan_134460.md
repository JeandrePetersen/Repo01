# Test Plan - PDR 134460
Copyright Notice: This document is for SYSPRO (Pty) Ltd internal usage only.

This document is provided outside of the SYSPRO development environment for informational purposes only. SYSPRO makes no warranties, express or implied, in this document. The information contained in this document is an overview of the intended functionality for SYSPRO and should not be interpreted to be a commitment on the final features, enhancements or scheduling.

## 1. DOCUMENT INFORMATION
**PDR Number:** 134460  
**Program:** ARSPIN.CBL  
**Module:** AR Sales Invoice Posting  
**Developer:** MPR  
**Issue Date:** 28/08/25  

## 2. DOCUMENT HISTORY
Version 1.0 - Initial test plan for WEB UI city field validation fix

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
**Risk Level:** Low

This is a targeted user interface fix addressing a specific validation issue in the WEB UI. The change is isolated to XML configuration with no impact on core business logic, resulting in minimal risk.

## 5. SYNOPSIS
**Developer Synopsis:** WEB UI: When posting invoice with extended tax information, City field validation fails. Changes limited to ARSPINL3.XML.

**Code Analysis:** The fix addresses a validation issue specific to the WEB UI where city field validation was incorrectly failing during invoice posting with extended tax information. The resolution was contained within the XML interface configuration file rather than requiring changes to the core COBOL program logic.

**Change Context:** This resolves a user experience issue in the web-based invoice entry system. Users working with extended tax systems (particularly USA tax with state/county/city requirements) were unable to successfully post invoices due to incorrect city field validation in the web interface, while the same functionality worked correctly in the desktop GUI.

## 6. PROGRAM LIST
- **ARSPIN.CBL** - Main AR Sales Invoice Posting program (no code changes)
- **ARSPINL3.XML** - WEB UI configuration file (contains actual fix)
  - Addresses city field validation logic for extended tax scenarios

## 7. FEATURES TO BE TESTED
- WEB UI invoice posting with extended tax information
- City field validation in extended tax scenarios
- Extended tax information entry and processing
- USA tax system functionality in WEB UI
- State/County/City field validation interactions
- Invoice posting workflow via web interface
- Cross-validation between tax fields in WEB UI
- Error message handling for validation failures

## 8. FEATURES NOT TO BE TESTED
- Desktop GUI invoice posting (unchanged functionality)
- Core COBOL invoice posting business logic
- Basic tax system processing (non-extended tax)
- Customer maintenance and validation
- Product catalog and pricing functions
- Multi-currency invoice processing
- Invoice authorization workflows
- Standard reporting and inquiry functions
- Integration with other AR modules

## 9. APPROACH

### ISTQB Testing Techniques

**Technique:** Equivalence Partitioning  
**Explanation:** Partition city field inputs into valid and invalid categories to systematically test validation behavior across different input types and formats.

**Technique:** Boundary Value Analysis  
**Explanation:** Test city field at maximum and minimum length boundaries, special character limits, and validation constraint edges to ensure proper handling.

**Technique:** Error Guessing  
**Explanation:** Focus on common city field entry errors and validation scenarios that typically cause user difficulties in tax processing systems.

**Technique:** User Interface Testing  
**Explanation:** Specifically validate web interface behavior, user experience, and visual feedback during extended tax invoice processing workflows.

### Test Approaches

**Description:** Interface-Specific Testing  
**Explanation:** Concentrate testing efforts exclusively on WEB UI functionality since all changes are isolated to the XML interface configuration.

**Description:** Validation-Focused Testing  
**Explanation:** Emphasize field validation behavior testing, particularly city field validation rules and error handling in extended tax contexts.

**Description:** Comparative Testing  
**Explanation:** Compare WEB UI behavior with Desktop GUI to ensure consistency where appropriate and verify platform-specific fixes work correctly.

**Description:** User Experience Testing  
**Explanation:** Validate that the fix improves user workflow and eliminates frustration points in extended tax invoice processing.

### Functional Areas Assessment

**Functional Suitability:** WEB UI fix appropriately resolves city field validation failures in extended tax invoice posting without affecting other functionality.

**Functional Correctness:** City field validation logic should now correctly accept valid city entries and reject invalid ones according to extended tax requirements.

**Functional Accuracy:** Validation should accurately process city field data in extended tax scenarios, providing precise feedback for both valid and invalid entries.

**Functional Interoperability:** Changes maintain compatibility between WEB UI and core invoice posting system while preserving integration with tax calculation engines.

**Functional Completeness:** Fix provides complete resolution for city field validation issues in WEB UI extended tax scenarios without introducing new gaps.

## 10. ITEMS PASS/FAIL CRITERIA

### PASS CRITERIA
- City field validation works correctly in WEB UI extended tax scenarios
- Valid city entries are accepted and processed successfully
- Invalid city entries show appropriate, clear error messages
- Invoice posting completes successfully with extended tax information
- No regression in Desktop GUI functionality
- Extended tax calculations remain accurate
- User workflow is smooth and intuitive

### FAIL CRITERIA
- City field validation continues to fail inappropriately
- Valid city entries are rejected by the system
- System crashes or produces unhandled errors during validation
- Invoice posting fails for previously working scenarios
- Desktop GUI functionality is negatively impacted
- Tax calculations become inaccurate
- User experience is degraded in any interface

## 11. SUSPENSION/RESUMPTION CRITERIA

### SUSPENSION CRITERIA
- Critical validation failures affecting invoice posting
- System instability in test environment
- Dependencies on tax calculation system become unavailable
- WEB UI interface becomes inaccessible
- Blocking defects prevent meaningful validation testing

### RESUMPTION CRITERIA
- All blocking validation issues resolved and verified
- Test environment restored to stable operational state
- Tax calculation systems are available and functional
- WEB UI interface is accessible and responsive
- Development team confirms fix readiness for comprehensive testing

## 12. TESTING TASKS

### Manual Test Cases

**Test Case TC-001: Extended Tax City Validation**
- **Preconditions:** WEB UI access with extended tax system enabled and customer requiring extended tax
- **Scenario:** Create invoice with extended tax information including city field, then post the invoice
- **Expected Result:** City field validation accepts valid entry and invoice posts successfully without errors

**Test Case TC-002: City Field Edge Cases**
- **Preconditions:** WEB UI extended tax setup with various city name scenarios prepared
- **Scenario:** Test city fields with different lengths, special characters, and formats during invoice posting
- **Expected Result:** System appropriately validates each city entry type and provides clear feedback for invalid entries

**Test Case TC-003: Cross-Platform Consistency**
- **Preconditions:** Access to both WEB UI and Desktop GUI with identical customer and tax configuration
- **Scenario:** Process identical extended tax invoices in both interfaces and compare validation behavior
- **Expected Result:** Both interfaces handle extended tax appropriately with WEB UI city validation now working correctly

### Previous Events Analysis

**Related Historical Issues:**
- **Version 027:** "Add tax code, GST and USA tax systems(tax)" - Extended tax system implementation
- **Version 019:** "Generate an error message when customer is taxable and productclass is _GST or _FED" - Tax validation logic
- **Version 037:** "Changes for Avanti (C5512)" - UI-related modifications and enhancements

**Historical Test Cases:**
- **TC-027-001:** Validate USA tax system functionality with complete state/county/city field processing
- **TC-019-001:** Test tax validation error messaging for various customer and product class combinations
- **TC-037-001:** Ensure UI modifications maintain consistency and functionality across different interface types

## 13. ENVIRONMENT
- **Development Environment:** IMP - For defect reproduction and validation
- **Test Environment:** TST - For fix validation and comprehensive regression testing  
- **Requirements:** SYSPRO AR module with extended tax system enabled, WEB UI access
- **Test Data:** Customers configured for extended tax, sample invoices with various city field scenarios

## 14. RESPONSIBILITIES
- **TESTER:** QA Team Member (To be assigned)
- **DEVELOPER:** MPR (Primary developer for PDR 134460)
- **BUSINESS ANALYST:** AR module subject matter expert
- **UI SPECIALIST:** WEB UI configuration expert for XML-related changes
- **TEST COORDINATOR:** QA Lead for AR module testing

## 15. SCHEDULE (PROJECT EVENTS)
- **Test Plan Review:** [To be scheduled upon completion]
- **Test Case Execution Start:** [Upon TST environment deployment with fix]
- **WEB UI Focused Testing:** [Primary testing phase for interface validation]
- **Regression Testing:** [Following successful primary testing]
- **Cross-Platform Validation:** [Comparison testing between WEB UI and Desktop]
- **Sign-off Target:** [Based on successful test completion and issue resolution]
- **Production Deployment:** [Subject to successful test validation and approval]