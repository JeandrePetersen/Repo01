8.0   * This program has been copied to SYSPRO 8.
      **************************************************************
      **                      SYSPRO                              **
      **  Copyright (c) 1994-2024 SYSPRO Ltd. All rights reserved.**
      **************************************************************
      **  Program name  : ASSPAD                                  **
      **  Description   : Asset Depreciation Adjustment           **
      **  Run from menu : Yes                                     **
      **  Can be secured: Yes                                     **
      **  Owner         : Financial                               **
      **************************************************************
      *
      *   Date   Init  PDR  Description
015   * 26/07/24 EVL 129195 Check if there are any lines to tag with
      *                     dimensions before calling GENPDN. 
014   * 10/10/23 AK  124595 Adjustment incorrectly rounding off decimals
013   * 18/05/21 ARA 117683 Dimension Analsysis(F2000)
012   * 26/08/19 rpm 99110 Avanti changes (BINSRC only).
011   * 16/03/18 ARA 86907 Clear listview after posting (ClientServer)
010   * 14/07/17 ARA 82467 SYSPRO 8 Migration
8.0   *----------------------------------------------------------
009   * 05/11/13 LCH 58321 Standardise short-cuts for Post and Prev
008   * 02/02/13 ZKR 53382 Removed obsolete code(Events & Triggers)
007   * 05/10/12 ZTM 51056 Correct comment length
      * 18/02/13 ZKR 51056 Removed obsolete code(Events & Triggers)
006   * 12/06/12 ZTM 45781 Conversion to SYSPRO 7
7.0   *----------------------------------------------------------
005   * 10/08/10 ztm 29869 Electronic signatures for 6.1
004   * 06/05/11 PVW 37416 Changes to prevent 114 error.
003   * 11/04/11 ztm 36828 Translation problem - Listview XML only
002   * 10/01/11 ztm 33782 link to Asset Setup program.
001   * 10/08/10 ZTM 29868 DS Run error - Dialog only
000   * 07/05/09 ZTM 18469 New 6.1 UI for Asset Depreciation Adjustment
      *
       FILE-CONTROL.
      *
       COPY "ASSMST.SEL".
       COPY "ASSCTL.SEL".
       COPY "ASSDIS.SEL".
       COPY "ASSDBV.SEL".
       COPY "ASSDTX.SEL".
       COPY "ASSDAL.SEL".
013    COPY "GENMST.SEL".
       COPY "GENCTL.SEL".
       COPY "ADMRPT.SEL".
       COPY "ADMREP.SEL".
013    COPY "GENDTF.SEL".
      *
       COPY "CLASS.WRK".
              .
      *
       DATA DIVISION.
       FILE SECTION.
      *
       FD ASSMST.
       COPY "ASSMST.MAC".
       FD ASSCTL.
       COPY "ASSCTL.MAC".
       FD ASSDIS.
       COPY "ASSDIS.MAC".
       FD ASSDBV.
       COPY "ASSDBV.MAC".
       FD ASSDTX.
       COPY "ASSDTX.MAC".
       FD ASSDAL.
       COPY "ASSDAL.MAC".
013    FD GENMST.
013    COPY "GENMST.MAC".
       FD GENCTL.
       COPY "GENCTL.MAC".
       FD ADMREP.
       COPY "ADMREP.MAS".
       FD ADMRPT.
       COPY "ADMRPT.MAS".
013    FD GENDTF.
013    COPY "GENDTF.MAT".

       working-storage section.
      *
       COPY "STANDARD.WRK".
      *
       78 ProgramId          VALUE "ASSPAD".
      *
       01  WHAT-STRING       VALUE "@(#) Program version    .015".
           03  filler        pic x(25).
           03  vers          pic 9(3).
       01  what-dummy        pic x(2) value x"0d0a".
       01  BROWSE-NAME       PIC X(6) VALUE "ASSPAD".
      *
       78  ASSPADlv-cols     value 7.  *> No of columns in listview
      *
       01  EDITB-12-2B       PIC BZZZ,ZZZ,ZZZ,ZZ9.99-.
       01  EDIT-EXCEPTION.
           03  EDIT-EXCEPTION-NUM PIC 9(6).
       01  SAV-ADJ-ACCESS-OK       PIC X.
       01  EDITED-DATE     PIC X(8).
      *
005    01  W-MESSAGE               PIC X(80) VALUE
005     "You have been denied access to Asset Depreciation Adjustment.".
005    01  W-MESSAGE2              PIC X(80) VALUE
005        "eSignature access denied to this transaction.".

005    01  ADJ-VALUES.
005        03 FILLER OCCURS 12.
005           05 ADJ-TYTD          PIC S9(12)V99.
005           05 ADJ-PRN           PIC S9(12)V99.
005    01  W-FOUND                 PIC X.

       01  LINK-CALL.
70         03 LINK-CODE                PIC X(30).
           03 LINK-MNT                 PIC X(3).
      *
70fix  01  ALPHA-ASS.
           03  NUMERIC-ASS  PIC 9(15).

       01  ASI-KEY.
           03  ASI-YEAR          PIC 9(4).
           03  ASI-MONTH         PIC 9(2).
           03  ASI-REG           PIC 9(10).
       01  SAV-ASSDIS-KEY.
           03  SAV-ASSDIS-YEAR   PIC 9(4).
           03  SAV-ASSDIS-PER    PIC 9(2).
           03  SAV-ASSDIS-REG    PIC 9(10).
       01  SAVE-LINK-EXTRA   PIC X(1000).
       01  W-MONTH               PIC S99.

013    01 dimregisterNo.
013      03 dimregNo              pic 9(10).
013    01 dim-ent-cnt             pic 9(10).
013    01  sav-assdim-key.
013        03  sav-assdim-cod        pic x(30). *>AssetKey
013        03  sav-assdim-yyyymm.
013            05  sav-assdim-year   pic 9(4).  *>EntryYear
013            05  sav-assdim-month  pic 9(2).  *>EntryMonth
013        03  sav-assdim-date       pic 9(8).  *>SystemDate
013        03  sav-assdim-time       pic 9(8).  *>SystemTime
013   *
013    01 dim-sav.
013       03 dim-sav-entno        pic 9(10)  occurs 500.

       01  FILLER.
           03  AS-DDT-DATE         PIC 9(8).
           03  AS-DDT-DATEX REDEFINES AS-DDT-DATE.
               05  AS-DDT-YYYY     PIC 9999.
               05  AS-DDT-MMDD.
                   07  AS-DDT-MM   PIC 99.
                   07  AS-DDT-DD   PIC 99.
           03  AS-FROM-DATE.
               05  AS-FROM-CEN     PIC 99.
               05  AS-FROM-YEAR    PIC 99.
               05  AS-FROM-MONTH   PIC 99.
               05  AS-FROM-DAY     PIC 99.
           03  AS-TO-DATE.
               05  AS-TO-CEN       PIC 99.
               05  AS-TO-YEAR      PIC 99.
               05  AS-TO-MONTH     PIC 99.
               05  AS-TO-DAY       PIC 99.
           03  AS-CALC-PERIODX.
               05  AS-CALC-YYYY    PIC 9999.
               05  AS-CALC-MM      PIC 99.
           03  AS-CALC-PERIOD REDEFINES AS-CALC-PERIODX
                                       PIC 9(6).
           03  AS-MONTHS           PIC S9(5).
           03  AS-FROM-MONTHS      PIC S9(5).
           03  AS-TO-MONTHS        PIC S9(5).
      *
       COPY "IMPZMC.LNK".
013    copy "GLGENDAN.WRK".
013    copy "GLDIMANA.WRK".
013    copy "GLDIM.LNK".
      *
       COPY "ASSPAD.CPB".
       COPY "DSCTL.WRK".
      *
       COPY BROWSE.WRK.
      *
       COPY "REPORT.WRK".
       COPY "WWLINK.WRK".
       COPY "COMPAR.WRK".
       COPY "COMCRX.WRK".
       COPY "SQL.WRK".
       COPY "DEL.WRK".
       COPY "IMPTRN.WRK".

       78 MNTCOD VALUE START OF D-MNT-COD - START OF D-DATA-BLOCK.
       78 MNT-DATE VALUE START OF D-MNT-DATE - START OF D-DATA-BLOCK.
       78 MNT-PER VALUE START OF D-MNT-PER - START OF D-DATA-BLOCK.
       78 COM-MENT VALUE START OF D-COMMENT - START OF D-DATA-BLOCK.
      *
       COPY "LNK.WRK".
       01 LNK2.
           02  IMPFRO-LINK.
               COPY "IMPFRO.LNK".
      *
       01  COMP-LNK REDEFINES LNK2.
       COPY "COMPAR.LNK".
       01 FILLER REDEFINES LNK2.
           COPY "COMPST.LNK".
       01  SETUP-LNK2 REDEFINES LNK2.
       COPY "COMMN2.LNK".

       LINKAGE SECTION.
       COPY "LINK.WRK".
       01  LINK2                  PIC X.
      *
       PROCEDURE DIVISION USING LINK, LINK2.
           IF LINK-MAINT-FRM-BRW = "Y"
               MOVE "N" TO CHECK-ACCESS.
           PERFORM COMPAR-INITIALIZE-OBJECTS.
           SET COMMN2-XMLOUT TO NULL.
       COPY "PROBEGIN.PRO".
       COPY "PROMC.PRO".
       COPY "IMPFRO.PRO".
       COPY "COMCRX.PRO".
       COPY "COMPAR.PRO".
       COPY "SQL.PRO".
013    copy "GLDIMANA.PRO".
013    copy "GENDTF.PRO".
013    copy "PRODEL.PRO".
       COPY "IMPTRN.PRO".
       copy "REPORT.PRO".
           MOVE LINK-EXTRA      TO LINK-CALL.
      *
      * Check that appropriate module is installed...
      *
           IF IM0PLN NOT = "Y"
              MOVE COM-MSG-ASS-NOT-INS TO LINK-COM-MSG
              PERFORM COM-ERROR-MSG
              GO TO ENDJOB.
      *
      * Ensure that something has been returned otherwise get out...
           IF COMPST-XMLIN = NULL
              MOVE COM-MSG-NO-DATA-LINK TO LINK-COM-MSG
              PERFORM COM-ERROR-MSG
              GO TO ENDJOB.
      *
      **  Initialize dialog system fields
           INITIALIZE DS-CONTROL-BLOCK.
           INITIALIZE D-DATA-BLOCK.
           MOVE "ASSPAD"            TO SCREENSET-NAME.
           MOVE DSG-PUSH-SET        TO DSG-CONTROL.
      *
      * Check access to financial fields
           MOVE 16                TO WW-ACCESS-NUM.
           PERFORM FILTER-ACCESS-FIELD.
           MOVE WW-ACCESS-OK      TO D-FIN-ACCESS-OK.
           PERFORM ESIGNATURES-VERIFY.
      *
           MOVE IM0GPR TO D-IM0GPR.
           PERFORM OPEN-LOCK-FILES.
           MOVE SPACES TO LINK-EXTRA.

           MOVE "A" TO D-ADD-CHG.
002        MOVE LINK-CODE     TO D-MNT-COD.
002        MOVE LINK-MNT      TO D-S-CHR50A.
      *
           PERFORM LOAD-ASSET-DETAILS THRU LOAD-ASSET-END.
      *
      ************************************************
      **  Main Dialog system message handling loop  **
      ************************************************
      *
       MAIN-DS-LOOP.
      *
           PERFORM CALL-DS.
      *
           IF D-S-FR-MSG = "LOADLV"
                   PERFORM LOAD-ASSET-DETAILS THRU LOAD-ASSET-END.
      *
           IF D-S-FR-MSG = "READKEY" OR "READ"
               PERFORM READ-KEY.
      *
           IF D-S-FR-MSG = "INITIALIZE"
               PERFORM INIT-RECORD-AREA.
      *
           IF D-S-FR-MSG = "READNEXT"
               PERFORM NEXTBN.
      *
           IF D-S-FR-MSG = "READPREV"
               PERFORM PREVBN.
      *
           IF D-S-FR-MSG = "LastEntry"
               PERFORM LAST-ENTRY THRU LAST-ENTRY-END.
      *
           IF D-S-FR-MSG = "FirstEntry"
               PERFORM FIRST-ENTRY THRU FIRST-ENTRY-END.
      *
           IF D-S-FR-MSG = "ADDCHG"
               PERFORM ADD-UPD-ROUTINE.
      *
           IF D-S-FR-MSG = "GET-PER"
              PERFORM VALIDATE-DATE.
      *
           IF D-S-FR-MSG = "CHECK-PER"
              PERFORM VALIDATE-PERIOD.
      *
           IF D-S-FR-MSG = "VALIDATE"
              PERFORM VALIDATE-GRID THRU VG-EXIT.
      *
           IF D-S-FR-MSG = "BRW-IMPBAS"
               MOVE D-MNT-COD    TO LINK-BROWSE
               MOVE "IMPBAS"      TO WW-PROG-NAME
               MOVE "B"           TO LINK-BRW-ENQ
               PERFORM CALL-PROGRAM
               MOVE LINK-BRW-RET  TO D-S-TO-PAR
               IF D-S-TO-PAR <> SPACES
                  MOVE D-S-TO-PAR TO D-MNT-COD
               END-IF
               MOVE SPACES        TO LINK-EXTRA.
      *
           GO TO MAIN-DS-LOOP.
      *
       OPEN-LOCK-FILES.
           PERFORM ASSMST-BUILD-AND-OPEN-INPUT.
           PERFORM ASSCTL-BUILD-AND-OPEN-INPUT.
           MOVE "CTL" TO ASSCTL-KEY.
           PERFORM ASSCTL-READ.
           IF NOT STAT-LCK AND NOT STAT-OK
              ADD 1               TO XX4
              MOVE CTL-ERR-AS-00  TO CTL-ERR(XX4).
      *
              IF XX4 > ZERO
                 PERFORM CONTROL-ERROR
                 GO TO ENDJOB.
           PERFORM CHECK-DATES.
           MOVE "-ASS01" TO LINK-PASS-TYP.
           PERFORM GET-PASSWORD-INFO.
           IF LINK-PASS-OK = "Y"
               MOVE "Y" TO D-PASSW-NEEDED
           ELSE
               MOVE SPACES TO D-PASSW-NEEDED.
           PERFORM ASSDBV-BUILD-AND-OPEN-INPUT.
           PERFORM ASSDTX-BUILD-AND-OPEN-INPUT.
           PERFORM ASSDAL-BUILD-AND-OPEN-INPUT.
           PERFORM ASSDIS-BUILD-AND-OPEN-IO-COMER.
           PERFORM GENCTL-BUILD-AND-OPEN-INPUT.
013        PERFORM GENMST-BUILD-AND-OPEN-IO-COMER.
      *
           MOVE COMPID TO GENCTL-CMP.
           PERFORM GENCTL-READ.
           PERFORM COMER.
           IF ASSCTL-YEAR > GENCTL-YEAR
               MOVE 0 TO GENCTL-PER.
           IF ASSCTL-VAL-HED1 = SPACES
               MOVE "Alt valuation 1" TO ASSCTL-VAL-HED1.
           IF ASSCTL-VAL-HED2 = SPACES
               MOVE "Alt valuation 2" TO ASSCTL-VAL-HED2.
           IF ASSCTL-VAL-HED3 = SPACES
               MOVE "Alt valuation 3" TO ASSCTL-VAL-HED3.
           IF ASSCTL-VAL-HED4 = SPACES
               MOVE "Alt valuation 4" TO ASSCTL-VAL-HED4.
           IF ASSCTL-VAL-HED5 = SPACES
               MOVE "Alt valuation 5" TO ASSCTL-VAL-HED5.
           IF ASSCTL-VAL-HED6 = SPACES
               MOVE "Alt valuation 6" TO ASSCTL-VAL-HED6.
           IF ASSCTL-VAL-HED7 = SPACES
               MOVE "Alt valuation 7" TO ASSCTL-VAL-HED6.
           IF ASSCTL-VAL-HED8 = SPACES
               MOVE "Alt valuation 8" TO ASSCTL-VAL-HED8.
           IF ASSCTL-VAL-HED9 = SPACES
               MOVE "Alt valuation 9" TO ASSCTL-VAL-HED9.
           IF ASSCTL-VAL-HED10 = SPACES
               MOVE "Alt valuation 10" TO ASSCTL-VAL-HED10.
      *
       READ-KEY.
           PERFORM ASSMST-UNLOCK.
           PERFORM READ-KEY-1 THRU READ-KEY-END.
       READ-KEY-1.
70fix      IF IM0ASSKEY = "A"
              GO TO READ-KEY-2.
           PERFORM VALIDATE-NUMERIC.
           IF D-S-ERROR NOT = SPACES
               GO TO READ-KEY-END.
           MOVE D-MNT-COD TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM       TO NUMERIC-ASS.
           MOVE ALPHA-ASS TO D-MNT-COD.
       READ-KEY-2.
           MOVE 0 TO ASSMST-SLD.
           MOVE D-MNT-COD          TO ASSMST-COD.
           PERFORM ASSMST-READ.
           IF NOT STAT-OK
               MOVE 0 TO ASSMST-SLD
               MOVE ERRNOT TO WW-ERROR-NUM
               PERFORM LOOK-UP-ERROR
               GO TO READ-KEY-END.
           IF STAT-LCK
               MOVE ERRLOC TO WW-ERROR-NUM
               PERFORM LOOK-UP-ERROR
               GO TO READ-KEY-END.
           IF ASSMST-SLD > 0
               MOVE "SOLD" TO D-S-ERROR
               GO TO READ-KEY-END.
           IF ASSMST-QTY = 0
               MOVE "QTYERROR" TO D-S-ERROR
               GO TO READ-KEY-END.

           PERFORM INIT-RECORD-AREA.
      *
           MOVE SPACES TO D-S-CHR1B D-S-CHR1A.
           PERFORM SETUP-MNT-FROM-10 THRU SETUP-MNT-EXIT.
      *
       READ-KEY-END.
           EXIT.
      *
       VALIDATE-NUMERIC.
           IF D-MNT-COD = SPACES
              MOVE "0" TO NUMB-R
           ELSE
              PERFORM VARYING XX3 FROM 1 BY 1 UNTIL
70ok                              D-MNT-COD(XX3:1) NOT = SPACES
              END-PERFORM
70ok          MOVE D-MNT-COD(XX3:) TO NUMB-R.
      *
           PERFORM NUMB-CHECK.
           IF NUM-OK NOT = "Y"
              MOVE "Asset must be numeric." TO D-S-ERROR.
      *
       SETUP-MNT-FROM-10.
           MOVE "ASSPADLV"     TO xtpReportControl.
           MOVE 7              TO xtpNumberColumns.
           PERFORM CreateReportControl.
           MOVE D-MNT-COD      TO ASSDBV-COD ASSDTX-COD.
           PERFORM ASSDBV-READ.
           IF NOT STAT-OK
               GO TO ST-TAX.
           MOVE "Book value"   TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDBV-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDBV-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDBV-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDBV-TYTD FROM ASSDBV-CUR.
           MOVE ASSDBV-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-TAX.
           PERFORM ASSDTX-READ.
           IF NOT STAT-OK OR ASSCTL-TAX-BASIS = "L"
               GO TO ST-ALT1.
           MOVE "Tax"          TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDTX-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDTX-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDTX-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDTX-TYTD FROM ASSDTX-CUR.
           MOVE ASSDTX-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-TAX-BASIS NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT1.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 1              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(1) = "L"
               GO TO ST-ALT2.
           MOVE ASSCTL-VAL-HED1 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(1) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT2.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 2              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(2) = "L"
               GO TO ST-ALT3.
           MOVE ASSCTL-VAL-HED2 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(2) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT3.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 3              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(3) = "L"
               GO TO ST-ALT4.
           MOVE ASSCTL-VAL-HED3 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(3) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT4.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 4              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(4) = "L"
               GO TO ST-ALT5.
           MOVE ASSCTL-VAL-HED4 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(4) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT5.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 5              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(5) = "L"
               GO TO ST-ALT6.
           MOVE ASSCTL-VAL-HED5 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(5) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT6.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 6              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(6) = "L"
               GO TO ST-ALT7.
           MOVE ASSCTL-VAL-HED6 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(6) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT7.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 7              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(7) = "L"
               GO TO ST-ALT8.
           MOVE ASSCTL-VAL-HED7 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(7) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT8.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 8              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(8) = "L"
               GO TO ST-ALT9.
           MOVE ASSCTL-VAL-HED8 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(8) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT9.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 9              TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(9) = "L"
               GO TO ST-ALT10.
           MOVE ASSCTL-VAL-HED9 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(9) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       ST-ALT10.
           INITIALIZE ASSDAL-REC.
           MOVE D-MNT-COD      TO ASSDAL-COD.
           MOVE 10             TO ASSDAL-ALT-COD.
           PERFORM ASSDAL-READ.
           IF NOT STAT-OK OR ASSCTL-ALT-BASIS(10) = "L"
               GO TO SETUP-MNT-EXIT.
           MOVE ASSCTL-VAL-HED10 TO CELLVALUE(1).
014        MOVE "0.00"         TO CELLVALUE(2) CELLVALUE(3).
           MOVE ASSDAL-CAS     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(4).
           MOVE ASSDAL-TYTD    TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(5).
           MOVE ASSDAL-PRN     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(6).
           SUBTRACT ASSDAL-TYTD FROM ASSDAL-CUR.
           MOVE ASSDAL-CUR     TO EDITB-12-2B.
           MOVE EDITB-12-2B    TO CELLVALUE(7).
           MOVE 1              TO CELLEDITABLE(2) CELLEDITABLE(3).
           IF ASSCTL-ALT-BASIS(10) NOT = "P"
               MOVE 0 TO CELLEDITABLE(2).
           MOVE SPACES TO RECORDINSERTPOINT-ALPHA.
           PERFORM InsertReportRow.
       SETUP-MNT-EXIT.
           PERFORM FinishReportControl.
       SETUP-MNT-END.
           EXIT.
      *
       INIT-RECORD-AREA.
           MOVE ASSCTL-CDATE(ASSCTL-MONTH) TO D-MNT-DATE.
           MOVE ASSCTL-MONTH TO D-MNT-PER.
           MOVE ASSCTL-YEAR  TO D-MNT-YEAR.
      *    PERFORM GET-PERIOD.
           MOVE SPACES TO D-COMMENT.
           PERFORM CloseReportControl.
           PERFORM DeleteReportControl.
           PERFORM LOAD-ASSET-DETAILS THRU LOAD-ASSET-END.
      *
      **********************************************************
      *  Routine to read for next Asset Codes record          **
      **********************************************************
       NEXTBN.
           PERFORM NEXTBN-1 THRU NEXTBN-END.
       NEXTBN-1.
           MOVE SPACES       TO ASSMST-KEY.
           MOVE 0            TO D-REACHED-EOF D-COPY-FLG.
           MOVE D-MNT-COD    TO ASSMST-COD.
           PERFORM ASSMST-START-GT.
           IF STAT-INVALID-KEY
              GO TO NEXTBN-3.
       NEXTBN-2.
           PERFORM ASSMST-READ-NEXT.
           IF STAT-AT-END
               GO TO NEXTBN-3.
           PERFORM COMER.

           MOVE ASSMST-COD   TO D-MNT-COD.
           GO TO NEXTBN-END.
      *
       NEXTBN-3.
           MOVE "end"        TO D-S-ERROR.
           move 1      to d-reached-eof.
           move spaces to d-first-entry.
           move "Y"    to d-last-entry.
       NEXTBN-END.
      *
      **********************************************************
      ** Routine to read for previous Asset codes record      **
      **********************************************************
       PREVBN.
           PERFORM PREVBN-1 THRU PREVBN-END.
       PREVBN-1.
           MOVE SPACES      TO ASSMST-KEY.
           MOVE 0           TO D-REACHED-EOF D-COPY-FLG.
           MOVE D-MNT-COD   TO ASSMST-COD.
           PERFORM ASSMST-START-LT.
           IF STAT-INVALID-KEY
              GO TO PREVBN-3.
      *
       PREVBN-2.
           PERFORM ASSMST-READ-PREV.
           IF STAT-AT-END
             GO TO PREVBN-3.
           IF ASSMST-COD = SPACES
               GO TO PREVBN-3.
      *
           MOVE ASSMST-COD   TO D-MNT-COD.
           GO TO PREVBN-END.
      *
       PREVBN-3.
           MOVE "end"        TO D-S-ERROR.
           move 1      to d-reached-eof.
           move spaces to d-last-entry.
           move "Y"    to d-first-entry.
       PREVBN-END.
      *
       first-entry.
           move spaces to assmst-key d-last-entry d-copy-flg.
           move "Y" to d-first-entry.
           perform assmst-start-gt.
           if stat-invalid-key
               move 1 to d-reached-eof
               go to first-entry-end..
           perform assmst-read-next.
           if stat-at-end
               move 1 to d-reached-eof
               go to first-entry-end.
           perform comer.
           move assmst-cod to d-mnt-cod.
       first-entry-end.

       last-entry.
           move spaces to d-first-entry d-copy-flg.
           move "Y" to d-last-entry.
           move high-values to assmst-key.
           perform assmst-start-lt.
           if stat-invalid-key
               move 1 to d-reached-eof
               go to last-entry-end..
           perform assmst-read-prev.
           if stat-at-end
               move 1 to d-reached-eof
               go to last-entry-end.
           perform comer.
           move assmst-cod to d-mnt-cod.
       last-entry-end.
      *
      ********************************************************
      **  Routine to Add/update an item                     **
      ********************************************************
      *
       ADD-UPD-ROUTINE.
           PERFORM COMPAR-INITIALIZE-OBJECTS.
           PERFORM COMPAR-INITIALIZE.
           SET COMPST-XMLOUT TO NULL.
           PERFORM ADD-1 THRU ADD-END.
       ADD-1.
           PERFORM SETUP-XML-PARAMETER.
           PERFORM SETUP-XML-IN.

005        PERFORM ESIGNATURES-PRIOR-ADJ.
005        IF D-S-ERROR = "esig-err"
005            GO TO ADD-END.
      *
      **   Build up the linkage and call the business object
           MOVE SPACES   TO LINK-EXTRA.
           MOVE "ASSTAD" TO WW-PROG-NAME.
           PERFORM CALL-BO-POST.
      *
      **  Check for any exceptions - error message is in LINK-EXTRA
      **  We will use a simple Message box for the exception message
           IF LINK-COM-RETURN <> ZEROS
               MOVE LINK-COM-RETURN TO EDIT-EXCEPTION-NUM
               MOVE SPACES TO LINK-MSG-HDG
               STRING "Exception Raised Dep Books (" DELIMITED BY SIZE
                      EDIT-EXCEPTION       DELIMITED BY SIZE
                      ")"                  DELIMITED BY SIZE
                  INTO LINK-MSG-HDG
               PERFORM INVOKE-MESSAGE-BOX
               MOVE "{Exception}" TO D-MNT-DES
               MOVE ZEROS  TO LINK-COM-RETURN
               MOVE SPACES TO LINK-EXTRA
               GO TO ADD-END.
      *
      **  Parse the XML - if invalid then goes to endjob with exception
      **  If valid this returns the number of nodes
           SET COMPAR-OBJECT TO COMPST-XMLOUT.
           MOVE "N" TO COMPAR-TO-ENDJOB.
           PERFORM COMPAR-PARSE-XML.
           MOVE "Y" TO COMPAR-TO-ENDJOB.
           IF LINK-COM-RETURN <> ZERO
               MOVE "XML Parsing Message" TO LINK-MSG-HDG
               PERFORM INVOKE-MESSAGE-BOX
               MOVE "{Xml Parse Error}" TO D-MNT-DES
               MOVE ZEROS  TO LINK-COM-RETURN
               MOVE SPACES TO LINK-EXTRA
               GO TO ADD-END.

      **  Select the single node 'ErrorDescription'
           MOVE "errordescription" TO COMPAR-QUERY.
           PERFORM COMPAR-SELECT-SINGLE-NODE.
      *
           IF  COMPAR-SINGLE-VALUE <> HIGH-VALUES
               MOVE SPACES TO LINK-MSG-HDG
               STRING "ErrorDescription Returned" DELIMITED BY SIZE
                  INTO LINK-MSG-HDG
               MOVE LINK-MSG-HDG        TO D-S-ERROR
               MOVE COMPAR-SINGLE-VALUE TO LINK-EXTRA
               PERFORM INVOKE-MESSAGE-BOX
               MOVE ZEROS  TO LINK-COM-RETURN
               MOVE SPACES TO LINK-EXTRA
               PERFORM FIND-ERR-NUM
               PERFORM DeleteReportControl
               GO TO ADD-END.
      *
013   * Registernumber generated... select the single node '
013   * registernumber'and store it
013        move "registernumber"     to compar-query.
013        perform compar-select-single-node.
013        move compar-single-value to dimregisterNo.
013        move dimregisterNo          to sav-assdis-reg.
013   *
013   *>  GL Dimension analysis
013        if im2-ass-dana = "E"
013           if dimregNo > 0
013              perform dimension-analysis
013           end-if
013        end-if.
      *
           PERFORM CREATE-LEDGER-ENTRY.
           PERFORM ESIGNATURES-COMPLETE.
       ADD-END.
      *
       FIND-ERR-NUM.
           MOVE "errornumber" TO COMPAR-QUERY.
           PERFORM COMPAR-SELECT-SINGLE-NODE.
           MOVE COMPAR-SINGLE-VALUE TO D-ERR-NUM.
      *
       SETUP-XML-PARAMETER.
      **  First create the root element - adds standard XML prolog
      **  This creates an object called 'ARRAY-OBJECT'
           MOVE "PostAssetAdjustment" TO XML-ROOT-NAME.
           PERFORM CREATE-XML-HEADER.

           MOVE "<Parameters>" TO ARRAY-DATA.
           MOVE ZEROS TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.

           MOVE "ActionType" TO XML-TAG-NAME.
           MOVE D-ADD-CHG TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "IgnoreWarnings" TO XML-TAG-NAME.
           MOVE "Y" TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "ValidateOnly" TO XML-TAG-NAME.
           MOVE D-VALIDATE-BO  TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "ApplyIfEntireDocumentValid" TO XML-TAG-NAME.
           MOVE "Y" TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "</Parameters>" TO ARRAY-DATA.
           MOVE ZEROS TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.

           MOVE "</PostAssetAdjustment>" TO ARRAY-DATA.
           MOVE ZEROS TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
      **  Store XmlParameter string in COMMN2-PARAMETERS
           PERFORM ARRAY-FINAL-CREATE.
           SET COMPST-PARAMETERS TO ARRAY-OBJECT.
           SET ARRAY-OBJECT      TO NULL.
      *
      *
      ****************************************************************
      **  Routine to setup Depreciation XmlIn string                **
      **  Values taken from the data block                          **
      **  Output : COMMN2-XMLIN      Object containing XmlIn        **
      ****************************************************************
       SETUP-XML-IN.
           PERFORM SETUP-XMLIN-1 THRU SETUP-XMLIN-END.
       SETUP-XMLIN-1.
      *
      **  First create the root element - adds standard XML prolog
      **  This creates an object called 'ARRAY-OBJECT'
           MOVE "PostAssetAdjustment" TO XML-ROOT-NAME.
           PERFORM CREATE-XML-HEADER.

           MOVE "<Item>"     TO ARRAY-DATA.
           MOVE ZEROS        TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.

           MOVE "Asset"      TO XML-TAG-NAME.
           MOVE D-MNT-COD    TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "AdjustmentDate" TO XML-TAG-NAME.
           MOVE D-MNT-DATE TO EDITED-DATE.
           MOVE EDITED-DATE TO ARRAY-EDITED-DATE.
           MOVE ARRAY-EDITED-DATE TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "AdjustmentPeriod" TO XML-TAG-NAME.
           MOVE D-MNT-PER TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "AdjustmentComment" TO XML-TAG-NAME.
           MOVE D-COMMENT TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "ASSPADLV"    TO xtpReportControl.
           MOVE 7             TO xtpNumberColumns.
           PERFORM CloseReportControl.
           PERFORM RetrieveReportControl.
       XMLIN-1.
           PERFORM RetrieveNextReportRecord.
           IF NOT xtpAtOK
               GO TO SETUP-XMLIN-CONTINUE.

           MOVE "BvAdjustmentThisYear"   TO XML-TAG-NAME.
           MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL.
           PERFORM EDIT-NO-LEADING-SPACES-2.
           MOVE NUMB-R          To XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.

           MOVE "BvAdjustmentAccumDepn"   TO XML-TAG-NAME.
           MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL.
           PERFORM EDIT-NO-LEADING-SPACES-2.
           MOVE NUMB-R          To XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           PERFORM RetrieveNextReportRecord.
           IF NOT xtpAtOK
               GO TO SETUP-XMLIN-CONTINUE.

           IF ASSCTL-TAX-BASIS = "P"
               MOVE "TaxAdjustmentThisYear"   TO XML-TAG-NAME
               MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
               PERFORM EDIT-NO-LEADING-SPACES-2
               MOVE NUMB-R          To XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.

           IF ASSCTL-TAX-BASIS = "P" OR "Y"
               MOVE "TaxAdjustmentAccumDepn"   TO XML-TAG-NAME
               MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
               PERFORM EDIT-NO-LEADING-SPACES-2
               MOVE NUMB-R          To XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
       XMLIN-2.
           PERFORM RetrieveNextReportRecord.
           IF NOT xtpAtOK
               GO TO SETUP-XMLIN-CONTINUE.

           IF CELLVALUE(1) = ASSCTL-VAL-HED1
               IF ASSCTL-ALT-BASIS(1) = "P"
                   MOVE "Alt1AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(1) = "P" OR "Y"
                   MOVE "Alt1AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED2
               IF ASSCTL-ALT-BASIS(2) = "P"
                   MOVE "Alt2AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(2) = "P" OR "Y"
                   MOVE "Alt2AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED3
               IF ASSCTL-ALT-BASIS(3) = "P"
                   MOVE "Alt3AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(3) = "P" OR "Y"
                   MOVE "Alt3AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED4
               IF ASSCTL-ALT-BASIS(4) = "P"
                   MOVE "Alt4AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(4) = "P" OR "Y"
                   MOVE "Alt4AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED5
               IF ASSCTL-ALT-BASIS(5) = "P"
                   MOVE "Alt5AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(5) = "P" OR "Y"
                   MOVE "Alt5AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED6
               IF ASSCTL-ALT-BASIS(6) = "P"
                   MOVE "Alt6AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(6) = "P" OR "Y"
                   MOVE "Alt6AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED7
               IF ASSCTL-ALT-BASIS(7) = "P"
                   MOVE "Alt7AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(7) = "P" OR "Y"
                   MOVE "Alt7AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED8
               IF ASSCTL-ALT-BASIS(8) = "P"
                   MOVE "Alt8AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(8) = "P" OR "Y"
                   MOVE "Alt8AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED9
               IF ASSCTL-ALT-BASIS(9) = "P"
                   MOVE "Alt9AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(9) = "P" OR "Y"
                   MOVE "Alt9AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.
      *
           IF CELLVALUE(1) = ASSCTL-VAL-HED10
               IF ASSCTL-ALT-BASIS(10) = "P"
                   MOVE "Alt10AdjustmentThisYear"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(2)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT
               END-IF
               IF ASSCTL-ALT-BASIS(10) = "P" OR "Y"
                   MOVE "Alt10AdjustmentAccumDepn"   TO XML-TAG-NAME
                   MOVE FUNCTION NUMVAL (CELLVALUE(3)) TO NUM-VAL
                   PERFORM EDIT-NO-LEADING-SPACES-2
                   MOVE NUMB-R          To XML-TAG-VALUE
                   PERFORM OUTPUT-ELEMENT.

               GO TO XMLIN-2.
      *
         SETUP-XMLIN-CONTINUE.
           MOVE "</Item>" TO ARRAY-DATA.
           MOVE ZEROS TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.

           MOVE "</PostAssetAdjustment>" TO ARRAY-DATA.
           MOVE ZEROS TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
      **  Store XmlIn string in COMMN2-XMLIN
           PERFORM ARRAY-FINAL-CREATE.
           Set COMPST-XMLIN        To ARRAY-OBJECT.


       SETUP-XMLIN-END.
      *
rtgl   CREATE-LEDGER-ENTRY.
rtgl       PERFORM CREATE-LEDGER-ENTRY-START THRU
rtgl               CREATE-LEDGER-ENTRY-END.
rtgl  *
rtgl   CREATE-LEDGER-ENTRY-START.
rtgl       IF  IM36LINT = "R"
rtgl           GO TO CREATE-LEDGER-ENTRY-END.
rtgl  *
rtgl       IF  IM2-ASS-CGL NOT = "Y"
rtgl           GO TO CREATE-LEDGER-ENTRY-END.
rtgl  *
rtgl       IF COMPAR-WS-READ >= COMPAR-NODE-COUNT
rtgl           GO TO CREATE-LEDGER-ENTRY-NEXT.
rtgl  *
rtgl  **  Retrieve next XML element name and value
rtgl  **  See COMPAR-TAG-x for names and values
rtgl       PERFORM COMPAR-GET-NEXT.
rtgl  *
rtgl  **  Continue looping if find an open node (no value)
rtgl       IF COMPAR-NEW-NODE = "Y" OR COMPAR-END-NODE = "Y"
rtgl           GO TO CREATE-LEDGER-ENTRY-START.
rtgl
rtgl       IF COMPAR-TAG-3 = "RegisterNumber"
rtgl           MOVE FUNCTION NUMVAL (COMPAR-TAG-4)  TO SAV-ASSDIS-REG.
rtgl       GO TO CREATE-LEDGER-ENTRY-START.
rtgl  *
rtgl   CREATE-LEDGER-ENTRY-NEXT.
rtgl       IF   SAV-ASSDIS-KEY NOT > SPACES
rtgl            GO TO CREATE-LEDGER-ENTRY-END.
      *
rtgl       MOVE SPACES             TO ASI-KEY.
rtgl       MOVE D-MNT-YEAR         TO ASI-YEAR.
rtgl       MOVE D-MNT-PER          TO ASI-MONTH.
rtgl       MOVE SAV-ASSDIS-REG     TO ASI-REG.
rtgl       MOVE ASI-KEY            TO LINK-EXTRA.
rtgl       MOVE "ASSPGI"           TO WW-PROG-NAME.
rtgl       PERFORM CALL-PROGRAM.
rtgl   CREATE-LEDGER-ENTRY-END.
      *
      *****************************************
      **  Populate Asset information         **
      *****************************************
       LOAD-ASSET-DETAILS.
       LOAD-L1.
           INITIALIZE IMPFRO-LINK.
           MOVE 0                    TO IMPFRO-COUNT.

           ADD 1 TO IMPFRO-COUNT.
           MOVE "Adjustment information" TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE "H"                  TO IMPFRO-AND(IMPFRO-COUNT).
      *
           ADD 1                     TO IMPFRO-COUNT.
           MOVE "Asset code"         TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-MNT-COD            TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE "G"                  TO IMPFRO-GRP(IMPFRO-COUNT).
           MOVE 1                    TO IMPFRO-EDIT(IMPFRO-COUNT).
      *
           ADD 1                     TO IMPFRO-COUNT.
           MOVE "Description"        TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE ASSMST-DES           TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE "G"                  TO IMPFRO-GRP(IMPFRO-COUNT).
           MOVE 1                    TO IMPFRO-EDIT(IMPFRO-COUNT).
      *
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Asset quantity"     TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE ASSMST-QTY           TO IMPFRO-NUM(IMPFRO-COUNT).
           MOVE "N"                  TO IMPFRO-AND(IMPFRO-COUNT).
70ok       MOVE 5                    TO IMPFRO-DEC(IMPFRO-COUNT).
           MOVE "G"                  TO IMPFRO-GRP(IMPFRO-COUNT).
           MOVE 1                    TO IMPFRO-EDIT(IMPFRO-COUNT).
      *
           ADD 1                     TO IMPFRO-COUNT.
           MOVE "Adjustment date"    TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE "D"                  TO IMPFRO-AND(IMPFRO-COUNT).
           MOVE D-MNT-DATE           TO IMPFRO-DAT(IMPFRO-COUNT).
           MOVE IMPFRO-ICON-DATE     TO IMPFRO-ICON(IMPFRO-COUNT).
           MOVE MNT-DATE             TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-MNT-DATE TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE "G"                  TO IMPFRO-GRP(IMPFRO-COUNT).
      *
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Adjustment period"  TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-MNT-PER            TO IMPFRO-NUM(ICX1).
           MOVE "N"                  TO IMPFRO-AND(IMPFRO-COUNT).
           MOVE LENGTH OF D-MNT-PER  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE MNT-PER              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE "G"                  TO IMPFRO-GRP(IMPFRO-COUNT).
      *    IF IM0GPR NOT = 13
      *        MOVE 1                TO IMPFRO-EDIT(IMPFRO-COUNT).
      *
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Adjustment year"    TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-MNT-YEAR           TO IMPFRO-NUM(ICX1).
           MOVE "N"                  TO IMPFRO-AND(IMPFRO-COUNT).
           MOVE "N"                  TO IMPFRO-EDIT-WITH-COMMAS(ICX1).
           MOVE LENGTH OF D-MNT-YEAR TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE "G"                  TO IMPFRO-GRP(IMPFRO-COUNT).
           MOVE 1                    TO IMPFRO-EDIT(IMPFRO-COUNT).
      *
           ADD 1                     TO IMPFRO-COUNT.
           MOVE "Comment"            TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-COMMENT            TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE COM-MENT             TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-COMMENT  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE "G"                  TO IMPFRO-GRP(IMPFRO-COUNT).
      *
           MOVE "ASS"                TO IMPFRO-CUSTOM-FORM.
           MOVE ASSMST-COD           TO IMPFRO-CUSTOM-KEY.
      *
           MOVE "ASSPADL1"           TO IMPFRO-LISTVIEW.
           PERFORM SET-LISTVIEW-PROPERTIES.
       LOAD-ASSET-END.
           EXIT.
      *
      ******************************************************************
      **  Routine to be Verify whether the transaction will be        **
      **  allowed. Can be used to disable/enable functions so that an **
      **  operator is disallowed from a function.                     **
      **  Output : STAT-OK     Function should be allowed             **
      ******************************************************************
       ESIGNATURES-VERIFY.
           MOVE SPACES TO SAV-ADJ-ACCESS-OK.
           PERFORM ESIGNATURES-VERIFY-1 THRU ESIGNATURES-VERIFY-EXIT.
       ESIGNATURES-VERIFY-1.
           MOVE "N" TO COMER-TO-ENDJOB.
           PERFORM TRN-INITIALISE.
           MOVE TRNID-ASS-ASS-ADJ TO TRN-ID
           PERFORM TRN-VERIFY
           IF STAT-CODE NOT = "00"
005            MOVE "eSignature Control" TO LINK-MSG-HDG
005            MOVE "S"                  TO LINK-MSG-ICON
005            MOVE W-MESSAGE            TO LINK-EXTRA
005            PERFORM INVOKE-MESSAGE-BOX
005            MOVE SPACES TO LINK-EXTRA
005            GO TO ENDJOB.
      *
           MOVE "E" TO COMER-TO-ENDJOB.
       ESIGNATURES-VERIFY-EXIT.
           EXIT.
      *
      *************************************************************
      **  Prior to the transaction Adjustment                    **
      *************************************************************
       ESIGNATURES-PRIOR-ADJ.
           MOVE "00" TO STAT-CODE.
           PERFORM ESIGNATURES-PRIOR-ADJ-1
                THRU ESIGNATURES-PRIOR-ADJ-EXIT.
       ESIGNATURES-PRIOR-ADJ-1.
           MOVE "N" TO COMER-TO-ENDJOB.
           PERFORM TRN-INITIALISE.
      *
      *   Pass the transaction id as defined in IMPTRN.WRK
           MOVE TRNID-ASS-ASS-ADJ   TO TRN-ID.
           PERFORM ESIGNATURES-PRIOR.
       ESIGNATURES-PRIOR-ADJ-EXIT.
           EXIT.
      *************************************************************
      **  Prior to the transaction the parameters available must **
      **  be passed to the Electronic Signature function         **
      *************************************************************
       ESIGNATURES-PRIOR.
      **  Pass variables defined for this transaction
           MOVE D-MNT-COD                  TO TRN-PAR-ALP(1).
           MOVE ASSMST-DES                 TO TRN-PAR-ALP(2).
           MOVE D-MNT-DATE                 TO TRN-PAR-DAT(3).
           MOVE D-MNT-PER                  TO TRN-PAR-NUM(4).
           MOVE D-MNT-YEAR                 TO TRN-PAR-NUM(5).
           MOVE D-COMMENT                  TO TRN-PAR-ALP(6).
           IF ADJ-TYTD(1) NOT = ZERO
             MOVE ADJ-TYTD(1) TO TRN-PAR-NUM(7).
           IF ADJ-PRN(1) NOT = ZERO
             MOVE ADJ-PRN(1) TO TRN-PAR-NUM(19).
           IF ADJ-TYTD(2) NOT = ZERO
             MOVE ADJ-TYTD(2) TO TRN-PAR-NUM(8).
           IF ADJ-PRN(2) NOT = ZERO
             MOVE ADJ-PRN(2) TO TRN-PAR-NUM(20).
           PERFORM VARYING XX1 FROM 1 BY 1 UNTIL XX1 > 10
             ADD 2 XX1 GIVING XX2
             MOVE D-MNT-COD TO ASSDAL-COD
             MOVE XX1       TO ASSDAL-ALT-COD
             PERFORM ASSDAL-READ
             IF STAT-OK
                   MOVE  ADJ-TYTD(XX2) TO TRN-PAR-NUM(8 + XX1)
                   MOVE ADJ-PRN(XX2) TO TRN-PAR-NUM(20 + XX1)
             END-IF
             END-PERFORM.
      *
           PERFORM TRN-PRIOR.
           IF STAT-OK
               MOVE TRN-RET-LOG-KEY TO TRN-SAV-LOG-KEY(1)
           ELSE
005            MOVE "eSignature Control" TO LINK-MSG-HDG
005            MOVE "S"                  TO LINK-MSG-ICON
005            MOVE W-MESSAGE2           TO LINK-EXTRA
005            PERFORM INVOKE-MESSAGE-BOX
005            MOVE SPACES TO LINK-EXTRA
009            MOVE "esig-err" TO D-S-ERROR.
      *
           MOVE "E" TO COMER-TO-ENDJOB.
      *
      **********************************************************
      **  Now inform the Electronic Signature system that the **
      **  transaction has completed                           **
      **********************************************************
005    ESIGNATURES-COMPLETE.
005        PERFORM ESIGNATURES-COMPLETE-1
005                THRU ESIGNATURES-COMPLETE-EXIT.
005    ESIGNATURES-COMPLETE-1.
005        MOVE "N" TO COMER-TO-ENDJOB.
005        MOVE TRN-SAV-LOG-KEY(1)  TO TRN-ORIG-LOG-KEY.
005        PERFORM TRN-COMPLETE.
005        PERFORM COMER.
005   *
005        MOVE "E" TO COMER-TO-ENDJOB.
005    ESIGNATURES-COMPLETE-EXIT.
005        EXIT.
      *
       VALIDATE-GRID.
           INITIALIZE ADJ-VALUES.
005        MOVE SPACES TO D-S-ERROR W-FOUND.
           MOVE "ASSPADLV"    TO xtpReportControl.
           MOVE 7             TO xtpNumberColumns.
           PERFORM CloseReportControl.
           PERFORM RetrieveReportControl.
       VG-1.
           PERFORM RetrieveNextReportRecord.
           IF NOT xtpAtOK
               GO TO VG-END.
005        IF CELLVALUE(1) = "Book value"
005          MOVE FUNCTION NUMVAL (CELLVALUE(2))  TO ADJ-TYTD(1)
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(1).
005   *
005        IF CELLVALUE(1) = "Tax"
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(2)
005          IF ASSCTL-TAX-BASIS = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(2).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED1
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(3)
005          IF ASSCTL-ALT-BASIS(1) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(3).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED2
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(4)
005          IF ASSCTL-ALT-BASIS(2) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(4).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED3
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(5)
005          IF ASSCTL-ALT-BASIS(3) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(5).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED4
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(6)
005          IF ASSCTL-ALT-BASIS(4) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(6).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED5
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(7)
005          IF ASSCTL-ALT-BASIS(5) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(7).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED6
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(8)
005          IF ASSCTL-ALT-BASIS(6) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(8).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED7
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(9)
005          IF ASSCTL-ALT-BASIS(7) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(9).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED8
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(10)
005          IF ASSCTL-ALT-BASIS(8) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(10).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED9
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(11)
005          IF ASSCTL-ALT-BASIS(9) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(11).
005   *
005        IF CELLVALUE(1) = ASSCTL-VAL-HED10
005          MOVE FUNCTION NUMVAL (CELLVALUE(3))  TO ADJ-PRN(12)
005          IF ASSCTL-ALT-BASIS(10) = "P"
005            MOVE FUNCTION NUMVAL (CELLVALUE(2))TO ADJ-TYTD(12).
005   *
005        MOVE FUNCTION NUMVAL (CELLVALUE(2))    TO NUM-VAL.
005        IF NUM-VAL NOT = 0
005            MOVE "Y" TO W-FOUND.
005        MOVE FUNCTION NUMVAL (CELLVALUE(3))    TO NUM-VAL.
005        IF NUM-VAL NOT = 0
005            MOVE "Y" TO W-FOUND.
           GO TO VG-1.
       VG-END.
           IF W-FOUND = "Y"
               GO TO VG-EXIT.
           MOVE "Adjustment amounts may not be zeroes." TO D-S-ERROR.
           PERFORM DeleteReportControl.
       VG-EXIT.
           EXIT.

      *
       VALIDATE-DATE.
           MOVE SPACES TO D-S-ERROR.
           IF D-MNT-DATE = 0
               MOVE "Adjustment date must be greater than zero." TO
                   D-S-ERROR.
           IF D-MNT-DATE > ASSCTL-CDATE(ASSCTL-MONTH)
               MOVE "Adjustment date must be before period-end date."
                   TO D-S-ERROR.

           IF D-MNT-DATE > ASSCTL-CDATE(IM0GPR)
                   OR NOT > ASSCTL-PDATE(IM0GPR)
               MOVE "Adjustment date must be in current financial year."
                   TO D-S-ERROR.

      *    IF D-S-FR-MSG = "VAL-PUR"
      *        IF D-S-ERROR = SPACES
      *            PERFORM GET-PERIOD.

       VALIDATE-PERIOD.
           MOVE SPACES TO D-S-ERROR.
           IF D-MNT-PER = 0
               MOVE "Period must be greater than zero." TO D-S-ERROR
           ELSE
           IF D-MNT-PER > ASSCTL-MONTH
               MOVE "Period must not be greater than current period."
                   TO D-S-ERROR
           ELSE
           IF ASSCTL-CFLAG(D-MNT-PER) = "C"
               MOVE "Asset period is closed." TO D-S-ERROR.

      *******************************************************
      ** Calculate Purchase year/period from purchase date **
      ** if supplied                                       **
      *******************************************************
       GET-PERIOD.
           MOVE D-MNT-DATE TO AS-DDT-DATE.
           IF IM0GPR = 12
            PERFORM GET-PERIOD-1 THRU GET-PERIOD-EXIT.
       GET-PERIOD-1.
           INITIALIZE AS-CALC-PERIOD.
           IF AS-DDT-DATE = 0
               GO TO GET-PERIOD-EXIT.
           MOVE ASSCTL-YEAR            TO AS-CALC-YYYY.
           IF AS-DDT-DATE NOT > ASSCTL-PDATE(IM0GPR)
               GO TO CALC-DEPR-START-PUR.
      * If in future adjust year to get period
           PERFORM VARYING XX2 FROM 0 BY 1 UNTIL AS-DDT-DATE
               NOT > ASSCTL-CDATE(IM0GPR)
               SUBTRACT 1 FROM AS-DDT-YYYY.
      * If in current year get the month number
           PERFORM VARYING AS-CALC-MM FROM 1 BY 1 UNTIL
               AS-DDT-DATE NOT > ASSCTL-CDATE(AS-CALC-MM).
      * Add back any future years if calc'ed
           ADD XX2 TO AS-DDT-YYYY.
           ADD XX2 TO AS-CALC-YYYY.
           GO TO CALC-DEPR-MOVE-PUR.
       CALC-DEPR-START-PUR.
      * Using year-end as base calculate the purchase period
           SUBTRACT 1                  FROM AS-CALC-YYYY.
           MOVE AS-DDT-DATE        TO AS-FROM-DATE
           MOVE ASSCTL-PDATE(IM0GPR)   TO AS-TO-DATE.
           PERFORM ASSETS-MONTHS-CALC.
           IF AS-MONTHS NOT > 0
               MOVE 0                  TO AS-MONTHS.
      *
           PERFORM ASSETS-SUBTRACT-MONTHS UNTIL AS-MONTHS NOT > 12.
      * Calculate start period
           SUBTRACT AS-MONTHS FROM 12 GIVING AS-CALC-MM
           ADD 1                       TO AS-CALC-MM.
       CALC-DEPR-MOVE-PUR.
           MOVE AS-CALC-YYYY       TO D-MNT-YEAR.
           MOVE AS-CALC-MM         TO D-MNT-PER.
       GET-PERIOD-EXIT.
           EXIT.
      *
       ASSETS-MONTHS-CALC.
           COMPUTE AS-FROM-MONTHS  = (AS-FROM-CEN   * 1200) +
                                         (AS-FROM-YEAR  * 12  ) +
                                          AS-FROM-MONTH.
           COMPUTE AS-TO-MONTHS    = (AS-TO-CEN     * 1200) +
                                         (AS-TO-YEAR    * 12  ) +
                                          AS-TO-MONTH.
           SUBTRACT AS-FROM-MONTHS FROM AS-TO-MONTHS
                                       GIVING AS-MONTHS.
           ADD 1                       TO AS-MONTHS.
      *
       ASSETS-SUBTRACT-MONTHS.
           SUBTRACT 12                 FROM AS-MONTHS.
           SUBTRACT 1                  FROM AS-CALC-YYYY.
      *
      *
      *********************************************
      * Routine to check that ASSCTL has dates   **
      *********************************************
       CHECK-DATES.
           MOVE SPACES TO D-S-CHR1A.
           PERFORM VARYING XX1 FROM 1 BY 1
              UNTIL XX1 > ASSCTL-MONTH
                 IF ASSCTL-CDATE(XX1) NOT > 0
                       MOVE "E" TO D-S-CHR1A
                       MOVE COM-MSG-ASS-PER-TAB TO LINK-COM-MSG
                       MOVE "S" TO LINK-MSG-ICON
                       PERFORM COM-ERROR-MSG
                       PERFORM INVOKE-MESSAGE-BOX
                       GO TO ENDJOB.
      *
           PERFORM VARYING XX1 FROM 1 BY 1
              UNTIL XX1 > IM0GPR
                 IF ASSCTL-PDATE(XX1) NOT > 0
                       MOVE "E" TO D-S-CHR1A
                       MOVE COM-MSG-ASS-PER-TAB TO LINK-COM-MSG
                       MOVE "S" TO LINK-MSG-ICON
                       PERFORM COM-ERROR-MSG
                       PERFORM INVOKE-MESSAGE-BOX
                       GO TO ENDJOB.
      *
013   *>--------------------------------------------------------------
      **> Call Dimension Analysis Capture
      **> Input  : sav-asssdis-year Posting year
      **>        : sav-assdid-per   Posting period
      **>        : sav-assdis-reg   Register
      **>        : d-mnt-cod        Asset
      **>--------------------------------------------------------------
       Dimension-analysis.
           perform Dimension-analysis-001 thru Dimension-analysis-099.
       Dimension-analysis-001.
           perform gendtf-initialise.
           initialize gendan-fields.
           if sav-assdis-reg <> gendan-jnl
              move 0 to dimana-line
           end-if
      *
           initialize              gendan-entry-fields
           move "E"                to gendan-call-from
           move "ASS"              to gendan-sub-mod
           move "AS"               to gendan-source
           move "AS"               to gendan-prio-src
           move "REG"              to gendan-tcd
           move sav-assdis-reg     to gendan-jnl
           move d-mnt-year         to gendan-year
           move d-mnt-per          to gendan-period
           move "AAS"              to gendan-bus-process

           perform dim-ass-distribution
015        if dim-rows > 0 
015          perform cap-and-post-dimana
015        end-if
           if dim-dentry > 0
              perform update-ass-dis-reg
           end-if
           .
      *
       dimension-analysis-099.
          exit.

       dim-ass-distribution.
           perform dim-ass-dist-01 thru  dim-ass-dist-99.
013        perform gendtf-close .

       dim-ass-dist-01.
           perform sql-initialise.
      *
           move "a AssetDistReg" to sql-tab-nam(1).

           move "a.GlYear"       to sql-col-nam(1).
           move "N"              to sql-col-and(1).
           move "a.GlPeriod"     to sql-col-nam(2).
           move "N"              to sql-col-and(2).
           move "a.GlCode"       to sql-col-nam(3).
           move "a.Asset "       to sql-col-nam(4).
           move "a.DistRegNum"   to sql-col-nam(5).
           move "N"              to sql-col-and(5).
           move "a.Entry"        to sql-col-nam(6).
           move "N"              to sql-col-and(6).
           move "a.DistValue"    to sql-col-nam(7).
           move "N"              to sql-col-and(7).
           move "a.SystemDate"   to sql-col-nam(8).
           move "D"              to sql-col-and(8).
           move "a.SystemTime"   to sql-col-nam(9).
           move "N"              to sql-col-and(9).
           move "a.DistType"     to sql-col-nam(10).
      *  
           move spaces                to sql-con.
           move 1                     to sql-cx1.
      *
      * Year
           move "a.GlYear = %1 and"   to sql-con(sql-cx1:).
           perform sql-con-next.
      * Period
           move "a.GlPeriod = %2 and" to sql-con(sql-cx1:).
           perform sql-con-next.
      * Register
           move "a.DistRegNum = %3"   to sql-con(sql-cx1:).
           perform sql-con-end.

           move d-mnt-year        to sql-par-num(1).
           move "N"               to sql-par-and(1).
           move d-mnt-per         to sql-par-num(2).
           move "N"               to sql-par-and(2).
           move sav-assdis-reg    to sql-par-num(3).
           move "N"               to sql-par-and(3).
           move d-mnt-cod         to sql-par-alp(4).
           move "A"               to sql-par-and(4).
      *
           perform sql-build-command.
           perform comer.
      *
       dim-ass-dist-nxt.
           perform sql-fetch-row.
           if stat-at-end
             go to dim-ass-dist-99.
           perform comer.
      *
           if sql-col-num(1)<> d-mnt-year
               if sql-col-num(2)<> d-mnt-per
                  if sql-col-num(5)<> sav-assdis-reg
                    go dim-ass-dist-nxt
                  end-if
               end-if
            end-if

           add 1                   to dim-ent-cnt
           move sql-col-num(6)     to dim-sav-entno(dim-ent-cnt)
           
           add 1                   to dimana-line
           perform gl-dimension-analysis

           go to dim-ass-dist-nxt.
      *
       dim-ass-dist-99.
           perform sql-shutdown.
         exit.
       *>---------------------------------------------------------------
       *> Update AssetDistReg with a dimension entry number
       *> Input  : dim-dentry      Dimension entry number
       *> Output : sql-stat        zero - ok
       *>---------------------------------------------------------------
       update-ass-dis-reg.
           perform sql-initialise

           move spaces to sql-con
      *
           string
            "Update "                              delimited by size
            "AssetDistReg "                        delimited by size
            "set DimensionEntry = "                delimited by size
            dim-dentry                             delimited by size
            " from "                               delimited by size
            " GenDimensionDet a"                   delimited by size
            " left join "                          delimited by size
            " AssetDistReg b ON"                   delimited by size
            " a.GlYear = b.GlYear "                delimited by size
            " and a.GlPeriod = b.GlPeriod "        delimited by size
            " and a.Journal = b.DistRegNum "       delimited by size
            " and a.GlCode = b.GlCode "            delimited by size
            " Where "                              delimited by size
            "b.GlYear = "                          delimited by size
            d-mnt-year                             delimited by size
            " and b.GlPeriod = "                   delimited by size
            d-mnt-per                              delimited by size
            " and b.DistRegNum = "                 delimited by size
            sav-assdis-reg                         delimited by size
                                                   into sql-con
           end-string

           perform sql-execute-command
           perform comer

           perform sql-shutdown
           .
      *
       gl-dimension-analysis.
012        initialize gendan-line-details.
           perform check-control-acc
           if sql-col-alp(10) = "C"
              compute gendan-line-amt = sql-col-num(7) * -1
              move sql-col-alp(3) to gendan-line-ledger
           else
              move sql-col-num(7) to gendan-line-amt
              move sql-col-alp(3) to gendan-line-ledger
           end-if
           move d-mnt-cod         to gendan-line-asset
           move dimana-line       to gendan-line
           move sav-assdis-reg    to gendan-line-docno
           move assmst-cc         to gendan-line-cc
           move assmst-bra        to gendan-line-branch
      *
           move spaces            to gendan-line-src-key
           initialize  sav-assdim-key.
           move  d-mnt-cod        to sav-assdim-cod
           move  d-mnt-year       to sav-assdim-year
           move  d-mnt-per        to sav-assdim-month
           move  sql-col-dat(8)   to sav-assdim-date
           move  sql-col-num(9)   to sav-assdim-time
           move sav-assdim-key    to gendan-line-src-key
012        perform gendtf-write-file
           .
      *>----------------------------------------------------
      *  Read ledger code for control account    
      *>----------------------------------------------------
       check-control-acc.
           move spaces            to genmst-key
           move compid            to genmst-cmp
           move sql-col-alp(3)    to genmst-acc
           perform genmst-read.
           if stat-lck
           or stat-ok
               move genmst-ctl    to  gendan-line-ctrl-flg
           else
               move spaces to genmst-rec.
013   *
      *****************************
      **  End of job processing  **
      *****************************
       CANCELREQ.
       REGISTER-MESSAGES.
       HOF.
       ENDJOB.
           MOVE SPACES          TO LINK-EXTRA.
           PERFORM CLOSE-ALL-FILES.
012       if gendtf-data <> spaces
012          move gendtf-data to delete-file-name
012          perform delete-index-file
012       end-if.
           PERFORM QUIT-DS.
           EXIT PROGRAM.
      *
