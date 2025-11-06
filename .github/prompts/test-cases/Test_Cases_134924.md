# Test Case Document — GENPJM.CBL (PDR 134924)

## Test Case 1: Save Custom Forms with Zero Lines
- **Preconditions:** User has access to GL Journal Entry and custom forms are enabled.
- **Scenario:** Create a new journal entry with zero lines and attempt to save custom forms.
- **Expected Result:** Custom forms are saved correctly without errors.

## Test Case 2: Save After Removing All Lines
- **Preconditions:** Existing journal entry with lines; user removes all lines before saving.
- **Scenario:** Save the journal and custom forms.
- **Expected Result:** Custom forms are still saved correctly.

## Test Case 3: Regression — Save After Printing from Excel
- **Preconditions:** Journal entry with custom forms and lines.
- **Scenario:** Save after printing from Excel.
- **Expected Result:** Save button enables and custom forms are saved.

## Test Case 4: Regression — Save Authorized Journal
- **Preconditions:** Journal entry is authorized.
- **Scenario:** Save the journal.
- **Expected Result:** Journal remains authorized and custom forms are saved.

## Edge Cases
- Saving custom forms after deleting all lines.
- Saving with mixed line states.

## Recommended Automation
Automate tests for saving custom forms with zero and non-zero lines.
