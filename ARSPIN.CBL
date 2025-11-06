8.0   * This program has been copied to SYSPRO 8.
      **************************************************************
      **                      SYSPRO                              **
      **  Copyright (c) 1994-2025 SYSPRO Ltd. All rights reserved.**
      **************************************************************
      **  Program name  : ARSPIN                                  **
      **  Description   : AR Invoice Posting                      **
      **  Run from menu : Yes                                     **
      **  Can be secured: Yes                                     **
      **  Owner         : Financial                               **
      **************************************************************
      *
      *   Date   Init   PDR Description
044   * 28/08/25 MPR 134460 WEB UI: When posting invoice with extended
      *                     tax code an error was returned. 
      *                     Changes limited to ARSPINL3.XML.
043   * 14/05/25 ARA 133047 Generate document number incorrectly
      *                     checked when key type is Alphanumeric(GUI).
042   * 03/26/25 WAL 132351 Disallow same invoice usage for sub/master
      *                     in the same run.
042s  *                     Minor scamp.
041   * 08/08/23 VN  124425 Dated exchange rates (F3000)
041a  *                     Add code to ignore dated exchange rate flag
040   * 25/02/22 RPM 116551 GL Dimension Analysis (Project F1890).
039   * 01/02/22 AHY 116070 Enlarged WS field so that data is not 
      *                     truncated(F1980)
038   * 01/12/21 lch 114329 Remove reference to getting the next 
      *                     register. (ARSTIN gets this now so 
      *                     removing this to avoid future confusion)
037   * 06/05/20 LUS 104469 Changes for Avanti (C5512).
036   * 06/08/19 kim  98614 Clears out tax code when validating geo area
035   * 27/05/19 WAL  96636 Toast message not disabling main screen.
034   * 13/11/18 LCH  93960 Fix key for ARSCTL and eSignatures
033   * 07/08/18 LUS  92457 Control account in detail.
032   * 31/10/17 ARA  87622 Use origional invoice rate when posting to
      *                     existing invoice.
      *                     Create Reval GL journal when posting credit
      *                     and debit notes to exsiting invoices(032Ex)
031   * 30/06/17 WAL  82394 SYSPRO 8 Migration
      *                     No Changes
8.0   *----------------------------------------------------------
030   * 21/04/17 ARA  80927 Subscript outof range when you tabbed off
      *                     the Document value without entering the
      *                     customer (gui).
029   * 16/08/16 ARA  77444 Custom forms not saved correctly(gui)
028   * 18/07/16 ARA  77169 Customer not found when geographical area
      *                     is blank(038)
027   * 18/05/16 ARA  75686 Add tax code, GST and USA tax systems(tax).
026   * 22/04/16 ARA  75800 Multiple warning when future date(gui)
025   * 31/03/16 ARA  75063 No warning given when invalid date eneterd
      *                     (gui)
024   * 03/12/15 ZTM  73663 Use original invoice exchange rate
022   * 19/03/15 VN   68784 Posting Information pane totals are updated
023   * 11/05/15 WAL  69598 Remove Begin-Transaction when generating
      *                     inv. incorrectly when changing lines
021   * 28/11/14 SHA  63460 Input fields were being flagged for
      *                     translation. (GUI only).
020   * 17/09/14 ARA  64577 Fixed exchange rate disable when credit or
      *                     debit note are selected.(gui)
019   * 18/08/14 ARA  64010 Generate an error message when customer is
      *                     taxable and productclass is _GST or _FED
018b  * 05/08/14 VN   63600 If type in product class and click 'Add'
      *                     without tabbing/entering, nothing happens
      *                     (gui change - if product class updated, go
      *                     and validate it)
018   * 26/06/14 VN   62760 Transaction value displayed doubles when
      *                     adding a line to previous months
017   * 26/06/14 EDD  59578 Same document type used for credit and debit
016   * 29/05/14 VN   62252 Set listview (ARSPINL1.CBL) to
      *                     CannotSaveFormValues
015   * 19/03/14 WAL  60328 Custom fields do not save
014   * 24/02/14 WAL  58092 Retain Customer between tranx. FF
013   * 30/05/13 ZTM  55102 Handle "Fixed exchange rate" correctly
012   * 14/08/12 WAL  45732 Conversion to SYSPRO 7
      * 13/03/13            Adapt GenKey/Val
      * 19/02/13 ZKR  45732 Removed obsolete code(Events & Triggers)
7.0   *----------------------------------------------------------
011   * 22/02/12 WAL  43136 Use SORUIN no allocate invoices and
      *                     implement Customs Forms
010   * 04/11/11 WAL  42216 Increment _CRD to _CRE,CRF,CRG...
009   * 27/06/11 ZTM  38851 Cater for "Submit" function - Screenset only
008   * 19/05/11 WAL  37808 When you Tab too fast couses Recursive error
007   * 06/05/11 ADA  37447 Changes to prevent 114 error
006a  * 18/01/11 WAL  33954 Tooltips not showing.TB
006   * 14/01/10 WAL  33899 Branch list security error
005b  * 18/10/10 WAL  31646 Recalc of Info panel affected by delete +DS
005   * 12/10/10 WAL  30873 Generate Document number is available when
      *                     using alpha invoice numbers by company
005   * 12/10/10 WAL  30858 When you edit existing entry and you
      *                     captured your own number you cannot apply 
      *                     changes
004   * 11/08/10 WAL  29616 Invalid Date comparison if date is mm/dd/yy.
003   * 25/06/10 WAL  28789 Allow Geo code to be blank.DS
003   * 08/06/10 WAL  28283 Allow set-propertysheet to fire twice. DS
002a  * 08/10/09 WAL  18454 6.1 UI.
002   * 25/06/09 kim  19962 Call ARSPGI for RTGL
001   * 21/07/09 WAL  20409 Browse button on Terms
001b  *          WAL  20201 Enabling of Post button
000   * 01/12/07 WAL  85119 Note the following major changes:
      *               1) Use new interface
      *               2) Use ARSTIN B/O for posting transactions
      *               3) Apply eSignatures
      *
      ******************************************************************
       FILE-CONTROL.
      *
       Copy "ARSBAL.SEL".
       Copy "ARSCTL.SEL".
       Copy "ARSMST.SEL".
       Copy "ARSSTC.SEL".
       Copy "ARSSTD.SEL".
       Copy "ARSSTS.SEL".
       Copy "ARSSTX.SEL".
       Copy "ARSTRN.SEL".
       Copy "SALARE.SEL".
       Copy "SALBRN.SEL".
       Copy "SALSLS.SEL".
       Copy "SALICT.SEL".
       Copy "SALINS.SEL".
       Copy "SALPRD.SEL".
       Copy "SALTXG.SEL".
       Copy "ADMTXG.SEL".
       Copy "TBLART.SEL".
       Copy "ARSINV.SEL".
       Copy "ADMREP.SEL".
       Copy "ADMRPT.SEL".
tax    Copy "ADMTAX.SEL".
040    Copy "GENDTF.SEL".
      *
       Copy "CLASS.WRK".
              .
      *
       DATA DIVISION.
       FILE SECTION.
      *
       FD ARSBAL.
       Copy "ARSBAL.MAC".
       FD ARSCTL.
       Copy "ARSCTL.MAC".
       FD ARSINV.
       Copy "ARSINV.MAC".
       FD ARSMST.
       Copy "ARSMST.MAC".
       FD ARSSTC.
       Copy "ARSSTC.MAC".
       FD ARSSTD.
       Copy "ARSSTD.MAC".
       FD ARSSTS.
       Copy "ARSSTS.MAC".
       FD ARSSTX.
       Copy "ARSSTX.MAC".
       FD ARSTRN.
       Copy "ARSTRN.MAC".
       FD SALARE.
       Copy "SALARE.MAC".
       FD SALBRN.
       Copy "SALBRN.MAC".
       FD SALSLS.
       Copy "SALSLS.MAC".
       FD SALICT.
       Copy "SALICT.MAC".
       FD SALINS.
       Copy "SALINS.MAC".
       FD SALPRD.
       Copy "SALPRD.MAC".
       FD SALTXG.
       Copy "SALTXG.MAC".
       FD ADMTXG.
       Copy "ADMTXG.MAC".
       FD TBLART.
       Copy "TBLART.MAC".
       FD ADMREP.
       Copy "ADMREP.MAS".
       FD ADMRPT.
       Copy "ADMRPT.MAS".
tax    FD ADMTAX.
tax    Copy "ADMTAX.MAC".
040    FD GENDTF.
040    Copy "GENDTF.MAT".

      *
       Working-storage Section.
      *
       Copy "STANDARD.WRK".
      *
       78 ProgramId          Value "ARSPIN".
      *
       01  WHAT-STRING       Value "@(#) Program version    .044".
           03  Filler        Pic X(25).
           03  VERS          Pic 9(3).
       01  WHAT-DUMMY        Pic X(2) Value X"0D0A".
      *
      *
       01  SAV-SALI-ICLS               Pic X.
       01  SAV-SALI-IGEO               Pic X.
       01  SAV-SALI-IWH                Pic X.
      * Store number To be stored for a sub-account.
70ok   01  STORENO                     Pic X(20).
      * Saved i/o area after reading for master/subaccount...
039    01  SAV-C10REC                  Pic X(ARSMST-MAC-RLN).
70Fix  01  Alpha-Cus                   Pic X(15).
70Fix  01  Numeric-Cus Redefines Alpha-Cus Pic 9(15).
       01  SUB-ACCOUNT                 Pic X.
      * Original document values
       01  DOC-VALUE                   Pic S9(12)V9(2).
       01  COST-VALUE                  Pic S9(12)V9(2).
       01  TAX-VALUE                   Pic S9(12)V9(2).
       01  GST-VALUE                   Pic S9(12)V9(2).
       01  EXEMPT-VALUE                Pic S9(12)V9(2).
      * Local currency equivalent values
       01  LOCAL-DOC-VALUE             Pic S9(12)V9(2).
       01  LOCAL-TAX-VALUE             Pic S9(12)V9(2).
       01  LOCAL-GST-VALUE             Pic S9(12)V9(2).
       01  LOCAL-EXEMPT-VALUE          Pic S9(12)V9(2).
      * Total Local currency equivalent values
       01  T-LOCAL-DOC-VALUE           Pic S9(12)V9(2).
       01  T-LOCAL-TAX-VALUE           Pic S9(12)V9(2).
       01  T-LOCAL-GST-VALUE           Pic S9(12)V9(2).
       01  T-LOCAL-EXEMPT-VALUE        Pic S9(12)V9(2).
      * Used in overflow checking on A/R balance.
       01  CTL-OVER                    Pic S9(12)V9(2).
      * Overflow check field
       01  TEMP-BAL                    Pic S9(12)V9(2).
      * Fields for next branch invoice number
70Fix *01  BRANCH-INV.
70Fix *    03  BRANCH-PRE              Pic X.
70Fix *    03  BRANCH-NUM              Pic 9(5).
      * Fields To check invoice number entered
70Fix  01  TRNINV                      Pic X(20).
70Fix  01  TRNINV-1 Redefines TRNINV   Pic X.
70Fix  01  TRNINV-2 Redefines TRNINV   Pic X(2).
70Fix  01  TRNINV-3 Redefines TRNINV   Pic X(3).
70Fix  01  TRNINV-4 Redefines TRNINV   Pic X(4).
       01  TRNINN   Redefines TRNINV   Pic 9(15).
       01  SAV-MD                      Pic X.
      * Edit fields for listview...
       77  ED-12-2                     Pic ----,---,---,--9.99.
       77  ED-6-6                      Pic ----,--9.999999.
       77  EDDAT                       Pic 99/99/99.

       01  wsX1                        Pic 999.
       01  wsThisErrItem               Pic 999.
       01  wsLastErrItem               Pic 999.
       01  wsBoPhase                   Pic X.
       01  wsErrStr                    Pic X(1000).
       01  wsValidatedItems            Pic 999.
       01  wsInValidItems              Pic 999.
       01  ESIG-TYPE                   Pic X(20).
       01  ESIG-INV                    Pic X.
       01  ESIG-CRN                    Pic X.
       01  ESIG-DRN                    Pic X.
       01  wsCheckDupInvoice.
70Ok       03  wsChkInv                Pic X(20) Occurs 1000 Times.
70Ok       03  wsChkCus                Pic X(15) Occurs 1000 Times.
017        03  wsChkTyp                Pic X(1)  Occurs 1000 Times.
002    01  ARI-KEY.
002        03  ARI-YEAR                Pic 9(4).
002        03  ARI-MONTH               Pic 9(2).
70Ok       03  ARI-REG                 Pic 9(10).
70Fix      03  ARI-INV                 Pic X(20).
002        03  ARI-LIN                 Pic 9(5).
tax    01  SHIP-DISPLAY.
tax        03  SHIP-DISP-STATE         Usage State2TD.
tax        03  FILLER                  Pic X VALUE "/".
tax        03  SHIP-DISP-COZIP         Usage CountyZipTD.
tax        03  FILLER                  Pic X VALUE "/".
tax        03  SHIP-DISP-CITY          Usage City3TD.
tax    01  TAXFIELDS.
tax        03  TAX-RATE                Usage TaxRateTD.
tax        03  TAXBLE-VAL-PLUS-FED     Pic S9(12)V9(2).
tax        03  TAXABLE-AMT             Pic S9(12)V9(2).
tax        03  USA-STD-TAXABLE         Pic S9(12)V9(2).
tax        03  DOC-DATE                Pic 9(6).
tax    01  GSTTAXFIELDS.
tax        03  GST-RATE                Usage TaxRateGstTD.
tax        03  CAL-GST-VALUE           Usage ValueTD. *> Calculated GST value
tax    01  TAXTYPE                     Pic X.
tax    01  EXT-TAX-RATE                Usage TaxRateTD.
tax    01  SAVED-AREA                  Pic X(10).
032Ex  01  ARP-KEY.
032Ex      03  ARP-YEAR                Pic 9(4).
032Ex      03  ARP-MONTH               Pic 9(2).
032Ex      03  ARP-JNL                 Pic 9(10).
032Ex  01  CUR-JNL                     Pic 9(10).
      *
037    01  Hide-Tax.
037        03 BASIC-Hidden             Pic 9.
037        03 BASIC-Edit               Pic X.
037        03 GST-Hidden               Pic 9.
037        03 GST-Edit                 Pic X.
037        03 USA-Hidden               Pic 9.
037        03 USA-Edit                 Pic X.
       01  Hide-Avanti.
037        03 Avanti-Hidden            Pic 9.
037        03 Avanti-Edit              Pic X.
      *
040    01  SalGlIntSaleYN              Pic X.
041    01  access-inv-cdb-rate    pic x.
       *>    eSig to indicate ability to override exchange rate
       *>    (only when dated exchange rates are in use)
041    01  returned-cdb-rate      pic 9(6)v9(6).
       *>    Exchange rate returned from impzmc dated rate routine
041    01  returned-cdb-muldiv    pic x.
       *>    Multiply/divide returned from impzmc dated rate routine
041    01  cdb-supplied-date      pic 9999/99/99.
041a   01  store-cdb-required     pic x.
      *
       Copy "MON.WRK".
       Copy "DEB.WRK".
       Copy "AGE.WRK".
       Copy "TAX.WRK".
       Copy "IMPZMC.LNK".
       Copy "ARSPIN.CPB".
       Copy "DSCTL.WRK".
       Copy "WWLINK.WRK".
       Copy "LNK.WRK".
       Copy "COMPAR.WRK".
       Copy "COMCRX.WRK".
       Copy "REPORT.WRK".
       Copy "IMPTRN.WRK".
011    Copy "SORUIN.LNK".
70Fix  Copy "KEYGEN.WRK".
040    Copy "GLGENDAN.WRK".
040    Copy "GLDIMANA.WRK".
040    Copy "GLDIM.LNK".
040s  *copy "SQL.WRK".
040    copy "DEL.WRK".


       *> Invoice entry fields
       78  WS-Cus                 Value Start Of D-Customer
                                      - Start Of D-DATA-BLOCK.
       78  WS-Branch              Value Start Of D-Branch
                                      - Start Of D-Data-Block.
       78  WS-Document-Type       Value Start Of D-Document-Type
                                      - Start Of D-Data-Block.
       78  WS-Generate-Invoice    Value Start Of D-Generate-Invoice
                                      - Start Of D-Data-Block.
       78  WS-Post-To-Invoice     Value Start Of D-Post-To-Invoice
                                      - Start Of D-Data-Block.
       78  WS-Invoice-Id          Value Start Of D-Invoice-Id
                                      - Start Of D-Data-Block.
       78  WS-Document-Date       Value Start Of D-Document-Date
                                      - Start Of D-Data-Block.
       78  WS-Document-Reference  Value Start Of D-Document-Reference
                                      - Start Of D-Data-Block.
       78  WS-Document-Value      Value Start Of D-Document-Value
                                      - Start Of D-Data-Block.
       78  WS-Tax-Value           Value Start Of D-Tax-Value
                                      - Start Of D-Data-Block.
       78  WS-Gst-Value           Value Start Of D-Gst-Value
                                      - Start Of D-Data-Block.
       78  WS-TB04Rate            Value Start Of D-TB04Rate
                                      - Start Of D-Data-Block.
       78  WS-Fixed-Exch          Value Start Of D-Fixed-Exch
                                      - Start Of D-Data-Block.
       78  WS-Cost-Value          Value Start Of D-Cost-Value
                                      - Start Of D-Data-Block.
       78  WS-Product-Class       Value Start Of D-Product-Class
                                      - Start Of D-Data-Block.
       78  WS-Terms-Code          Value Start Of D-Terms-Code
                                      - Start Of D-Data-Block.
       78  WS-Geographic-Area     Value Start Of D-Geographic-Area
                                      - Start Of D-Data-Block.
       78  WS-Salesperson         Value Start Of D-Salesperson
                                      - Start Of D-Data-Block.
       78  WS-Currency            Value Start Of D-C10CUR
                                      - Start Of D-Data-Block.
       78  WS-TaxCode             Value Start Of D-C1TXCD
                                      - Start Of D-Data-Block.
       *> Information
       78  WS-PstYer              Value Start Of D-PstYer
                                      - Start Of D-Data-Block.
       78  WS-PstMon              Value Start Of D-PstMon
                                      - Start Of D-Data-Block.
       78  WS-Invoice-Register    Value Start Of D-Invoice-register
                                      - Start Of D-Data-Block.
       78  WS-Document-Totals     Value Start Of D-Document-Totals
                                      - Start Of D-Data-Block.
       78  WS-Documents-Processed Value Start Of D-Documents-Processed
                                      - Start Of D-Data-Block.
       78  WS-Inv-Ctl             Value Start Of D-Inv-Ctl
                                      - Start Of D-Data-Block.
       78  WS-Cre-Ctl             Value Start Of D-Cre-Ctl
                                      - Start Of D-Data-Block.
       78  WS-Deb-Ctl             Value Start Of D-Deb-Ctl
                                      - Start Of D-Data-Block.
       78  WS-T-Local-Doc         Value Start Of D-T-Local-Doc
                                      - Start Of D-Data-Block.
       78  WS-T-Local-Tax         Value Start Of D-T-Local-Tax
                                      - Start Of D-Data-Block.
       78  WS-T-Local-Gst         Value Start Of D-T-Local-Gst
                                      - Start Of D-Data-Block.
       78  WS-T-Local-Exempt      Value Start Of D-T-Local-Exempt
                                      - Start Of D-Data-Block.
tax    78  WS-Tax-Code            Value Start Of D-Tax-Code
                                      - Start Of D-Data-Block.
tax    78  WS-GST-Code            Value Start Of D-GST-Code
                                      - Start Of D-Data-Block.
tax    78  WS-GST-Taxable         Value Start Of D-GST-Taxable
                                      - Start Of D-Data-Block.
tax    78  WS-City                Value Start Of D-City
                                      - Start Of D-Data-Block.
tax    78  WS-State               Value Start Of D-State
                                      - Start Of D-Data-Block.
tax    78  WS-CoZip               Value Start Of D-CoZip
                                      - Start Of D-Data-Block.
tax    78  WS-Extrate             Value Start Of D-EXT-TAX-RATE
                                      - Start Of D-Data-Block.
tax    78  WS-PST-Taxable         Value Start Of D-PST-Taxable
                                      - Start Of D-Data-Block.
tax    78  WS-Exempt              Value Start Of D-TAXABLE
                                      - Start Of D-Data-Block.
tax    78  WS-Ext-Value           Value Start Of D-Ext-tax-Value
                                      - Start Of D-Data-Block.
tax    78  WS-Ext-Taxable         Value Start Of D-EXT-TAXABLE
                                      - Start Of D-Data-Block.
037    78  WS-RESET-CR-STATUS     Value Start Of D-RESET-CR-STATUS
                                      - Start Of D-Data-Block.
037    78  WS-BRANCH-SELECTION    Value Start Of D-BRANCH-SELECTION
                                      - Start Of D-Data-Block.
037    78  WS-DEF-BRANCH          Value Start Of D-DEF-BRANCH
                                      - Start Of D-Data-Block.

       78  cId                    Value 1.
       78  cStat                  Value 2.
       78  cCus                   Value 3.
       78  cCusNam                Value 4.
       78  cBr                    Value 5.
       78  cDocType               Value 6.
       78  cGenDoc                Value 7.
       78  cPostTo                Value 8.
       78  cInvId                 Value 9.
       78  cDocDate               Value 10.
       78  cDocRef                Value 11.
       78  cDocVal                Value 12.
       78  cTaxVal                Value 13.
       78  cGstVal                Value 14.
       78  cFixExch               Value 15.
       78  cRate                  Value 16.
       78  cCostVal               Value 17.
       78  cProd                  Value 18.
       78  cTerms                 Value 19.
       78  cGeo                   Value 20.
       78  cSal                   Value 21.
       78  cCur                   Value 22.
       78  cExempt                Value 23.
tax    78  cTax                   Value 24.
tax    78  cGst                   Value 25.
tax    78  cGSTExempt             Value 26.
tax    78  cExtzip                Value 27.
tax    78  cExtrate               Value 28.
tax    78  cExtcity               Value 29.
tax    78  cExtstate              Value 30.
       78  cL3Columns             Value 30.


      *****
       01  LNK2                        Pic X(6000).
       01  Redefines LNK2.
           02 IMPFRO-LINK.
              Copy "IMPFRO.LNK".
       01  LNK-RED Redefines LNK2.
           Copy "EDIT.WRK".
       01  Filler Redefines LNK2.
           Copy "COMPAR.LNK".
       01  Filler Redefines LNK2.
           Copy "COMPST.LNK".
      *
      *
       Linkage Section.
       Copy "LINK.WRK".
       01  LINK2                       Pic X.
      *
      *
       Procedure Division Using LINK, LINK2.
       Copy "PROBEGIN.PRO".
       Begin.
           Go To BEG20.
      *
       Copy "COMPAR.PRO".
       Copy "COMCRX.PRO".
       Copy "PRODEB.PRO".
       Copy "PROMC.PRO".
       Copy "PROTAXE.PRO".
       Copy "IMPFRO.PRO".
       Copy "REPORT.PRO".
       Copy "IMPTRN.PRO".
012    Copy "KEYGEN.PRO".
tax    Copy "PROTAX.PRO".
040    Copy "GLDIMANA.PRO".
040    Copy "GENDTF.PRO".
040s  *Copy "SQL.PRO".
040    Copy "PRODEL.PRO".
      *


       BEG20.

041a       initialize store-cdb-required
041a       move im5-cdb-required to store-cdb-required
041a       move " "              to im5-cdb-required
           If  IM0DEB Not = "Y"
               Perform MODULE-NOT-INSTALLED
               Go To ENDJOB
           End-If
           Perform ARSCTL-BUILD-AND-OPEN-IO-Comer
           Perform ARSMST-BUILD-AND-OPEN-IO-Comer
           Perform ARSBAL-BUILD-AND-OPEN-IO-Comer
           Perform ARSTRN-BUILD-AND-OPEN-IO-Comer
           Perform ARSINV-BUILD-AND-OPEN-IO-Comer
           Perform ARSSTC-BUILD-AND-OPEN-IO-Comer
           Perform ARSSTD-BUILD-AND-OPEN-IO-Comer
           Perform ARSSTS-BUILD-AND-OPEN-IO-Comer
           Perform ARSSTX-BUILD-AND-OPEN-IO-Comer
           Perform SALBRN-BUILD-AND-OPEN-IO-Comer
           Perform SALSLS-BUILD-AND-OPEN-IO-Comer
           Perform SALPRD-BUILD-AND-OPEN-IO-Comer
           Perform SALINS-BUILD-AND-OPEN-IO-Comer
           Perform SALICT-BUILD-AND-OPEN-IO-Comer
           Perform SALARE-BUILD-AND-OPEN-IO-Comer
           Perform TBLART-BUILD-AND-OPEN-IO-Comer
tax        Perform ADMTAX-BUILD-AND-OPEN-IO-Comer
           If  IM2-GEO-TAX = "G" OR "A" *> Open USA tax file
               Perform SALTXG-BUILD-AND-OPEN-IO-Comer
               Perform ADMTXG-BUILD-AND-OPEN-IO-Comer
           End-If
           Move 0 To XX4             *> AR control
           Move Spaces To ARSCTL-KEY
           Move "CTL"  To ARSCTL-CTL
           Perform ARSCTL-READ
           If  Not STAT-LCK And Not STAT-OK
               Add 1 To XX4
               Move CTL-ERR-AR-00 To CTL-ERR(XX4)
               Perform CONTROL-ERROR
               GO To ENDJOB
           End-If
           Move ARSCTL-BAL(1) To CTL-OVER *> overflow checking...
           If  IM2-SAL-PGL NOT = "N"  *> Read for sales interface
               Move Spaces To SALICT-KEY
               Move "CTL"  To SALICT-KEY
               Perform SALICT-READ
               If  NOT STAT-LCK AND NOT STAT-OK
                   Add 1 To XX4
                   Move CTL-ERR-SM-I To CTL-ERR(XX4)
                   Perform CONTROL-ERROR
                   GO To ENDJOB
               Else
                   Move SALICT-ICLS To SAV-SALI-ICLS
                   Move SALICT-IGEO To SAV-SALI-IGEO
                   Move SALICT-IWH  To SAV-SALI-IWH
               End-If
           End-If
           Initialize DS-CONTROL-BLOCK
           Initialize D-DATA-BLOCK
           Move "ARSPIN"       To SCREENSET-NAME
           Move DSG-PUSH-SET   To DSG-CONTROL
           Move IM0SOS         To D-IMOSOS
036        Move LINK-AVANTI    To D-LINK-AVANTI
           .
      *
       ASK-POSTING-PERIOD.
           Move "C" To PM-ACTION
           Move ARSCTL-MONTH-NO    To PM-INPMON
           Move ARSCTL-YEAR        To PM-INPYEAR
           Move "AR"               To PM-MODULE
           Move "Y"                To PM-INT
033        If  IM2-SAL-PGL NOT = "D" AND NOT = "S" AND NOT = "C"
               Move "N" To PM-INT
           End-If
           If  ARSCTL-MONTH-NO > 2
               Move ARSCTL-CFLAG(ARSCTL-MONTH-NO - 1) To PM-FLAG1
               Move ARSCTL-CFLAG(ARSCTL-MONTH-NO - 2) To PM-FLAG2
           Else
               If  ARSCTL-MONTH-NO = 2
                   Move ARSCTL-CFLAG(1) To PM-FLAG1
                   If  IM0GPR = 13
                       Move ARSCTL-PFLAG(13) To PM-FLAG2
                   Else
                       Move ARSCTL-PFLAG(12) To PM-FLAG2
                   End-If
               Else
                   If  IM0GPR = 13
                       Move ARSCTL-PFLAG(13)  To PM-FLAG1
                       Move ARSCTL-PFLAG(12) To PM-FLAG2
                   Else
                       Move ARSCTL-PFLAG(12) To PM-FLAG1
                       Move ARSCTL-PFLAG(11) To PM-FLAG2
                   End-If
               End-If
           End-If
      *    Move IM2-PASS-DPREV To PM-PASSWORD
           Move "-ARS01"       To PM-PASS-TYPE
           Move MULTI-PERIOD-FIELDS To LINK-EXTRA
           Move "IMPPST"       To WW-PROG-NAME
           Perform CALL-PROGRAM
           If  LINK-EXTRA = Spaces
               GO To ENDJOB
           End-If
           Move LINK-EXTRA To MULTI-PERIOD-FIELDS
           Move Spaces     To LINK-EXTRA
           Move PM-PSTYER  To D-PSTYER
           Move PM-PSTMON  To D-PSTMON
           Evaluate PM-MON
           When "1" Move "C" To AS-OF-SELECTION
           When "2" Move "P" To AS-OF-SELECTION
           When "3" Move "2" To AS-OF-SELECTION
           End-Evaluate
           Perform DEBPAC-MONTH-END-DATES
      * Build remaining data block fields...
           Move IM50-CUR       To D-IM50-CUR
           Move IM50-FED       To D-IM50-FED
           Move IM50-FOREIGN   To D-IM50-FOREIGN
           Move IM2-GEO-TAX    To D-IM2-GEO-TAX
      * Assume To use the default branch against each customer...
037        MOVE "1" TO D-Branch-Selection
      * Disable being able To generate a document number...
      * If Alpha invoice numbering 'on' and it is by company...
           Move "Y" To D-GENERATE-NO-ALLOWED
70Ok       If  IM50-INVNO-TYP = "A"
               If  IM2-INVNO-METHOD NOT = "B"
                   Move "N" To D-GENERATE-NO-ALLOWED
               End-If
           End-If
           Move "N" To D-Access-Inv
                       D-Access-Crn
                       D-Access-Drn
           Move 10     To WW-ACCESS-NUM
           Perform FILTER-ACCESS-TT
           Move WW-ACCESS-OK To D-ACCESS-INV
           Move 11     To WW-ACCESS-NUM
           Perform FILTER-ACCESS-TT
           Move WW-ACCESS-OK To D-ACCESS-CRN
           Move 12     To WW-ACCESS-NUM
           Perform FILTER-ACCESS-TT
           Move WW-ACCESS-OK To D-ACCESS-DRN
           If  Stat-Code = "00"
               Perform Esignatures-Verify
               If  D-ACCESS-INV = "Y"
                   If  ESIG-INV = "N"
                       Move "N" To D-ACCESS-INV
                   End-If
               End-If
               If  D-Access-CRN  = "Y"
                   If  ESIG-CRN = "N"
                       Move "N" To D-ACCESS-CRN
                   End-If
               End-If
               If  D-Access-DRN = "Y"
                   If  ESIG-DRN = "N"
                       Move "N" To D-ACCESS-DRN
                   End-If
               End-If
           End-If
           If  "N" = D-Access-Inv And D-Access-Crn and D-Access-Drn
               Move "Access denied" To D-S-Error
           End-If
           If  D-S-Error = Spaces
               Perform eSignatures-Batch-Verify
               If  STAT-CODE Not = "00"
                   Move "eSignature access denied." To D-S-Error
               End-If
           End-If
       *> Esignature to override dated exchange rate
041        if im5-cdb-required <> spaces       *> Dated ex rates reqd 
041          perform trn-initialise
041          move trnid-ars-inv-cdb to trn-id  *> Invoice override cdb
041          perform trn-verify
041          if not stat-ok
041            move "N" to access-inv-cdb-rate
041          end-if
041        end-if

      *    Perform Create-Invoice-List
      * Persit these defaults between runs
           Move "Y"        To D-Generate-Invoice
           Move "N"        To D-Post-To-Invoice
041        move "N"        to d-cdb-disable-rate d-dated-exch-rate-flag
           Perform Initialize-Entry-Values
           Perform Load-Entry-Details
           Perform Load-Info-Details
           .
      *
       MAIN-DS-LOOP.
           Perform CALL-DS
           Evaluate D-S-FR-MSG
           When "StringMsg"
               Move Length Of D-S-Fr-Par To   Upper-Lower-Length
               Call "CBL_TOLOWER" Using D-S-Fr-Par
                                By Value Upper-Lower-Length
               String
                   D-S-Chr30A      Delimited By "  "
                   " "             Delimited By Size
                   D-S-Fr-Par      Delimited By "  "*> Spaces
               Into D-S-Error

           When "read-cus"
041            move "N" to d-cdb-disable-rate d-dated-exch-rate-flag
042s           perform read-customer 
               If  ARSMST-TYPE = "S"
                       Move ARSMST-STORE To D-DOCUMENT-REFERENCE
                                            STORENO
                       Move "Y" To D-SUB-ACC
               End-If
               Perform LOAD-ENTRY-DETAILS
           When "read-cus2"  *> Just validate customer
041            move "N" to d-cdb-disable-rate d-dated-exch-rate-flag
042s           perform read-customer
041        when "check-cdb"
041            perform check-dated-exch-rates
041        when "read-cdb"
041            perform read-exchange-rate-cdb
           When "chk-oflow" *> Check overflow
               Perform CHECK-OVERFLOW
           When "read-inv" *>   Check for entered invoice
               Perform CHECK-INVOICE-NUMBER
           When "read-terms"
               Perform READ-TERMS-CODE
           When "read-br"
               Perform READ-Branch
037        When "read-defbr"
037            Perform READ-DEFINED-BRANCH
           When "read-sls"
               Perform READ-SALESPERSON
           When "read-area"
               Perform READ-AREA
           When "read-class"
019            if  D-C1TXCD  = "E"
0109               Perform PROD-CLASS-EXEMPT
019   *        If  D-PRODUCT-CLASS = "_TAX" AND D-C1TXCD = "E"
019   *            Move "tax" To D-S-ERROR
               Else
                   Perform READ-PCLASS
               End-If
           When "read-iface"
               If  IM2-SAL-PGL NOT = "N"
                   If  SAV-SALI-ICLS = "Y"
                       If  D-PRODUCT-CLASS Not = "_FIN" And Not = "_DEP"
                           And Not = "_RND" And Not = "_TAX"
                           And Not = "_FED" And Not = "_GST"
                           And Not = "_FRT"
                           Perform READ-INTERFACE
                       End-If
                   End-If
               End-If
           When "read-defbr"
               Perform READ-DEFAULT-BRANCH
           When "CHG-PERIOD" *> Change Posting Period
               Perform CHANGE-PERIOD
           When "BRW-IMPBIN"
               Perform BROWSE-IMPBIN
           When "BRW-IMPBCS"
               Perform BROWSE-IMPBCS
           When "BRW-IMPBBR"
               Perform BROWSE-IMPBBR
           When "BRW-IMPBPC"
               Perform BROWSE-IMPBPC
           When "BRW-IMPBSL"
               Perform BROWSE-IMPBSL
           When "BRW-IMPBGA"
               Perform BROWSE-IMPBGA
           When "BRW-IMPBTC"
               Perform BROWSE-IMPBTC
           When "val-date"
               Perform CHECK-FUTURE-DATE
           When "NO ACCESS"
               Move 12 To WW-ACCESS-NUM
               Perform VERIFY-ACCESS-TT
           When "Load-Inv"
           When "Reload-Inv"
               Move D-Document-Type To ESig-Type
               Perform eSignature-Prior
               If  D-S-Error = "sig-err"
                   Continue
                   *>Move "Err" to E-Sig-Type
               Else
015              If  D-S-Fr-Msg = "Load-Inv"
011                  Perform Allocate-Invoice 
                 End-If
70ok             String  D-Customer      Delimited By Size
70ok                     D-Invoice-Id    Delimited By Size
.                        D-Document-Type Delimited By Size
70Fix            Into    D-Custom-Key
041              if  d-dated-exch-rate-flag = "Y"
041              and returned-cdb-rate <> d-tb04rate
041              and d-post-to-invoice <> "Y"
041                perform esig-prior-cdb
041                if  not stat-ok
041                  move "sig-err" to d-s-error
041                  continue
041                else
041                  Perform load-invoice-to-list
041                  Perform load-info-details
041                  perform esig-complete-cdb
041                  Perform esignature-complete
041                end-if
041              else
                   Perform Load-Invoice-To-List
                   Perform Load-Info-Details
                   Perform eSignature-Complete
041              end-if

015   *            Perform Initialize-Entry-Values
015   *            Perform Load-Entry-Details
               End-If
           When "Refresh-L1"
               Perform Refresh-L1
           When "Load-Def"
005b           If  D-ADD-CHANGE-MODE = 2 *>'Change
005b               Perform Load-Info-Details
005b           End-If
               Perform Initialize-Entry-Values
               Perform Load-Entry-Details
           When "Delete-Row"
               Perform Delete-Selected-Row
           When "Post-Trx"     *> Post transaction
               Initialize wsCheckDupInvoice
               Perform Post-Transaction-BO
tax        When "Read-Tax"
tax            Perform Validate-Tax-Code
tax        When "Read-Us"
tax            Perform Browse-Us-Tax
tax        When "Calc-Tax"
tax            Perform Calculate-Tax
tax        When "Reload"
tax            Perform Load-Entry-Details
037        When "Load-brn"
037            Perform Load-Branch
tax        When "Check-ex"
tax            Perform Check-Taxable
tax        When "Get-Us"
tax            String  D-STATE Delimited By Size
tax                    D-COZIP Delimited By Size
tax                    D-CITY  Delimited By Size
tax            INTO TX-CDE
tax            Perform READ-Us-Tax
           When "EndJob"
               Go To EndJob
           End-Evaluate
           Go To MAIN-DS-LOOP
           .
      *
       Load-Entry-Details.
           Initialize IMPFRO-LINK
           Move 0  To ICX1 *> IMPFRO-COUNT
           Add 1   To ICX1
           Move "Customer "                To IMPFRO-DES(ICX1)
           Move D-Customer                 To IMPFRO-ALP(ICX1)
           Move WS-Cus                     To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Customer       To IMPFRO-LEN(ICX1)
           Move D-Cus-Nam                  To IMPFRO-TOOLTIP(ICX1)
           Move 1                          To IMPFRO-DESCTIP(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Branch "                  To IMPFRO-DES(ICX1)
           Move D-Branch                   To IMPFRO-ALP(ICX1)
           Move WS-Branch                  To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Branch         To IMPFRO-LEN(ICX1)
           Move "P"                        To IMPFRO-AND(ICX1)
035        Move "N"                        To IMPFRO-HLINK(ICX1)
           Move D-Branch-Nam               To IMPFRO-TOOLTIP(ICX1)
           Move 1                          To IMPFRO-DESCTIP(ICX1)
           If  D-Branch-Selection = 1
               If  D-Add-Change-Mode <> 2
                   Move D-Default-Branch To D-Branch, IMPFRO-ALP(ICX1)
               End-If
           End-If
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Currency"                 To IMPFRO-DES(ICX1)
           Move D-C10CUR                   To IMPFRO-ALP(ICX1)
           Move WS-Currency                To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-C10CUR         To IMPFRO-LEN(ICX1)
           Move "A"                        To IMPFRO-AND(ICX1)
           *>Move D-Currency-Name            To IMPFRO-TOOLTIP(ICX1)
           Move 1                          To IMPFRO-DESCTIP(ICX1)
           Move 3                          To IMPFRO-EDIT(ICX1)
tax   *    Add 1   To ICX1
tax   *    Move "Taxable"                  To IMPFRO-DES(ICX1)
tax   *    If  D-C1TXCD = "E"
tax   *        Move "Exempt from tax"      To IMPFRO-ALP(ICX1)
tax   *    Else
tax   *        Move "Non-exempt from tax"  To IMPFRO-ALP(ICX1)
tax   *    End-If
tax   *    Move WS-TaxCode                 To IMPFRO-BLOCK-POS(ICX1)
tax   *    Move Length Of D-C1TXCD         To IMPFRO-LEN(ICX1)
tax   *    Move "A"                        To IMPFRO-AND(ICX1)
tax   *   *> Move D-Tax-Code-Name          To IMPFRO-TOOLTIP(ICX1)
tax   *    Move 1                          To IMPFRO-DESCTIP(ICX1)
tax   *    Move 3                          To IMPFRO-EDIT(ICX1)

           Add 1   To ICX1
           Move "Document type"            To IMPFRO-DES(ICX1)
002        Evaluate D-Document-Type
           When "C" Move 1                 To IMPFRO-ALP(ICX1)
           When "D" Move 2                 To IMPFRO-ALP(ICX1)
           When Other Move 0               To IMPFRO-ALP(ICX1)
002        End-Evaluate
           Move WS-Document-Type           To IMPFRO-BLOCK-POS(ICX1)
002a       Move xtpOption                  To IMPFRO-AND(ICX1)
           Move Length Of D-Document-Type  To IMPFRO-LEN(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Generate document number" To IMPFRO-DES(ICX1)
           If  D-Generate-Invoice = "Y"
               Move "1"    To IMPFRO-ALP(ICX1)
           Else
               Move "0"    To IMPFRO-ALP(ICX1)
           End-If
           Move WS-Generate-Invoice        To IMPFRO-BLOCK-POS(ICX1)
           Move xtpCheckBox                To IMPFRO-AND(ICX1)
           Move Length Of D-Generate-Invoice To IMPFRO-LEN(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
005a       If  D-GENERATE-NO-ALLOWED = "N"
.              Move "N"        To D-Generate-Invoice
.              Move "0"        To IMPFRO-ALP(ICX1)
.              Move 3          To IMPFRO-EDIT(ICX1)
005a       End-If
           Add 1   To ICX1
           Move "Post to existing document" To IMPFRO-DES(ICX1)
           If  D-Post-To-Invoice = "Y"
               Move "1"    To IMPFRO-ALP(ICX1)
           Else
               Move "0"    To IMPFRO-ALP(ICX1)
           End-If
           Move WS-Post-To-Invoice          To IMPFRO-BLOCK-POS(ICX1)
           Move xtpCheckBox                 To IMPFRO-AND(ICX1)
           Move Length Of D-Post-To-Invoice To IMPFRO-LEN(ICX1)
           Move "Post to existing document" To IMPFRO-TOOLTIP(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           If  D-Document-Type = "I"
               Move 3                      To IMPFRO-EDIT(ICX1)
           Else
               If  D-Generate-Invoice = "Y"
                   Move 3                  To IMPFRO-EDIT(ICX1)
               Else
                   Move 2                  To IMPFRO-EDIT(ICX1)
               End-If
           End-If
           Add 1   To ICX1
           Move "Document number"          To IMPFRO-DES(ICX1)
70Fix      Move "Invoice"                  To IMPFRO-DES-OVR(ICX1)
           Move D-Invoice-Id               To IMPFRO-ALP(ICX1)
           Move WS-Invoice-Id              To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Invoice-Id     To IMPFRO-LEN(ICX1)
           Move "Q"                        To IMPFRO-AND(ICX1)
           Move "N"                        To IMPFRO-HLink(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           If  D-Generate-Invoice = "Y"
               Move 3                      To IMPFRO-EDIT(ICX1)
               Move "N"                    To IMPFRO-HLink(ICX1)
           End-If
           Add 1   To ICX1
           Move "Document date"            To IMPFRO-DES(ICX1)
           Move D-Document-Date            To IMPFRO-DAT(ICX1)
           Move WS-Document-Date           To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Document-Date  To IMPFRO-LEN(ICX1)
           Move "D"                        To IMPFRO-AND(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Document reference"       To IMPFRO-DES(ICX1)
           Move D-Document-Reference       To IMPFRO-ALP(ICX1)
           Move WS-Document-Reference      To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Document-Reference To IMPFRO-LEN(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Document value"           To IMPFRO-DES(ICX1)
           Move D-Document-Value           To IMPFRO-NUM(ICX1)
           Move WS-Document-Value          To IMPFRO-BLOCK-POS(ICX1)
           Move "M"                        To IMPFRO-AND(ICX1)
70ok       Move 2                          To IMPFRO-DEC(ICX1)
           Move Length Of D-Document-Value To IMPFRO-LEN(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Fixed exchange rate"      To IMPFRO-DES(ICX1)
013   *    Move D-VALID-FIXED              To D-Fixed-Exch
           If  D-Fixed-Exch = Spaces
               Move "N"    To D-Fixed-Exch
           End-If
013        Move  D-Fixed-Exch   To IMPFRO-ALP(ICX1)
013        MOVE "Y"           TO IMPFRO-APPLY-YN-CHECKBOX(IMPFRO-COUNT)
           Move WS-Fixed-Exch              To IMPFRO-BLOCK-POS(ICX1)
           Move xtpCheckBox                To IMPFRO-AND(ICX1)
           Move Length Of D-Fixed-Exch     To IMPFRO-LEN(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           If D-IM50-Foreign <> "Y"
              Move 3                       To IMPFRO-EDIT(ICX1)
           End-If
013        IF D-VALID-FIXED = "Y"
013           Move 1                       To IMPFRO-EDIT(ICX1)
013        End-If
013        If D-Terms-Code = "1" or "2"
013           Move 1                       To IMPFRO-EDIT(ICX1)
013        End-If

           Add 1   To ICX1
           Move "Exchange rate"            To IMPFRO-DES(ICX1)
           Move D-TB04Rate                 To IMPFRO-NUM(ICX1)
           Move WS-TB04Rate                To IMPFRO-BLOCK-POS(ICX1)
           Move "N"                        To IMPFRO-AND(ICX1)
70ok       Move 6                          To IMPFRO-DEC(ICX1)
           Move Length Of D-TB04Rate       To IMPFRO-LEN(ICX1)
013        If D-Fixed-Exch = "Y"
013          Move 1                        To IMPFRO-EDIT(ICX1)
013        Else
             Move 2                        To IMPFRO-EDIT(ICX1)
013        End-If
           If D-IM50-Foreign <> "Y"
              Move 3                       To IMPFRO-EDIT(ICX1)
           End-If
013        If D-Terms-Code = "1" or "2"
013           Move 1                       To IMPFRO-EDIT(ICX1)
013        End-If
041        if  d-cdb-disable-rate = "Y"
041          move 1                      to impfro-edit(icx1)
041        end-if
           Add 1   To ICX1
           Move "Cost value"               To IMPFRO-DES-Ovr(ICX1)
                                              IMPFRO-DES(ICX1)
           If  IM50-FOREIGN  = "Y"
               Move "Cost value (Local) "  To ImpFro-Des(IcX1)
               Move IM50-CUR               To ImpFro-ToolTip(IcX1)
70ok           Move IM50-CURDES            To ImpFro-ToolTip(IcX1)(4:)
           End-If
           Move D-Cost-Value               To IMPFRO-NUM(ICX1)
           Move WS-Cost-Value              To IMPFRO-BLOCK-POS(ICX1)
           Move "N"                        To IMPFRO-AND(ICX1)
70ok       Move 2                          To IMPFRO-DEC(ICX1)
           Move Length Of D-Cost-Value     To IMPFRO-LEN(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Product class"            To IMPFRO-DES(ICX1)
           Move D-Product-Class            To IMPFRO-ALP(ICX1)
           Move WS-Product-Class           To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Product-Class  To IMPFRO-LEN(ICX1)
           Move "S"                        To IMPFRO-AND(ICX1)
035        Move "N"                        To IMPFRO-HLINK(ICX1)
           Move D-Product-Class-Name       To IMPFRO-TOOLTIP(ICX1)
           Move 1                          To IMPFRO-DESCTIP(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Document terms"           To IMPFRO-DES(ICX1)
           Move D-Terms-Code               To IMPFRO-ALP(ICX1)
           Move WS-Terms-Code              To IMPFRO-BLOCK-POS(ICX1)
001        Move "T"                        To IMPFRO-AND(ICX1)
035        Move "N"                        To IMPFRO-HLINK(ICX1)
           Move Length Of D-Terms-Code     To IMPFRO-LEN(ICX1)
           Move D-Terms-Desc               To IMPFRO-TOOLTIP(ICX1)
           Move 1                          To IMPFRO-DESCTIP(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Geographic area"          To IMPFRO-DES(ICX1)
           Move D-Geographic-Area          To IMPFRO-ALP(ICX1)
           Move WS-Geographic-Area         To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Geographic-Area To IMPFRO-LEN(ICX1)
           Move 1                          To IMPFRO-DESCTIP(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
           Add 1   To ICX1
           Move "Salesperson"              To IMPFRO-DES(ICX1)
           Move D-Salesperson              To IMPFRO-ALP(ICX1)
           Move WS-Salesperson             To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Salesperson    To IMPFRO-LEN(ICX1)
           Move "R"                        To IMPFRO-AND(ICX1)
035        Move "N"                        To IMPFRO-HLINK(ICX1)
           Move D-Salesperson-Name         To IMPFRO-TOOLTIP(ICX1)
           Move 1                          To IMPFRO-DESCTIP(ICX1)
           Move 2                          To IMPFRO-EDIT(ICX1)
tax    *>
tax        If D-IM2-GEO-TAX = "N" Or "Y"
037           Move 0                       To BASIC-HIDDEN
037           Move Spaces                  To BASIC-EDIT
037        Else
037           Move 1                       To BASIC-HIDDEN
037           Move 1                       To BASIC-EDIT
037        End-If
tax   *  
tax        Add 1                           To ICX1
tax        Move "Basic tax information"    To IMPFRO-DES(ICX1)
tax        Move "Y"                       To IMPFRO-SHOW-COLLAPSED(ICX1)
tax        Move "H"                        To IMPFRO-AND(ICX1)
037        Move BASIC-HIDDEN               To IMPFRO-HIDDEN(ICX1)
037        Move BASIC-EDIT                 To IMPFRO-EDIT(ICX1)
tax   *
tax        Add 1                           To ICX1
tax        Move "Taxable"                  To IMPFRO-DES(ICX1)
tax        Move xtpDropDown                To IMPFRO-AND(ICX1)
tax        Move WS-Exempt                  To IMPFRO-POS(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move D-TAXABLE                  To IMPFRO-ALP(ICX1)
tax        Move Length Of D-TAXABLE        To IMPFRO-LEN(ICX1)
037        Move BASIC-HIDDEN               To IMPFRO-HIDDEN(ICX1)
037        Move BASIC-EDIT                 To IMPFRO-EDIT(ICX1)
tax   *
tax    *> Tax code
tax        Add 1                           To ICX1
tax        Move "Tax code"                 To IMPFRO-DES(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move "B"                        To TAXTYPE
tax        Move D-Tax-Code                 To IMPFRO-ALP(ICX1)
tax        Move WS-Tax-Code                To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-Tax-Code       To IMPFRO-LEN(ICX1)
037        Move BASIC-HIDDEN               To IMPFRO-HIDDEN(ICX1)
037        Move BASIC-EDIT                 To IMPFRO-EDIT(ICX1)
tax        If  D-TAXABLE = "E"
037        And BASIC-EDIT = Spaces
tax            Move 1                      To IMPFRO-EDIT(ICX1)
tax        End-If
tax        Add 1                           To ICX1
tax        Move "Tax value"                To IMPFRO-DES(ICX1)
tax        Move D-Tax-Value                To IMPFRO-NUM(ICX1)
tax        Move WS-Tax-Value               To IMPFRO-BLOCK-POS(ICX1)
tax        Move "M"                        To IMPFRO-AND(ICX1)
tax        Move 2                          To IMPFRO-DEC(ICX1)
tax        Move Length Of D-Tax-Value      To IMPFRO-LEN(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
037        Move BASIC-HIDDEN               To IMPFRO-HIDDEN(ICX1)
037        Move BASIC-EDIT                 To IMPFRO-EDIT(ICX1)
037        If BASIC-EDIT = Spaces
tax           If D-TAXABLE <> "E"
tax              Move 2                    To IMPFRO-EDIT(ICX1)
tax           Else
tax              Move 3                    To IMPFRO-EDIT(ICX1)
tax           End-If
037        End-If
037tax*    End-If
tax   *
tax     *> GST taxable
tax        If IM50-FED = "Y"
037           Move 0                       To GST-HIDDEN
037           Move Spaces                  To GST-EDIT
037        Else
037           Move 1                       To GST-HIDDEN
037           Move 1                       To GST-EDIT
037        End-If
tax        Add 1                           To ICX1
tax        Move "Canadian GST information" To IMPFRO-DES(ICX1)
tax        Move "H"                        To IMPFRO-AND(ICX1)
037        Move GST-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move GST-EDIT                   To IMPFRO-EDIT(ICX1)
tax   *
tax        Add 1                           To ICX1
tax        Move "GST taxable"              To IMPFRO-DES(ICX1)
tax        Move xtpDropDown                To IMPFRO-AND(ICX1)
tax        Move WS-GST-Taxable             To IMPFRO-POS(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move D-GST-TAXABLE              To IMPFRO-ALP(ICX1)
tax        Move WS-GST-Taxable             To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-GST-TAXABLE    To IMPFRO-LEN(ICX1)
037        Move GST-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move GST-EDIT                   To IMPFRO-EDIT(ICX1)
tax   *
tax    *> GST tax code
tax        Add 1                           To ICX1
tax        Move "GST code"                 To IMPFRO-DES(ICX1)
tax        Move "G"                        To TaxType
tax        Move D-GST-Code                 To IMPFRO-ALP(ICX1)
tax        Move WS-GST-CODE                To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-GST-Code       To IMPFRO-LEN(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
037        Move GST-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move GST-EDIT                   To IMPFRO-EDIT(ICX1)
tax        If  D-GST-TAXABLE = "E"
037        And GST-EDIT = Spaces
tax            Move  1                     To IMPFRO-EDIT(ICX1)
tax        End-If
tax   *
tax        Add 1                           To ICX1
tax        Move "GST value"                To IMPFRO-DES(ICX1)
tax        Move D-Gst-Value                To IMPFRO-NUM(ICX1)
tax        Move "M"                        To IMPFRO-AND(ICX1)
tax        Move 2                          To IMPFRO-DEC(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move WS-Gst-Value               To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-Gst-Value      To IMPFRO-LEN(ICX1)
037        Move GST-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move GST-EDIT                   To IMPFRO-EDIT(ICX1)
tax        If  D-GST-TAXABLE = "E"
037        And GST-EDIT = Spaces
tax            Move 1                      To IMPFRO-EDIT(ICX1)
tax        End-If
tax   *
tax        Add 1                           To ICX1
tax        Move "PST tax calculate on GST" To IMPFRO-DES(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move xtpCheckbox                To IMPFRO-AND(ICX1)
tax        If IM2-GEO-TAX = "N"
tax           Move  "Y"                    To D-PST-TAXABLE
tax        End-If
tax        Move D-PST-TAXABLE              To IMPFRO-ALP(ICX1)
tax        Move 1                          To IMPFRO-EDIT(ICX1)
tax        Move WS-PST-Taxable             To IMPFRO-BLOCK-POS(ICX1)
tax        Move "Y"                    To IMPFRO-APPLY-YN-CHECKBOX(ICX1)
tax        Move Length Of D-PST-TAXABLE    To IMPFRO-LEN(ICX1)
037        Move GST-HIDDEN                 To IMPFRO-HIDDEN(ICX1) 
037        Move GST-EDIT                   To IMPFRO-EDIT(ICX1)
037tax*    End-If
tax   *
tax   * Added for USA tax only
tax        If D-IM2-GEO-TAX = "G" Or "A"
037           Move 0                       To USA-HIDDEN
037           Move Spaces                  To USA-EDIT
037        Else
037           Move 1                       To USA-HIDDEN
037           Move 1                       To USA-EDIT
037        End-If
tax        Add 1                           To ICX1
tax        Move "USA Tax information"      To IMPFRO-DES(ICX1)
tax        Move "H"                        To IMPFRO-AND(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move USA-EDIT                   To IMPFRO-EDIT(ICX1)
tax   *
tax        Add 1                           To ICX1
tax        Move "USA Taxable"              To IMPFRO-DES(ICX1)
tax        Move xtpDropDown                To IMPFRO-AND(ICX1)
tax        Move WS-Ext-Taxable             To IMPFRO-POS(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move D-EXT-TAXABLE              To IMPFRO-ALP(ICX1)
tax        Move WS-Ext-Taxable             To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-EXT-TAXABLE    To IMPFRO-LEN(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move USA-EDIT                   To IMPFRO-EDIT(ICX1)
tax   *
tax        Add 1                           To ICX1
tax        Move "State (extended tax code)" To IMPFRO-DES(ICX1)
tax        Move "state usa"                To IMPFRO-DES-OVR(ICX1)
tax        Move D-STATE                    To IMPFRO-ALP(ICX1)
tax        Move "Z"                        To IMPFRO-AND(ICX1)
tax        Move WS-State                   To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-STATE          To IMPFRO-LEN(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move USA-EDIT                   To IMPFRO-EDIT(ICX1)
tax        If  D-EXT-TAXABLE = "E"
037        And USA-EDIT = Spaces
tax            Move 1                      To IMPFRO-EDIT(ICX1)
tax            Move "N"                    To IMPFRO-HLINK(ICX1)
tax        End-If
tax   *
tax        Add 1                           To ICX1
tax        Move "County (extended tax code)" To IMPFRO-DES(ICX1)
tax        Move "county usa"               To IMPFRO-DES-OVR(ICX1)
tax        If D-IM2-GEO-TAX = "G"
tax           Move "Zip code (tax code)"   To IMPFRO-DES(ICX1)
tax        End-If
tax        Move D-COZIP                    To IMPFRO-ALP(ICX1)
tax        Move "Z"                        To IMPFRO-AND(ICX1)
tax        Move WS-CoZip                   To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-COZIP          To IMPFRO-LEN(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move USA-EDIT                   To IMPFRO-EDIT(ICX1)
tax        If  D-EXT-TAXABLE = "E"
037        And USA-EDIT = Spaces
tax            Move 1                      To IMPFRO-EDIT(ICX1)
tax            Move "N"                    To IMPFRO-HLINK(ICX1)
tax        End-If
tax   *
tax        Add 1                           To ICX1
tax        Move "City (extended tax code)" To IMPFRO-DES(ICX1)
tax        Move "city usa"                 To IMPFRO-DES-OVR(ICX1)
tax        Move D-CITY                     To IMPFRO-ALP(ICX1)
tax        Move WS-City                    To IMPFRO-BLOCK-POS(ICX1)
tax        Move "Z"                        To IMPFRO-AND(ICX1)
tax        Move Length Of D-CITY           To IMPFRO-LEN(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037        Move USA-EDIT                   To IMPFRO-EDIT(ICX1)
tax        Move D-EXT-TAXABLE              To D-TAXABLE
tax        If  D-EXT-TAXABLE = "E"
037        And USA-EDIT = Spaces
tax            Move 1                      To IMPFRO-EDIT(ICX1)
tax            Move "N"                    To IMPFRO-HLINK(ICX1)
tax        End-If
tax   *
tax        Add 1                           To ICX1
tax        Move "Extended tax value"       To IMPFRO-DES(ICX1)
tax        Move D-Ext-tax-Value            To IMPFRO-NUM(ICX1)
tax        Move "M"                        To IMPFRO-AND(ICX1)
tax        Move 2                          To IMPFRO-DEC(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move WS-Ext-Value               To IMPFRO-BLOCK-POS(ICX1)
tax        Move Length Of D-Ext-tax-Value  To IMPFRO-LEN(ICX1)
tax        Move 1                          To IMPFRO-EDIT(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
tax   *
tax        Add 1                           To ICX1
tax        Move "Extended tax code"        To IMPFRO-DES(ICX1)
tax        Move "1"                        To IMPFRO-EDIT(IMPFRO-COUNT)
tax        Move D-STATE                    To SHIP-DISP-STATE
tax        Move D-COZIP                    To SHIP-DISP-COZIP
tax        Move D-CITY                     To SHIP-DISP-CITY
tax        Move SHIP-DISPLAY               To IMPFRO-ALP(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move 1                          To IMPFRO-EDIT(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
tax   *
tax        Add 1                           To ICX1
tax        Move "Extended tax base rate"   To IMPFRO-DES(ICX1)
tax        Move D-EXT-TAX-RATE             To IMPFRO-NUM(ICX1)
tax        Move WS-Extrate                 To IMPFRO-BLOCK-POS(ICX1)
tax        Move "M"                        To IMPFRO-AND(ICX1)
tax        Move 5                          To IMPFRO-DEC(ICX1)
tax        Move Length Of D-EXT-TAX-RATE   To IMPFRO-LEN(ICX1)
tax        Move xtpGroup                   To IMPFRO-GRP(ICX1)
tax        Move 1                          To IMPFRO-EDIT(ICX1)
037        Move USA-HIDDEN                 To IMPFRO-HIDDEN(ICX1)
037tax*    End-If 
037        .
      *
037   * Options will only show in the SYSPRO Avanti environment, as 
037   * the toolbar was to busy in Avanti
037        If LINK-AVANTI = "Y"
037           Move Spaces                 To Avanti-Edit
037           Move 0                      To Avanti-Hidden
037        Else
037           Move 1                      To Avanti-Edit
037           Move 1                      To Avanti-Hidden
037        End-If.
      *
037        Add 1                          To ICX1
037        Move "Options"                 To IMPFRO-DES(ICX1)
037        Move "Y"                       To IMPFRO-SHOW-COLLAPSED(ICX1)
037        Move "H"                       To IMPFRO-AND(ICX1)
037        Move Avanti-Edit               To IMPFRO-EDIT(ICX1)
037        Move Avanti-Hidden             To IMPFRO-HIDDEN(ICX1)
      *
037        Add 1                          To ICX1
037        Move "Posting period"          To IMPFRO-DES(ICX1)
037        Move "Change Posting Period"   To IMPFRO-TOOLTIP(ICX1)
037        Move xtpGroup                  To IMPFRO-GRP(ICX1)
037        Move "Edit"                    To IMPFRO-ALP(ICX1)
037        Move "U"                       To IMPFRO-AND(ICX1)
037        Move 1                         To IMPFRO-EDIT(ICX1)
037        Move Avanti-Hidden             To IMPFRO-HIDDEN(ICX1).
      *
037        Add 1                          To ICX1
037        Move "Define branch"           To IMPFRO-DES(ICX1)
037        Move "Define Branch"           To IMPFRO-TOOLTIP(ICX1)
037        Move xtpGroup                  To IMPFRO-GRP(ICX1)
037        Move "Edit"                    To IMPFRO-ALP(ICX1)
037        Move "V"                       To IMPFRO-AND(ICX1)
037        Move 1                         To IMPFRO-EDIT(ICX1)
037        Move Avanti-Hidden             To IMPFRO-HIDDEN(ICX1).
      *
037        Add 1                          To ICX1
037        Move "Reset credit status"     To IMPFRO-DES(ICX1)
037        Move xtpGroup                  To IMPFRO-GRP(ICX1)
037        Move xtpCheckbox               To IMPFRO-AND(ICX1)
037        Move D-RESET-CR-STATUS         To IMPFRO-NUM(ICX1)
037        Move D-RESET-CR-STATUS         To IMPFRO-ALP(ICX1)
037        Move WS-RESET-CR-STATUS        To IMPFRO-BLOCK-POS(ICX1)
037        Move Length Of D-RESET-CR-STATUS
037                                       To IMPFRO-LEN(ICX1)
037        Move "Reset Credit Status After Posting"
037                                       To IMPFRO-TOOLTIP(ICX1)
037        Move Avanti-Edit               To IMPFRO-EDIT(ICX1)
037        Move Avanti-Hidden             To IMPFRO-HIDDEN(ICX1).
      *
           *>
011        Move "ARINV"                    To IMPFRO-CUSTOM-FORM
011        Move D-Custom-Key               To IMPFRO-CUSTOM-KEY
           *>
           Move "ARSPINL1"                 To IMPFRO-LISTVIEW
           Perform SET-LISTVIEW-PROPERTIES
      *
           Perform Document-Type-DropDown
           .

       Document-Type-DropDown.
           Move Zeroes To wsX1
           Initialize IMPFRO-LINK
           Initialize IMPFRO-DROP-TABLE
           Add 1   To ICX1
           Move "Document type"     To IMPFRO-DROP-CAPTION(ICX1)
           If  D-Access-Inv <> "N"
               Add 1 To wsX1
               Move "Invoice"       To IMPFRO-DROP-DESC(ICX1,wsX1)
002b           Move "0"             To IMPFRO-DROP-VALUE(ICX1,wsX1)
           End-If
           If  D-Access-Crn <> "N"
               Add 1 To wsX1
               Move "Credit note"   To IMPFRO-DROP-DESC(ICX1,wsX1)
002b           Move "1"             To IMPFRO-DROP-VALUE(ICX1,wsX1)
           End-If
           If  D-Access-Drn <> "N"
               Add 1 To wsX1
               Move "Debit note"    To IMPFRO-DROP-DESC(ICX1,wsX1)
002b           Move "2"             To IMPFRO-DROP-VALUE(ICX1,wsX1)
           End-If

tax        ADD 1 TO ICX1
tax        Move "Taxable"           To IMPFRO-DROP-CAPTION(ICX1)
tax        MOVE "Exempt"               TO IMPFRO-DROP-DESC(ICX1,1)
tax        MOVE "E"                    TO IMPFRO-DROP-VALUE(ICX1,1)
tax        MOVE "Non-exempt"           TO IMPFRO-DROP-DESC(ICX1,2)
tax        MOVE "N"                    TO IMPFRO-DROP-VALUE(ICX1,2)

tax        ADD 1 TO ICX1
tax        Move "GST taxable"          To IMPFRO-DROP-CAPTION(ICX1)
tax        MOVE "Exempt"               TO IMPFRO-DROP-DESC(ICX1,1)
tax        MOVE "E"                    TO IMPFRO-DROP-VALUE(ICX1,1)
tax        MOVE "Non-exempt"           TO IMPFRO-DROP-DESC(ICX1,2)
tax        MOVE "N"                    TO IMPFRO-DROP-VALUE(ICX1,2)

tax        ADD 1 TO ICX1
tax        MOVE "USA Taxable"          TO  IMPFRO-DROP-CAPTION(ICX1)
tax        MOVE "Exempt"               TO IMPFRO-DROP-DESC(ICX1,1)
tax        MOVE "E"                    TO IMPFRO-DROP-VALUE(ICX1,1)
tax        MOVE "Non-exempt"           TO IMPFRO-DROP-DESC(ICX1,2)
tax        MOVE "N"                    TO IMPFRO-DROP-VALUE(ICX1,2)


      *Move "Generate document number" To IMPFRO-DROP-CAPTION(ICX1)
           *>
           Move "ARSPINL1"      To IMPFRO-LISTVIEW
           Perform SET-LISTVIEW-DROPDOWN
           .
      *
037    Load-Branch.
           Initialize IMPFRO-LINK
           Move 0  To ICX1 
           Add 1                           To ICX1
           Move "Branch selection"         To IMPFRO-DES(ICX1)
           Move "Branch Selection"         To IMPFRO-TOOLTIP(ICX1)
           Move D-Branch-Selection         To IMPFRO-ALP(ICX1)
           Move WS-Branch-Selection        To IMPFRO-BLOCK-POS(ICX1)
           Move xtpOption                  To IMPFRO-AND(ICX1)
           Move Length Of D-Branch-Selection To IMPFRO-LEN(ICX1)
      *
           Add 1                           To ICX1
           Move "Branch"                   To IMPFRO-DES(ICX1)
           Move "O"                        To IMPFRO-AND(ICX1)
           Move D-Def-Branch               To IMPFRO-ALP(ICX1)
           Move WS-DEF-BRANCH              To IMPFRO-BLOCK-POS(ICX1)
           Move Length Of D-Def-Branch     To IMPFRO-LEN(ICX1)
      *
           Move "ARSPINL4"                 To IMPFRO-LISTVIEW
           Perform SET-LISTVIEW-PROPERTIES
      *
           Perform BRANCH-RADIO-BUTTONS.
037    BRANCH-RADIO-BUTTONS.
           Initialize IMPFRO-LINK
           Initialize IMPFRO-DROP-TABLE
           Add 1                   To ICX1
           Move "Branch selection" To IMPFRO-DROP-CAPTION(ICX1)
           Move "Use branch defined against each customer"
                                   To IMPFRO-DROP-DESC(ICX1,1)
           Move "1"                To IMPFRO-DROP-VALUE(ICX1,1)
           Move "Override customer's branch"
                                   To IMPFRO-DROP-DESC(ICX1,2)
           Move "2"                To IMPFRO-DROP-VALUE(ICX1,2)
           Move "ARSPINL4"         To IMPFRO-LISTVIEW
           Perform SET-LISTVIEW-DROPDOWN.

       Initialize-Entry-Values.
011        Move Spaces     To D-Custom-Key
014   *    Move Spaces     To D-Customer
           Move Spaces     To D-Cus-Nam
           If  D-Branch-Selection = 1
               Move D-Default-Branch     To D-Branch
           Else
               Move Spaces               To D-Branch
           End-If
           Move Spaces     To D-Branch-Nam
           If D-Document-Type = Spaces
             If D-Access-Drn Not ="N" Move "D" To D-Document-Type End-If
             If D-Access-Crn Not ="N" Move "C" To D-Document-Type End-If
             If D-Access-INV Not ="N" Move "I" To D-Document-Type End-If
           End-If
           If  D-Generate-Invoice = " "
               Move "Y"            To D-Generate-Invoice
           End-If
           If  D-Document-Type = "I"
               If  D-Generate-Invoice = "Y"
                   Move "N"        To D-Post-To-Invoice
               End-If
           Else
               If  D-Generate-Invoice = "N"
                   If  D-Post-To-Invoice = " "
                       Move "Y"    To D-Post-To-Invoice
                   End-If
               Else
                   Move "N"        To  D-Post-To-Invoice
               End-If
           End-If
           Move Spaces         To D-Invoice-Id
           Move System-Date    To Date-Normal
           Perform DATE-To-CYMD
           Move Date-CCYYMMDD  To D-Document-Date
           *> Move Spaces To D-Document-Reference
005b       If  D-C1TXCD = "E"
005b           Subtract D-Document-Value From Local-Exempt-Value
005b       End-If
           Move Zeroes To D-Document-Value
           Move Zeroes To D-Tax-Value
           Move Zeroes To D-Gst-Value
           Move Zeroes To D-TB04Rate
           Move "N"    To D-Fixed-Exch
           Move Zeroes To D-Cost-Value
           Move Spaces To D-Product-Class
           Move Spaces To D-Product-Class-Name
           Move Spaces To D-Terms-Code
           Move Spaces To D-Terms-Desc
           Move Spaces To D-Geographic-Area
           Move Spaces To D-Area-Description
           Move Spaces To D-Salesperson
           Move Spaces To D-Salesperson-Name
           Move Spaces To D-C10CUR
tax        Move Zeroes To Gst-Rate
tax        Move Zeroes To Tax-Rate
tax        Move "N"    To D-GST-TAXABLE
tax        Move "N"    To D-EXT-TAXABLE
tax        Move "N"    To D-TAXABLE
tax        Move Spaces To D-STATE
tax        Move Spaces To D-COZIP
tax        Move Spaces To D-CITY
tax        Move Spaces To D-SHIP-DISPLAY
tax        Move Zeroes To D-EXT-TAX-VALUE
tax        Move Zeroes To D-EXT-TAX-RATE
tax        MOVE Spaces TO D-TAX-CODE
tax        MOVE Spaces TO D-GST-CODE
032Ex      MOVE Zeroes To CUR-JNL
           .

       Load-Invoice-To-List.
           Move Spaces     To RecordRow
           Move D-Customer         To CellValue(cCus)
                                      D-LvItem-Text(cCus)
           Move D-Cus-Nam          To CellValue(cCusNam)
                                      D-LvItem-Text(cCusNam)
           Move D-Branch           To CellValue(cBr)
                                      D-LvItem-Text(cBr)
           Move D-Document-Type    To CellValue(cDocType)
                                      D-LvItem-Text(cDocType)
           Move D-Generate-Invoice To *> CellValue(cGenDoc)
                                      D-LvItem-Text(cGenDoc)
012        If  D-Generate-Invoice = "Y" Then
               Move xtpTrue        To CellIsChecked(cGenDoc)
           End-If
           Move xtpTrue            To CellHasCheckBox(cGenDoc)
           Move D-Post-To-Invoice  To *> CellValue(cPostTo)
                                      D-LvItem-Text(cPostTo)
012        If  D-Post-To-Invoice = "Y" Then
               Move xtpTrue        To CellIsChecked(cPostTo)
           End-If
           Move xtpTrue            To CellHasCheckBox(cPostTo)
           Move D-Invoice-Id       To CellValue(cInvId)
                                      D-LvItem-Text(cInvId)
           Move D-Document-Date    To CellValue(cDocDate)
                                      D-LvItem-Text(cDocDate)
           Move D-Document-Reference To CellValue(cDocRef)
                                      D-LvItem-Text(cDocRef)
           Move D-Document-Value   To ED-12-2
           Move ED-12-2            To CellValue(cDocVal)
                                      D-LvItem-Text(cDocVal)
           Move D-Tax-Value        To ED-12-2
           Move ED-12-2            To CellValue(cTaxVal)
                                      D-LvItem-Text(cTaxVal)
           Move D-Gst-Value        To ED-12-2
           Move ED-12-2            To CellValue(cGstVal)
                                      D-LvItem-Text(cGstVal)
           Move D-Fixed-Exch       To *> CellValue(cFixExch)
                                      D-LvItem-Text(cFixExch)
012        If  D-Fixed-Exch = "Y" Then
               Move xtpTrue        To CellIsChecked(cFixExch)
           End-if
           Move xtpTrue            To CellHasCheckBox(cFixExch)
           Move D-TB04Rate         To ED-6-6
           Move ED-6-6             To CellValue(cRate)
                                      D-LvItem-Text(cRate)
           Move D-Cost-Value       To ED-12-2
           Move ED-12-2            To CellValue(cCostVal)
                                      D-LvItem-Text(cCostVal)
           Move D-Product-Class    To CellValue(cProd)
                                      D-LvItem-Text(cProd)
           Move D-Terms-Code       To CellValue(cTerms)
                                      D-LvItem-Text(cTerms)
           Move D-Geographic-Area  To CellValue(cGeo)
                                      D-LvItem-Text(cGeo)
           Move D-Salesperson      To CellValue(cSal)
                                      D-LvItem-Text(cSal)
           Move D-C10CUR           To CellValue(cCur)
                                      D-LvItem-Text(cCur)
005btx*    Move D-C1TXCD           To CellValue(cExempt)
tax        Move D-TAXABLE          To CellValue(cExempt)
                                      D-LvItem-Text(cExempt)
tax        IF D-IM2-GEO-TAX = "G" OR "A"
tax           Move D-STATE           TO D-LvItem-Text(cExtstate)
tax                                     CellValue(cExtstate)
tax           Move D-COZIP           TO D-LvItem-Text(cExtzip)
tax                                     CellValue(cExtzip)
tax           Move D-CITY           TO D-LvItem-Text(cExtcity)
tax                                     CellValue(cExtcity)
tax           Move D-EXT-TAX-RATE    TO ED-12-2
tax           Move ED-12-2           TO D-LvItem-Text(cExtrate)
tax                                     CellValue(cExtrate)
tax           IF D-EXT-TAXABLE = "N"
tax              Move "Y"             To CellValue(cTax)
tax                                      D-LvItem-Text(cTax)
tax              Move D-EXT-TAXABLE   To CellValue(cExempt)
tax                                      D-LvItem-Text(cExempt)
tax           ELSE
tax              Move "N"             To CellValue(cTax)
tax                                      D-LvItem-Text(cTax)
tax              Move D-EXT-TAXABLE   To CellValue(cExempt)
tax                                      D-LvItem-Text(cExempt)
tax           END-IF
tax        else
tax           Move D-TAX-CODE      To CellValue(cTax)
tax                                D-LvItem-Text(cTax)
tax        End-if
tax        If IM50-FED = "Y"
tax           Move D-GST-CODE      To CellValue(cGst)
tax                                   D-LvItem-Text(cGst)
tax           Move D-GST-TAXABLE   To CellValue(cGSTExempt)
tax                                   D-LvItem-Text(cGSTExempt)
tax        End-If

           If  D-Add-Change-Mode = 1
               Perform Create-Invoice-List
               Perform InsertReportRow
               Add 1 To D-Documents-Processed
               Perform FinishReportControl
               If  D-Post-To-Invoice = "N"
                   Perform Add-Invoice-To-Array
               End-If
           End-If
           .

       Refresh-L1.
           Move Spaces     To RecordRow
           Move D-LvItem-Text(cCus)        To D-Customer
           Move D-LvItem-Text(cCusNam)     To D-Cus-Nam
           Move D-LvItem-Text(CBr)         To D-Branch
           Move D-LvItem-Text(cDocType)    To D-Document-Type
           If D-LvItem-Text(cGenDoc) = "1"
             Move "Y" To D-Generate-Invoice
           Else
             Move "N" To D-Generate-Invoice
           End-If
           If D-LvItem-Text(cPostTo) = "1"
             Move "Y" To D-Post-To-Invoice
           Else
             Move "N" To D-Post-To-Invoice
           End-If
           Move D-LvItem-Text(cInvId)      To D-Invoice-Id
           Move function NumVal(D-LvItem-Text(cDocDate))
                                           To D-Document-Date
           Move D-LvItem-Text(cDocRef)     To D-Document-Reference
           Move Function NumVal(D-LvItem-Text(cDocVal))
                                           To D-Document-Value
           Move Function NumVal(D-LvItem-Text(cTaxVal))
                                           To D-Tax-Value
           Move Function NumVal(D-LvItem-Text(cGstVal))
                                           To D-GST-Value
           If D-LvItem-Text(cFixExch) = "1"
             Move "Y" To D-Fixed-Exch
           Else
             Move "N" To D-Fixed-Exch
           End-If
           Move Function NumVal(D-LvItem-Text(cRate))  To D-TB04Rate
           Move Function NumVal(D-LvItem-Text(cCostVal))
                                           To D-Cost-Value
           Move D-LvItem-Text(cProd)       To D-Product-Class
           Move D-LvItem-Text(cTerms)      To D-Terms-Code
           Move D-LvItem-Text(cGeo)        To D-Geographic-Area
           Move D-LvItem-Text(cSal)        To D-Salesperson
           Move D-LvItem-Text(cCur)        To D-C10CUR
005btx*    Move D-LvItem-Text(cExempt)     To D-C1TXCD
tax        Move D-LvItem-Text(cExempt)     To D-TAXABLE
tax        Move D-LvItem-Text(cGst)        To D-GST-CODE
tax        Move D-LvItem-Text(cTax)        To D-TAX-CODE
tax        Move D-LvItem-Text(cGSTExempt)  To D-GST-TAXABLE
tax        IF IM2-GEO-TAX = "G" OR "A"
tax           MOVE D-LvItem-Text(cExtstate)To D-STATE
tax           MOVE D-LvItem-Text(cExtzip)  To D-COZIP
tax           MOVE D-LvItem-Text(cExtcity) To D-CITY
tax           MOVE D-STATE              TO SHIP-DISP-STATE
tax           MOVE D-COZIP              TO SHIP-DISP-COZIP
tax           MOVE D-CITY               TO SHIP-DISP-CITY
tax           MOVE SHIP-DISPLAY           To D-SHIP-DISPLAY
tax           Move D-LvItem-Text(cExempt) To D-EXT-TAXABLE
tax           Move Function NumVal(D-LvItem-Text(cExtrate))
tax                                       To D-EXT-TAX-RATE
tax           Move Function NumVal(D-LvItem-Text(cTaxVal))
tax                                       To D-EXT-TAX-VALUE
tax        END-IF
70ok       String  D-Customer      Delimited By Size
70ok               D-Invoice-Id    Delimited By Size
.                  D-Document-Type Delimited By Size
011        Into    D-Custom-Key

           If D-ADD-CHANGE-MODE <> 3 *>'Remove
             Perform Load-Entry-Details
             If D-ADD-CHANGE-MODE = 2 *>'Add
               Perform Convert-Values-To-Local
               Subtract Local-Doc-Value From D-T-LOCAL-DOC
               Subtract Local-Tax-Value From D-T-LOCAL-TAX
               Subtract Local-GST-Value From D-T-LOCAL-GST
               Subtract Local-Exempt-Value From D-T-LOCAL-EXEMPT
               Perform Load-Info-Details
             End-If
           End-If
           .

       Load-Info-Details.
           Initialize IMPFRO-LINK
           Move 0 To ICX1
           *>
           Add 1 To ICX1
           Move "Post year "       To IMPFRO-DES(ICX1)
           Move D-PstYer           To IMPFRO-ALP(ICX1)
           Move WS-PstYer          To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF D-PstYer To IMPFRO-LEN(ICX1)
           Move 2                  To IMPFRO-EDIT(ICX1)
           Add 1 To ICX1
           Move "Post month"       To IMPFRO-DES(ICX1)
           Move D-PstMon           To IMPFRO-ALP(ICX1)
           Move WS-PstMon          To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF D-PstYer To IMPFRO-LEN(ICX1)
           Move 2                  To IMPFRO-EDIT(ICX1)
           If  IM2-INVNO-METHOD <> "B"
               Move Spaces To ARSCTL-KEY
               Move "CTL"  To ARSCTL-CTL
               Perform ARSCTL-READ
               If  STAT-OK
                   Add 1 To ICX1
70Fix              Move ArsCtl-Inv             To KeyGen-Val-SFX
70Fix              Perform KEYGEN-VAL-AR-INV
70Fix              Move "Next invoice"         To IMPFRO-DES(ICX1)
70Fix              Move KeyGen-RT-Key          To IMPFRO-ALP(ICX1)
                   Move WS-Inv-Ctl             To IMPFRO-BLOCK-POS(ICX1)
                   Move LENGTH OF Arsctl-Inv   To IMPFRO-LEN(ICX1)
                   Move 2                      To IMPFRO-EDIT(ICX1)
70Fix              Move "Next invoice number to be generated"
                                               To IMPFRO-TOOLTIP(ICX1)
                   Add 1 To ICX1
70Fix              Move ArsCtl-Cre             To KeyGen-Val-SFX
70Fix              Perform KEYGEN-VAL-AR-INV
70Fix              Move "Next credit note"     To IMPFRO-DES(ICX1)
70Fix              Move KeyGen-RT-Key          To IMPFRO-ALP(ICX1)
                   Move WS-Cre-Ctl             To IMPFRO-BLOCK-POS(ICX1)
                   Move LENGTH OF Arsctl-Cre   To IMPFRO-LEN(ICX1)
                   Move 2                      To IMPFRO-EDIT(ICX1)
70Fix              Move "Next credit note number to be generated"
                                               To IMPFRO-TOOLTIP(ICX1)
                   Add 1 To ICX1
70Fix              Move ArsCtl-Deb             To KeyGen-Val-SFX
70Fix              Perform KEYGEN-VAL-AR-INV
70Fix              Move "Next debit note"      To IMPFRO-DES(ICX1)
70Fix              Move KeyGen-RT-Key          To IMPFRO-ALP(ICX1)
                   Move WS-Deb-Ctl             To IMPFRO-BLOCK-POS(ICX1)
                   Move LENGTH OF Arsctl-Deb   To IMPFRO-LEN(ICX1)
                   Move 2                      To IMPFRO-EDIT(ICX1)
70Fix              Move "Next debit note number to be generated"
                                               To IMPFRO-TOOLTIP(ICX1)
               End-If
           End-If
           Add 1 To ICX1
           Move "Number of documents"  To IMPFRO-DES(ICX1)
           Move D-Documents-Processed  To IMPFRO-ALP(ICX1)
           Move "N"                    To IMPFRO-AND(ICX1)
           Move WS-Documents-Processed To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF D-Invoice-Register   To IMPFRO-LEN(ICX1)
           Move 2                      To IMPFRO-EDIT(ICX1)

018        if    d-s-fr-msg not = "CHG-PERIOD"
           *>If D-Document-Value <> Zero
             Perform Convert-Values-To-Local
             Evaluate  D-ADD-CHANGE-MODE
             When 1 *>'Add
               Add Local-Doc-Value     To D-T-LOCAL-DOC
               Add Local-Tax-Value     To D-T-LOCAL-TAX
               Add Local-GST-Value     To D-T-LOCAL-GST
               Add Local-Exempt-Value  To D-T-LOCAL-EXEMPT
             When 2 *>'Change
               If D-S-FR-MSG <> "Refresh-L1"
022            AND D-S-FR-MSG <> "Reload-Inv"
                 Add Local-Doc-Value     To D-T-LOCAL-DOC
                 Add Local-Tax-Value     To D-T-LOCAL-TAX
                 Add Local-GST-Value     To D-T-LOCAL-GST
                 Add Local-Exempt-Value  To D-T-LOCAL-EXEMPT
               End-If
             When 3 *>'Remove
               Subtract Local-Doc-Value    From D-T-LOCAL-DOC
               Subtract Local-Tax-Value    From D-T-LOCAL-TAX
               Subtract Local-GST-Value    From D-T-LOCAL-GST
               Subtract Local-Exempt-Value From D-T-LOCAL-EXEMPT
             End-Evaluate
           *>End-If
018        END-IF
           Add 1 To ICX1
           Move "Transaction values"   To IMPFRO-DES(ICX1)
           Move "H"                    To IMPFRO-AND(ICX1)
           Add 1 To ICX1
           Move "Transaction value"    To IMPFRO-DES(ICX1)
           Move "N"                    To IMPFRO-AND(ICX1)
           Move D-T-Local-Doc          To IMPFRO-NUM(ICX1)
           Move WS-T-Local-Doc         To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF Local-Doc-Value  To IMPFRO-LEN(ICX1)
           Move "M"                        To IMPFRO-AND(ICX1)
70ok       Move 2                      To IMPFRO-DEC(ICX1)
           Move 2                      To IMPFRO-EDIT(ICX1)
           Move "G"                    To IMPFRO-GRP(ICX1)
           Add 1 To ICX1
           Move "Tax value"            To IMPFRO-DES(ICX1)
           Move "N"                    To IMPFRO-AND(ICX1)
           Move D-T-Local-Tax          To IMPFRO-NUM(ICX1)
           Move WS-T-Local-Tax         To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF Local-Doc-Value  To IMPFRO-LEN(ICX1)
           Move "M"                        To IMPFRO-AND(ICX1)
70ok       Move 2                      To IMPFRO-DEC(ICX1)
           Move 2                      To IMPFRO-EDIT(ICX1)
           Move "G"                    To IMPFRO-GRP(ICX1)
           Add 1 To ICX1
           Move "GST value"            To IMPFRO-DES(ICX1)
           Move "N"                    To IMPFRO-AND(ICX1)
           Move D-T-Local-GST          To IMPFRO-NUM(ICX1)
           Move WS-T-Local-Gst         To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF Local-Doc-Value  To IMPFRO-LEN(ICX1)
           Move "M"                        To IMPFRO-AND(ICX1)
70ok       Move 2                      To IMPFRO-DEC(ICX1)
           Move 2                      To IMPFRO-EDIT(ICX1)
           Move "G"                    To IMPFRO-GRP(ICX1)
           Add 1 To ICX1
           Move "Exempt value"         To IMPFRO-DES(ICX1)
           Move "N"                    To IMPFRO-AND(ICX1)
           Move D-T-Local-Exempt       To IMPFRO-NUM(ICX1)
           Move WS-T-Local-Exempt      To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF Local-Doc-Value  To IMPFRO-LEN(ICX1)
           Move "M"                        To IMPFRO-AND(ICX1)
70ok       Move 2                      To IMPFRO-DEC(ICX1)
           Move 2                      To IMPFRO-EDIT(ICX1)
           Move "G"                    To IMPFRO-GRP(ICX1)
           Add 1 To ICX1
           Compute D-Document-Totals =
                   D-T-Local-Doc + D-T-Local-Tax + D-T-Local-Gst
                  *> + D-T-Local-Exempt
           Move "Total documents"      To IMPFRO-DES(ICX1)
           Move "N"                    To IMPFRO-AND(ICX1)
           Move D-Document-Totals      To IMPFRO-NUM(ICX1)
           Move WS-Document-Totals     To IMPFRO-BLOCK-POS(ICX1)
           Move LENGTH OF Local-Doc-Value  To IMPFRO-LEN(ICX1)
           Move "M"                        To IMPFRO-AND(ICX1)
70ok       Move 2                      To IMPFRO-DEC(ICX1)
           Move 2                      To IMPFRO-EDIT(ICX1)
           Move "G"                    To IMPFRO-GRP(ICX1)
           *>
           Move "ARSPINL2" To IMPFRO-LISTVIEW
           Perform SET-LISTVIEW-PROPERTIES
           .

       Create-Invoice-List.
           Move "ARSPINL3"     To xtpReportControl
           Move cL3Columns     To xtpNumberColumns
           Perform CreateReportControl
           .

       Create-Invoice-List2.
           Move "ARSPIN3L"     To xtpReportControl2
           Move cL3Columns     To xtpNumberColumns
           Move 2              To xtpReportOutput
           Perform CreateReportControl
           .

      **************************************
      * Provide a warning If future dated  *
      **************************************
       Check-Future-Date.
025        Move D-Document-Date To DATE-CCYYMMDD
025        Perform IS-DATE-VALID-CYMD.
025        If DATE-VALID Not = "Y"
025           Move "Invalid"       To D-S-ERROR.

           Move IM0DAT             To DD-LDAT
004   *    Move D-Document-Date    To Date-Normal
.     *    Perform DATE-YMD
.     *    Move DATE-YYMMDD        To DD-HDAT
.          Move D-Document-Date    To Date-CCYYMMDD
.          Perform Date-From-CYMD
004        Move Date-Normal        To DD-HDAT
           Perform DATE-COMPARE
           If DD-HDAT-LATER Not = "Y"
             Continue
           Else
             Move "LATER"  To D-S-ERROR
           End-If
           .
      *****************************************************
      * Routine To check for a valid G/L interface record *
      *****************************************************
       READ-INTERFACE.
           Move Spaces    To SALINS-KEY
           Move D-BRANCH  To SALINS-BR
           If SAV-SALI-ICLS = "Y"
             Move D-PRODUCT-CLASS To SALINS-COD
           End-If
           If SAV-SALI-IGEO = "Y"
             Move D-GEOGRAPHIC-AREA To SALINS-AREA
           End-If
      * Read for other charges interface record...
           Move Spaces To SALINS-WH
           Perform SALINS-READ
           If STAT-LCK Or STAT-OK
             Next Sentence
           Else
             Move "iface-error" To D-S-ERROR
           End-If
           .

       Convert-Values-To-Local.
           If D-C10CUR = Spaces Or D-C1TXCD = Spaces
             Move ARSMST-CUR To D-C10CUR
             Move ARSMST-TXCD To D-C1TXCD
tax                              D-TAXABLE
           End-If
005b       If D-C1TXCD = Spaces Then
005b          Exit Paragraph
005b       End-If

      * Assume that entered values are in local currency...
           Move D-DOCUMENT-VALUE   To LOCAL-DOC-VALUE DOC-VALUE
           Move D-TAX-VALUE        To LOCAL-TAX-VALUE TAX-VALUE
           Move D-GST-VALUE        To LOCAL-GST-VALUE GST-VALUE
           Move D-COST-VALUE       To COST-VALUE
      * Establish total tax exempt value...
           Move Zero To LOCAL-EXEMPT-VALUE EXEMPT-VALUE
tax   *    IF D-C1TXCD = "E"
tax        IF D-TAXABLE = "E"
             MOVE D-DOCUMENT-VALUE TO LOCAL-EXEMPT-VALUE EXEMPT-VALUE
             IF IM50-FED = "Y"
               ADD D-GST-VALUE TO LOCAL-EXEMPT-VALUE EXEMPT-VALUE
             End-If
           End-If
      * Add Canadian GST amount...
tax   *    IF IM50-FED = "Y" And D-C1TXCD NOT = "E"
tax        IF IM50-FED = "Y" And D-TAXABLE NOT = "E"
             IF IM2-GEO-TAX = "Y" And SALARE-PST = "N"
               ADD D-GST-VALUE TO LOCAL-EXEMPT-VALUE EXEMPT-VALUE
             End-If
           End-If
      * ...else convert entered foreign currency values into local
      * currency equivalent...
           IF IM50-FOREIGN = "Y" AND IM50-CUR NOT = D-C10CUR
             MOVE "C"              TO IMPZMC-FUNCTION
             MOVE D-DOCUMENT-VALUE TO IMPZMC-POSTING-VALUE
001   *      MOVE ARSMST-CUR           TO IMPZMC-POSTING-CURRENCY
             Move D-C10CUR           TO IMPZMC-POSTING-CURRENCY
             MOVE "AR"             TO IMPZMC-AR-OR-AP
024          IF D-VALID-FIXED NOT = "Y" OR D-POST-TO-INVOICE = "Y"
               MOVE D-TB04RATE       TO IMPZMC-FIXED-RATE
               MOVE SAV-MD           TO IMPZMC-FIXED-MUL
             END-IF
             PERFORM MC-CURRENCY-CONVERSION
             MOVE IMPZMC-CONV-BASE-VALUE TO LOCAL-DOC-VALUE
             *>
             MOVE "C"              TO IMPZMC-FUNCTION
             MOVE D-TAX-VALUE      TO IMPZMC-POSTING-VALUE
             MOVE D-C10CUR         TO IMPZMC-POSTING-CURRENCY
             MOVE "AR"             TO IMPZMC-AR-OR-AP
024          IF D-VALID-FIXED NOT = "Y" OR D-POST-TO-INVOICE = "Y"
               MOVE D-TB04RATE       TO IMPZMC-FIXED-RATE
               MOVE SAV-MD           TO IMPZMC-FIXED-MUL
             END-IF
             PERFORM MC-CURRENCY-CONVERSION
             MOVE IMPZMC-CONV-BASE-VALUE TO LOCAL-TAX-VALUE
             *>
             MOVE "C"              TO IMPZMC-FUNCTION *> GST
             MOVE D-GST-Value      TO IMPZMC-POSTING-VALUE
             MOVE D-C10CUR           TO IMPZMC-POSTING-CURRENCY
             MOVE "AR"             TO IMPZMC-AR-OR-AP
024          IF D-VALID-FIXED NOT = "Y" OR D-POST-TO-INVOICE = "Y"
               MOVE D-TB04RATE       TO IMPZMC-FIXED-RATE
               MOVE SAV-MD           TO IMPZMC-FIXED-MUL
             END-IF
             PERFORM MC-CURRENCY-CONVERSION
             MOVE IMPZMC-CONV-BASE-VALUE TO LOCAL-GST-VALUE
             *>
             MOVE "C"              TO IMPZMC-FUNCTION *> Exemp Val
             MOVE LOCAL-EXEMPT-VALUE TO IMPZMC-POSTING-VALUE
             MOVE D-C10CUR           TO IMPZMC-POSTING-CURRENCY
             MOVE "AR"             TO IMPZMC-AR-OR-AP
024          IF D-VALID-FIXED NOT = "Y" OR D-POST-TO-INVOICE = "Y"
               MOVE D-TB04RATE       TO IMPZMC-FIXED-RATE
               MOVE SAV-MD           TO IMPZMC-FIXED-MUL
             END-IF
             PERFORM MC-CURRENCY-CONVERSION
             MOVE IMPZMC-CONV-BASE-VALUE TO LOCAL-EXEMPT-VALUE
           End-If
      *
           IF D-DOCUMENT-TYPE = "C"
             SUBTRACT DOC-VALUE FROM ZERO GIVING DOC-VALUE
             SUBTRACT TAX-VALUE FROM ZERO GIVING TAX-VALUE
             SUBTRACT GST-VALUE FROM ZERO GIVING GST-VALUE
             SUBTRACT COST-VALUE FROM ZERO GIVING COST-VALUE
             SUBTRACT EXEMPT-VALUE FROM ZERO GIVING EXEMPT-VALUE
             SUBTRACT LOCAL-DOC-VALUE FROM ZERO GIVING LOCAL-DOC-VALUE
             SUBTRACT LOCAL-TAX-VALUE FROM ZERO GIVING LOCAL-TAX-VALUE
             SUBTRACT LOCAL-GST-VALUE FROM ZERO GIVING LOCAL-GST-VALUE
             SUBTRACT LOCAL-EXEMPT-VALUE FROM ZERO
                                          GIVING LOCAL-EXEMPT-VALUE
           End-If
           .

      *****************************************
      * Routine To check for balance overflow *
      *****************************************
       CHECK-OVERFLOW.
           Perform CHECK-OVERFLOW-1 THRU CHECK-OVERFLOW-END
           .
       CHECK-OVERFLOW-1.
           Move Spaces     To ARSBAL-KEY
           Move D-CUSTOMER To ARSBAL-CUS
      * For a subaccount read the master account To update balance...
           If ARSMST-TYPE = "S"
             Move ARSMST-MST To ARSBAL-CUS
           End-If
           Perform ARSBAL-READ *> -LOCK
           If STAT-LCK
             Go To CHECK-OVERFLOW-1
           End-If
           If Not STAT-OK
             Move "no-30" To D-S-ERROR
             Go To CHECK-OVERFLOW-END
           End-If
      * ...convert entered foreign currency values into local
      * currency equivalent...and check for overflow.
           Move "C"                To IMPZMC-FUNCTION
           Move D-DOCUMENT-VALUE   To IMPZMC-POSTING-VALUE
           Move D-C10CUR         To IMPZMC-POSTING-CURRENCY
           Move "AR"               To IMPZMC-AR-OR-AP
024        IF D-VALID-FIXED NOT = "Y" OR D-POST-TO-INVOICE = "Y"
             Move D-TB04RATE  To IMPZMC-FIXED-RATE
             Move SAV-MD      To IMPZMC-FIXED-MUL
           End-If
           Perform MC-CURRENCY-CONVERSION
           If IMPZMC-OVERFLOW = "Y"
             Move "foren" To D-S-ERROR
             Go To CHECK-OVERFLOW-END
           End-If
           Move IMPZMC-CONV-BASE-VALUE To LOCAL-DOC-VALUE
      * Overflow errors for customers current balance and control balance
      * must also be checked
           If D-DOCUMENT-TYPE NOT = "C"
             Add LOCAL-DOC-VALUE, D-TAX-VALUE, D-GST-VALUE
                                  To CTL-OVER  ON SIZE ERROR
      *    "E) Company balance overflow []"
                                   Move "comp" To D-S-ERROR
           End-If
           If D-DOCUMENT-TYPE NOT = "C"
70Fix *      If RUNNING12-2 NOT = "Y"
70Fix *        If (CTL-OVER > 9999999999.99 OR < -9999999999.99)
70Fix *          Move "comp" To D-S-ERROR
70Fix *        End-If
70Fix *      End-If
70Fix *    End-If
70Fix *    If D-S-ERROR NOT = Spaces
70Fix *       GO To CHECK-OVERFLOW-END
70Fix *    End-If
           If D-DOCUMENT-TYPE NOT = "C"
               Add
                  D-TAX-VALUE,D-GST-VALUE,D-DOCUMENT-VALUE,ARSBAL-BAL(1)
                                    GIVING TEMP-BAL
               ON SIZE ERROR  Move "Y" To ONSIZE-40
           End-If
           If D-DOCUMENT-TYPE NOT = "C"
              Move TEMP-BAL To TRANSACTION-OFLOW
              Move "N" To DISPLAY-ERROR
              Perform CHECK-TRANSACTION-OFLOW
              If D-S-ERROR NOT = Spaces
                 Move "oflow" To D-S-ERROR
              End-If
           End-If
           If D-DOCUMENT-TYPE NOT = "C" AND PM-MON > 1
               Add
                  D-TAX-VALUE,D-GST-VALUE,D-DOCUMENT-VALUE,ARSBAL-BAL(2)
                                    GIVING TEMP-BAL
               ON SIZE ERROR  Move "Y" To ONSIZE-40
           End-If
           If D-DOCUMENT-TYPE NOT = "C" AND PM-MON > 1
               Move TEMP-BAL To TRANSACTION-OFLOW
               Move "N" To DISPLAY-ERROR
               Perform CHECK-TRANSACTION-OFLOW
               If D-S-ERROR NOT = Spaces
                  Move "oflow" To D-S-ERROR
               End-If
           End-If
           If D-DOCUMENT-TYPE NOT = "C" AND PM-MON = 3
               Add
                  D-TAX-VALUE,D-GST-VALUE,D-DOCUMENT-VALUE,ARSBAL-BAL(3)
                                    GIVING TEMP-BAL
               ON SIZE ERROR  Move "Y" To ONSIZE-40
           End-If
           If D-DOCUMENT-TYPE NOT = "C" AND PM-MON = 3
              Move TEMP-BAL To TRANSACTION-OFLOW
              Move "N" To DISPLAY-ERROR
              Perform CHECK-TRANSACTION-OFLOW
              If D-S-ERROR NOT = Spaces
                  Move "oflow" To D-S-ERROR
              End-If
           End-If
           .
       CHECK-OVERFLOW-END.
           Perform ARSBAL-UNLOCK
           .
      *
      **********************************************
      * Routine To validate entered invoice number *
      **********************************************
       CHECK-INVOICE-NUMBER.
           Perform CHECK-INV-1 THRU CHECK-INV-END.
       CHECK-INV-1.
           Move D-INVOICE-ID To TRNINV
           If TRNINV-1 NOT = "*"
             If TRNINV-2 NOT = "FC"
               If TRNINV-3 NOT = "_CS"
010              If TRNINV-3 NOT = "_CR"
70ok               If IM50-INVNO-TYP = "A"
                     If TRNINV = Spaces
                       Move "invalid" To D-S-ERROR
                       GO To CHECK-INV-END
                     Else
                       Continue *>NEXT SENTENCE
                     End-If
                   Else
                     Move TRNINV To NUMB-R
                     Perform NUMB-CHECK
70Fix                Move NUM  To TRNINN
                     Move TRNINV To D-INVOICE-ID
                     If TRNINN NOT > 0
                       Move "invalid" To D-S-ERROR
                       GO To CHECK-INV-END
                     End-If
                   End-If
                 End-If
               End-If
             End-If
           End-If
           Move TRNINV To D-INVOICE-ID
      * If posting To an existing invoice, then check If this invoice
      * exists or not...
           If  D-DOCUMENT-TYPE = "C" OR "D"
               If  D-GENERATE-INVOICE = "N" And D-POST-TO-INVOICE = "Y"
                   GO To CHECK-INV-5
               End-If
           End-If

011        Perform Check-Invoice
           If  SorUin-RT-ErrNo Not = Zero *>270198
               Move "already"      To D-S-ERROR
           End-If
           GO To CHECK-INV-END
           .
       CHECK-INV-5.
           Move Spaces To ARSINV-KEY
           Move ARSMST-CUS To ARSINV-CUS
           Move TRNINV To ARSINV-INV
           Perform ARSINV-START-GE
           If  STAT-INVALID-KEY
               GO To CHECK-NO-DOC
           End-If
           .
       CHECK-INV-6.
           Perform ARSINV-READ-NEXT
           If STAT-AT-END
             GO To CHECK-NO-DOC
           End-If
           If ARSMST-CUS NOT = ARSINV-CUS
           OR ARSINV-INV NOT = TRNINV
             GO To CHECK-NO-DOC
           End-If
           If AS-OF-SELECTION NOT = "C"
             If AS-OF-DATE < ARSINV-POST-YYYY-MM
               Move "inv-after" To D-S-ERROR
               GO To CHECK-INV-END
             End-If
           End-If
032Ex *    Move ARSINV-RAT To D-TB04RATE
032Ex *    Move ARSINV-RAT To D-SAVE-TB04RATE
032Ex * If posting to an exsting invoice, use the orioganl invoice rate
032Ex * just incase the any revaluations have already happened
032Ex      If ARSINV-ORIG-RAT = 0
032Ex         move ARSINV-RAT   To ARSINV-ORIG-RAT
032Ex      End-if
032Ex      Move ARSINV-ORIG-RAT To D-TB04RATE
032Ex      Move ARSINV-ORIG-RAT To D-SAVE-TB04RATE

           If ARSINV-EXCH = "Y"
             Move "Y" To D-FIXED-EXCH
           Else
             Move "N" To D-FIXED-EXCH
           End-If
           GO To CHECK-INV-END
           .
       CHECK-NO-DOC.
           Move "noinv" To D-S-ERROR
           GO To CHECK-INV-END
           .
       CHECK-INV-END.
           If  D-S-Error = Spaces
               If  D-Generate-Invoice = "N" And D-Post-To-Invoice = "N"
                   Perform Check-Invoice-In-Array
               End-If
           End-If
           Exit
           .
      *
       Check-Invoice-In-Array. *> Check if doc exist in array
           Move Zeroes To XX1
011        Move Spaces To D-S-Error
           Perform Varying wsX1 From 1 By 1 Until wsX1 = 1000
               If  Spaces = wsChkCus(wsX1)
                   Exit Perform
               End-If
               If  wsChkInv(wsX1) = All "*"
                   Add 1  To XX1
               End-If
               If  wsChkInv(wsX1) = D-Invoice-Id
               And
042              (wsChkCus(wsX1)= D-Customer
042               or (d-sub-acc = "Y" and wsChkCus(wsX1)= arsmst-mst)
042              )
017            And wsChkTyp(wsX1) = D-Document-Type
005                If D-Add-Change-Mode = 2 And D-Cur-Row = (wsX1 - XX1)
005                    Exit Perform
                   Else
                       Move "InvProcess" To D-S-Error
                       Exit Perform
                   End-If
               End-If
           End-Perform
           .
       Add-Invoice-To-Array. *> Add doc to array
           Perform Check-Invoice-In-Array
           If  D-S-Error = "InvProcess"
               Continue
           Else
               Perform Varying wsX1 From 1 By 1 Until wsX1 = 1000
                   If  Spaces = wsChkCus(wsX1)
                       Move D-Invoice-Id To wsChkInv(wsX1)
                       Move D-Customer   To wsChkCus(wsX1)
017                    move d-Document-Type to wsChkTyp(wsX1)
042                    if d-sub-acc = "Y"
042                      move arsmst-mst   to wsChkCus(wsX1)
042                    end-if
                       Exit Perform
                   End-If
               End-Perform
           End-If
           .

       Delete-Invoice-From-Array. *>
           Perform Varying wsX1 From 1 By 1 Until wsX1 = 1000
               If  Spaces = wsChkInv(wsX1) And wsChkCus(wsX1) and
017            wsChkTyp(wsX1)
                   Exit Perform
               End-If
               If  wsChkInv(wsX1) = D-Invoice-Id
               And wsChkCus(wsX1)= D-Customer
017            And wsChkTyp(wsX1) = D-Document-Type
                   Move All "*"    To wsChkInv(wsX1)
                                      wsChkCus(wsX1)
017                                   wsChkTyp(wsX1)
                   Exit Perform
               End-If
           End-Perform
           .

       Delete-Selected-Row.
           Perform Refresh-L1
           Perform eSignature-Prior
           If  D-S-Error = "sig-err"
               Continue
           Else
               Perform Delete-Invoice-From-Array
               Subtract 1 From D-Documents-Processed
               Perform Load-Info-Details
               Perform eSignature-Complete
               Perform Initialize-Entry-Values
           End-If
           .

      ************************************
      * Routine To change posting period *
      ************************************
       CHANGE-PERIOD.
           Move "P" To PM-ACTION
           Move MULTI-PERIOD-FIELDS To LINK-EXTRA
           Move "IMPPST" To WW-PROG-NAME
           Perform CALL-PROGRAM
           If  LINK-EXTRA NOT = Spaces
               Move LINK-EXTRA To MULTI-PERIOD-FIELDS
           End-If
           Move Spaces To LINK-EXTRA
           Move PM-PSTYER To D-PSTYER
           Move PM-PSTMON To D-PSTMON
           Evaluate PM-MON
           When "1" Move "C" To AS-OF-SELECTION
           When "2" Move "P" To AS-OF-SELECTION
           When "3" Move "B" To AS-OF-SELECTION
           End-Evaluate
           Perform Load-Info-Details
           .
      ****************************************
      * Routine To browse on customer        *
      ****************************************
       BROWSE-IMPBCS.
            Move D-CUSTOMER   To LINK-BRW-1
            Move "IMPBCS"     To WW-PROG-NAME
            Move "B"          To LINK-BRW-ENQ
            Perform CALL-PROGRAM
            Move LINK-BRW-RET To D-S-TO-PAR
            .
      ****************************************
      * Routine To browse on invoice numbers *
      ****************************************
       BROWSE-IMPBIN.
            Move D-CUSTOMER   To LINK-BRW-1
            Move D-INVOICE-ID To LINK-BRW-2
            Move "B"          To LINK-BRW-3
            Move "IMPBIN"     To WW-PROG-NAME
            Move "B"          To LINK-BRW-ENQ
            Perform CALL-PROGRAM
            Move LINK-BRW-RET To D-S-TO-PAR
            .
       BROWSE-IMPBPC.
            Move D-PRODUCT-CLASS To LINK-BRW-1
            Move D-BRANCH     To LINK-BRW-2
            Move "IMPBPC"     To WW-PROG-NAME
            Move "B"          To LINK-BRW-ENQ
            Perform CALL-PROGRAM
            Move LINK-BRW-RET To D-S-TO-PAR
            .
       BROWSE-IMPBSL.
            Move D-SALESPERSON   To LINK-BRW-1
            Move D-BRANCH     To LINK-BRW-2
            Move "IMPBSL"     To WW-PROG-NAME
            Move "B"          To LINK-BRW-ENQ
            Perform CALL-PROGRAM
            Move LINK-BRW-RET To D-S-TO-PAR
            .
       BROWSE-IMPBGA.
            Move D-GEOGRAPHIC-AREA   To LINK-BRW-1
            Move "IMPBGA"     To WW-PROG-NAME
            Move "B"          To LINK-BRW-ENQ
            Perform CALL-PROGRAM
            Move LINK-BRW-RET To D-S-TO-PAR
            .
       BROWSE-IMPBBR.
            Move D-BRANCH     To LINK-BRW-1
            Move "IMPBBR"     To WW-PROG-NAME
            Move "B"          To LINK-BRW-ENQ
            Perform CALL-PROGRAM
            Move LINK-BRW-RET To D-S-TO-PAR
            .
       BROWSE-IMPBTC.
            Move D-TERMS-CODE To LINK-BRW-1
            Move "IMPBTC"     To WW-PROG-NAME
            Move "B"          To LINK-BRW-ENQ
            Perform CALL-PROGRAM
            Move LINK-BRW-RET To D-S-TO-PAR
            .
      *************************************
      * Routine To read for customer code *
      *************************************
042s   Read-customer.
042s       perform read-customer-start thru read-customer-end
           .
042s   read-customer-start.
70fix *    If IM0CUSKEY = "N"
70fix *      Move D-CUSTOMER To NUMB-R
70fix *      Perform NUMB-CHECK
70fix *      Move NUM-VAL To Numeric-Cus
70fix *      Move Alpha-Cus To D-CUSTOMER
70fix *    End-If
      *    Move Spaces     To ARSMST-KEY
           Move D-CUSTOMER To ARSMST-CUS
           Perform ARSMST-READ
           If STAT-LCK
             Move ERRLOC To WW-ERROR-NUM
             Perform LOOK-UP-ERROR
           Else
             If Not STAT-OK
               Move Spaces To ARSMST-REC
               Initialize ARSMST-REC
               Move ERRNOT To WW-ERROR-NUM
               Perform LOOK-UP-ERROR
               Go To Read-Customer-End
             End-If
           End-If
      * Can this operator see customers of this branch?
           If STAT-OK
             If OPERATOR-SEC-LIM-ARBR = "F"
               Move ARSMST-BR   To WW-ACCESS-FIELD
               Perform VERIFY-ACCESS-ARBR
               If WW-ACCESS-OK = "N"
                 GO To READ-CUSTOMER-END
               END-IF
             END-IF
             If OPERATOR-SEC-LIM-SLS = "F"
               Move ARSMST-SLSP  To WW-ACCESS-FIELD
               Perform VERIFY-ACCESS-REP
               If WW-ACCESS-OK = "N"
                 Go To READ-CUSTOMER-END
               End-If
             End-If
           End-If
           If D-S-Error <> Spaces
             Go To Read-Customer-End
           End-If
           If D-S-ERROR = Spaces
             Move Spaces     To ARSBAL-KEY
             Move D-CUSTOMER To ARSBAL-CUS
             Perform ARSBAL-READ
             If STAT-LCK
               Move ERRLOC To WW-ERROR-NUM
               Perform LOOK-UP-ERROR
             Else
               If NOT STAT-OK
                 Move ERRNOT To WW-ERROR-NUM
                 Perform LOOK-UP-ERROR
               End-If
             End-If
           End-If
           If D-S-ERROR = Spaces
             If ARSMST-HOLD = "Y"
               Move "onhold" To D-S-ERROR
             End-If
           End-If
           If D-S-ERROR = Spaces
             If IM2-GEO-TAX = "A" OR "G"
               Move ARSMST-STAX     To TX-CDE
               Perform TX-VALIDATE-EXT
               If TX-ANS = "N"
                 Move "no-usatax" To D-S-ERROR
tax            else
tax              If D-ADD-CHANGE-MODE = 1
tax                 Move ADMTXG-STATE  To D-STATE
tax                 Move ADMTXG-CO-ZIP To D-COZIP
tax                 Move ADMTXG-CITY   To D-CITY
tax                 Compute EXT-TAX-RATE = ADMTXG-TAXRATE1(1)
tax                                     + ADMTXG-TAXRATE2(1)
tax                                     + ADMTXG-TAXRATE3(1)
tax                 MOVE EXT-TAX-RATE   TO D-EXT-TAX-RATE
tax              End-If
tax            End-If
             End-If
           End-If
      * Read for currency exchange rate...
           If D-S-ERROR = Spaces
             If IM50-FOREIGN = "Y"
               Move ARSMST-CUR To D-C10CUR
041            if  im5-cdb-required <> spaces
041            and im50-cur <> d-c10cur
041              move "Y" to d-dated-exch-rate-flag
041              if  access-inv-cdb-rate = "N"
041                move "Y" to d-cdb-disable-rate
041              end-if
041              if  d-s-fr-msg = "read-cus"
041                perform read-exchange-rate-cdb        
041              end-if
041            else   
                 Perform READ-EXCHANGE-RATE
041            end-if
             End-If
           End-If
           If D-S-ERROR <> Spaces
             Go To Read-Customer-End
           End-If
      * If a subaccount, then check If master account is on hold or
           Move ARSMST-REC To SAV-C10REC.
           If ARSMST-TYPE = "S"
              Move Spaces     To ARSMST-KEY
              Move ARSMST-MST To ARSMST-CUS
              Perform ARSMST-READ
              If STAT-LCK OR STAT-OK
                 If ARSMST-HOLD = "Y"
                    Move "mas-onhold" To D-S-ERROR
                 End-If
              End-If
           End-If
           If D-S-ERROR <> Spaces
             Go To Read-Customer-End
           End-If

           Move SAV-C10REC To ARSMST-REC
           If D-S-FR-MSG = "read-cus2"
             Go To Read-Customer-End
           End-If
           Move ARSMST-NAM To D-Cus-NAM
           Move ARSMST-CUR To D-C10CUR
tax        IF ARSMST-TXCD = "O"
tax           MOVE "N"         TO D-C1TXCD D-TAXABLE
tax                               D-EXT-TAXABLE
tax        ELSE
tax           Move ARSMST-TXCD To D-C1TXCD D-TAXABLE
tax                               D-EXT-TAXABLE
tax        END-IF
tax        Move ARSMST-GST-CODE To D-C1GST-CODE
tax                                D-GST-TAXABLE
tax        MOVE ZEROES          TO D-TAX-VALUE
tax                                D-GST-VALUE
tax        IF D-TAXABLE = "E"
tax           MOVE ZEROES TO  D-TAX-VALUE
tax        END-IF
tax        IF D-GST-TAXABLE = "E"
tax           MOVE ZEROES   TO D-GST-VALUE
tax        END-IF
tax        IF D-EXT-TAXABLE = "E"
tax           MOVE ZEROES   TO  D-TAX-VALUE
tax                             D-EXT-TAX-VALUE
tax        END-IF
tax        IF IM2-GEO-TAX NOT = "Y"
tax           MOVE IM23-DEB-INV-CDE TO D-TAX-CODE
tax           MOVE IM23-GST-TAX-CDE TO D-GST-CODE
tax        END-IF

tax        Move ARSMST-AREA To D-GEOGRAPHIC-AREA
028        IF IM2-GEO-TAX = "Y"
tax           Perform Read-Area
028        END-IF
           Move ARSMST-BR   To D-BRANCH D-DEFAULT-BRANCH
           Move ARSMST-TRMS To D-TERMS-CODE
           Move ARSMST-SLSP To D-SALESPERSON
013        Move D-VALID-FIXED   To D-Fixed-Exch

      *If override do not check branch
           If D-S-ERROR = Spaces
             If D-Branch-Selection = 2
               Perform READ-BRANCH
               If D-S-ERROR NOT = Spaces
                 Move "nobr" To D-S-ERROR
               End-If
             End-If
           End-If

           .
       READ-CUSTOMER-END.
      *
      **********************************************
      * Routine To read for currency exchange rate *
      **********************************************
       READ-EXCHANGE-RATE.
           Move "V"            To IMPZMC-FUNCTION
           Move D-C10CUR       To IMPZMC-POSTING-CURRENCY
           Move "AR"           To IMPZMC-AR-OR-AP
           Perform MC-CURRENCY-CONVERSION
           If IMPZMC-VALID-CURRENCY = "N"
             Move "nocur"  To D-S-ERROR
           Else
             If D-S-FR-MSG <> "read-cus2"
               Move IMPZMC-VALID-RATE To D-TB04RATE
               Move IMPZMC-VALID-RATE To D-SAVE-TB04RATE
               Move IMPZMC-VALID-MUL  To SAV-MD
               Move IMPZMC-VALID-DESC To D-TB04DES
               Move IMPZMC-VALID-FIXED To D-VALID-FIXED
             End-If
           End-If
           .

      **********************************************
      * Routine To check if dated exchange rates   *
      **********************************************
041    check-dated-exch-rates.

           if  im5-cdb-required <> spaces
           and im50-cur <> d-c10cur
             move "Y" to d-dated-exch-rate-flag
             if  access-inv-cdb-rate = "N"
               move "Y" to d-cdb-disable-rate
             end-if
           end-if.

      **********************************************
      * Routine To read for dated exchange rates   *
      **********************************************
041    read-exchange-rate-cdb.
           move "F"              to impzmc-function
           move d-c10cur         to impzmc-posting-currency
           move d-document-date  to impzmc-cdb-date
           move "AR"             to impzmc-ar-or-ap
           move spaces           to d-muldiv-mismatch
           perform mc-currency-conversion
           if  impzmc-valid-fixed = "Y"
               move "Y" to d-cdb-disable-rate
               move "Y" to d-valid-fixed
           end-if
           evaluate impzmc-cdb-error
             when "no tblcur"
               move "Y"            to d-cdb-error
               move spaces to link-extra
               string "Currency "        delimited by size
                      d-c10cur           delimited by size
                      " not found."
                                         delimited by size
                 into link-extra
               end-string
               move "W"            to link-msg-icon
               move "Currency"     to link-msg-hdg
               perform invoke-message-box
               move spaces         to link-extra
               move zeros          to d-tb04rate d-save-tb04rate
               move spaces         to sav-md d-valid-fixed
             when "no tblcdb"
               move "Y"            to d-cdb-error
               move spaces to link-extra
               string "Currency "        
                      d-c10cur           
                      " not found on dated exchange rate table."
                                         delimited by size                        
                 into link-extra
               end-string
               move "W"            to link-msg-icon
               move "Currency"     to link-msg-hdg
               perform invoke-message-box
               move spaces         to link-extra
               move zeros          to d-tb04rate d-save-tb04rate
               move spaces         to sav-md
               if  impzmc-valid-fixed <> "Y"
                 move spaces to d-valid-fixed
               end-if
             when "no tblcdb rate"
               move "Y"            to d-cdb-error
               move spaces to link-extra
               move d-document-date to cdb-supplied-date
               string "Dated exchange rate for currency "        
                      d-c10cur           
                      " and date "
                      cdb-supplied-date    
                      " not found."      delimited by size                        
                 into link-extra
               end-string
               move "W"            to link-msg-icon
               move "Exchange Rate"  to link-msg-hdg
               perform invoke-message-box
               move spaces         to link-extra
               move zeros          to d-tb04rate d-save-tb04rate
               move spaces         to sav-md 
               if  impzmc-valid-fixed <> "Y"
                 move spaces to d-valid-fixed
               end-if
             when other
               if  impzmc-valid-mul <> impzmc-cdb-muldiv    
                 move "Y" to d-muldiv-mismatch
               end-if
               if d-s-fr-msg <> "read-cus2"
                 move impzmc-cdb-rate to d-tb04rate d-save-tb04rate
                                         returned-cdb-rate
                 move impzmc-cdb-muldiv  to sav-md returned-cdb-muldiv
                 move impzmc-valid-desc  to d-tb04des
                 move impzmc-valid-fixed to d-valid-fixed
               end-if
           end-evaluate
           .

      ***********************************************
      * Routine To re ad for invoice terms code     *
      *********************************************
       READ-TERMS-CODE.
           Move Spaces       To TBLART-KEY
           Move D-TERMS-CODE To TBLART-COD
           Perform TBLART-READ
           If STAT-LCK OR STAT-OK
             If D-S-FR-MSG <> "read-cus2"
               Move TBLART-DES To D-TERMS-DESC
             End-If
           Else
             Move Spaces To D-TERMS-DESC
             Move ERRNOT To WW-ERROR-NUM
             Perform LOOK-UP-ERROR
           End-If
           .
      **********************************************
      * Routine To read for geographic area        *
      **********************************************
       READ-AREA.
           Move Spaces            To SALARE-KEY
           Move D-GEOGRAPHIC-AREA To SALARE-AREA
           Perform SALARE-READ
           If STAT-LCK OR STAT-OK
             Move SALARE-DESC To D-AREA-DESCRIPTION
tax          MOVE SALARE-PST  TO D-PST-TAXABLE
tax          PERFORM CHECK-GEO-LOC
           Else
             Move Spaces To D-AREA-DESCRIPTION
             Move ERRNOT To WW-ERROR-NUM
             Perform LOOK-UP-ERROR
028          Move "no-area"  To D-S-ERROR
          End-If
          .
      **********************************************
      * Routine To read for product class          *
      **********************************************
       READ-PCLASS.
           Move Spaces            To SALPRD-KEY
           Move D-BRANCH          To SALPRD-BR
           Move D-PRODUCT-CLASS   To SALPRD-COD
           Perform SALPRD-READ
           If STAT-LCK OR STAT-OK
             Move SALPRD-DESC To D-PRODUCT-CLASS-NAME
           Else
             Move ERRNOT To WW-ERROR-NUM
             Perform LOOK-UP-ERROR
           End-If
           .
02    **********************************************
      * Routine to read product class and
      **********************************************
019    PROD-CLASS-EXEMPT.
019        EVALUATE D-PRODUCT-CLASS
019           WHEN "_TAX"
019               Move "tax" To D-S-ERROR
019           WHEN "_GST"
019               Move "GST" To D-S-ERROR
019           WHEN "_FED"
019               Move "FED" To D-S-ERROR
019        END-EVALUATE.

      **********************************************
      * Routine To read for branch                 *
      **********************************************
       READ-BRANCH.
           Move Spaces            To SALBRN-KEY
           Move D-BRANCH          To SALBRN-BR
           Perform SALBRN-READ
           If STAT-LCK OR STAT-OK
006            If OPERATOR-SEC-LIM-ARBR = "F"
                   Move SALBRN-BR   To WW-ACCESS-FIELD
                   Perform VERIFY-ACCESS-ARBR
                   If WW-ACCESS-OK = "Y"
                       Move SALBRN-DESC To D-Branch-NAM
                   End-If
               End-If
           Else
             Move ERRNOT To WW-ERROR-NUM
             Perform LOOK-UP-ERROR
           End-If
           .
037    READ-DEFINED-BRANCH.
           Move Spaces            To SALBRN-KEY
           Move D-DEF-BRANCH      To SALBRN-BR
           Perform SALBRN-READ
           If  STAT-LCK Or STAT-OK
               If  OPERATOR-SEC-LIM-ARBR = "F"
                   Move SALBRN-BR   To WW-ACCESS-FIELD
                   Perform VERIFY-ACCESS-ARBR
                   If WW-ACCESS-OK = "Y"
                       Move SALBRN-DESC To D-Branch-NAM
                   End-If
               End-If
           Else
               Move ERRNOT To WW-ERROR-NUM
               Perform LOOK-UP-ERROR
           End-If
           .
      **********************************************
      * Routine To read for default branch code    *
      **********************************************
       READ-DEFAULT-BRANCH.
           Move Spaces            To SALBRN-KEY
           Move D-DEFAULT-BRANCH  To SALBRN-BR
           Perform SALBRN-READ
           If NOT STAT-LCK AND NOT STAT-OK
             Move ERRNOT To WW-ERROR-NUM
             Perform LOOK-UP-ERROR
           Else
             Move D-DEFAULT-BRANCH To WW-ACCESS-FIELD
             Perform VERIFY-ACCESS-ARBR
           End-If
           .
      **********************************************
      * Routine To read for saleperson             *
      **********************************************
       READ-SALESPERSON.
           Move Spaces            To SALSLS-KEY
           Move D-BRANCH          To SALSLS-BR
           Move D-SALESPERSON     To SALSLS-COD
           Perform SALSLS-READ
           If NOT STAT-LCK AND NOT STAT-OK
             Move ERRNOT To WW-ERROR-NUM
             Perform LOOK-UP-ERROR
           Else
             Move D-SALESPERSON  To WW-ACCESS-FIELD
             Perform VERIFY-ACCESS-REP
             If WW-ACCESS-OK = "Y"
               Move SALSLS-NAME To D-SALESPERSON-NAME
             End-If
           End-If
           .
      ***********************************************
      * Check If this is a duplicate invoice number *
      ***********************************************
       DUPLICATE-INVOICE.
           Move Spaces          To ARSINV-REC
           Move ARSMST-CUS      To ARSINV-CUS
           If ARSMST-TYPE = "S"
              Move ARSMST-MST   To ARSINV-CUS
           End-If
           Move D-DOCUMENT-TYPE To ARSINV-CDI
           Move TRNINV          To ARSINV-INV
           Perform ARSINV-READ
           If STAT-LCK OR STAT-OK
              Move "duplicate" To D-S-ERROR
              Move Spaces To TRNINV
           End-If
           .
      *
011    Check-Invoice.
.          Initialize SORUIN-LINK
.          Move "Y"            To SORUIN-TO-VALIDATE
.          Move D-Invoice-Id   To SORUIN-TO-INVOICE
.          Move "N"            To SORUIN-TO-ALLOC
.          Move "N"            To SORUIN-TO-ADD
.          Perform CALL-SORUIN
011        .

011    Allocate-Invoice.
041        perform allocate-invoice-start thru allocate-invoice-end     
041        .
041    allocate-invoice-start.
.     * Call SORUIN To generate and record
.          Initialize SORUIN-LINK
.          If  D-Generate-Invoice = "Y"
.              Move "Y"            To SORUIN-TO-ALLOC
.          Else
.              Move D-Invoice-Id   To SORUIN-TO-INVOICE
.              Move "Y"            To SORUIN-TO-VALIDATE
               Move "N"            To SORUIN-TO-ALLOC
.          End-If
.          Move "Y"                To SORUIN-TO-ADD
.          Perform CALL-SORUIN
.          If  SORUIN-RT-ERRNO Not = Zero
.              Move "Y"            To D-S-ERROR
.              Move Spaces         To TRNINV
.              Move SORUIN-RT-ERROR To Link-Extra
.              Move "invoice"      To Link-Msg-Hdg
.              Perform Invoke-Message-Box
.              Move Spaces         To LINK-EXTRA
041   *        Exit Paragraph
041            go to allocate-invoice-end
.          End-If
.          Move SorUin-RT-INVOICE  To TRNINV
.          Move SorUin-Rt-Invoice  To D-Invoice-Id
.          If  D-Generate-Invoice = "Y"
.              Perform Check-Invoice-In-Array
.              If  D-S-Error <> Spaces
.                  *> NB:This is a NESTED LOOP. Check the Stack
041   *            Perform Allocate-Invoice
041                go to allocate-invoice-start
.              End-If
.          End-If
011        .
041    allocate-invoice-end.

      *
011    CALL-SORUIN.
023   *    Perform Begin-Transaction
011        Move D-Customer         To SORUIN-TO-CUST
.          If  ARSMST-TYPE = "S"
.              Move ARSMST-MST     To SORUIN-TO-CUST
.          End-If
.          Move D-Document-Type    To SORUIN-TO-TYPE
.          Move "ARSPIN"           To SORUIN-TO-PROGRAM
.          Move D-Document-Date    To SORUIN-TO-DATE
.          Move D-Branch           To SORUIN-TO-BRANCH
.          Move "allocinv"         To LINK-COM-METHOD
.          Move SORUIN-LINK        To LINK-EXTRA
.          Move "SORUIN"           To WW-PROG-NAME
.          Perform CALL-PROGRAM-NO-CANCEL
.          Move LINK-EXTRA         To SORUIN-LINK
011        Move SPACES To LINK-EXTRA
023   *    Perform Commit-Transaction
011        .
      *
      *
       BO Section.
      ***************************************
      **** ARSTIN Business Object Section ***
      ***************************************
           *> This section will :...
           *> 1) Retrieve client L3 file
           *> 2) Validate the file by sending the to the BO
           *> 3) If there are no error
           *> 3.1) Do eSignature if configured
           *> 3.2) Reopen L3 file. NB: Not retrieve
           *> 3.3) Post all trxs.
           *> 4.4) Do "Credit Status" BO if selected.
           *> 4.5) FINALY: Show pass message and END program.
           *> 4) If there are errors
           *> 4.1) Read the schema to get the error description
           *> 4.2) Open the second LV file "3L"
           *> 4.3) Get the Item line no from schema to flag the err row
           *> 4.4) Transfere all the passed trx before the error from
           *>      L3 to 3L inserting a check to signal pass.
           *> 4.5) Then append this error and insert a tooltip and flag
           *> 4.6) Repeat 4.1 until end of schema
           *> 4.7) Append all passed trx from L3 to 3L until eof(L3)
           *> 4.8) Close files. Delete L3. Rename 3L to L3. Send new L3
           *>      to cliet.
           *> 4.9) Ask user if he still wants to post valid one only.
           *> 5) If not. Allow the continue with the add/change.
           *> 6) If they post repeat 4.1 but this time:
           *> 6.1) Skip 4.4 and 4.7. This trx will be posted.
           *> 6.2) Do "Credit Status" BO of those trx if selected.
           *> 6.3) Do a recalculation of Infomation pane of failed
           trx.
           *> 6.4) FINALY: Show failed trx. Allow user to Edit/Change
      *****************************************************************
       Post-Transaction-BO.
           Move Zeros  To wsLastErrItem
                          wsThisErrItem
           Move "Y" To wsBoPhase  *> Validate First
           Perform ArsTin-Invoke
           If wsBoPhase = "F"
             Move "Post-Err1"   To D-S-Error
             Perform Call-DS
             If D-S-FR-MSG = "Dont-Post"
               *> Perform Call-DS
               Continue                    *> Review without posting
             Else   *> "Post-Them"
               Perform Post-Continue       *> Post only valid ones
002            PERFORM Create-Ledger-Entry
032Ex          PERFORM CREATE-LEDGER-ENTRY-REVERS
               Move "PostedSome"   To D-S-To-Msg
               Perform Call-DS
             End-If
           Else
             Perform Post-Continue         *> No error where where found
             If D-S-Error = Spaces         *> Post all and close program
               Move "Posted"   To D-S-To-Msg
               Perform Call-DS
002            PERFORM Create-Ledger-Entry
032Ex          PERFORM CREATE-LEDGER-ENTRY-REVERS
002a           Move Zeroes     To
.                              LOCAL-DOC-VALUE
.                              LOCAL-TAX-VALUE
.                              LOCAL-GST-VALUE
.                              LOCAL-EXEMPT-VALUE
.                              T-LOCAL-DOC-VALUE
.                              T-LOCAL-TAX-VALUE
.                              T-LOCAL-GST-VALUE
.                              T-LOCAL-EXEMPT-VALUE
.                              D-Documents-Processed
.                              D-Document-Totals
.                              D-T-LOCAL-DOC
.                              D-T-LOCAL-TAX
.                              D-T-LOCAL-GST
.                              D-T-LOCAL-EXEMPT
.                              D-DOCUMENT-VALUE
.                              D-TAX-VALUE
.                              D-GST-VALUE
.                              D-COST-VALUE
.                              wsInValidItems
.                              wsValidatedItems
.                              wsX1
.                              wsThisErrItem
.                              wsLastErrItem
.              Move Spaces     To wsErrStr
.                              wsBoPhase
.              Perform Load-Info-Details
002a  *        Go To EndJob
             Else                         *> But we will never be
               Perform Call-Ds            *> certain. If error cropped
             End-If                       *> up go back to the screen
           End-If
           .

       Post-Continue.
           Move Zeros  To wsLastErrItem
                          wsThisErrItem
           Perform eSignature-Batch-Prior
           If Stat-Code = "00"
             Perform eSignature-Batch-Complete
             Move "N" To wsBoPhase  *> Post
             *> Clear Info panel counters
             Move Zeroes     To D-Documents-Processed
             Move Zeroes     To D-Document-Totals
             Move Zeroes     To D-T-LOCAL-DOC
                              D-T-LOCAL-TAX
                              D-T-LOCAL-GST
                              D-T-LOCAL-EXEMPT
             Move Zeroes     To D-DOCUMENT-VALUE
                              D-TAX-VALUE
                              D-GST-VALUE
                              D-COST-VALUE
023          Perform Begin-Transaction
             Perform ArsTin-Invoke
023          Perform Commit-Transaction
             Move "Y" To wsBoPhase *> Reset back to Y
040          *> Perform GL Dimension Analysis (GENPDN) after ARSTIN 
040          *> posted
040          if im2-ars-dana = "E"
040            perform gl-dimension-analysis-loop
040          end-if
           Else
             Move "eSig-Err" To D-S-Error
           End-If

           If D-S-Error = Spaces
             String
               "Transactions posted successfully." Delimited By Size
               "\n Invoice register:   "           Delimited By Size
70ok           D-Invoice-Register                  Delimited By Size
             Into D-S-To-Par
001b         If wsInValidItems <> 0
.              Move "Post-Err2"   To D-S-Error
.              Move Spaces To D-S-To-Par
.              String
.               "NOTE: Not all transactions where posted."
.                                                      Delimited by Size
.               "Failed transactions are listed in the Document List."
.                                                      Delimited By Size
.               "\n The successfully posted transactions generated"
.                                                      Delimited By Size
.               " Invoice register:   "                Delimited By Size
70ok             D-Invoice-Register                    Delimited By Size
.              Into D-S-To-Par
001b         End-If
           End-If
           .

       ArsTin-Invoke.
           Perform COMPAR-INITIALIZE-OBJECTS
           Perform COMPAR-INITIALIZE
           Set COMPST-XMLOUT               To Null
           Perform ArsTin-Parameters
           Perform ArsTin-Items
     **    Build up the linkage and call the business object
           Move Spaces                     To LINK-EXTRA
           Move "ARSTIN"                   To WW-PROG-NAME
           Perform CALL-BO-POST
           If LINK-COM-RETURN <> Zero
               Move "F"                    To wsBoPhase
               Move "XML Parsing Message"  To LINK-MSG-HDG
               Perform INVOKE-MESSAGE-BOX
               Move ZEROS                  To LINK-COM-RETURN
               Move SPACES                 To LINK-EXTRA
           End-If
           Set COMPAR-OBJECT               To COMPST-XMLOUT
           Perform COMPAR-PARSE-XML
           If LINK-COM-RETURN <> Zero
               Move "F"                    To wsBoPhase
               Move "XML Parsing Message"  To LINK-MSG-HDG
               Perform INVOKE-MESSAGE-BOX
               Move ZEROS                  To LINK-COM-RETURN
               Move SPACES                 To LINK-EXTRA
           Else
               Perform ArsTin-Errors
               If  wsLastErrItem = 0
                   If  wsBoPhase = "N"
                       If  D-Reset-Cr-Status = 1
                           Move "ARSPINL3"     To xtpReportControl
                           Move  cL3Columns    To xtpNumberColumns
                           Perform ReOpenServerFile
                           Perform InsertRemainingReport2
                       End-If
                   End-If
               Else
                   Perform InsertRemainingReport2
                   CLOSE ADMRPT2 *>Perform FinishReportControl
                   Perform DeleteReportControl
                   Move xtpReportFileName2 To LINK-EXTRA-1
                   Move xtpReportFileName  To LINK-EXTRA-2
                   Perform COPY-FILE-ON-SERVER
                   If  LINK-IMPWSH-STA <> Zero
                       Continue
                   End-If
                   Perform FinishReportControl
               End-If
011            Move SPACES To LINK-EXTRA
           End-If
           .
       ArsTin-Parameters.
           Move "PostArInvoices"           To XML-ROOT-NAME
           Perform CREATE-XML-HEADER
           Move "<Parameters>"             To ARRAY-DATA
           Move Zeros To ARRAY-LENGTH
           Perform ARRAY-CREATE
           Move  "PostingPeriod"           To XML-TAG-NAME
           Move AS-OF-SELECTION            To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "IgnoreWarnings"           To XML-TAG-NAME
           Move "Y" To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "ApplyIfEntireDocumentValid" To XML-TAG-NAME
           Move "N"                        To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "ValidateOnly"             To XML-TAG-NAME
           Move wsBoPhase                  To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
tax        Move "AutomaticTaxCalculation" To XML-TAG-NAME
tax        Move "N"                       To XML-TAG-VALUE
tax        Perform OUTPUT-ELEMENT
           Move "</Parameters>"            To ARRAY-DATA
           Move Zeros                      To ARRAY-LENGTH
           Perform ARRAY-CREATE
           Move "</PostArInvoices>"        To ARRAY-DATA
           Move ZEROS To ARRAY-LENGTH
           Perform ARRAY-CREATE
      **  Store XmlParameter string in COMPST-PARAMETERS
           Perform ARRAY-FINAL-CREATE
           Set COMPST-PARAMETERS           To ARRAY-OBJECT
           Set ARRAY-OBJECT To Null
           .

       ArsTin-Items.
           Move "PostArInvoices"           To XML-ROOT-NAME
           Perform CREATE-XML-HEADER
           Move "ARSPINL3"                 To xtpReportControl
           Move  cL3Columns                To xtpNumberColumns
           Perform RetrieveReportControl
           Perform RetrieveNextReportRecord
           Perform Until Not xtpAtOk
               Perform ArsTin-Item
               Perform RetrieveNextReportRecord
           End-Perform
           Perform CloseReportControl
           Move "</PostArInvoices>"        To ARRAY-DATA
           Move Zeros                      To ARRAY-LENGTH
           Perform ARRAY-CREATE
      **  Store XmlIn string in COMPST-XMLIN
           Perform ARRAY-FINAL-CREATE
           Set COMPST-XMLIN                To ARRAY-OBJECT
           .

       ArsTin-Item.
           Move "<Item>"                   To ARRAY-DATA
           Move Zeros                      To ARRAY-LENGTH
           Perform ARRAY-CREATE
           Move "TransactionType"          To XML-TAG-NAME
           Move CellValue(cDocType)        To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "Customer"                 To XML-TAG-NAME
           Move CellValue(cCus)            To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT-Customer
           Move "Branch"                   To XML-TAG-NAME
           Move CellValue(cBr)             To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "PostToExistingInvoice"    To XML-TAG-NAME
           If CellValue(cPostTo) = 0
             Move "N"     To XML-TAG-VALUE
           Else
             Move "Y"     To XML-TAG-VALUE
           End-If
           Perform OUTPUT-ELEMENT
           Move "GenerateInvoiceNumber"    To XML-TAG-NAME
           If  CellValue(cGenDoc) = 0
               Move "N"    To XML-TAG-VALUE
           Else
               Move "Y"    To XML-TAG-VALUE
           End-If
011        *> Set to No Since invoices are generated by SORUIN
011        Move "N"        To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "Invoice"                  To XML-TAG-NAME
           Move CellValue(cInvId)          To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "InvoiceDate"              To XML-TAG-NAME
           Move Function NumVal(CellValue(cDocdate))  To D-Document-Date
           Move D-Document-Date            To ARRAY-EDITED-DATE
           Perform OUTPUT-ELEMENT-DATE
           Move "Reference"                To XML-TAG-NAME
           Move CellValue(cDocref)         To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "InvoiceValue"             To XML-TAG-NAME
           Move Function NumVal(CellValue(cDocVal)) To NUM-VAL
           Perform EDIT-NO-LEADING-SPACES-2
           Move NUMB-R                     To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "ExchangeRate"             To XML-Tag-Name
           Move Function NumVal(CellValue(cRate)) To Num-Val
           Perform EDIT-NO-LEADING-SPACES-6
           Move Numb-R                     To XML-Tag-Value
           Perform OutPut-Element
           MOVE "FixedExchangeRate"        To XML-TAG-NAME
           If CellValue(cFixExch) = 0
             Move "N"     To XML-TAG-VALUE
           Else
             Move "Y"     To XML-TAG-VALUE
           End-If
           Perform OUTPUT-ELEMENT
tax        MOVE "Taxable"                  To XML-TAG-NAME
tax        If CellValue(cExempt) = "N"
tax          Move "N"                      To XML-TAG-VALUE
tax        Else
tax          Move "E"                      To XML-TAG-VALUE
tax        End-If
tax        Perform OUTPUT-ELEMENT
tax        Move "TaxCode"                  To Xml-Tag-Name
tax        Move CellValue(cTax)            To XML-TAG-VALUE
tax        Perform OUTPUT-ELEMENT-TAX
           Move "TaxValue"                 To Xml-Tag-Name
           Move Function NumVal(CellValue(cTaxVal)) To NUM-VAL
           Perform EDIT-NO-LEADING-SPACES-2
           Move NUMB-R                     To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
tax        MOVE "GSTTaxable"               To XML-TAG-NAME
tax        If CellValue(cGSTExempt) = "N"
tax          Move "N"                      To XML-TAG-VALUE
tax        Else
tax          Move "E"                      To XML-TAG-VALUE
tax        End-If
tax        Perform OUTPUT-ELEMENT
tax        Move "GSTTaxCode"               To Xml-Tag-Name
tax        Move CellValue(cGst)            To XML-TAG-VALUE
tax        Perform OUTPUT-ELEMENT-TAX
           Move "GSTValue"                 To Xml-Tag-Name
           Move Function NumVal(CellValue(cGstVal)) To NUM-VAL
           Perform EDIT-NO-LEADING-SPACES-2
           MOVE NUMB-R                     To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "CostValue"                To Xml-Tag-Name
           Move Function NumVal(CellValue(cCostVal)) To NUM-VAL
           Perform EDIT-NO-LEADING-SPACES-2
           MOVE NUMB-R                     To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "ProductClass"             To XML-TAG-NAME
           Move CellValue(cProd)           To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "InvoiceTerms"             To XML-TAG-NAME
           Move CellValue(cTerms)          To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "GeographicArea"           To XML-TAG-NAME
           Move CellValue(cGeo)            To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "Salesperson"              To XML-TAG-NAME
           Move CellValue(cSal)            To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
tax        Move "StateExtTax"              To XML-TAG-NAME
tax        Move CellValue(cExtstate)       To XML-TAG-VALUE
tax        Perform OUTPUT-ELEMENT
tax        Move "CountyZipExtTax"          To XML-TAG-NAME
tax        Move CellValue(cExtzip)         To XML-TAG-VALUE
tax        Perform OUTPUT-ELEMENT
tax        Move "CityExtTax"               To XML-TAG-NAME
tax        Move CellValue(cExtcity)        To XML-TAG-VALUE
tax        Perform OUTPUT-ELEMENT
           Move "</Item>"                  To ARRAY-DATA
           Move Zeros                      To ARRAY-LENGTH
           Perform ARRAY-CREATE
           .

       ArsTin-Errors.
           Perform COMPAR-GET-NEXT
           Perform Until COMPAR-WS-READ >= COMPAR-NODE-COUNT
             *> Report failed trxs to a listview
             If Compar-Tag-4 = "ErrorDescription"
               Move Compar-Tag-5   To wsErrStr
               Perform Error-String
             End-If
             If Compar-Tag-5 = "ErrorDescription"
               Move Compar-Tag-6   To wsErrStr
               Perform Error-String
             End-If
             If Compar-Tag-6 = "ErrorDescription"
               Move Compar-Tag-7   To wsErrStr
               Perform Error-String
             End-If
             If COMPAR-TAG-3 = "ItemsValidated"
               Move Compar-Tag-4 To Numb-R
               Perform Numb-Check
               Move Num-Val To wsValidatedItems
               *>If Num-Val <> 0
             End-If
             If COMPAR-TAG-3 = "InvalidItems"
               Move Compar-Tag-4 To Numb-R
               Perform Numb-Check
               Move Num-Val To wsInValidItems
               If Num-Val <> 0
                 If wsBoPhase <> "N"
                   Move "F" To wsBoPhase
                 End-If
001              *> Exit Perform
               End-If
             End-If
             If Compar-Tag-3 = "RegisterNumber"
               Move Compar-Tag-4   To Numb-R
               Perform Numb-Check
               Move Num-Val        To D-Invoice-Register
             End-If
032Ex        If Compar-Tag-4 = "RevalJournalNumber"
032Ex          Move COMPAR-TAG-5   To Numb-R
032Ex          Perform Numb-Check
032Ex          Move Num-Val        To CUR-JNL
032Ex        End-If
             Perform COMPAR-GET-NEXT
           End-Perform
         .

       Error-String.
007        Move Spaces    To recordrow
           If wsBoPhase = "Y"
             Move "F"    To wsBoPhase
           End-If
           *> Get Item Number from Compar. Report only the 1st error and
           *> Skip all the other errors reported for the current tag
           Move 0 To wsThisErrItem
           Perform Until Compar-Tag-3 = "ItemNumber"
             Perform Compar-Get-Next
             If Compar-Tag-3 = "ItemNumber"
               Move Compar-Tag-4 To Numb-R
               Perform Numb-Check
               Move Num-Val To wsThisErrItem  *> We have found it
             End-If
           End-Perform
           *> If it 1st time create 2nd file and do BOF of 1st file
           If wsLastErrItem = 0
             Move "ARSPINL3"     To xtpReportControl
             Move  cL3Columns    To xtpNumberColumns
             Perform ReOpenServerFile
             Perform Create-Invoice-List2
           End-If
           *> Insert all the record from the last read
           Move 0      To xtpReportOutput
           Perform RetrieveNextReportRecord
           Perform  Until Not xtpAtOk
             Move 2      To xtpReportOutput
             Add 1 To wsLastErrItem
             If wsThisErrItem = wsLastErrItem
               *> On final phase lets recalc Info Details counters
               Move CellValue(cCus)      To ArsMst-Cus
               Perform ARSMST-READ
               Move CellValue(cDocType)  To D-DOCUMENT-TYPE
               Move Function NumVal(CellValue(cDocVal))
                                         To D-Document-Value
               Move Function NumVal(CellValue(cTaxVal))
                                         To D-Tax-Value
               Move Function NumVal(CellValue(cGstVal))
                                         To D-GST-Value
               Move CellValue(cFixExch)  To D-Fixed-Exch
               Move Function NumVal(CellValue(cRate))
                                         To D-TB04Rate
               Move Function NumVal(CellValue(cCostVal))
                                         To D-Cost-Value
               *>Perform  Convert-Values-To-Local
               Add 1     To D-Documents-Processed
               Move 1    To D-Add-Change-Mode
               Perform Load-Info-Details
               Move 0    To D-Add-Change-Mode
               *>
               Move 189        To CellIcon(cStat) *>Id-RedFlad
               Move wsErrStr   To CellValue(cStat)

011            Move Spaces    To RecordInsertPoint-Alpha
               Perform InsertReportRow
               Move wsErrStr   To RecordRow
               Move cStat      To xtpReportTooltipColumn
               Move 2          To xtpReportOutput
               Perform InsertTooltip
               Exit Perform
             End-If
             *> If final phase do not insert back to screen
             If wsBoPhase <> "N"
               Move 201        To CellIcon(cStat) *>Id-CheckMark
               Move Spaces     To CellValue(cStat)
               Move 2          To xtpReportOutput
011            Move Spaces    To RecordInsertPoint-Alpha
               Perform InsertReportRow
             End-If
             Perform RetrieveNextReportRecord
           End-Perform
           .

      *This procedure can only happen if errors where found.
      *It will Insert all the remaining records from the last error
       InsertRemainingReport2.
           Move 0      To xtpReportOutput
           Perform RetrieveNextReportRecord
           Perform Until Not xtpAtOk
011            Move Spaces    To RecordInsertPoint-Alpha
               If  wsBoPhase <> "N"
                   Move 2      To xtpReportOutput
                   Add 1 To wsLastErrItem
                   Move 201            To CellIcon(cStat) *>Id-CheckMark
                   Move Spaces         To CellValue(cStat)
                   Perform InsertReportRow
               Else
                   If  D-Reset-Cr-Status = 1
                       Perform ARSTCR-Invoke
                   End-If
               End-If
               Move 0      To xtpReportOutput
               Perform RetrieveNextReportRecord
           End-Perform
           Perform CloseReportControl
           .

       ReOpenServerFile. *> Used to open rather than retrieve file
               *> Build up file name to be found on client.
           move xtpReportControl to ww-file-name
           move "BULDLV" to ww-function
           perform ww
           move ww-file-name to xtpReportFileName
      *
      **  If C/S transfer to client in ASCII mode
      **  Note this file never has the user number prefix
           move xtpReportFileName to xtpSvrFileName

      **  Now open file on server
           move xtpSvrFileName to admrpt-in-data
           open input admrpt-in
           move admrpt-in-data to errfil
           move errop          to errmes
           move spaces         to errkey
           move "ADMRPT"       to errfcd
           perform comer
           .


      ***************************************
      **** ARSTCR Business Object Section ***
      ***************************************
       *> Post valid trx one by 1
       ARSTCR-Invoke.
           Perform COMPAR-INITIALIZE-OBJECTS
           Perform COMPAR-INITIALIZE
           Set COMPST-XMLOUT To NULL
           Perform ARSTCR-Parameters
           Perform ARSTCR-Items
           Set COMPST-XMLIN    To ARRAY-OBJECT
           Move Spaces         To LINK-EXTRA
           Move "ARSTCR"       To WW-PROG-NAME
           Perform CALL-BO-POST
           Set COMPAR-OBJECT To COMPST-XMLOUT
           Perform COMPAR-PARSE-XML
           If LINK-COM-RETURN <> ZERO
             Move "XML Parsing Message(ARSTCR)" To LINK-MSG-HDG
             Perform INVOKE-MESSAGE-BOX
             Move ZEROS    To LINK-COM-RETURN
             Move Spaces   To LINK-EXTRA
          Else
            Perform ARSTCR-Errors
          End-If
          .

       ARSTCR-Parameters.
           Move "ArCreditCheck"    To XML-ROOT-NAME
           Perform CREATE-XML-HEADER
           Move "<Parameters>"     To ARRAY-DATA
           Move Zeros              To ARRAY-LENGTH
           Perform ARRAY-CREATE
           Move "IgnoreWarnings"   To XML-TAG-NAME
           Move "Y"                To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "ApplyIfEntireDocumentValid" To XML-TAG-NAME
           Move "Y" To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "ValidateOnly"     To XML-TAG-NAME
           Move "N"                To XML-TAG-VALUE
           Perform OUTPUT-ELEMENT
           Move "PostingPeriod"    To XML-TAG-NAME
           Move AS-OF-SELECTION    To XML-TAG-VALUE
           Perform Output-Element
           Move "</Parameters>"    To ARRAY-DATA
           Move Zeros              To ARRAY-LENGTH
           Perform ARRAY-CREATE
           Move "</ArCreditCheck>" To ARRAY-DATA
           Move ZEROS To ARRAY-LENGTH
           Perform ARRAY-CREATE
           Perform ARRAY-FINAL-CREATE
           Set COMPST-PARAMETERS   To ARRAY-OBJECT
           Set ARRAY-OBJECT        To Null
           .

       ARSTCR-Items.
           Move "ArCreditCheck"        To XML-ROOT-NAME
           Perform CREATE-XML-HEADER
           *>Move "ARSPINL3"     To xtpReportControl
           *>Move  cL3Columns    To xtpNumberColumns
          *> Open admrpt-In
           *>Perform RetrieveReportControl
           *>Perform RetrieveNextReportRecord
           *>Perform Until Not xtpAtOk
             Move "<Item>"               To ARRAY-DATA
             Move Zeros                  To ARRAY-LENGTH
             Perform ARRAY-CREATE
             Move "TransactionMethod"    To XML-TAG-NAME
             Move "S"                    To XML-TAG-VALUE
             Perform OUTPUT-ELEMENT
             Move "Customer"             To XML-TAG-NAME
             Move CellValue(cCus)        To XML-TAG-VALUE
             Perform OUTPUT-ELEMENT
             Move "</Item>"              To ARRAY-DATA
             Move Zeros                  To ARRAY-LENGTH
             Perform ARRAY-CREATE
             *>Perform RetrieveNextReportRecord
           *>End-Perform
           *>Perform CloseReportControl
           Move "</ArCreditCheck>"     To ARRAY-DATA
           Move Zeros                  To ARRAY-LENGTH
           Perform ARRAY-CREATE
           Perform ARRAY-FINAL-CREATE
           Set COMPST-XMLIN    To ARRAY-OBJECT
           .
      *
       ARSTCR-Errors.
      *
      ***************************************
      **** eSignature Section             ***
      ***************************************
       eSignatures-Verify.
           Perform Trn-Initialise
           Move TRNID-ARS-INV-PST  To TRN-ID
           Perform TRN-VERIFY
           If STAT-CODE Not = "00"
             Move "N" To Esig-Inv
           End-If
           Perform Trn-Initialise
           Move TRNID-ARS-CRN-PST  To TRN-ID
           Perform TRN-VERIFY
           If STAT-CODE Not = "00"
             Move "N" To Esig-Crn
           End-If
           Perform Trn-Initialise
           Move TRNID-ARS-DRN-PST  To TRN-ID
           Perform TRN-VERIFY
           If STAT-CODE Not = "00"
             Move "N" To Esig-Drn
           End-If
           .
      *
       eSignature-Prior.
           Perform Trn-Initialise
           Evaluate D-Document-Type
           When "I"    Move TRNID-ARS-INV-PST  To TRN-ID
           When "C"    Move TRNID-ARS-CRN-PST  To TRN-ID
           When "D"    Move TRNID-ARS-DRN-PST  To TRN-ID
           End-Evaluate
           Move Spaces             To TRN-PAR-ALP(1)  *> %Key
           Move D-Customer         To TRN-PAR-ALP(2)
           Move D-Branch           To TRN-PAR-ALP(3)
           Move D-Document-Type    To TRN-PAR-ALP(4)
           Move D-Document-Date    To TRN-PAR-DAT(5)
           Move D-Document-Reference    To TRN-PAR-ALP(6)
           Move D-Invoice-ID       To TRN-PAR-ALP(7)
           Move D-Document-Value   To TRN-PAR-NUM(8)
           Move D-Tax-Value        To TRN-PAR-NUM(9)
           Move D-Gst-Value        To TRN-PAR-NUM(10)
           Move D-TB04Rate         To TRN-PAR-Num(11)
           Move D-Fixed-Exch       To TRN-PAR-Alp(12)
           Move D-Cost-Value       To TRN-PAR-NUM(13)
           Move D-Product-Class    To TRN-PAR-Alp(14)
           Move D-Terms-Code       To TRN-PAR-Alp(15)
           Move D-Geographic-Area  To TRN-PAR-Alp(16)
           Move D-Salesperson      To TRN-PAR-Alp(17)
tax        Move D-Taxable          To TRN-PAR-Alp(18)
tax        Move D-Gst-Taxable      To TRN-PAR-Alp(19)
tax        If IM2-GEO-TAX = "G" OR "A"
tax           If D-EXT-TAXABLE = "N"
tax               Move "Y"         To D-Tax-Code
tax           Else
tax               Move "N"         To D-Tax-Code
tax           End-if
tax        End-if
tax        Move D-Tax-Code         To TRN-PAR-Alp(20)
tax        Move D-Gst-Code         To TRN-PAR-Alp(21)
           Perform Trn-Prior
           If Stat-Code Not = "00"
             Move "sig-err" To D-S-Error
           Else
             Move TRN-RET-LOG-KEY To TRN-SAV-LOG-KEY(1)
           End-If
           .
      *
       eSignature-Complete.
           Perform Trn-Init-Complete
           Move TRN-SAV-Log-Key(1) To Trn-Orig-Log-Key
           Move ARSINV-KEY         To TRN-PAR-ALP(1) *> Key
70ok       String D-Customer       Delimited By Size
70ok              D-Invoice-Id     Delimited By Size
70ok              D-Document-Type  Delimited By Size
                                   Into Trn-Par-Alp(1) *> Key
           Move D-Customer         To TRN-PAR-ALP(2)
           Move D-Branch           To TRN-PAR-ALP(3)
           Move D-Document-Type    To TRN-PAR-ALP(4)
           Move D-Document-Date    To TRN-PAR-DAT(5)
           Move D-Document-Reference    To TRN-PAR-ALP(6)
           Move D-Invoice-ID       To TRN-PAR-ALP(7)
           Move D-Document-Value   To TRN-PAR-NUM(8)
           Move D-Tax-Value        To TRN-PAR-NUM(9)
           Move D-Gst-Value        To TRN-PAR-NUM(10)
           Move D-TB04Rate         To TRN-PAR-Num(11)
           Move D-Fixed-Exch       To TRN-PAR-Alp(12)
           Move D-Cost-Value       To TRN-PAR-NUM(13)
           Move D-Product-Class    To TRN-PAR-Alp(14)
           Move D-Terms-Code       To TRN-PAR-Alp(15)
           Move D-Geographic-Area  To TRN-PAR-Alp(16)
           Move D-Salesperson      To TRN-PAR-Alp(17)
tax        Move D-Taxable          To TRN-PAR-Alp(18)
tax        Move D-Gst-Taxable      To TRN-PAR-Alp(19)
tax        If IM2-GEO-TAX = "G" OR "A"
tax           If D-EXT-TAXABLE = "N"
tax               Move "Y"         To D-Tax-Code
tax           Else
tax               Move "N"         To D-Tax-Code
tax           End-if
tax        End-if
tax        Move D-Tax-Code         To TRN-PAR-Alp(20)
tax        Move D-Gst-Code         To TRN-PAR-Alp(21)
           Perform Trn-Complete
           .

       *>--------------------------------------------------------------
       *>  Esig for capturing an invoice with dated exchange rates
       *>--------------------------------------------------------------
041    esig-prior-cdb.
           perform trn-initialise 
           move trnid-ars-inv-cdb to trn-id

           move spaces to trn-par-alp(1)
           string d-Customer       delimited by size
                  d-Invoice-Id     delimited by size
                  d-Document-Type  delimited by size
                                   into trn-par-alp(1) *> Key
           end-string
           move d-customer        to trn-par-alp(2)

           move d-invoice-id      to trn-par-alp(3)
           move d-document-type   to trn-par-alp(4)
           move d-c10cur          to trn-par-alp(5)
           move d-document-date   to trn-par-dat(6)
           move returned-cdb-rate to trn-par-num(7)
           move returned-cdb-muldiv to trn-par-alp(8)
           move d-tb04rate        to trn-par-num(9)
           perform trn-prior
           move trn-ret-log-key   to trn-sav-log-key(2)
           .
       *>********************************************************
       *>  Now inform the Electronic Signature system that the **
       *>  transaction has completed                           **
       *>********************************************************
041    esig-complete-cdb.
           perform trn-init-complete
           move trn-sav-log-key(2) to trn-orig-log-key
           perform trn-complete
           perform comer
           .

      ***************************************
      **** eSignature Batch Section       ***
      ***************************************
       eSignatures-Batch-Verify.
           Perform Trn-Initialise
           Move TRNID-ARS-DOC-BATCH  To TRN-ID
           Perform TRN-VERIFY
           .

       eSignature-batch-prior.
           perform trn-initialise.
           move trnid-ars-doc-batch to trn-id.
034        move arsctl-key          to trn-par-alp(1).   *> Key
038   *    move arsctl-nxrg         to trn-par-num(2).   *> RegisterNumber
034        move d-invoice-register  to trn-par-num(3).   *> PrevRegisterNumber
           move 1                   to trn-par-num(4).   *> BatchStatus
           move wsValidatedItems    to trn-par-num(5).   *> NumberOfDocuments
           move wsInValidItems      to trn-par-num(6).   *> NumberOfErrors
           move zeroes              to trn-par-num(7).   *> NumberOfPosts
           perform trn-prior.
           if stat-code not = "00"
             move "sig-err"         to d-s-error
           else
             move trn-ret-log-key   to trn-sav-log-key(1)
           end-if.

       eSignature-batch-complete.
           perform trn-init-complete.
           move trn-sav-log-key(1)  to trn-orig-log-key.
034        move arsctl-key          to trn-par-alp(1).   *> Key
038   *    move arsctl-nxrg         to trn-par-num(2).   *> RegisterNumber
           move d-invoice-register  to trn-par-num(3).   *> PrevRegisterNumber
           if wsInValidItems = 0                         
             move 0                 to trn-par-num(4)    *> BatchStatus
034          move 1                 to trn-par-num(7)    *> NumberOfPosts
           else                                          
             move 2                 to trn-par-num(4)    *> BatchStatus
034          move 0                 to trn-par-num(7)    *> NumberOfPosts
           end-if.
           move wsValidatedItems    to trn-par-num(5).   *> NumberOfDocuments
           move wsInValidItems      to trn-par-num(6).   *> NumberOfErrors
           perform trn-complete.

002   *
002    CREATE-LEDGER-ENTRY.
002        PERFORM CREATE-LEDGER-ENTRY-START THRU
002                CREATE-LEDGER-ENTRY-END.
002   *
002    CREATE-LEDGER-ENTRY-START.
002        IF  IM2-DEB-PGL = "R"
002        OR  IM2-DEB-PGL = "N"
002            GO TO CREATE-LEDGER-ENTRY-END.
002   *
002        IF  IM2-ARS-CGL NOT = "Y"
002            GO TO CREATE-LEDGER-ENTRY-END.
002   *
002        MOVE SPACES             TO ARI-KEY.
002        MOVE D-PstYer           TO ARI-YEAR.
002        MOVE D-PstMon           TO ARI-MONTH.
002        MOVE D-Invoice-Register TO ARI-REG.
002        MOVE ARI-KEY            TO LINK-EXTRA.
002        MOVE "ARSPGI"           TO WW-PROG-NAME.
002        PERFORM CALL-PROGRAM.
002    CREATE-LEDGER-ENTRY-END.
tax   ***************************************************
tax   * Calculate dfifferent taxe systems
tax   ****************************************************
tax    CALCULATE-TAX.
tax         PERFORM CALC-TAX-START THRU CALC-TAX-END.
tax    CALC-TAX-START.
tax        INITIALIZE TAXFIELDS.
ta         MOVE D-DOCUMENT-VALUE TO TAXABLE-AMT
tax                                 TAXBLE-VAL-PLUS-FED.
tax   * Set document date...
tax        IF D-DOCUMENT-DATE NOT = ZEROS
tax           MOVE D-DOCUMENT-DATE TO DATE-CCYYMMDD
tax           PERFORM DATE-FROM-CYMD
tax           MOVE DATE-NORMAL   TO DOC-DATE
tax        ELSE
tax           MOVE IM0DAT        TO DOC-DATE.
tax
tax   * Calculate Canadian GST if tax system is basic and nationality
tax   * is CAN
tax        IF IM50-FED = "Y"
tax           PERFORM CALC-FEDERAL-TAX.
tax
tax   * Calculate USA tax
tax        IF IM2-GEO-TAX = "A" OR "G"
tax           PERFORM CALCULATE-USA-TAX.
tax
tax    CALC-BASIC-TAX.
tax   * Calculate basic tax
tax        IF IM2-GEO-TAX = "A" OR "G"
tax           GO TO CALC-TAX-END.
tax
tax   * Calculate basic tax if taxable ...otherwise go to end
tax        IF D-TAXABLE = "E"
tax           GO TO CALC-TAX-END.
taz
tax        IF D-TAXABLE = "N"
tax           IF D-TAX-CODE = SPACES
tax              MOVE "no-tax" TO D-S-ERROR
tax              GO TO CALC-TAX-END.
tax
tax   * Establish which rate to use...
tax   * If processing a credit note, check if date of invoice
tax   * being credited is before the invoice document date.
tax   * If so, use previous tax rate...
tax        MOVE ZEROES             TO TAX-RATE
tax        MOVE D-TAX-CODE         TO TX-CD.
tax        IF TX-CD NOT = SPACES
tax           PERFORM TX-VALIDATE
tax           IF TX-ANS = "Y"
tax              MOVE TXCUR-RATE(TX-X1) TO TAX-RATE
tax              MOVE DOC-DATE   TO DD-LDAT.
tax
tax        MOVE TXDAT-RATE(TX-X1) TO DD-HDAT.
tax        PERFORM DATE-COMPARE.
tax        IF DD-LDAT-EARLIER = "Y"
tax           MOVE TXPRV-RATE(TX-X1) TO TAX-RATE
tax           MOVE DD-LDAT TO TX-DATE
tax           PERFORM TX-READ-HISTORY
tax           IF SORUTX-RT-STAT = "Y"
tax              MOVE TX-EFF-RATE TO  TAX-RATE.
tax
tax   * Now calculate basic tax...based on the given rate
tax        IF TX-EXCLUSIVE = "I"
tax          MOVE "E"               TO TX-INC-EXCL(TX-X1).
tax        MOVE TAXBLE-VAL-PLUS-FED TO TX-BASE.
tax        PERFORM TX-CALCULATE.
tax        MOVE TX-AMOUNT           TO D-TAX-VALUE.
tax
tax    CALC-TAX-END.
          EXIT.
tax   **************************
tax   * Calculate Canadian GST *
tax   **************************
tax    CALC-FEDERAL-TAX.
tax        PERFORM CALC-FST-START THRU CALC-FST-END.
tax    CALC-FST-START.
tax        INITIALIZE GSTTAXFIELDS.
tax
tax        IF D-GST-TAXABLE = "E"
tax           GO TO CALC-FST-END.
tax
tax        IF D-GST-CODE = SPACES
tax           MOVE "no-gst" TO D-S-ERROR
tax           GO TO CALC-FST-END.
tax
tax   * *> First Get GST rate and and calculate
tax        MOVE ZEROES             TO GST-RATE
tax        MOVE D-GST-CODE         TO TX-CD.
tax        IF TX-CD NOT = SPACES
tax           PERFORM TX-VALIDATE
tax           IF TX-ANS = "Y"
tax              MOVE TXCUR-RATE(TX-X1) TO GST-RATE
tax              MOVE DOC-DATE          TO DD-LDAT
tax              MOVE TXDAT-RATE(TX-X1) TO DD-HDAT
tax              PERFORM DATE-COMPARE
tax              IF DD-LDAT-EARLIER = "Y"
tax                 MOVE TXPRV-RATE(TX-X1) TO GST-RATE
tax                 MOVE DD-LDAT TO TX-DATE
tax                 PERFORM TX-READ-HISTORY
tax                 IF SORUTX-RT-STAT = "Y"
tax                    MOVE TX-EFF-RATE TO GST-RATE.
tax
tax   * *> Calculate the GST amount...based on the GST rate.
tax        IF D-GST-TAXABLE = "N"
tax           COMPUTE CAL-GST-VALUE ROUNDED =
tax                              (TAXABLE-AMT * (GST-RATE / 100))
tax           MOVE CAL-GST-VALUE   TO D-GST-VALUE
tax        END-IF.
tax
tax   *  Calculate provincial tax on n GST for Canada
tax        IF IM2-GEO-TAX NOT = "Y"
tax        OR D-PST-TAXABLE = "Y"
tax           COMPUTE TAXBLE-VAL-PLUS-FED ROUNDED =
tax                                       CAL-GST-VALUE + TAXABLE-AMT.
tax   *
tax    CALC-FST-END.
tax        EXIT.
tax   **********************
tax   * Calculate USA tax *
tax   **********************
tax    CALCULATE-USA-TAX.
tax        PERFORM CALCULATE-USA-START THRU CALCULATE-USA-END.
tax    CALCULATE-USA-START.
tax   * *> Make sure that the customer is taxable...othrwise get out
tax        IF D-EXT-TAXABLE = "E"
tax           MOVE ZEROES TO D-TAX-VALUE
tax           GO TO CALCULATE-USA-END.
tax
tax        MOVE ZEROES TO D-EXT-TAX-VALUE.
tax   * *> Validate the extended tax codes.
tax        MOVE D-STATE  TO TX-CDE-STATE
tax        MOVE D-COZIP  TO TX-CDE-CO-ZIP
tax        MOVE D-CITY   TO TX-CDE-CITY
tax        PERFORM READ-US-TAX.
tax
tax   * *> Check to see if more than 25 rates used
tax        IF IM2-GEO-TAX = "A" OR "G"
tax            MOVE 1 TO XX4
tax            MOVE TAXABLE-AMT  TO TX-BASE
tax            MOVE "N"          TO TX-ECODE
tax            MOVE 0            TO TX-REP-3RD-PARTY
tax            MOVE DOC-DATE     TO TX-DATE
tax            MOVE "N" TO TX-USE-3RD-PARTY-CALC
tax            PERFORM TX-CALCULATE-EXT.
tax        MOVE TX-RATE    TO D-EXT-TAX-RATE.
tax        MOVE TX-TAXABLE TO TAXABLE-AMT.
tax        MOVE TX-AMOUNT  TO D-EXT-TAX-VALUE D-TAX-VALUE.
tax
tax    CALCULATE-USA-END.
tax         EXIT.
tax
tax   **********************************************
tax   * Procedure to calculate diffent tax systems *
tax   **********************************************
tax    CHECK-TAXABLE.
tax         PERFORM CHECK-TAXABLE-001 THRU  CHECK-TAXABLE-002.
tax
tax    CHECK-TAXABLE-001.
tax   *  If USA extended tax codes, the tax codes have already been
tax   *  validated.
tax        IF IM2-GEO-TAX = "A" OR "G"
tax           GO TO CHECK-TAXABLE-002.
tax
tax   * Provide a tax code if customer is customer is not exempt and
tax   * tax value is greater than zeroe
tax        IF D-TAXABLE = "N"
tax           IF D-TAX-CODE = SPACES AND D-TAX-VALUE = ZEROES
tax              MOVE "E" TO D-TAXABLE.
tax
tax        IF D-GST-TAXABLE = "N"
tax           IF D-GST-CODE = SPACES AND D-GST-VALUE = ZEROES
tax              MOVE "E" TO D-GST-TAXABLE.
tax
tax   * Provide a tax code if customer is customer is not exempt and
tax   * tax value is greater than zeroe
tax        IF D-TAXABLE = "N"
tax           IF D-TAX-CODE = SPACES
tax              IF D-TAX-VALUE > ZEROES
tax                  MOVE "no-tax" TO D-S-ERROR.
tax
tax   * Provide GST tax code if customer is customer is not exempt and
tax   * GST tax value is greater than zeroe
tax        IF D-GST-TAXABLE = "N"
tax           IF D-GST-CODE = SPACES
tax              IF D-GST-VALUE > ZEROES
tax                 MOVE "no-gst" TO D-S-ERROR.
tax
tax    CHECK-TAXABLE-002.
tax        EXIT.
tax   ***************************************
tax   * Validate tax codes against ADMTAX   *
tax   ***************************************
tax    VALIDATE-TAX-CODE.
tax         PERFORM VAL-TAX-CODE-001 THRU  VAL-TAX-CODE-002.
tax
tax    VAL-TAX-CODE-001.
tax        INITIALIZE ADMTAX-REC.
tax        IF D-MNT-CODE NOT = SPACES
tax           MOVE D-MNT-CODE   TO TX-CD
tax           PERFORM TX-VALIDATE
tax           IF TX-ANS = "N"
tax              MOVE "no-tax"  TO D-S-ERROR
tax           END-IF.
tax
tax    VAL-TAX-CODE-002.
tax        EXIT.
tax   *
tax   *************************************************************
tax   * If by geographic area, default to the area tax codes and GST
tax   * codes...if not provided , default to AR Setup tax codes
tax   *************************************************************
tax    CHECK-GEO-LOC.
tax       PERFORM CHECK-GEO-LOC-001 THRU CHECK-GEO-LOC-002.
tax    CHECK-GEO-LOC-001.
tax   * If maintaining and the area is the same...dont read SALARE
029        IF D-TAXABLE = "E" AND D-GST-TAXABLE = "E"
tax           GO TO CHECK-GEO-LOC-002.
tax
tax        IF D-ADD-CHANGE-MODE = 2
tax           IF SAVED-AREA = SALARE-AREA
tax              IF D-TAX-CODE NOT = SPACES
tax                 OR D-GST-CODE NOT = SPACES
tax                    GO TO CHECK-GEO-LOC-002.
tax
tax        IF D-ADD-CHANGE-MODE = 1
tax           IF D-TAX-CODE NOT = SPACES
tax              IF D-GST-CODE NOT = SPACES
tax                 GO TO CHECK-GEO-LOC-002.
tax
tax        IF IM2-GEO-TAX = "Y"
tax           MOVE SALARE-AREA TO SAVED-AREA
036           IF  D-TAX-CODE = SPACES 
tax               MOVE SALARE-TAX  TO D-TAX-CODE
036           END-IF
036           IF D-GST-CODE = SPACES 
tax               MOVE SALARE-GST  TO D-GST-CODE
036           END-IF
tax           IF D-TAX-CODE = SPACES
tax               MOVE IM23-DEB-INV-CDE TO D-TAX-CODE
tax           END-IF
tax             IF D-GST-CODE = SPACES
tax                 MOVE IM23-GST-TAX-CDE TO D-GST-CODE
tax              END-IF
tax            MOVE SALARE-PST TO D-PST-TAXABLE.
tax
tax        If IM2-GEO-TAX = "G" OR "A"
tax           MOVE SPACES  TO D-GST-CODE
tax        END-IF.
tax
tax    CHECK-GEO-LOC-002.
tax       EXIT.
tax   *************************************
tax   * Browse USA tax code and validate *
tax   *************************************
tax    BROWSE-US-TAX.
tax        MOVE EXT-TAX-RATE TO D-EXT-TAX-RATE.
tax        MOVE D-STATE      TO ADMTXG-STATE.
tax        MOVE D-COZIP      TO ADMTXG-CO-ZIP.
tax        MOVE D-CITY       TO ADMTXG-CITY.
tax        MOVE ADMTXG-KEY   TO LINK-BRW-1.
tax        MOVE "IMPTXE"     TO WW-PROG-NAME.
tax        MOVE "B"          TO LINK-BRW-ENQ.
tax        PERFORM CALL-PROGRAM.
tax        IF LINK-BRW-RET NOT = SPACES
tax           MOVE LINK-BRW-RET   TO TX-CDE
tax           perform READ-US-TAX
tax           MOVE SPACES TO LINK-BRW-RET.
tax
tax   *************************
tax   * Read for USA tax code *
tax   *************************
tax    READ-US-TAX.
tax       PERFORM TX-VALIDATE-EXT
tax       IF TX-ANS = "Y"
tax          COMPUTE EXT-TAX-RATE = ADMTXG-TAXRATE1(1)
tax                                 + ADMTXG-TAXRATE2(1)
tax                                 + ADMTXG-TAXRATE3(1)
tax          MOVE ADMTXG-STATE    TO D-STATE SHIP-DISP-STATE
tax          MOVE ADMTXG-CO-ZIP   TO D-COZIP SHIP-DISP-COZIP
tax          MOVE ADMTXG-CITY     TO D-CITY  SHIP-DISP-CITY
tax          MOVE SHIP-DISPLAY    TO D-SHIP-DISPLAY
tax          MOVE EXT-TAX-RATE    TO D-EXT-TAX-RATE
tax       ELSE
tax         PERFORM ADMTXG-INITIALIZE-REC
tax         MOVE "no-usatax"       TO D-S-ERROR
tax       End-If.
032Ex *****************************************************************
032Ex * Create a GL Journal when posting credit and Debit notes to
032Ex * Invoices that have been Revalued
032Ex *****************************************************************
032Ex  CREATE-LEDGER-ENTRY-REVERS.
032Ex      IF CUR-JNL <> 0  AND
032Ex         SQL-FLAG = "Y"
032Ex         PERFORM CREATE-LEDGER-REVS-ENTRY-START THRU
032Ex                 CREATE-LEDGER-REVS-ENTRY-END.
032Ex *
032Ex  CREATE-LEDGER-REVS-ENTRY-START.
032Ex      IF  IM2-DEB-PGL = "R"
032Ex      OR  IM2-DEB-PGL = "N"
032Ex          GO TO CREATE-LEDGER-REVS-ENTRY-END.
032Ex *
032Ex      IF  IM2-ARS-CGL NOT = "Y"
032Ex          GO TO CREATE-LEDGER-REVS-ENTRY-END.
032Ex *
032Ex      MOVE SPACES        TO ARP-KEY.
032Ex      MOVE D-PSTYER      TO ARP-YEAR.
032Ex      MOVE D-PSTMON      TO ARP-MONTH.
032Ex      MOVE CUR-JNL       TO ARP-JNL.
032Ex      MOVE ARP-KEY       TO LINK-EXTRA.
032Ex      MOVE "ARSPGP"      TO WW-PROG-NAME.
032Ex      PERFORM CALL-PROGRAM.
032Ex  CREATE-LEDGER-REVS-ENTRY-END.
      *
       *>--------------------------------------------------------------
       *> Routine to call GL Dimension Analysis program (GENPDN)
       *> Input  : GENDAN.LNK
       *> Output : gendan-dentry  Returned Dimension Analysis number
       *>--------------------------------------------------------------
040    gl-dimension-analysis-loop.
040        perform gendtf-initialise
040        if d-invoice-register <> gendan-jnl
040          move 0 to dimana-line   
040        end-if
040
040        initialize  gendan-entry-fields
040        move "E"                to gendan-call-from
040        move "ARS"              to gendan-sub-mod
040        move "SA"               to gendan-source
040        move "AR"               to gendan-prio-src
040        move "DEBS"             to gendan-tcd
040        move d-invoice-register to gendan-jnl
040        move pm-pstyer          to gendan-year
040        move pm-pstmon          to gendan-period
040        move "SBI"              to gendan-bus-process
040
040        perform arsstd-initialize-rec
040        move pm-pstyer    to arsstd-year
040        move pm-pstmon    to arsstd-month
040        move d-invoice-register to arsstd-reg
040        perform arsstd-start-ge
040        perform arsstd-read-next
040        perform until stat-code <> "00"
040          or arsstd-reg <> d-invoice-register 
040          if arsstd-dentry = zeroes
040            perform gl-dimension-analysis
040          end-if
040          perform arsstd-read-next
040        end-perform
040
040        perform gendtf-close
040        *> Only call GENPDN once with all the GL Lines to get the
040        *> dimension entry number
040        if SalGlIntSaleYN = "Y"
040          perform cap-and-post-dimana 
040        end-if
040        if dim-dentry <> zeroes
040          perform arsstd-initialize-rec
040          move pm-pstyer          to arsstd-year
040          move pm-pstmon          to arsstd-month
040          move d-invoice-register to arsstd-reg
040          perform arsstd-start-ge
040          perform arsstd-read-next
040          perform until stat-code <> "00"
040          or arsstd-reg <> d-invoice-register
040            if arsstd-dentry = zeroes 
040                move dim-dentry to arsstd-dentry
040                perform arsstd-rewrite
040                perform comer
040            end-if
040            perform arsstd-read-next
040          end-perform
040        end-if
040        .
040   *
040    gl-dimension-analysis.
040       perform gl-dimension-analysis-start thru
040                                           gl-dimension-analysis-end.
040   * We are setting up a table of entries so that we only call GENPDN 
040   * once to avoid unecessary calls
040   *
040    gl-dimension-analysis-start.
040   *> Apply the AR branch net SalesCtlAcc to this line
040        perform dim-read-branch
040        initialize gendan-line-details
040        add 1                     to dimana-line
040        move "Y"                  to gendan-line-ctrl-flg
040        move dimana-line          to gendan-line
040        move salbrn-sctl          to gendan-line-ledger 
040        move arsstd-cus           to gendan-line-cus
040        move arsstd-amt           to gendan-line-amt
040        move arsstd-inv           to gendan-line-docno
040        move arsstd-prd           to gendan-line-pcl
040        move arsstd-geo           to gendan-line-geo
040        string arsstd-year
040               arsstd-month
040               arsstd-reg
040               arsstd-inv
040               arsstd-lin
040                                  delimited by size
040                                  into gendan-line-src-key
040        perform gendtf-write-file
040
040        perform read-sales-gl-integration
040
040   *> Apply ledger code for sales and a credit note
040        initialize gendan-line-details
040        add 1                     to dimana-line 
040        move dimana-line          to gendan-line
040        if  arsstd-doc = "C" and salins-cod-credit not = spaces
040          move salins-cod-credit  to gendan-line-ledger 
040        else 
040          move salins-sal         to gendan-line-ledger
040        end-if
040        move arsstd-cus           to gendan-line-cus
040        move arsstd-amt           to gendan-line-amt
040        move arsstd-inv           to gendan-line-docno
040        move arsstd-prd           to gendan-line-pcl
040        move arsstd-geo           to gendan-line-geo
040        move arsstd-cpo           to gendan-line-ref
040        compute gendan-line-amt = gendan-line-amt * -1
040        move arsstd-key           to gendan-line-src-key
040        perform gendtf-write-file
040
040        if arsstd-cost = zeroes
040          go to gl-dimension-analysis-end
040        end-if
040
040    *> Apply ledger code for cost of sales 
040        initialize gendan-line-details
040        add 1                     to dimana-line
040        move dimana-line          to gendan-line
040        move salins-cos           to gendan-line-ledger
040        move arsstd-cus           to gendan-line-cus
040        move arsstd-cost          to gendan-line-amt
040        move arsstd-inv           to gendan-line-docno
040        move arsstd-prd           to gendan-line-pcl
040        move arsstd-geo           to gendan-line-geo
040        move arsstd-cpo           to gendan-line-ref
040        move arsstd-key           to gendan-line-src-key
040        perform gendtf-write-file
040
040    *> Apply the AR branch cost of sales control account
040        initialize gendan-line-details
040        add 1                     to dimana-line 
040        move dimana-line          to gendan-line
040        move "Y"                  to gendan-line-ctrl-flg
040        move salbrn-cctl          to gendan-line-ledger
040        move arsstd-cus           to gendan-line-cus
040        move arsstd-prd           to gendan-line-pcl
040        move arsstd-geo           to gendan-line-geo
040        move arsstd-cost          to gendan-line-amt
040        compute gendan-line-amt = gendan-line-amt * -1.
040        move arsstd-inv           to gendan-line-docno.
040        string arsstd-year
040               arsstd-month
040               arsstd-reg
040               arsstd-inv
040               arsstd-lin           delimited by size
040                                  into gendan-line-src-key
040        end-string.
040        perform gendtf-write-file
040        .
040    gl-dimension-analysis-end.
040        .
040
040    read-sales-gl-integration.
040        move "CTL"                to salict-key
040        perform salict-read
040
040        move spaces               to salins-key
040        move arsstd-br            to salins-br
040        if salict-icls = "Y"
040          move arsstd-prd         to salins-cod
040        end-if
040        if salict-igeo = "Y"
040          move arsstd-geo         to salins-area
040        end-if
040        if salict-iwh = "Y"
040          move arsstd-wh          to salins-wh
040        end-if
040        
040    *> If no sales interfaces setup for this branch, don't call GENPDN
040    *> with a blank ledger code
040        perform salins-read
040        if not stat-ok 
040          move "N" to SalGlIntSaleYN        
040        else
040          move "Y" to SalGlIntSaleYN
040          perform comer
040        end-if
040        .
040    dim-read-branch.
040        move spaces            to salbrn-key
040        move arsstd-br         to salbrn-br
040        perform salbrn-read
040        if stat-ok
040          continue
040        else
040          perform comer
040        end-if
040        .
      *
      **************************
      **  End of job routine  **
      **************************
       CANCELREQ.
      *
       REGISTER-MESSAGES.
       HOF.
       ENDJOB.
041a       move store-cdb-required to im5-cdb-required
041a       .
       ENDJOB10.
           Perform QUIT-DS
           Perform Close-All-Files
           Exit Program.