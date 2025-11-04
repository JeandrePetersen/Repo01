      **************************************************************
      **                      SYSPRO                              **
      **  Copyright (c) 1994-2025 SYSPRO Ltd. All rights reserved.**
      **************************************************************
      **  Program name  : GENPJM                                  **
      **  Description   : GL Journal Entry                        **
      **  Run from menu : Yes                                     **
      **  Can be secured: Yes                                     **
      **  Owner         : Financial                               **
      **************************************************************
      *
      **  Date   Init   PDR Description
107a!!* 22/10/25 ara 134924 Custom forms saved incorrectly when Zero
      *                     lines
107!!!* 27/08/25 lch 133470 GL Post Previous Years (F3070)
106   * 26/06/25 ove 133692 Save button was not enabling after printing 
      *                     from excel (Dialog only).
105   * 02/04/25 lch 132493 After journal is authorised, if user saves
      *                     journal, it becomes unauthorised again
      *                     (UI only)
104   * 13/03/25 lch 132311 Authorising and posting multiple journals
      *                     without exiting, is not tagging dimensions
      *                     for subsequent journals
103   * 05/02/25 lch 131815 Posting multiple journals without exiting,
      *                     is not tagging dimensions for subsequent
      *                     journals
102   * 31/10/24 VN  130631 When copying an existing journal, PostDate 
      *                     in GenJournalCtl should not be populated
101   * 30/05/24 VN  128354 eSig for authorization not working correctly
100   * 21/05/24 EVL 127292 added accelerator keys to the toolbar 
      *                     buttons of GENPJMF2 and GENPJMF3 
099   * 05/03/24 VN  127235 GL Dimension Analysis (Project F3010)
098   * 05/03/24 AK  126806 GENP45 not populating when called after a 
      *                     save
097   * 25/01/24 VN  126684 Dimension analysis - call GENTDN for
      *                     AP/AR Contra
      *                     Do not tag tax and withholding tax lines  
096   * 15/01/24 AK  124683 Top line in GL Distribution listview being 
      *                     overwritten and GENP45 not populating  
      *                     existing Analysis data in WEB-UI.
095   * 03/10/23 EVL 125299 Do not call GENPDN when there are Dimension 
      *                     Entry number against the journal. (F3010)
      *                     Added a check for RTS on procedure 
      *                     gl-dimension-at-gl-level
095v  *                     Call GENTDN (not GENPDN) if AP jnl is from
      *                     auto vouchering, which is a batch process 
094   * 15/08/23 ZEC 124315 Changed year drop down when copying an 
      *                     existing journal to be a drop down entry.
      *                     Scamp errors and cosmetic fixes.
093   * 03/04/23 kgk 122079 Dimension analysis - Call GENTDN for 
      *                     Cash Book Currency Variance (F2000).
      *                     Cater for Acquisitions and Disposal done 
      *                     through the Asset Count system
092   * 13/03/23 AHY 121572 Inter-company journals not browsing on
      *                     correct company in Avanti (GENPJML1)
091   * 16/02/23 ARA 121668 Call GENTDN when posting Asset 
      *                     transactions that are in batches for
      *                     dimension analsyis.
090   * 10/01/23 VN  121205 When copying a journal with GL analysis
      *                     entries, these analysis entries are missing
      *                     details                                  
089   * 29/11/22 DAA 118219 Optimizing Avanti call when adding new row
088   * 15/11/22 AK  119199 Read disabled if you try to post an 
      *                     unauthorized journal. (UI only)
087   * 28/10/22 AHY 111423 Avanti clearing the journal number after
      *                     authorizing the journal(GUI)
086b  * 01/09/22 ZEC 119213 AR Intercompany Group Payments (F1930)
086a  * 23/07/22 kah 118639 AP Intercompany Group Payments (F1940)
      *                     Added new property CustomFormColumnCheck to
      *                     GENPJMLV for Phil
086   * 23/11/21 KGK 115648 Dimension analysis project (Project F1890).
085   * 20/09/21 RPM 113365 Correct the form context menu against 
      *                     GENPJMF5 to allow you to maintain Macros.
084   * 10/05/21 lch 111101 F1880: Insert next numbers functionality
084   * 19/04/21 lch 110641 F1880: Control Numbers
083   * 18/02/21 lch 108868 Posting incorrect amount when eSigs setup
082   * 04/01/21 ARA 108516 Unable to add custom fields on the grid
081   * 01/12/20 LUS 107803 Set focus on GL Journal to prevent enabling
      *                     of list view when double tabbing (GUI only).
080   * 29/10/20 ZEC 107252 GL Journal Lock message displayed even when 
      *                     journal not being maintained and also not
      *                     displayed when GL Journal is being 
      *                     maintained.
079   * 16/07/20 lch 105003 Cannot copy from an existing journal which 
      *                     is in a closed period
078   * 28/05/20 ZEC 103899 Reference & Comment columns not populating 
      *                     correctly(UI Only).         
077   * 15/07/19 RPM 98165 GL Analysis edit hyperlink being disabled
      *                    in the incorrect row when multiple entries
      *                    have been entered (GUI)
076   * 28/05/19 zkp 97441 Add new standard source code RE for Return
      *                    to Supplier
075   * 14/05/19 RPM 97140 When copying a GL Journal from an existing
      *                    journal the Journal date does not change
      *                    to the date entered (GUI only)
074   * 22/03/19 PAD 95139 GENPJM issues a BeginWebViewUpdate statement 
      *                    when validating the GL code, for Avanti.
073   * 03/10/18 ZEC 93689 Adding WebView callouts to improve process
      *                    performance in AVANTI(UI only).
      *                    Removed camel case for form captions
      *                    Changed how the reference and comment fields
      *                    are populated in the Grid when adding a new
      *                    line as was not always being populated in 
      *                    Avanti.
072   * 17/07/18 KAH 91193 Multi-currency changes (F1680)
071   * 30/05/18 ZEC 90451 Disabled the notes pane for posted journals.
      *                    New UI Conversion
      *                    Added webview callouts for AVANTI.
070   * 07/07/17 ZKR 83068 SYSPRO 8 Migration
      *                    - Removed read-company-paths. 
8.0   *----------------------------------------------------------
069   * 30/03/17 MKS 80751 Date not displayed in the Authorize
      *                    Journals pane.
068   * 30/01/17 VN  79697 When following a certain sequence of events,
      *                    the first line in the form was overwritten
      *                    with a zero value line (GUI only)
068a  * 31/01/17 MPR 79691 Time delay when deleting line before saving
      *                    journal
067   * 27/10/16 kim 77433 Blank journal year when back from browse
066   * 19/10/16 kim 78292 Disable journal after entry (Gui)
065   * 28/07/16 ARA 75288 Add custom forms to th grid.
064   * 12/04/16 kim 75286 AP Payment Reference project
063   * 01/03/16 kim 74929 Do not force analysis at time of entry
061b  * 05/11/15 KIM 72691 Give warning if provisional journal not
      *                    in current period
062   * 27/11/15 KIM 73317 Force import date to be CCYYMMDD
061a  * 05/11/15 KIM 72696 Do not allow copy STD provisional jnl for
      *                    previous period
061   * 30/10/15 ZKR 72473 Operator security activity - not handled
      *                    correctly when denying access to capture.
060a  * 20/10/15 ZKR 72522 Prevent posting of Journal after editing,
      *                    when Journal Authorization is on.
060   * 12/10/15 ZKR 72433 Ledger code column incorrectly validated
      *                    when selected for entry(GUI only).
059   * 30/09/15 ZKR 72288 Paste all rows function not populating
      *                    the LedgerCode Description column.
058   * 21/08/15 KIM 71603 Browse from existing journal not working.
      *                    Hidden keys in GENPJML2 translating
057   * 03/06/15 Kim 70806 Document rate to GL
056   * 17/06/15 ARA 70446 Print button on the menu enabled when GL
      *                    Normal journal print access is denied(056)
055   * 29/10/14 Kim 65669 When selecting a year set focus on period
      *                    GUI only
054   * 10/10/14 VN  64623 SQL optimization done in version 051 doesn't
      *                    have a SQL-SHUTDOWN, so if SQL data is
      *                    fetched more than once in the program, it
      *                    causes a 'Connection is busy with results for
      *                    another hstmt' error and rolls back
053   * 06/10/14 VN  65292 If user tabs off journal number without
      *                    entering anything, do not do the validation
      *                    (GUI change)
052   * 07/08/14 VN  63446 Nested transaction limit reached error given
      *                    when copying a standard journal
      *                    Ensured esignature logic was in correct place
051a  * 04/06/14 Kim 63057 SQL opt the loading of auth jnls
051   * 10/06/14 VN  62626 Do not allow toolbar to be floatable or
      *                    closeable (UI change only - GENPJMTB.XCB)
050   * 13/05/14 LCH 61638 Disable add/remove for posted journal
049   * 10/03/14 KAH 60354 Deny access to printing of the journals
      *                    if the operator is denied access
048   * 27/04/14 kim 59696 Allow to copy an existing journal from any yr
047   * 05/12/13 kim 58855 Grid not editable after posting jnl
047   * 03/12/13 kim 58877 Can create intercomp jnl to comp without access
046   * 19/11/13 KIM 58365 Enable grid when not in edit mode (Gui only).
046   * 29/10/13 KIM 58173 Intercompany tick not available (Gui only).
045D  * 03/10/13 ZTM 57677 Disable/Enable grid on Hold/Release Jnl - GUI
045C  * 25/09/13 KIM 48402 Browse on prev years jnls
045B  * 20/09/13 KIM 50782 Do not allow copy when no access to add (gui only)
045a  * 18/09/13 kim 56101 Filter on auth jnls that are loaded
045   * 17/09/13 kim 49554 Reload jnl after printing (gui only)
044   * 10/09/13 KIM 53518 Trap pasted rows
043A  * 06/09/13 KIM 57202 Copy standard jnl does not allow date
043   * 23/08/13 kim 56967 Not forcing analysis
042a  * 30/07/13 kim 49746 Enter invalid year - TB only.
042   * 29/07/13 kim 49464 Auth jnls window not refreshing
041   * 22/07/13 kim 56057 114 ERROR - GUI ONLY
040   * 08/03/13 kim 53817 Do not copy update flag when copying analysis
039c  * 07/11/12 kim 51962 Not not for the authorization screen to open
      *                    Gui only
039b  * 04/09/12 KIM 50901 Process type for sub module jnls
039a  * 14/08/12 kim 50188 E-sig add when copying jnls
039   * 29/06/12 KIM 46221 Conversion to SYSPRO 7.0
7.0   *---------------------------------------------------------
038   * 11/06/12 KIM 49019 Analaysis hyperlink not working - GUI
037   * 30/03/12 kim 45468 Click off cr amount causes error - GUI
036   * 26/03/12 KIM 45339 Incorrectly validates std journal period.
036   * 26/03/12 KIM 45338 Std Jnl drop down period indorrect - GUI
035   * 28/02/12 ADA 45045 Async running of report.
034   * 24/10/11 KIM 29973 Transaction date being cleared
033   * 07/10/11 kim 40924 Ledger code passed not displayed
032   * 14/09/11 KIM 40679 Add AfterSubmit and allow user to pass jnl no
032   * 14/09/11 KIM 40206 Put in the mouse wait when load & copy jnls
031   * 29/07/11 KIM 39700 After Copy and Paste line initialized (GUI)
030A  * 19/07/11 KIM 39014 Use resource locking to prevent jnl maintained
      *                    go be posted
030   * 18/07/11 kim 38644 Allow to post zero value sub module jnl
029a  * 05/06/11 kim 38583 Add triggers
029   * 05/06/11 kim 38774 Cannot print jnls for prev period
028   * 11/05/11 kim 37689 Allow view column on auth screen to translate
027   * 03/05/11 PAD 37047 Prevent OnSelectionChanged from firing when
      *                    blank row inserted (see REPORT05.WRK).
027   * 08/04/11 KIM 36745 Load jnl after created
027   * 08/04/11 KIM 36780 Reverse intercompany journals
026D  * 14/03/11 KIM 35776 Allow to copy submodule journal
026C  * 21/02/11 KIM 34577 Browse on prev year not finding jnl
026   * 14/02/11 PAD 33725 Fix find&replace toolbar with built-in
      *                    toolbar.
026a  * 04/02/11 LCH 34206 Include year selection from GENPB4
026   * 02/12/10 LCH 33080 Default journal no when auto posted from
      *                    GL Weighted Transfer (GUI only)
025a  * 03/11/10 kim 31385 Incorrect xml for SRS report
025   * 02/11/10 kim 31128 Allowed so save a new jnl when capture = N.
024   * 04/08/10 KIM 29391 Allow zoom on Authorize screen
023   * 23/06/10 kim 28543 Error when entering notes (Gui only)
023   * 31/05/10 kim 27703 Print submodule journals (023B).
023   * 18/05/10 kim 25894 Custom forms (023a)
023   * 10/05/10 kim 24756 GL analysis - ask me later
022   * 26/04/10 kim 27078 Post sub module jnls.
022   * 13/04/10 KIM 27054 Auth sub module jnl
021   * 15/04/09 KIM 26984 Cannot post to prev year
020   * 06/01/10 KIM 18413 Allow for 6.1 UI (020a) .
020   * 22/12/09 kim 21143 Allow for 30 character ref
019   * 16/11/09 KIM 22592 RTGL changes.
018   * 05/06/09 kim 19415 Reference copied to detail is too long .
018   * 29/05/09 kim 19414 Cannot tick intercompany
018   * 27/05/09 kim 19413 Add line fucntion
018   * 26/05/09 kim 19412 Notes as a tab page
017   * 23/04/09 KIM 17455 Analysis on entry < 1.00
017   * 05/05/09 kim 18926 Load default values if you click on detail
016   * 04/03/09 kim 16398 Calls up incorrect jnl
016   * 27/02/09 KIM 15989 Copy from existing copies post flag
016   * 25/02/09 KIM 15938 Copy notes when copy std journals
015   * 03/02/09 kim 15113 Invalid Jnl no caused blank type
014   * 09/12/08 kim 14519 G/L analysis copy incorrectly
014   * 09/12/08 kim 14661 Tab off ref - lost focus - gui only
013   * 12/11/08 kim 14233 Jnl ref when clicking on add line
013   * 12/11/08 KIM 13551 Jnl's on hold
013   * 12/11/08 kim 14182 Do not default ref with more then pic x(9).
012   * 15/10/08 KIM 13251 Default entry form ref on grid
011   * 19/09/08 kim 12981 Enter on entry form to go to detail
010   * 19/08/08 kim 12358 Journal not saving - Gui Only
009   * 31/08/08 kim 11934 Discard zero lines on save
008   * 10/06/08 KIM 11456 Asks passwords when IM50-GENPWR = "N"
007   * 03/06/08 kim 10333 Do not validate Revaluation transaction using
      *                    GENPGV
007   * 03/06/08 KIM 10413 Incorrect value passed to GENP45
007   * 03/06/08 KIM 10512 To be called from GENPRP
007   * 12/06/08 kim 10774 Batch total does not balance
006   * 22/05/08 PAD 10314 Implement structured G/L for a grid.
005   * 07/02/08 kim 95439 Disabled grid on entry
005   * 20/02/08 kim 97191 Do not allow copy prov jnl to prev period
005   * 21/02/08 KIM 97242 F9 does not browse on Jnl No
005   * 22/02/08 KIM 97400 Change menu and toolbar
004   * 18/12/07 KIM 93108 Auth oprion on print many journals
004   * 18/12/07 kim 94752 Copy from std jnl
003   * 02/08/07 kim 90684 Allow CTL+S for save
003   * 06/08/07 KIM 90322 When copying jnls allow to reverse entries
003   * 28/09/07 kim 92572 Printing unsaved journal
003   * 28/09/07 KIM 92231 Check GL files in use
002   * 05/06/07 kim 88837 sercurity issues
001   * 09/05/07 kim 88569 continue from event 85121
000   * 07/02/07 kim 85121 New G/L journal entry
      *
       FILE-CONTROL.
       COPY "ADMCTL.SEL".
       COPY "ADMOPR.SEL".
       COPY "ADMREP.SEL".
       COPY "ADMRPT.SEL".
       COPY "GENADC.SEL".
       COPY "GENADT.SEL".
084nk *COPY "GENCJN.SEL".
       COPY "GENCTL.SEL".
       COPY "GENEXC.SEL".
       COPY "GENHST.SEL".
       COPY "GENJNC.SEL".
       COPY "GENJND.SEL".
       COPY "GENMST.SEL".
107    copy "genpyr.sel".
       COPY "GENRJC.SEL".
       COPY "GENRJD.SEL".
       COPY "GENSTC.SEL".
       COPY "GENSTD.SEL".
       COPY "TBLCUR.SEL".
       COPY "TBLUSR.SEL".
047    COPY "ADMOPC.SEL".
086    copy "gendtf.sel".

      *
       COPY "CLASS.WRK".
         .
      *
       DATA DIVISION.
      *
       FILE SECTION.
      *
       FD ADMCTL.
8.0    COPY "ADMCTL.MAC".
      *
       FD ADMOPR.
8.0    COPY "ADMOPR.MAC".
      *
       FD ADMREP.
       COPY "ADMREP.MAS".
      *
       FD ADMRPT.
       COPY "ADMRPT.MAS".
      *
       FD GENADC.
       COPY "GENADC.MAC".
      *
       FD GENADT.
       COPY "GENADT.MAC".
      *
084nk *FD GENCJN.
084nk *COPY "GENCJN.MAC".
      *
       FD GENCTL.
       COPY "GENCTL.MAC".
      *
       FD GENEXC.
       COPY "GENEXC.MAC".
      *
       FD GENHST.
       COPY "GENHST.MAC".
      *
       FD GENJNC.
       COPY "GENJNC.MAC".
      *
       FD GENJND.
       COPY "GENJND.MAC".
      *
       FD GENMST.
       COPY "GENMST.MAC".
      *
107    fd genpyr.
107    copy "genpyr.mac".
      *
       FD GENRJC.
       COPY "GENRJC.MAC".
      *
       FD GENRJD.
       COPY "GENRJD.MAC".
      *
       FD GENSTC.
       COPY "GENSTC.MAC".
      *
       FD GENSTD.
       COPY "GENSTD.MAC".
      *
       FD TBLCUR.
       COPY "TBLCUR.MAC".
      *
       FD TBLUSR.
       COPY "TBLUSR.MAC".
      *
086    fd gendtf.
086    copy "gendtf.mat".
      *
047    FD ADMOPC.
8.0    COPY "ADMOPC.MAC".
      *
       WORKING-STORAGE SECTION.
       COPY "STANDARD.WRK".
      *
       78 ProgramId          VALUE "GENPJM".
      *
       01  WHAT-STRING       VALUE "@(#) Program version    .107".
           03  FILLER        PIC X(25).
           03  VERS          PIC 9(3).
       01  WHAT-DUMMY        PIC X(2) VALUE X"0D0A".
      *
      *
       COPY "GENPJM.CPB".     *> Dialog system data block copybook
       COPY "DSCTL.WRK".      *> Dialog system control block
       COPY "GENPST.LNK".
029A   COPY "IMPTRG.LNK".
071    COPY "STDTASK.WRK".
      *
       COPY "WWLINK.WRK".     *> Common IMPSTD copybook
       COPY "REPORT.WRK".
       COPY "GENANA.LNK".
       COPY "ANALYSIS.WRK".
       COPY "LNK.WRK".        *> Copy LINK copybook
       COPY "COMPAR.WRK".     *> XML Parser fields
       COPY "COMCRX.WRK".     *> Create XML fields
       COPY "IMPTRN.WRK".
       COPY "CACHE.WRK".      *>
051a   COPY "SQL.WRK".
065    COPY "IMPFRM.LNK".
084nk  copy "COMNXK.WRK".
086    copy "del.wrk".
086    copy "GLGENDAN.WRK". 
086    COPY "COMPA2.WRK".
086    copy "GLDIMANABO.WRK".
086    copy "gldim.lnk".
086b   COPY "IMPCHC.WRK".
      *
065    01 LNK2 PIC X(40000).  *> Size of IMPFRM-LINK
065    01 Redefines LNK2.
065       COPY "COMPS2.LNK".
       01  SETUP-LNK2 REDEFINES LNK2.
       COPY "COMMN2.LNK".
       01 LNK3 REDEFINES LNK2.
          02 IMPFRO-LINK.
          COPY "IMPFRO.LNK".
020a   01 SRSCTL-RECORD REDEFINES LNK2.
020a   COPY "SRSCTL.LNK".
086b   01 LNK2-IMPCHC REDEFINES LNK2.
086b   COPY "IMPCHC.LNK".
      *>---------------------------------------------------------------
020a  *
020a   01  PRINT-FLAG        PIC X.
       01  POST-PP-YYYY.
           03  POST-PP             PIC 9(2).
           03  POST-YYYY           PIC 9(4).
      *
70     01  EDIT-JNL                PIC Z(9)9.
       01  WS-FOUND                PIC X.
70     01  DETAIL-ENT              PIC 9(10).
      *
084   *      * Current GJ key (used for updating lowest unprocessed GJ key)
084   *      01  NEXT-GJ-KEY.
084   *          03 NEXT-GJ-YEAR         PIC 9(4).
084   *          03 NEXT-GJ-PER          PIC 99.
084   *          03 NEXT-GJ-JNL          PIC 9(10).
      *
       01  SAV-G00YEAR             PIC 9(4).
       01  SAV-G00PER              PIC 9(2).
      *
084nk  01  wsYear                  pic 9(4).
084nk  01  wsPeriod                pic 9(2).

       01  SQL-TRAN-TXT.
           03  FILLER              PIC X(14)   VALUE
               "GL Jnl entries".
           03  SQL-TRAN-TYP.
               05  SQL-TRN-ACT     PIC X(13).
70FIX          05  SQL-TRN-DOC     PIC X(10).
               05  SQL-TRN-LIT     PIC XX      VALUE
                   "/".
               05  SQL-TRN-LIN     PIC ZZZ9.
      *
084nk *       01  DUPLICATE-ERROR.
084nk *           03 ERROR-1              PIC X.
084nk *           03 ERROR-2              PIC X.
084nk *       01  COMP-ERROR REDEFINES DUPLICATE-ERROR PIC 9(4) COMP.
      *
       01 LINK-2.
           03 LINK-YEAR            PIC 9(4).
           03 LINK-PER             PIC 9(2).
      *
       01 RETURN-LINK.
70         03 RETURN-JNL           PIC 9(10).
           03 RETURN-PER           PIC 99.
026a       03 RETURN-YEAR          PIC 9(4).
      *
       01  EDIT-VALUE              PIC ------------9.99.
072    01  EDIT-RATE               PIC -----9.999999.
70FIX  01  EDIT-10-VAL             PIC ZZZZZZZZZ9.
70FIX  01  EDIT-5-VAL              PIC ZZZZZZZZZ9.
       01  EDITED-TRNVALUE         PIC ----,---,---,--9.99.
      *
       01  EDIT-EXCEPTION.
           03  EDIT-EXCEPTION-NUM  PIC 9(6).
      *
       01  WS-AMOUNT               PIC S9(12)V99.
072    01  WS-RATE                 PIC 9(6)V9(6).
      *
       01  MAX-PER                 PIC 9(2).
      *
       01  ESIG-TYPE               PIC X(20).
      *
       01  WS-JNL-FUNC             PIC X.
      *
       01  WS-CALC-VALUE           PIC S9(12)V99.
      *
       01  WS-ALPHA-VAL.
           03  WS-NUM-VAL          PIC S9(12)V99.
      *
       01  POST-PATH               PIC X(260).
      *                              Built path name of GENPST
      *                              posting program
      *
       01  GROUP-LSTPR.
           03  LSTPR               PIC 99 OCCURS 15 TIMES.
      *
071    01 LV-NAME                  PIC X(8).
071    01 LV-CAPTION               PIC X(40).
      *
071    01  PERIOD-STRING.
071      03  PERIOD-LET            PIC 99 VALUE ZEROS.
071      03  FILLER                PIC X VALUE ";".
071    01 PERIOD-DETAILS.
071       03 PERIOD-DET            PIC X(3) OCCURS 15.
      *
071    01  YEAR-STRING.
071      03  YEAR-LET              PIC 9(4) VALUE ZEROS.
071      03  FILLER                PIC X VALUE ";".
071    01 YEAR-DETAILS.
107       03 YEAR-DET              PIC X(5) OCCURS 7.
      *
107    01  postPrevYear            pic 9(4).
107    01  postPrev                pic x.

70FIX  01  WS-ALP-JNL              PIC X(10)   VALUE SPACES.
       01  WS-RED-JNL              REDEFINES   WS-ALP-JNL.
70FIX      03  WS-NUM-JNL          PIC 9(10).
      *
       01  WS-ALP-PER              PIC X(2)    VALUE SPACES.
       01  WS-RED-PER              REDEFINES   WS-ALP-PER.
           03  WS-NUM-PER          PIC 9(2).
      *
       01  WS-DEL-ENTRY-TABLE.
70         03  WS-DEL-ANALYSIS     PIC 9(10)    OCCURS 5000.
       01  WS-DEL-ENTRY-SUB        PIC 9(4)    VALUE ZEROES.
      *
       01  WS-ANALYSIS-DETAIL.
70         03  WS-ANA-NO           PIC 9(10).
70FIX      03  WS-ANA-LINE         PIC 9(10).
      *
70FIX  01  DICTDATA.
70FIX      03  DICT-RECORD         PIC X(650).
      *
       01  RETURN-STRING.
70FIX      03  RETURN-KEY          PIC X(26).
70FIX      03  RETURN-RECORD       PIC X(650).
      *
       01  ORDCOL-SIZE1            PIC X(4) COMP-5.
      *
       01  ORDCOLL-SRTREC          OBJECT REFERENCE.
      *
       01  WS-OBJECT               PIC X VALUE "N".
       01  WS-SRTREC               PIC X VALUE "N".
       01  array-rec               PIC X(11000).
      *
       01  WS-ALPHA-NUM            PIC X(10).
      *
70FIX  01  STORE-CELL-16           PIC X(35).
70FIX  01  STORE-CELL-17           PIC X(35).
      *
70FIX  01  PASSED-LEDGER     PIC X(35) VALUE SPACES.
       01  PASSED-GENPRP.
           03  PASSED-GENPRP-YEAR PIC 9(4).
           03  PASSED-GENPRP-PER  PIC 9(2).
70         03  PASSED-GENPRP-JNL  PIC 9(10).
      *
       01  ANY-JOURNALS-POSTED PIC 9 VALUE 0.
      *
       01  WS-DEBIT               PIC S9(12)V99.
       01  WS-CREDIT              PIC S9(12)V99.
009    01  TEMP-DR                PIC S9(12)v99.
009    01  TEMP-CR                PIC S9(12)v99.
      *
70     01  SHARED-COMPID     PIC X(4).
      *                             IM0SHGEN for TEST-COMPID
      *
       01  TEST-PER          PIC 9(2).
      *                             Ledger period to check
       01  SHARED-ERROR      PIC X.
      *                             Error with this company ? (N,Y)
       01  SHARED-MSG        PIC X(55).
      *                             Error message
70     01  TEST-COMPID       PIC X(4).
014    01  OLD-JNL-year      PIC 9(4).
014    01  OLD-JNL-PER       PIC 9(2).
      *                             Company to find IM0SHGEN for
      * Built file-names of files for inter-company postings...
       01  GENMST-FILE-NAME      PIC X(260).
       01  GENCTL-FILE-NAME      PIC X(260).
       01  GENHST-FILE-NAME      PIC X(260).
      *
70FIX  78 78-ADMCTL00-REC-LEN VALUE LENGTH OF ADMCTL-REC.
70FIX  01 SAV-ADMCTL00-REC          PIC X(78-ADMCTL00-REC-LEN).
70FIX  78 78-ADMCTL50-REC-LEN VALUE LENGTH OF ADMCTL-REC.
70FIX  01 SAV-ADMCTL50-REC          PIC X(78-ADMCTL50-REC-LEN).
      *
       01  WS-CUR            PIC X(3).
       01  INTER-COMP-OPEN-FLAG PIC X VALUE " ".
      *
70     01  NEW-AENTRY              PIC 9(10).
      *
009    01  ZERO-LINES              PIC X.
022    01  SUBMOD-JNL              PIC X.
024    01  ZOOM-LINK2.
024        03  ZOOM-YEAR     PIC 9(4).
024        03  ZOOM-PER      PIC 99.
70FIX      03  ZOOM-JNL      PIC 9(10).
70     01  WS-IDR            PIC X(35).
068a   01  DEL-CUS-FRM       PIC X. *> Deleting line
      *
       01  SHARED-DRIVES.
           03 GMDRV          PIC X.
           03 GHDRV          PIC X.
           03 GDDRV          PIC X.
           03 GJDRV          PIC X.
           03 GXDRV          PIC X.
           03 GYDRV          PIC X.
           03 GZDRV          PIC X.
019   *
019    01  AP-CHK-FLAG       PIC X.
70FIX  01  WS-COMMENT        PIC X(100).
023a   01  JNL-ENTRY-STATUS  PIC X.
044    01  PASTE-MODE        PIC X.
065    01  WS-FUNCTION       PIC X.
065    01  ENTRY-JN          PIC 9(10).
065    77  EDIT-DATE         PIC 9999/99/99.
065    01  LIST-EDIT-DATE.
065        03 LST-ED-DD      PIC 9(2).
065        03  FILLER        PIC X VALUE "/".
065        03 LST-ED-MM      PIC 9(2).
065        03  FILLER        PIC X VALUE "/".
065        03 LST-ED-CCYY    PIC 9(4).

       01  XX1-SAVE          PIC X(6).
      *>---------------------------------------------------------------
       01  MSG265            PIC X(30) VALUE
                 "Cannot post to current company".
       01  MSG270            PIC X(19) VALUE "Company not on file".
       01  MSG275            PIC X(20) VALUE "Ledger not installed".
       01  MSG280            PIC X(33) VALUE
                 "Posting period > periods per year".
       01  MSG297            PIC X(55) VALUE
           "The local currency is not the same for both companies".
       01  MSG400            PIC X(50) VALUE
          "Journal can only be changed by capturer".
       01  MSG405            PIC X(30) VALUE
          "Authorized".
       01  MSG406                  PIC X(30)   VALUE
           "Unauthorized".
       01  MSG407                  PIC X(30)   VALUE
           "Out of balance".
      *
       01  MSG-PEA           PIC X(22) VALUE
          "Period end adjustments".
       01  MSG-NRM           PIC X(22) VALUE
          "Normal journal        ".
       01  MSG-PRV           PIC X(22) VALUE
          "Provision journal     ".
       01  MSG-ICO           PIC X(22) VALUE
          "Inter-company journal ".
       01  MSG-AUD           PIC X(22) VALUE
          "Auditor's adjustments ".
       01  MSG-USR           PIC X(22) VALUE
          "User-defined journal  ".
       01  MSG-STA           PIC X(22) VALUE
          "Statistical journal   ".
       01  MSG-ALTCUR        PIC X(22) VALUE
          "Alt Currency journal  ".
       01  MSG-NOT           PIC X(10) VALUE
          "Not posted".
       01  MSG-HLD           PIC X(10) VALUE
          "On hold   ".
       01  MSG-CNC           PIC X(10) VALUE
          "Cancelled ".
       01  MSG-PST           PIC X(10) VALUE
          "Posted    ".
       01  MSG-YES1                PIC X(3)    VALUE
           "Yes".
       01  MSG-NO1                 PIC X(3)    VALUE
           "No ".
       01  MSG-NEW                 PIC X(45)    VALUE
           "Journal Header (New) ".
       01  MSG-MAINT               PIC X(45)    VALUE
           "Journal Header       ".
      *>---------------------------------------------------------------
      * Field needed for property controls.
       78  JNLSCODE VALUE START OF D-JNLSCODE - START OF D-DATA-BLOCK.
       78  JNL-TYPE VALUE START OF D-JNL-TYPE - START OF D-DATA-BLOCK.
       78  JNL-DATE VALUE START OF D-JNL-DATE - START OF D-DATA-BLOCK.
       78  JNL-REF  VALUE START OF D-JNL-REF  - START OF D-DATA-BLOCK.
       78  JNL-NOTE VALUE START OF D-JNL-NOTE - START OF D-DATA-BLOCK.
       78  JNL-BREQ VALUE START OF D-JNL-BREQ - START OF D-DATA-BLOCK.
       78  JNLBATCH VALUE START OF D-JNLBATCH - START OF D-DATA-BLOCK.
       78  DSP-TYPE VALUE START OF D-DSP-TYPE - START OF D-DATA-BLOCK.
       78  DSP-SRC  VALUE START OF D-DSP-SRC  - START OF D-DATA-BLOCK.
       78  DSP-STAT VALUE START OF D-DSP-STAT - START OF D-DATA-BLOCK.
       78  JNLTOTDR VALUE START OF D-JNLTOTDR - START OF D-DATA-BLOCK.
       78  JNLTOTCR VALUE START OF D-JNLTOTCR - START OF D-DATA-BLOCK.
       78  TOTALENT VALUE START OF D-TOTALENT - START OF D-DATA-BLOCK.
       78  DSP-MESG VALUE START OF D-DSP-MESG - START OF D-DATA-BLOCK.
       78  AUTH-DESC
                    VALUE START OF D-AUTH-DESC - START OF D-DATA-BLOCK.
       78  UNDIST   VALUE START OF D-UNDIST   - START OF D-DATA-BLOCK.
       78  CURR     VALUE START OF D-CURR     - START OF D-DATA-BLOCK.
032    78  JNL-YEAR-X VALUE START OF D-JNL-YEAR-X -
032                                  START OF D-DATA-BLOCK.
032    78  JNL-PER-X  VALUE START OF D-JNL-PER-X  -
032                                  START OF D-DATA-BLOCK.
032    78  JNL-NO-X   VALUE START OF D-JNL-NO-X   -
                                     START OF D-DATA-BLOCK.
      *>---------------------------------------------------------------
      *>---------------------------------------------------------------
065   * These fields hold the contents of each individual CF field as
065   * they are extracted from the grid row...
065    78  Error-Icon                 Value 177.
065    01 CF-ROW                      PIC 9(10).
065    01 CF-DESCRIPTION              USAGE Description30TD.
065    01 CF-VALUE                    PIC X(255).
065    01 CF-NAME                     USAGE CustomFormFieldTD.
065    01 CF-AND                      PIC X.
065    01 CF-VAL                      PIC 9.
065    01 CF-DATE-CCYYMMDD.
065       03 CF-CCYY                  Usage YearTD.
065       03 CF-MM                    Usage MonthTD.
065       03 CF-DD                    Usage DayTD.
065   * No of entries in table.
065    01 CF-COUNT                    PIC 999.
065   * This table holds holds the fields loaded for each line as they
065   * are loaded into the grid and used for validation and saving...
065    01 CF-TABLE.
065       03 CF-ENTRY                 OCCURS MAX-NO-OF-CUSTOM-FORMS.
065          05  CF-FIELD-NAME        USAGE CustomFormFieldTD.
065          05  CF-COLUMN-NAME       PIC X(18).
065   *                                   Column name of field
065          05  CF-FIELD-DESC        USAGE Description30TD.
065          05  CF-FIELD-AND         PIC X.
065   *                                   Field type (A,N,D)
065          05  CF-FIELD-NULL        PIC 9.
065   *                                   Null data indicator
065   *                                   1 - Null returned
065          05  CF-FIELD-ALP         PIC X(255).
065   *                                   Alpha value
065   *                                   Edited numeric value
065   *                                   Edited date value (norm fmt)
065          05  CF-FIELD-NUM         PIC S9(12)V9(6).
065          05  CF-FIELD-DAT         USAGE DateTD.
065          05  CF-FIELD-VAL         PIC 9.
065   *                                   Validation flag (0-5)
065   *                                   0 - Disallow spaces/zeros
065   *                                   1 - No validation
065   *                                   i.e. allow spaces/zeros
065   *                                   2 - List
065   *                                   3 - Range
065   *                                   4 - Lookup (mandatory)
065   *                                   5 - Lookup (not mandatory)
065   *                                   6 - Lookup (SYSPRO table)
065          05  CF-FIELD-LEN         USAGE FieldLength5TD.
065   *                                   Field length
065   *                                   Alp - max 255
065   *                                   Num - max 12 integers
065          05  CF-FIELD-DEC         PIC 9.
065   *                                   Numeric decimals (0-6)
065          05  CF-FIELD-DEF         USAGE CustomFormAlphaDefTD.
065   *                                   Default value
065          05  CF-FIELD-FIL         PIC X(5).
065   
065   * The following table holds the definition info for each CF...
065    01 CF-GENJND-COUNT                    PIC 999.
065   *                               No of entries in table.
065    01 CF-GENJND-TABLE.
065       03 CF-GENJND-ENTRY             OCCURS MAX-NO-OF-CUSTOM-FORMS.
065          05  CF-GENJND-NAME          USAGE CustomFormFieldTD.
065          05  CF-GENJND-COL           PIC X(18).
065   *                                   Column name of field
065          05  CF-GENJND-DESC          USAGE Description30TD.
065          05  CF-GENJND-AND           PIC X.
065   *                                   Field type (A,N,D)
065          05  CF-GENJND-VAL           PIC 9.
065   *                                   Validation flag (0-5)
065   *                                   0 - Disallow spaces/zeros
065   *                                   1 - No validation
065   *                                   i.e. allow spaces/zeros
065   *                                   2 - List
065   *                                   3 - Range
065   *                                   4 - Lookup (mandatory)
065   *                                   5 - Lookup (not mandatory)
065   *                                   6 - Lookup (SYSPRO table)
065          05  CF-GENJND-LEN           USAGE FieldLength5TD.
065   *                                   Field length
065   *                                   Alp - max 255
065   *                                   Num - max 12 integers
065          05  CF-GENJND-DEC           PIC 9.
065   *                                   Numeric decimals (0-6)
065          05  CF-GENJND-DEF           USAGE CustomFormAlphaDefTD.
065   *                                   Default value
065          05  CF-GENJND-DAT           USAGE DateTD.
065   *                                   Default date

086    01 dim-cnt                        pic 9(6).
086    01 OkToPost                       pic x.
086    01 dim-batch                      pic x.
086    01 store-xml-root-name            pic x(40).

086    01 dimana-path                    pic X(260).
086   *                                  'Built-path' name of GENPDN 
086   *                                  This field has been defined
086   *                                  separately from 'GLDIMANA.WRK'
086   *                                  to avoid duplicate 
086   *                                  'DIMANA-LINE' field.
       01 dim-batch-det.
086          05 dim-sav-tbl              pic x(20).
086          05 dim-sav-tbl-lnk          pic x(100).
086          05 dim-sav-col              pic x(20).
086
086    78 dim-sa-tbl          value "b ArTrnDetail".
086    78 dim-sa-lnk          value "a.Journal = b.GlJournal".
086    78 dim-sa-col          value "b.SalesOrder".

086    78 dim-inv-tbl         value "b InvJournalDet".
086    78 dim-inv-lnk         value "b.Journal = a.SubModJournal".
086    78 dim-inv-col         value "b.Notation". 

086    78 dim-grn-tbl         value "b GrnJournal".
086    78 dim-grn-lnk         value "a.Journal = b.GlJournal".
086    78 dim-grn-col         value "b.Notation".

091    78 dim-ass-tbl         value "b AssetEntriesBv".
091    78 dim-ass-lnk         value "a.SubModAssetReg = b.AssetDistReg".
091    78 dim-ass-col         value "b.Narration".

091kgk 78 dim-ap-tbl         value "b ApJnlSummary".
091kgk 78 dim-ap-lnk         value "a.Journal = b.GlJournal".
091kgk 78 dim-ap-col         value "b.Reference".
095    78 dim-ap-tbl-dis     value "c ApJnlDistrib".
095    78 dim-ap-lnk-dis-1   value "b.TrnYear = c.TrnYear".
095    78 dim-ap-lnk-dis-2   value "b.TrnMonth = c.TrnMonth".
095    78 dim-ap-lnk-dis-3   value "b.Journal = c.Journal ".
095    78 dim-ap-col-dis     value "c.Reference".

091kgk 78 dim-ar-tbl         value "b ArCshJnlDet".
091kgk 78 dim-ar-lnk         value "a.SubModJournal = b.Journal".
091kgk 78 dim-ar-col         value "b.Reference".

093    78 dim-cs-tbl         value "b CshJnl".
093    78 dim-cs-lnk         value "a.SubModJournal = b.Journal".
093    78 dim-cs-col         value "b.AdjustmentType".


086b   01  IsDome             pic x.
107a   01  invalid-ent        pic x.
      *>---------------------------------------------------------------

       LINKAGE SECTION.
       COPY "LINK.WRK".       *> Standard linkage
       01  LINK2       PIC X. *> Dummy 2nd linkage
      *
       PROCEDURE DIVISION USING LINK, LINK2.
      *
       PERFORM COMPAR-INITIALIZE-OBJECTS.
       SET COMMN2-XMLOUT TO NULL.
      *
       COPY "PROBEGIN.PRO".
       COPY "REPORT.PRO".
       COPY "IMPFRO.PRO".
       COPY "COMCRX.PRO".
       COPY "COMPAR.PRO".
       COPY "IMPTRN.PRO".
       COPY "ANALYSIS.PRO".
       COPY "PROCACHE.PRO".
029A   COPY "PROTRG.PRO".
051a   COPY "SQL.PRO".
084nk  copy "COMNXK.PRO".
086    copy "prodel.pro".
086    COPY "GLDIMANA.PRO".
086    COPY "COMPA2.PRO".
086    COPY "GLDIMANABO.PRO".
086    COPY "GENDTF.PRO".
086b   COPY "IMPCHC.PRO".
      *
           perform admctl-build-and-open-io-comer.
           perform admopr-build-and-open-io-comer.
           perform genadc-build-and-open-io-comer.
           perform genadt-build-and-open-io-comer.
084nk *    perform gencjn-build-and-open-io-comer.
           perform genctl-build-and-open-io-comer.
           perform genexc-build-and-open-io-comer.
           perform genhst-build-and-open-io-comer.
           perform genjnc-build-and-open-io-comer.
           perform genjnd-build-and-open-io-comer.
           perform genmst-build-and-open-io-comer.
           perform genrjc-build-and-open-io-comer.
           perform genrjd-build-and-open-io-comer.
           perform genstc-build-and-open-io-comer.
           perform genstd-build-and-open-io-comer.
           perform tblcur-build-and-open-io-comer.
           perform tblusr-build-and-open-io-comer.
047        perform admopc-build-and-open-io-comer.
107        perform genpyr-build-and-open-io-comer.
      *
      * Save any ledger code passed in linkage to GENP10
           MOVE "N"             TO D-GENPRP.
           IF LINK-EXTRA-1 = "GENPRP"
              MOVE LINK-EXTRA-2 TO GENJNC-KEY
              MOVE GENJNC-YEAR  TO PASSED-GENPRP-YEAR
              MOVE GENJNC-PER   TO PASSED-GENPRP-PER
              MOVE GENJNC-JNL   TO PASSED-GENPRP-JNL
           ELSE
70OK       IF LINK-EXTRA-1(1:8) = "JNLKEY: "
70FIX         MOVE LINK-EXTRA-1(9:16) TO GENJNC-KEY
032           MOVE GENJNC-YEAR  TO PASSED-GENPRP-YEAR
032           MOVE GENJNC-PER   TO PASSED-GENPRP-PER
032           MOVE GENJNC-JNL   TO PASSED-GENPRP-JNL
032        ELSE
               MOVE LINK-EXTRA TO PASSED-LEDGER.
           MOVE SPACES TO LINK-EXTRA.
      *
003        PERFORM GET-GL-ENT-LOCK-SHARED.
003        IF LINK-EXTRA NOT = SPACES
003           MOVE SPACES TO LINK-EXTRA
003           GO TO ENDJOB.
029a  *
029a  * Test to see if any trigger points exist for GENP10...
029a       INITIALIZE IMPTRG-LINKAGE.
029a       MOVE "GENPJM" TO IMPTRG-PROGRAM.
029a       MOVE "T"      TO IMPTRG-FUNCTION.
029a       MOVE IMPTRG-LINKAGE TO LINK-EXTRA.
029a       MOVE "IMPTRG" TO WW-PROG-NAME.
029a       PERFORM CALL-PROGRAM.
029a       MOVE LINK-EXTRA TO IMPTRG-LINKAGE.
029a       MOVE SPACES TO LINK-EXTRA.
      *
      **  Initialize dialog system fields
           INITIALIZE DS-CONTROL-BLOCK.
           INITIALIZE D-DATA-BLOCK.
           MOVE "GENPJM"     TO SCREENSET-NAME.
           MOVE DSG-PUSH-SET TO DSG-CONTROL.
      *
           MOVE SPACES TO GENCTL-KEY.
           MOVE COMPID TO GENCTL-CMP.
           PERFORM GENCTL-READ.
           IF STAT-LCK OR STAT-OK
              NEXT SENTENCE
           ELSE
              MOVE CTL-ERR-GM-00 TO CTL-ERR(1)
              PERFORM CONTROL-ERROR
              GO TO ENDJOB.
      *
           move genctl-per         to sav-g00per.
           move genctl-year        to sav-g00year.
004        move genctl-auth        to d-genctl-auth.
022        move im2-auth-smod      to d-submod-auth.
107        move genctl-post-prev   to d-genctl-post-prev.
      *
      ****************************************
      **  Build full path name of 'GENPST'  **
      ****************************************
      *
           MOVE "GENPST"   TO WW-PROG-NAME.
           MOVE "P"        TO WW-PROG-DIR.
           PERFORM BUILD-PROGRAM-NAME.
           MOVE WW-RET-PROG TO POST-PATH.
      *
      *********************************************************
      **  Call the posting program to ensure that it exists  **
      *********************************************************
           MOVE LINK   TO LNK.
           MOVE SPACES TO GENLNK.
           CALL POST-PATH USING LNK, LINK2, GENLNK
                          ON OVERFLOW
                             MOVE "ERRMEM" TO WW-FUNCTION
                             PERFORM WW
                             GO TO ENDJOB.
      *
      * Setup defaults
071        MOVE "1"            TO D-AUTH-OPTION.
071        MOVE 1              TO D-PER-SEL.
071        MOVE 1              TO D-JNL-SEL.
071        MOVE ZEROS          TO D-PERIOD-FROM
071                               D-PERIOD-TO
071                               D-JOURNAL-FROM
071                               D-JOURNAL-TO.
071        MOVE GENCTL-YEAR    TO D-AUTH-YEAR
                                  D-AUTH-YEAR-X.
70OK       MOVE ALL-9S         TO D-DEFTOJNL.
           MOVE "N"            TO D-JNL-TYPE.
           MOVE 1              TO D-MNT-FLG.
071        MOVE "1"            TO D-PRINT-AUTH-JNLS.
           MOVE IM0DAT         TO D-S-DATE2.
           MOVE SYSTEM-DATE    TO D-JNL-COPY-DATE.
071        MOVE "1"            TO D-LSTJL-AR D-LSTPR-AS.
060a       MOVE SPACES         TO D-CHANGE-MAINT.
068a       MOVE "N"            TO DEL-CUS-FRM.
           INITIALIZE          PERIOD-DETAILS.
           INITIALIZE          YEAR-DETAILS.
      *
      * Check user access
           MOVE 180 TO WW-ACCESS-NUM.
           PERFORM FILTER-ACCESS-TT.
           MOVE WW-ACCESS-OK TO D-AUTHORISE-ALLOWED.
           MOVE 179 TO WW-ACCESS-NUM.
           PERFORM FILTER-ACCESS-TT.
           MOVE WW-ACCESS-OK TO D-CAPTURE-ALLOWED.
           MOVE 181 TO WW-ACCESS-NUM.
           PERFORM FILTER-ACCESS-TT.
           MOVE WW-ACCESS-OK TO D-POST-ALLOWED.
           MOVE 182 TO WW-ACCESS-NUM.
           PERFORM FILTER-ACCESS-TT.
           MOVE WW-ACCESS-OK TO D-PRINT-ALLOWED.
      *
      * Check Esignature configuration for Ledger maintenance
      *
           PERFORM ESIGNATURES-VERIFY.
      *
           IF D-NORM-ADD = "Y"
              IF D-CAPTURE-ALLOWED = "N"
                   MOVE "N"    TO D-NORM-ADD.
      *
061        MOVE "Y"    TO D-NORM-MAINT.
      *
           IF D-NORM-AUTH = "Y"
              IF D-AUTHORISE-ALLOWED = "N"
              OR GENCTL-AUTH = "N"
                   MOVE "N"    TO D-NORM-AUTH.
      *
022        IF D-NORM-SUBMOD-AUTH = "Y"
022           IF D-AUTHORISE-ALLOWED = "N"
022           OR IM2-AUTH-SMOD = "N"
022                MOVE "N"    TO D-NORM-SUBMOD-AUTH.
      *
           IF D-NORM-PRINT = "Y"
              IF D-PRINT-ALLOWED = "N"
                   MOVE "N"    TO D-NORM-PRINT.
      *
           IF D-NORM-UNAUTH = "Y"
              IF D-AUTHORISE-ALLOWED = "N"
              OR GENCTL-AUTH = "N"
                   MOVE "N"    TO D-NORM-UNAUTH.
      *
022        IF D-NORM-SUBMOD-UNAUTH = "Y"
022           IF D-AUTHORISE-ALLOWED = "N"
022           OR IM2-AUTH-SMOD = "N"
022                MOVE "N"    TO D-NORM-SUBMOD-UNAUTH.
      *
           IF D-NORM-POST = "Y"
              IF D-POST-ALLOWED  = "N"
                   MOVE "N"    TO D-NORM-POST.
      *
           IF D-NORM-POST = "N"
           AND D-NORM-ADD = "N"
           AND D-NORM-MAINT = "N"
           AND D-NORM-AUTH = "N"
           AND D-NORM-UNAUTH = "N"
               MOVE "N" TO D-COPY-FUNC
           ELSE
               MOVE "Y" TO D-COPY-FUNC.
      *
      * Store high period number for list period number check...
071        IF IM0GPR >= 13 
071           MOVE 13      TO D-HIGPER
071        ELSE
071           MOVE IM0GPR  TO D-HIGPER
071        END-IF.
071   *    MOVE IM0GPR     TO D-HIGPER
           ADD 2           TO D-HIGPER.
      *
      * Store high period for normal journal maintenance (GUI only)
           SUBTRACT 1 FROM D-HIGPER GIVING MAX-PER.
           MOVE MAX-PER TO D-MAX-PER.
           MOVE MAX-PER TO D-IM0GPR.
      *
           MOVE GENCTL-PER    TO D-G00PER.
           MOVE GENCTL-YEAR   TO D-G00YEAR.
           MOVE GENCTL-YEAR   TO D-AUTH-YEAR.
      *
           MOVE GENCTL-YEAR   TO D-MENU-YRS(1) 
                                 D-MENU-YRS(2)
                                 D-MENU-YRS(3).

           SUBTRACT 1       FROM D-MENU-YRS(1).
           ADD 1              TO D-MENU-YRS(3).

           move d-menu-yrs(1) to d-add-yr(1).
           move d-menu-yrs(2) to d-add-yr(2).
           move d-menu-yrs(3) to d-add-yr(3).

107   * Add previous 2, 3, 4 and 5 years if allowed
107        move zeroes        to d-menu-yrs(4)
107                              d-menu-yrs(5)
107                              d-menu-yrs(6)
107                              d-menu-yrs(7)
107                              d-add-yr(4)
107                              d-add-yr(5)
107                              d-add-yr(6)
107                              d-add-yr(7).

107        if d-genctl-post-prev = "Y"
107          if d-esigs-post-prev = "Y"
107            compute d-menu-yrs(4) = genctl-year - 2
107            compute d-menu-yrs(5) = genctl-year - 3
107            compute d-menu-yrs(6) = genctl-year - 4
107            compute d-menu-yrs(7) = genctl-year - 5
107            move d-menu-yrs(4) to d-add-yr(4)
107            move d-menu-yrs(5) to d-add-yr(5)
107            move d-menu-yrs(6) to d-add-yr(6)
107            move d-menu-yrs(7) to d-add-yr(7)
107          end-if
107        end-if.
      *
      * Move in valid period numbers for Gui normal journal listing
          MOVE 1 TO XX1.
          PERFORM SET-UP-PERIOD.
      *
      * Setup editable controls for the first time
           PERFORM LOAD-NORMAL-HEADER.
           PERFORM SET-DROP-DOWN-LIST.
065        PERFORM CUSTOM-FIELDS-FORM.
      *
007       IF PASSED-GENPRP <> SPACES
007           MOVE "Y"                 TO D-GENPRP
007           MOVE PASSED-GENPRP-YEAR  TO D-JNL-YEAR-X
007           MOVE PASSED-GENPRP-PER   TO D-JNL-PER-X
007           MOVE PASSED-GENPRP-JNL   TO D-JNL-NO-X.
           MOVE PASSED-LEDGER TO D-PASSED-LEDGER-CODE.
047   *
047        MOVE SPACES        TO ADMOPR-KEY.
047        MOVE OPERATOR-CODE TO ADMOPR-OPR.
047        PERFORM ADMOPR-READ.
047        PERFORM COMER.
      *
051a       PERFORM SQL-FLAG-SETUP.
      *
      ************************************************
      **  Main Dialog system message handling loop  **
      ************************************************
       MAIN-DS-LOOP.
           PERFORM CALL-DS.
      *
           EVALUATE D-S-FR-MSG
      *                                 *> Init new jnl
           WHEN "new-jnl"
               PERFORM NEW-NORMAL-JNL
      *                                *> Init existing jnl
           WHEN "mnt-jnl"
               PERFORM MAINT-NORMAL-JNL
      *                                *> Validate currency
           WHEN "val-cur"
               PERFORM VALIDATE-CURRENCY
      *                                *> Validate source
           WHEN "val-src"
               PERFORM VALIDATE-SOURCE
      *                                *> Get period in numeric
           WHEN "get-per"
               PERFORM GET-NUMERIC-PERIOD
      *                                *> Browse std jnls
071        WHEN "BRW-JNL"
071            PERFORM BROWSE-JNL
      *
           WHEN "BRW-GB5"
               PERFORM BROWSE-STANDARD
      *                                *> Read std jnl
           WHEN "READ-STD"
               PERFORM READ-STD
      *                                *> Copy std jnls
           WHEN "COPY-STD"
061a           IF  D-JNL-TYPE = "P"
061a           AND (D-JNL-YEAR <> GENCTL-YEAR
061a           OR  D-JNL-PER  <  GENCTL-PER )
061a               MOVE "prv-err" TO D-S-ERROR
061a           ELSE
                   PERFORM COPY-STD
               END-IF
      *                                 *> Validate prov period
061b       WHEN "prv-chk"
061b           PERFORM VALIDATE-PROV-PER
      *                                *> Load jnl details
           WHEN "JOURNALS"
               PERFORM LOAD-NORM-DETAILS
      *                                *> Check selected source
           WHEN "READ-SRC"
               PERFORM READ-SRC
      *                                *> Load jnls for auth
           WHEN "READ-AUTHS"       
               MOVE D-AUTH-YEAR TO D-AUTH-YEAR-X
               PERFORM LOAD-AUTH-JOURNALS
      *                                *> Auth jnls
           WHEN "auth-item"
               PERFORM AUTH-JNLS
      *                                *> UnAuth jnls
           WHEN "unauth"
               PERFORM UN-AUTH-JNLS
      *                                *> List many jnls
           WHEN "LIST-ALL"
049            PERFORM CHECK-REPORT-ACCESS
049            IF BRW-MAINT-FLAG = "F"
020a              MOVE "A" TO PRINT-FLAG
020a              PERFORM PRINT-JNL
               END-IF
      *                                *> List 1 jnl
           WHEN "LIST-JNL"
049            PERFORM CHECK-REPORT-ACCESS
049            IF BRW-MAINT-FLAG = "F"
020a              MOVE 1 TO PRINT-FLAG
023b              PERFORM GENJNC-UNLOCK
023B              MOVE "0" TO D-REPRINT
023B              IF GENJNC-PRINT = "Y"
023B                 MOVE "1" TO D-REPRINT
023B              END-IF
020a              PERFORM PRINT-JNL
023B              PERFORM GENJNC-READ-LOCK
               END-IF
      *                                *> Update jnl
           WHEN "UPD-GL"
               PERFORM GET-NUMERIC-PERIOD
               PERFORM VALIDATE-DETAIL
               IF D-JOURNAL-VALID = "Y"
                  MOVE SPACES TO WS-JNL-FUNC
                  PERFORM CALL-JOURNAL-BO
               END-IF
      *                                *> Validate year
           WHEN "CHK-YR"
               PERFORM CHK-YR
      *                                *> Validate period
           WHEN "CHK-PRD"
               PERFORM CHK-PRD
079   *    WHEN "CHK-FR-PRD"
079   *        PERFORM CHK-FR-PRD
071        WHEN "CHK-TO-PRD"
071            PERFORM CHK-TO-PRD
036        WHEN "CHKSTDP"
036            PERFORM CHK-STD-PRD
      *                                *> Validate to period
           WHEN "CHK-PTO"
042            PERFORM CHK-PTO
      *                                *> Validate auth year
           WHEN "AUTH-YR"
               PERFORM AUTH-YR
      *                                *> Defaults for det line
           WHEN "LDG-DEFS"
               PERFORM CREATE-LEDGER-RECORD-DEFAULTS
      *   
017        WHEN "C-DTE"
017            MOVE D-JNL-DATE           TO DATE-NORMAL
017            PERFORM DATE-TO-CYMD
017            MOVE DATE-CCYYMMDD        TO D-TEXT-DATE
      *                                *> Calc undist amount
           WHEN "undist"
               PERFORM FORMAT-UNDIST
               PERFORM CALC-UNDIST
      *   
071        WHEN "JNL-OUT"   *> jnl out of balance
071            PERFORM JNL-OUT-OF-BAL
      *                                *> Post journal
           WHEN "POST-JNL"
               PERFORM VALIDATE-DETAIL
               IF D-JOURNAL-VALID = "Y"
107               if postPrev not = "Y"
086                 perform do-dimension-analysis
107               end-if
                  MOVE "P"     TO WS-JNL-FUNC
                  PERFORM CALL-JOURNAL-BO
               END-IF
      *                                *> Hold journal
           WHEN "HOLD-JNL"
               MOVE "H"     TO WS-JNL-FUNC
               PERFORM CALL-JOURNAL-BO
      *                                *> Release journal
           WHEN "REL-JNL"
               MOVE "R"     TO WS-JNL-FUNC
               PERFORM CALL-JOURNAL-BO
      *                                *> Cancel journal
           WHEN "CAN-JNL"
               MOVE "C"     TO WS-JNL-FUNC
               PERFORM CALL-JOURNAL-BO
      *                                *> Auth journal
           WHEN "AUTH-JNL"
               MOVE "A"     TO WS-JNL-FUNC
               PERFORM CALL-JOURNAL-BO
      *                                *> Unauth journal
           WHEN "UNA-JNL"
               MOVE "U"     TO WS-JNL-FUNC
               PERFORM CALL-JOURNAL-BO
      *                                *> Check if there is a password
           WHEN "password"
008            IF IM50-GENPWR = "N"
008               MOVE "N" TO D-PASSWORD-REQUIRED
008            ELSE
                  PERFORM CHECK-PASSWORD
			         END-IF
      *                                *> Check if auditors password
           WHEN "aud-chk"
               PERFORM CHECK-AUD-PASS
      *                                *> Journal browse
           WHEN "BRW-GB4"
           WHEN "B2-GB4"
           WHEN "BRW-G4A"
048        WHEN "FRM-G4A"
               PERFORM BROWSE-JOURNAL
      *                                *> Validate password
           WHEN "val-pas"
               PERFORM VALIDATE-PASSWORD
      *                                *> Validate auditors password
           WHEN "aud-pas"
               PERFORM VALIDATE-AUD-PASS
      *                                *> Check analysis
           WHEN "chk-ana"
               PERFORM CHECK-ANALYSIS-REQ
      *                                *> Enter G/L analysis
           WHEN "ask-ana"
               PERFORM ENTER-GL-ANALYSIS
      *                                *> Store deleted analysis no
           WHEN "del-ana"
               PERFORM STORE-DEL-ANA
      *                                *> Check that from jnl exists

      *
           WHEN "chk-exist"
               PERFORM CHECK-EXIST
      *                                *> Copy existing journal
           WHEN "cpy-exist"
               PERFORM COPY-EXIST
      *   
           WHEN "dr-ldg"
               PERFORM BROWSE-DR-LEDGER
      *   
           WHEN "cr-ldg"
               PERFORM BROWSE-CR-LEDGER
      *   
           WHEN "C-UND"
               PERFORM DIST-UNDIST-AMT
      *   
           WHEN "chk-dr"
               PERFORM CHECK-DR-AMOUNT
      *   
           WHEN "chk-cr"
               PERFORM CHECK-CR-AMOUNT
      *   
           WHEN "rtf-not"
               PERFORM READ-NOTEPAD
      *   
           WHEN "clr-not"
               PERFORM CLEAR-NOTEPAD
003   *   
003        WHEN "note-chg"
003            PERFORM SAVE-CHANGED-NOTES
024   *   
024        WHEN "zoom"
024            PERFORM ZOOM-GLJ
030a  *   
030a       WHEN "url"
030a           PERFORM RESOURCE-LOCK-DEL
044   *   
044        WHEN "paste"
044            PERFORM RECORDS-PASTED
047        WHEN "INTERCO"
047            PERFORM CHECK-COMP
      *   
071        WHEN "SET-F2"
071            PERFORM SETUP-EXISTING-JNL-CPY
      *   
071        WHEN "SET-F3"
071            PERFORM SETUP-STD-JNL-CPY
      *   
071        WHEN "SET-STD-YR"
071            PERFORM SETUP-STD-JNL-CPY
      *   
071        WHEN "SET-PRINT"
071            PERFORM SET-PRINT-DEFAULTS
      *
071        WHEN "CHECK-DEF"
071            PERFORM CHECK-DEFAULT-OPTIONS
      *
071        WHEN "SET-DEF"
071            PERFORM SET-DEFAULT-OPTIONS

086b       When "SHOW-GRP"
086b           PERFORM CALL-ARSPGR
      *
           END-EVALUATE.
      *
           GO TO MAIN-DS-LOOP.      
      *
      *   Set up table of period no for GUI
       SET-UP-PERIOD.
071   *    IF XX1 < D-HIGPER
071   *        ADD 1 TO XX1
071   *        GO TO SET-UP-PERIOD.
071   *    MOVE GROUP-LSTPR TO D-GROUP-004.
071   *
071        PERFORM VARYING XX1 FROM 1 BY 1 UNTIL XX1 > D-HIGPER 
071          MOVE XX1       TO LSTPR(XX1)
071        END-PERFORM.
071        MOVE GROUP-LSTPR TO D-GROUP-004.
      *
071    SETUP-EXISTING-JNL-CPY.
071        INITIALIZE IMPFRO-LINK.
071        MOVE SPACES            TO IMPFRO-LINK.
071        MOVE "GENPJMF2"        TO LV-NAME.
071        MOVE "From Period"     TO LV-CAPTION.
071        PERFORM SETUP-PERIOD-DROPDOWN.
071        MOVE "To Period"       TO LV-CAPTION.
071        PERFORM SETUP-PERIOD-DROPDOWN.
071        MOVE SPACES TO LV-CAPTION.
      *
071        MOVE "From Year"       TO LV-CAPTION.
071        PERFORM SETUP-YEAR-DROPDOWN.
071        MOVE "To Year"         TO LV-CAPTION.
071        PERFORM SETUP-YEAR-DROPDOWN.
      *
071        MOVE LV-NAME         TO IMPFRO-LISTVIEW.
071        PERFORM SET-FORM-DYNAMIC-DROPDOWN.
      *
071    SETUP-STD-JNL-CPY.
071        INITIALIZE IMPFRO-LINK.
071        MOVE SPACES            TO IMPFRO-LINK.
071        MOVE "GENPJMF3"        TO LV-NAME.
071        MOVE "Posting period"  TO LV-CAPTION.
071        PERFORM SETUP-PERIOD-DROPDOWN.
071        MOVE SPACES TO LV-CAPTION.
      *
071        MOVE "Posting year"    TO LV-CAPTION.
071        PERFORM SETUP-YEAR-DROPDOWN.
      *
071        MOVE LV-NAME         TO IMPFRO-LISTVIEW.
071        PERFORM SET-FORM-DYNAMIC-DROPDOWN.
      *
      *   Set up table of period no for GUI
071    SETUP-PERIOD-DROPDOWN.
071        PERFORM VARYING XX2 FROM 1 BY 1 UNTIL XX2 = D-HIGPER
071           MOVE LSTPR(XX2)    TO PERIOD-LET
071           MOVE PERIOD-STRING TO PERIOD-DET(XX2)
071        END-PERFORM.
071   *
071        ADD 1                TO ICX1.
071        INITIALIZE IMPFRO-DynamicDropDown-Value(ICX1).
071        INITIALIZE IMPFRO-DynamicDropDown-Caption(ICX1).
071        MOVE LV-CAPTION      TO IMPFRO-DynamicDropDown-Caption(ICX1).
071        MOVE PERIOD-DETAILS  TO IMPFRO-DynamicDropDown-Value(ICX1).
      *
      *   Set up table of period no for GUI
071    SETUP-YEAR-DROPDOWN.
107        perform varying xx2 from 1 by 1 
107                  until xx2 > 7 or d-add-yr(xx2) = zeroes
071           move d-add-yr(xx2)    to year-let
071           move year-string      to year-det(xx2)
071        end-perform.
071   *
071        ADD 1                TO ICX1.
071        INITIALIZE IMPFRO-DynamicDropDown-Value(ICX1).
071        INITIALIZE IMPFRO-DynamicDropDown-Caption(ICX1).
071        MOVE LV-CAPTION      TO IMPFRO-DynamicDropDown-Caption(ICX1).
071        MOVE YEAR-DETAILS    TO IMPFRO-DynamicDropDown-Value(ICX1).
      *
      * Load header info for the editable control
       LOAD-NORMAL-HEADER.
           PERFORM LOAD-NORMAL-START THRU
                   LOAD-NORMAL-END.
       LOAD-NORMAL-START.
           INITIALIZE IMPFRO-LINK.
           MOVE 0 TO IMPFRO-COUNT.
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Journal type"        TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE "L"                   TO IMPFRO-AND(IMPFRO-COUNT).
           MOVE D-JNL-TYPE            TO IMPFRO-ALP(IMPFRO-COUNT).
           IF   D-JNL-TYPE = SPACES
                MOVE "N"              TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE JNL-TYPE              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-JNL-TYPE  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE 2                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Journal date"        TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE "D"                   TO IMPFRO-AND(IMPFRO-COUNT).
           MOVE 0              TO IMPFRO-ALLOW-ZERO-DATE(IMPFRO-COUNT).
           MOVE D-JNL-DATE            TO DATE-NORMAL.
           PERFORM DATE-TO-CYMD.
           MOVE DATE-CCYYMMDD         TO IMPFRO-DAT(IMPFRO-COUNT).
           MOVE JNL-DATE              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-JNL-DATE  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE IMPFRO-ICON-DATE      TO IMPFRO-ICON(IMPFRO-COUNT).
           MOVE 2                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Reference"           TO IMPFRO-DES(IMPFRO-COUNT)
           MOVE D-JNL-REF             TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE JNL-REF               TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-JNL-REF   TO IMPFRO-LEN(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Notation"            TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-JNL-NOTE            TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE JNL-NOTE              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-JNL-NOTE  TO IMPFRO-LEN(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Batch total required"
                                      TO IMPFRO-DES(IMPFRO-COUNT).
020a       MOVE xtpCheckbox           TO IMPFRO-AND(IMPFRO-COUNT).
020a       MOVE "Y"
                TO IMPFRO-APPLY-YN-CHECKBOX(IMPFRO-COUNT).
           MOVE D-JNL-BREQ            TO IMPFRO-ALP(IMPFRO-COUNT).
           IF   D-JNL-BREQ = SPACES
                MOVE "N"              TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE JNL-BREQ              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-JNL-BREQ  TO IMPFRO-LEN(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Batch total"         TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE "N"                   TO IMPFRO-AND(IMPFRO-COUNT).
           MOVE D-JNLBATCH            TO IMPFRO-NUM(IMPFRO-COUNT).
70OK       MOVE 2                     TO IMPFRO-DEC(IMPFRO-COUNT).
           MOVE JNLBATCH              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-JNLBATCH  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Currency"            TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-CURR                TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE CURR                  TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-CURR      TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *
           IF  D-CURR NOT = SPACES
               IF  D-CURR NOT = TBLCUR-CUR
                   MOVE D-CURR TO TBLCUR-CUR
                   PERFORM TBLCUR-READ
                   IF NOT STAT-OK
                       MOVE SPACES TO TBLCUR-DES
                   END-IF.
      *
           MOVE TBLCUR-DES            TO IMPFRO-TOOLTIP(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-DESCTIP(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Source"              TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-JNLSCODE            TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE JNLSCODE              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-JNLSCODE  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *
           IF  D-JNLSCODE NOT = SPACES
               IF  D-JNLSCODE NOT = TBLUSR-SCODE
                   MOVE D-JNLSCODE    TO TBLUSR-SCODE
                   PERFORM TBLUSR-READ
                   IF NOT STAT-OK
                       MOVE SPACES TO TBLUSR-DESC
                   END-IF.
      *
           MOVE TBLUSR-DESC           TO IMPFRO-TOOLTIP(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-DESCTIP(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Status"              TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-DSP-STAT            TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE DSP-STAT              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-DSP-STAT  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Authorized"          TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-AUTH-DESC           TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE AUTH-DESC             TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-AUTH-DESC TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *****
           PERFORM CALC-UNDIST.
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Undistributed amount" TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE "N"                   TO IMPFRO-AND(IMPFRO-COUNT).
           MOVE D-UNDIST              TO IMPFRO-NUM(IMPFRO-COUNT).
70OK       MOVE 2                     TO IMPFRO-DEC(IMPFRO-COUNT).
           MOVE UNDIST                TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-UNDIST    TO IMPFRO-LEN(IMPFRO-COUNT)
           MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *****
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Message"             TO IMPFRO-DES(IMPFRO-COUNT).
           MOVE D-DSP-MESG            TO IMPFRO-ALP(IMPFRO-COUNT).
           MOVE DSP-MESG              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
           MOVE LENGTH OF D-DSP-MESG  TO IMPFRO-LEN(IMPFRO-COUNT).
           MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
032   *
032        ADD 1 TO IMPFRO-COUNT.
032        MOVE "Year    "            TO IMPFRO-DES(IMPFRO-COUNT).
032        MOVE D-JNL-YEAR-X          TO IMPFRO-ALP(IMPFRO-COUNT).
032        MOVE JNL-YEAR-X            TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
032        MOVE LENGTH OF D-JNL-YEAR-X TO IMPFRO-LEN(IMPFRO-COUNT).
032        MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
032   *
032        ADD 1 TO IMPFRO-COUNT.
032        MOVE "Period  "            TO IMPFRO-DES(IMPFRO-COUNT).
032        MOVE D-JNL-PER-X           TO IMPFRO-ALP(IMPFRO-COUNT).
032        MOVE JNL-PER-X             TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
032        MOVE LENGTH OF D-JNL-PER-X TO IMPFRO-LEN(IMPFRO-COUNT).
032        MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
032   *
032        ADD 1 TO IMPFRO-COUNT.
032        MOVE "Journal "            TO IMPFRO-DES(IMPFRO-COUNT).
032        MOVE D-JNL-NO-X            TO IMPFRO-ALP(IMPFRO-COUNT).
032        MOVE JNL-NO-X              TO IMPFRO-BLOCK-POS(IMPFRO-COUNT).
032        MOVE LENGTH OF D-JNL-NO-X  TO IMPFRO-LEN(IMPFRO-COUNT).
032        MOVE 1                     TO IMPFRO-EDIT(IMPFRO-COUNT).
      *****
023a       MOVE "GENJNL" TO IMPFRO-CUSTOM-FORM.
023a       IF  JNL-ENTRY-STATUS = "N"
023a           MOVE SPACES TO IMPFRO-CUSTOM-KEY
023a       ELSE
023a           MOVE GENJNC-KEY TO IMPFRO-CUSTOM-KEY.
023a  *****
           MOVE "GENPJMLV" TO IMPFRO-LISTVIEW.
           PERFORM SET-LISTVIEW-PROPERTIES.
       LOAD-NORMAL-END.
      *
      * Load dropdown lists for editable controls
       SET-DROP-DOWN-LIST.
           INITIALIZE IMPFRO-LINK.
           INITIALIZE IMPFRO-DROP-TABLE.
      *
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Journal type"   TO IMPFRO-DROP-CAPTION(IMPFRO-COUNT).
           MOVE "Normal journal" TO IMPFRO-DROP-DESC(IMPFRO-COUNT,1).
           MOVE "N"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,1).
           MOVE "Provisional journal"
                                 TO IMPFRO-DROP-DESC(IMPFRO-COUNT,2).
           MOVE "P"              TO IMPFRo-DROP-VALUE(IMPFRO-COUNT,2).
           MOVE "Inter-company journal"
                                 TO IMPFRO-DROP-DESC(IMPFRO-COUNT,3).
           MOVE "I"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,3).
           MOVE "User-defined journal"
                                 TO IMPFRO-DROP-DESC(IMPFRO-COUNT,4).
           MOVE "U"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,4).
           MOVE "Period end adjustments"
                                 TO IMPFRO-DROP-DESC(IMPFRO-COUNT,5).
           MOVE "E"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,5).
           MOVE "Auditor's adjustments"
                                 TO IMPFRO-DROP-DESC(IMPFRO-COUNT,6).
           MOVE "A"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,6).
           MOVE "Statistical journal"
                                 TO IMPFRO-DROP-DESC(IMPFRO-COUNT,7).
           MOVE "S"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,7).
           MOVE "Alternate currency jnl"
                                 TO IMPFRO-DROP-DESC(IMPFRO-COUNT,8).
           MOVE "L"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,8).
      *
           ADD 1 TO IMPFRO-COUNT.
           MOVE "Batch total required"
                                 TO IMPFRO-DROP-CAPTION(IMPFRO-COUNT).
           MOVE "No"             TO IMPFRO-DROP-DESC(IMPFRO-COUNT,1).
           MOVE "N"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,1).
           MOVE "Yes"            TO IMPFRO-DROP-DESC(IMPFRO-COUNT,2).
           MOVE "Y"              TO IMPFRO-DROP-VALUE(IMPFRO-COUNT,2).
      *
           MOVE "GENPJMLV" TO IMPFRO-LISTVIEW.
           PERFORM SET-LISTVIEW-DROPDOWN.

065    CUSTOM-FIELDS-FORM.
065        INITIALIZE IMPFRO-LINK.
065        MOVE "GENJND"   TO IMPFRO-CUSTOM-FORM.
065        MOVE "GENPJMFM" TO IMPFRO-LISTVIEW.
065        PERFORM SET-LISTVIEW-PROPERTIES.
065        PERFORM LOAD-CF-DEFINITIONS.
      *
      * Init fields for new journal
       NEW-NORMAL-JNL.
           PERFORM  GENJNC-UNLOCK.
           PERFORM CLEAR-DEL-ENT.
           PERFORM NEW-NORMAL-START THRU NEW-NORMAL-END.
       NEW-NORMAL-START.
023a       MOVE "N"                    TO JNL-ENTRY-STATUS.
           MOVE D-JNL-YEAR-X           TO D-JNL-YEAR.
           MOVE D-JNL-PER-X            TO D-JNL-PER.
013        MOVE "H"                    TO D-ADD-LINE-FROM
      *
           MOVE SPACES                 TO D-JNLSCODE.
      *
           MOVE "N"                    TO D-JNL-TYPE.
      *
           MOVE SYSTEM-DATE            TO D-JNL-DATE.
      *
           MOVE SPACES                 TO D-JNL-REF.
           MOVE SPACES                 TO D-JNL-NOTE.
           MOVE "N"                    TO D-JNL-BREQ.
           MOVE ZEROES                 TO D-JNLBATCH.
           MOVE SPACES                 TO D-DSP-TYPE.
           MOVE SPACES                 TO D-DSP-SRC.
           MOVE SPACES                 TO D-DSP-STAT.
           MOVE ZEROES                 TO D-JNLTOTDR.
           MOVE ZEROES                 TO D-JNLTOTCR.
           MOVE ZEROES                 TO D-TOTALENT.
           MOVE SPACES                 TO D-DSP-MESG.
           MOVE SPACES                 TO D-AUTH-DESC.
           MOVE SPACES                 TO D-DSP-STAT.
019        MOVE SPACES                 TO D-JNC-JSRC.
019        MOVE SPACES                 TO D-JNC-TCD.
           MOVE MSG-NEW                TO D-DETAIL-HEADING.
           PERFORM LOAD-NORMAL-HEADER.
           MOVE "D"                    TO D-AUTH-FUNC.
           MOVE "D"                    TO D-UNAUTH-FUNC.
           MOVE "D"                    TO D-POST-FUNC.
003        MOVE "E"                    TO D-HOLD-FUNC.
           MOVE "D"                    TO D-REL-FUNC.
003        MOVE "E"                    TO D-CAN-FUNC.
       NEW-NORMAL-END.
      *
      * Init fields for maintenance of existing journals
       MAINT-NORMAL-JNL.
030a       PERFORM RESOURCE-LOCK-DEL.
           PERFORM CLEAR-DEL-ENT.
           IF  D-NEW-JNL-X > SPACES
               MOVE D-NEW-JNL-X TO D-JNL-NO-X
               MOVE SPACES      TO D-NEW-JNL-X.
           PERFORM GET-NUMERIC-PERIOD.
           PERFORM MAINT-NORMAL-START THRU
                   MAINT-NORMAL-END.
           PERFORM SET-FUNC-KEYS.
       MAINT-NORMAL-START.
061        IF D-NORM-ADD = "N"
.             STRING
.               "You have been denied access"    DELIMITED BY SIZE
.               " to GL Journal capture."        DELIMITED BY SIZE
.               INTO LINK-EXTRA
.             END-STRING
.             MOVE "Operator Activity Control" TO link-msg-hdg
.             MOVE "A"         TO link-msg-buttons
.             MOVE "1"         TO link-msg-def
.             MOVE "W"         TO link-msg-icon
.             MOVE spaces      TO link-msg-chk    *>Must move SPACES
.             MOVE "GENPJM"    TO link-msg-chk-prg*>Program name
.             MOVE "Do not show this message again" TO link-msg-chk-msg
.             PERFORM invoke-message-box
061        END-IF.
      *
023a       MOVE "M"                TO JNL-ENTRY-STATUS.
           MOVE SPACES TO D-RTF-FILE-NAME.
70FIX *    MOVE D-JNL-YEAR-X       TO D-JNL-YEAR.
70FIX *    MOVE D-JNL-PER-X        TO D-JNL-PER.
70FIX *     MOVE D-JNL-NO-X         TO D-JNL-NO.
           PERFORM GENJNC-UNLOCK.
           MOVE SPACES     TO GENJNC-KEY.
           MOVE D-JNL-YEAR TO GENJNC-YEAR POST-YYYY.
           MOVE D-JNL-PER  TO GENJNC-PER.
           MOVE D-JNL-NO   TO GENJNC-JNL.
           MOVE D-JNL-NO   TO EDIT-JNL.
           MOVE EDIT-JNL   TO D-JNL-NO-X.
08030a*
08030a*    MOVE SPACES     TO WW-LOCK-FIELDS.  *> Initialise the key
08030a*    MOVE COMPID     TO WW-LOCK-COM.
08030a*    MOVE "GENPJM"   TO WW-LOCK-TYP.
08030a*    MOVE GENJNC-KEY TO WW-LOCK-KEY.
08030a*    MOVE "GL journal maintenance" TO WW-LOCK-DES.
08030a*    PERFORM RESOURCE-LOCK-ADD-MSG.
08030a*    IF STAT-LCK
08030a*       MOVE "Locked" TO D-S-ERROR
08030a*       GO TO MAINT-NORMAL-END.
08030a*
           PERFORM GENJNC-READ-LOCK.
           MOVE TIMESTAMP-BIN TO TIMESTAMP-SAV.
           IF STAT-LCK
               MOVE ERRLOC TO WW-ERROR-NUM
               PERFORM LOOK-UP-ERROR
           ELSE
               IF NOT STAT-OK
                  MOVE "N"    TO WS-FOUND
                  PERFORM READ-FOR-JNL THRU READ-FOR-JNL-EXIT
                  UNTIL   STAT-AT-END
                  OR      WS-FOUND = "X"
                  OR      WS-FOUND = "Y"
                  IF WS-FOUND = "N"
                  OR WS-FOUND = "X"
                      MOVE SPACES TO GENJNC-REC
                      MOVE ERRNOT TO WW-ERROR-NUM
                      PERFORM LOOK-UP-ERROR
015                   GO TO MAINT-NORMAL-END.
080   *
080        MOVE SPACES     TO WW-LOCK-FIELDS.  *> Initialise the key
080        MOVE COMPID     TO WW-LOCK-COM.
080        MOVE "GENPJM"   TO WW-LOCK-TYP.
080        MOVE GENJNC-KEY TO WW-LOCK-KEY.
080        MOVE "GL journal maintenance" TO WW-LOCK-DES.
080        PERFORM RESOURCE-LOCK-ADD-MSG.
080        IF STAT-LCK
080           MOVE "Locked" TO D-S-ERROR
080           GO TO MAINT-NORMAL-END.
080   *
      * If limit view to capturer = "Y" and this is a
      * different operator then don't allow maintenance
      * on the journal.
           IF GENCTL-LVIEW = "Y"
           AND D-S-ERROR NOT > SPACES
           AND D-AUTHORISE-ALLOWED = "N"
               IF GENJNC-OPCODE NOT = OPERATOR-CODE
                   MOVE MSG400  TO D-S-ERROR.
      *
      * Store journal header information in data block
           MOVE SPACES       TO D-JNL-KEY.
           MOVE GENJNC-KEY   TO D-JNL-KEY.
           MOVE GENJNC-JTYP  TO D-JNL-TYPE.
           MOVE GENJNC-JDAT  TO DATE-CCYYMMDD.
           PERFORM DATE-FROM-CYMD.
           MOVE DATE-NORMAL  TO D-JNL-DATE.
           MOVE GENJNC-REF   TO D-JNL-REF.
           MOVE GENJNC-NOTE  TO D-JNL-NOTE.
           MOVE GENJNC-SCODE TO D-JNLSCODE.
           IF   D-JNLSCODE = "J"
                MOVE SPACES  TO D-JNLSCODE.
           IF   GENJNC-PER > ZEROES
                MOVE GENJNC-PER   TO D-JNL-PER POST-PP
                MOVE GENJNC-PER   TO D-JNL-PER-X.
           MOVE POST-PP-YYYY TO D-LDG-PER.
           MOVE GENJNC-DEB   TO D-JNLTOTDR.
           MOVE GENJNC-CRD   TO D-JNLTOTCR.
      *
           IF   D-JNLTOTDR NOT = D-JNLTOTCR
                MOVE MSG407  TO D-DSP-MESG.
           MOVE D-JNL-NO     TO D-JNL-NO-X.
      *
           MOVE GENJNC-TRAN  TO DETAIL-ENT D-TOTALENT.
           MOVE GENJNC-CUR   TO D-CURR.
           IF   GENJNC-AUTHORISED = "Y"
                MOVE MSG405  TO D-AUTH-DESC
                MOVE "Y"     TO D-AUTHORISED
                IF GENJNC-STAT NOT = "N"
                    MOVE "N" TO D-AUTHORISED
                END-IF
           ELSE
                MOVE MSG406  TO D-AUTH-DESC
                MOVE "N"     TO D-AUTHORISED.
      *
           IF  GENJNC-JTYP = "N"
               MOVE "Normal journal"    TO D-DSP-TYPE
           ELSE
           IF  GENJNC-JTYP = "P"
               MOVE "Provisional journal" TO D-DSP-TYPE
           ELSE
           IF  GENJNC-JTYP = "I"
               MOVE "Inter-company journal"
                                        TO D-DSP-TYPE
           ELSE
           IF  GENJNC-JTYP = "U"
               MOVE "User-defined journal"
                                        TO D-DSP-TYPE
           ELSE
           IF  GENJNC-JTYP = "E"
               MOVE "Period end adjustments"
                                        TO D-DSP-TYPE
           ELSE
           IF  GENJNC-JTYP = "A"
               MOVE "Auditor's adjustments"
                                        TO D-DSP-TYPE
           ELSE
           IF  GENJNC-JTYP = "S"
               MOVE "Statistical journal"
                                        TO D-DSP-TYPE
           ELSE
           IF  GENJNC-JTYP = "L"
               MOVE " Alternate currency jnl"
                                        TO D-DSP-TYPE.
      *
           IF  GENJNC-SRC = "J"
               MOVE "Journal entry"     TO D-DSP-SRC
           ELSE
           IF  GENJNC-SRC = "E"
               MOVE "Ledger entries posting"
                                        TO D-DSP-SRC
           ELSE
           IF  GENJNC-SRC = "Y"
               MOVE "Year end closing"  TO D-DSP-SRC
           ELSE
           IF  GENJNC-SRC = "R"
               MOVE "Recurring journal" TO D-DSP-SRC
           ELSE
           IF  GENJNC-SRC = "V"
               MOVE "Reversing entries" TO D-DSP-SRC.
      *
           IF  GENJNC-STAT = "P"
               MOVE "Journal posted"    TO D-DSP-STAT
           ELSE
           IF  GENJNC-STAT = "H"
               MOVE "Journal on hold"   TO D-DSP-STAT
           ELSE
           IF  GENJNC-STAT = "N"
               MOVE "Journal not posted" TO D-DSP-STAT
           ELSE
           IF  GENJNC-STAT = "C"
               MOVE "Journal cancelled" TO D-DSP-STAT.
           MOVE GENJNC-STAT             TO D-JNL-STAT.
           MOVE GENJNC-PRINT            TO D-JNL-PRINT.
019   *
019        MOVE GENJNC-JSRC             TO D-JNC-JSRC.
019        MOVE GENJNC-TCD              TO D-JNC-TCD.
      *
           MOVE MSG-MAINT               TO D-DETAIL-HEADING.
           PERFORM LOAD-NORMAL-HEADER.
           IF D-DOCKING-IS-CLOSED(3) NOT = 1
                  PERFORM READ-NOTEPAD.
      *
022        IF  GENJNC-JSRC > SPACES
022            MOVE "Y" TO SUBMOD-JNL
022        ELSE
022            MOVE "N" TO SUBMOD-JNL.
      *
       MAINT-NORMAL-END.
      *
      * Read GENJNC for control record
       READ-FOR-JNL.
           PERFORM GENJNC-INITIALIZE-REC.
           MOVE D-JNL-YEAR TO GENJNC-YEAR.
           PERFORM GENJNC-START-GE.
           IF STAT-INVALID-KEY
               MOVE "X"     TO WS-FOUND
               GO TO READ-FOR-JNL-EXIT.
      *
       READ-FOR-JNL-CONT.
           PERFORM GENJNC-READ-NEXT.
           IF STAT-AT-END
               GO TO READ-FOR-JNL-EXIT.
           IF NOT STAT-OK
               GO TO READ-FOR-JNL-EXIT.
      *
           IF GENJNC-JNL = D-JNL-NO
               MOVE "Y" TO WS-FOUND
004            MOVE TIMESTAMP-BIN  TO TIMESTAMP-SAV
               GO TO READ-FOR-JNL-EXIT.
      *
           GO TO READ-FOR-JNL-CONT.
      *
       READ-FOR-JNL-EXIT.
           EXIT.
      *
      * Load the details lines for exiting journals
       LOAD-NORM-DETAILS.
           PERFORM LOAD-NORM-DET-START THRU LOAD-NORM-DET-END.
           PERFORM FinishReportControl.
           PERFORM CALC-UNDIST.
      *
       LOAD-NORM-DET-START.
           MOVE "GENPJML1" TO xtpReportControl
064   *    MOVE 51         TO xtpNumberColumns
086a  *    MOVE 69         TO xtpNumberColumns
086b       MOVE 72         TO xtpNumberColumns
           PERFORM CreateReportControl
      *
           MOVE ZEROS      TO D-JNLTOTDR D-JNLTOTCR
                              D-UNDIST.
      *
           MOVE SPACES             TO GENJND-KEY.
           MOVE D-JNL-YEAR         TO GENJND-YEAR.
           MOVE D-JNL-PER          TO GENJND-PER.
           MOVE D-JNL-NO           TO GENJND-JNL.
      *
           PERFORM GENJND-START-GE.
           IF STAT-INVALID-KEY
              GO TO LOAD-NORM-DET-END.
      *
       LOAD-NORM-DET-NEXT.
           PERFORM GENJND-READ-NEXT.
           IF STAT-AT-END
              GO TO LOAD-NORM-DET-END.
           PERFORM COMER.
      *
           IF GENJND-YEAR      NOT = D-JNL-YEAR
           OR GENJND-PER       NOT = D-JNL-PER
           OR GENJND-JNL       NOT = D-JNL-NO
               GO TO LOAD-NORM-DET-END.
      *
           MOVE SPACES  TO GENMST-KEY.
           MOVE COMPID  TO GENMST-CMP.
           MOVE GENJND-ACC TO GENMST-ACC.
           PERFORM GENMST-READ.
           IF STAT-LCK
           OR STAT-OK
               NEXT SENTENCE
           ELSE
               MOVE SPACES TO GENMST-REC.
      *
           MOVE SPACES TO RecordRow
           MOVE GENJND-ACC             TO CellValue(2).
           MOVE GENMST-DESC            TO CellValue(3).
           MOVE GENJND-DATE            TO CellValue(4).
           MOVE GENJND-REF             TO CellValue(5).
           MOVE GENJND-AMT             TO EDITED-TRNVALUE.
           IF GENJND-COD = "D"
               MOVE EDITED-TRNVALUE    TO CellValue(6)
           ELSE
               MOVE EDITED-TRNVALUE    TO CellValue(7).
           MOVE GENJND-COMM            TO CellValue(8).
           MOVE GENMST-UOM             TO CellValue(9).
           MOVE GENJND-ENT             TO CellValue(10).
           MOVE SPACES                 TO WS-ANALYSIS-DETAIL.
           MOVE GENJND-AENTRY          TO WS-ANA-NO.
043        MOVE WS-ANA-NO              TO CellValue(11).
           MOVE "43043"                TO CellHyperlinkEvent(13).
           MOVE  "Click to enter G/L analysis"
                                       TO CellTooltip(13).
      *
           IF   D-JNL-STAT = "P"
           OR   D-JNL-STAT = "H"
           OR   D-JNL-STAT = "C"
                MOVE " "               TO CellHyperlinkEvent(13)
                MOVE " "               TO CellTooltip(13).
      *
           PERFORM GENMST-INITIALIZE-REC.
           MOVE COMPID                 TO GENMST-CMP.
           MOVE GENJND-ACC             TO GENMST-ACC.
           PERFORM GENMST-READ.
           IF  NOT STAT-OK
               MOVE SPACES             TO GENMST-REC
           ELSE
               PERFORM COMER.
      *
           IF  GENMST-ANAREQ NOT = "Y"
023            IF  (GENJND-AENTRY > ZEROES
023            AND  GENJNC-JSRC > SPACES )
023                 NEXT SENTENCE
023            ELSE
               GO TO LOAD-NORM-DET-CONT.
      *
107   ** If posting to previous, skip analysis
107        if postPrev = "Y"
107          go to load-norm-det-cont
107        end-if.

           IF  GENJND-AENTRY = ZEROES
               MOVE "Edit"         TO CeLLValue(13)
038            MOVE "43043"        TO CellHyperlinkEvent(13)
               GO TO LOAD-NORM-DET-CONT.
023   *
023        IF  GENJNC-JSRC > SPACES
023            PERFORM GENADC-INITIALIZE-REC
023            MOVE COMPID             TO GENADC-CMP
023            MOVE GENJND-YEAR        TO GENADC-YEAR
023            MOVE GENJND-PER         TO GENADC-PER
023            MOVE GENJND-AENTRY      TO GENADC-AENTRY
023            PERFORM GENADC-READ
023            IF  NOT STAT-OK
023                MOVE "Edit"         TO CellValue(13)
038                MOVE "43043"        TO CellHyperlinkEvent(13)
023                GO TO               LOAD-NORM-DET-CONT
023            END-IF
023            IF  GENADC-TOTAMT = ZEROES
023                MOVE "Edit"         TO CellValue(13)
038                MOVE "43043"        TO CellHyperlinkEvent(13)
023                GO TO               LOAD-NORM-DET-CONT
023            END-IF
023        END-IF.
      *
           IF  GENJND-COD  = "D"
               MOVE GENJND-AMT         TO EDIT-VALUE
70FIX          STRING "Edit:"          DELIMITED BY SIZE
70FIX                 EDIT-VALUE       DELIMITED BY SIZE
70FIX                 INTO             CellValue(13)
           ELSE
               MOVE GENJND-AMT         TO WS-CALC-VALUE
               COMPUTE WS-CALC-VALUE = WS-CALC-VALUE * - 1
               MOVE WS-CALC-VALUE      TO EDIT-VALUE
70FIX          STRING "Edit:"          DELIMITED BY SIZE
70FIX                 EDIT-VALUE       DELIMITED BY SIZE
70FIX                 INTO             CellValue(13).
      *
       LOAD-NORM-DET-CONT.
      *
           MOVE xtpTrue                TO CellHasCheckBox(14).
           IF GENJND-INT = "Y"
               MOVE xtpTrue            TO CellIsChecked(14)
           ELSE
               MOVE xtpFalse           TO CellIsChecked(14).
      *
           MOVE GENJND-ID              TO CellValue(15).
           MOVE GENJND-IDR             TO CellValue(16).
           MOVE GENJND-ICR             TO CellValue(17).
      *
           IF   D-JNL-TYPE = "I"
                MOVE xtpTrue           TO CellEditable(14)
                MOVE xtpTrue           TO CellEditable(15)
                MOVE xtpTrue           TO CellEditable(16)
                MOVE xtpTrue           TO CellEditable(17)
           ELSE
                MOVE xtpFalse          TO CellEditable(14)
                MOVE xtpFalse          TO CellEditable(15)
                MOVE xtpFalse          TO CellEditable(16)
                MOVE xtpFalse          TO CellEditable(17).
019   *
019        MOVE GENJND-SRC             TO CellValue(18).
019        MOVE GENJND-TCD             TO CellValue(19).
019        MOVE GENJND-SOURCE-AP       TO CellValue(20).
019        MOVE GENJND-SOURCE          TO CellValue(21).
019        MOVE GENJND-MOD             TO CellValue(22).
070FIX*    MOVE GENJND-CMT2            TO CellValue(23).
019        MOVE GENJND-COMMIT          TO CellValue(24).
019        MOVE GENJND-TRNDATE         TO CellValue(25).
034        MOVE GENJND-CURR-INFO       TO CellValue(26).
70FIX      MOVE GENJND-SM-JNL          TO CellValue(27).
70FIX      MOVE GENJND-SM-INVREG       TO CellValue(28).
70FIX      MOVE GENJND-SM-REG          TO CellValue(29).
70FIX      MOVE GENJND-SM-ARINV        TO CellValue(30).
70FIX      MOVE GENJND-SM-APINV        TO CellValue(31).
70FIX      MOVE GENJND-SM-SUP          TO CellValue(32).
70FIX      MOVE GENJND-SM-CUS          TO CellValue(33).
70FIX      MOVE GENJND-SM-JNLREF       TO CellValue(34).
70FIX      MOVE GENJND-SM-CHECK        TO CellValue(35).
70FIX      MOVE GENJND-SM-BANK         TO CellValue(36).
70FIX      MOVE GENJND-SM-AP-BR        TO CellValue(37).
70FIX      MOVE GENJND-SM-AR-BR        TO CellValue(38).
70FIX      MOVE GENJND-SM-WH           TO CellValue(39).
70FIX      MOVE GENJND-SM-STOCK        TO CellValue(40).
70FIX      MOVE GENJND-SM-AREA         TO CellValue(41).
70FIX      MOVE GENJND-SM-TDESC        TO CellValue(42).
70FIX      MOVE GENJND-SM-ASSET        TO CellValue(43).
70FIX      MOVE GENJND-SM-GRN          TO CellValue(44).
70FIX      MOVE GENJND-SM-JOB          TO CellValue(45).
70FIX      MOVE GENJND-SM-OP           TO CellValue(46).
70FIX      MOVE GENJND-SM-WC           TO CellValue(47).
70FIX      MOVE GENJND-SM-EMP          TO CellValue(48).
70FIX      MOVE GENJND-SM-SORD         TO CellValue(49).
057        MOVE GENJND-DOC-DATE        TO CellValue(50).
064        MOVE GENJND-PAY-REF         TO CellValue(51).
072        MOVE GENJND-MULTI-CUR       TO CellValue(53).

072        IF GENJND-MULTI-CUR = "Y"
072            IF GENJND-COD = "C"
072                SUBTRACT GENJND-PAY-AMT FROM ZERO GIVING WS-AMOUNT
072                MOVE WS-AMOUNT      TO EDITED-TRNVALUE
072            ELSE
072                MOVE GENJND-PAY-AMT TO EDITED-TRNVALUE
072        ELSE
072            IF GENJND-COD = "C"
072                SUBTRACT GENJND-MC-FVAL FROM ZERO GIVING WS-AMOUNT
072                MOVE WS-AMOUNT      TO EDITED-TRNVALUE
072            ELSE
072                MOVE GENJND-MC-FVAL TO EDITED-TRNVALUE.
072        MOVE EDITED-TRNVALUE        TO CellValue(54).

072        IF GENJND-MULTI-CUR = "Y"
072            MOVE GENJND-PAY-CUR     TO CellValue(55)
072            MOVE GENJND-PAY-RTE     TO EDIT-RATE
072            MOVE EDIT-RATE          TO CellValue(56)
072            MOVE GENJND-PAY-MUL     TO CellValue(57)
072        ELSE
072            MOVE GENJND-MC-CUR      TO CellValue(55)
072            MOVE GENJND-MC-RATE     TO EDIT-RATE
072            MOVE EDIT-RATE          TO CellValue(56)
072            MOVE GENJND-MC-MUL      TO CellValue(57).

072        MOVE xtpTrue                TO CellHasCheckbox(58).
072        IF GENJND-MULTI-CUR = "Y"
072            MOVE xtpTrue            TO CellIsChecked(58)
072        ELSE
072            MOVE xtpFalse           TO CellIsChecked(58).

086a       move xtpTrue                to CellHasCheckBox(59)
086a       if genjnd-grp-pay = "Y"
086a         move xtpTrue              to CellIsChecked(59)
086a       else
086a         move xtpFalse             to CellIsChecked(59)
086a       end-if

086a       if genjnd-grp-pay = "Y"
086a         if genjnd-grp-val <> 0
086a           if genjnd-cod = "C"
086a             subtract genjnd-grp-val from zero
086a                                     giving ws-amount
086a             move ws-amount          to edited-trnvalue
086a           else
086a             move genjnd-grp-val     to edited-trnvalue
086a           end-if
086a           move edited-trnvalue      to CellValue(60)
086a         end-if

086a         move genjnd-grp-cur       to CellValue(61)

086a         move genjnd-grp-rte       to edit-rate
086a         move edit-rate            to CellValue(62)

086a         move xtpTrue              to CellHasCheckBox(63)
086a         if genjnd-grp-int = "Y"
086a           move xtpTrue            to CellIsChecked(63)
086a         else
086a           move xtpFalse           to CellIsChecked(63)
086a         end-if

086a         move genjnd-grp-sup       to CellValue(64)
086a         move genjnd-grp-supco     to CellValue(65)
086a         move genjnd-sec-supco     to CellValue(66)

086a         if genjnd-xref-crg <> 0
086a           move genjnd-xref-crg    to edit-10-val
086a           move edit-10-val        to CellValue(67)
             end-if

086a         move genjnd-ap-payno      to CellValue(68)
086a         move genjnd-grp-mul       to CellValue(69)
086a       end-if

086b       move xtpTrue                to CellHasCheckBox(70)
086b       if genjnd-interco <> spaces
086b         move xtpTrue              to CellIsChecked(70)
086b       else
086b         move xtpFalse             to CellIsChecked(70)
086b       end-if
086b       move genjnd-grp-cus         to CellValue(71)
086b       move genjnd-ar-payno        to CellValue(72)
086b       move "43050"                to CellHyperlinkEvent(72)
      *
           PERFORM InsertReportRow
065        PERFORM LOAD-CUSTOM-FORM-IN-GRID.
           GO TO LOAD-NORM-DET-NEXT.
       LOAD-NORM-DET-END.
      *
      *
      * Validate journal lines entred
       VALIDATE-DETAIL.
           MOVE "Y"           TO D-JOURNAL-VALID.
009        MOVE "N"           TO ZERO-LINES.
019        MOVE "N"           TO AP-CHK-FLAG.
      *
060a       IF GENCTL-AUTH = "Y"  AND D-S-FR-MSG = "POST-JNL"
.            IF GENJNC-AUTHORISED = "Y"
.             AND D-CHANGE-MAINT = "Y"
.              MOVE "N"     TO D-JOURNAL-VALID
.              MOVE "AUTH"  TO D-S-ERROR
.              STRING
.                "The changed journal entry cannot"  DELIMITED BY SIZE
                 " be posted as it requires"         DELIMITED BY SIZE
.                " re-authorization. "               DELIMITED BY SIZE
.                INTO LINK-EXTRA
.              END-STRING
.              MOVE "Change Not Authorized" TO LINK-MSG-HDG
.              MOVE 1       TO LINK-MSG-BUTTONS
.              MOVE "W"     TO LINK-MSG-ICON
.              MOVE SPACES  TO LINK-MSG-CHK
.              PERFORM INVOKE-MESSAGE-BOX
.            END-IF
060a       END-IF.
      *
           PERFORM VALIDATE-DETAIL-START THRU
                   VALIDATE-DETAIL-END.
009        IF ZERO-LINES = "Y"
009            MOVE "Zero value lines will be discarded." TO LINK-EXTRA
009            MOVE "Zero Value Lines" TO LINK-MSG-HDG
009            MOVE 2                  TO LINK-MSG-BUTTONS
009            MOVE "W"                TO LINK-MSG-ICON
009            MOVE SPACES             TO LINK-MSG-CHK
009            PERFORM INVOKE-MESSAGE-BOX
009            IF  LINK-MSG-RETURN = "2"
009                MOVE "N" TO D-JOURNAL-VALID
009                MOVE 1   TO D-EDIT-LINE
009                MOVE "ZERO" TO D-S-ERROR
009            END-IF
009        END-IF.
019   *
           IF  AP-CHK-FLAG = "Y"
019            MOVE "AP Check Number." TO LINK-MSG-HDG
019            MOVE "You have a zero value AP check number."
019                                    TO LINK-EXTRA
019            MOVE 2                  TO LINK-MSG-BUTTONS
019            MOVE "W"                TO LINK-MSG-ICON
019            MOVE SPACES             TO LINK-MSG-CHK
019            PERFORM INVOKE-MESSAGE-BOX
019            IF  LINK-MSG-RETURN = "2"
019                MOVE "N" TO D-JOURNAL-VALID
019                MOVE 1   TO D-EDIT-LINE
019                MOVE "ZERO" TO D-S-ERROR
019            END-IF
019        END-IF.
068a  *If selecting to delete the line, delete custom forms attached to
068a  *the line and re-add them again.This makes it easier to number the
068a  *add the entry numbers
068a       IF IMPFRM-COUNT > 0 AND DEL-CUS-FRM = "Y"
068a          AND D-CLOSE-FLAG = "Y"
068a          PERFORM DELETE-CUSTOM-FORMS.

       VALIDATE-DETAIL-START.
           MOVE "GENPJML1" TO xtpReportControl.
064   *    MOVE 51         TO xtpNumberColumns.
086a  *    MOVE 69         TO xtpNumberColumns.
086b       MOVE 72         TO xtpNumberColumns.
           PERFORM RetrieveReportControl.
           MOVE 0          TO D-EDIT-LINE.
       VALIDATE-DETAIL-NEXT.
           PERFORM RetrieveNextReportRecord.
065        IF NOT xtpAtOK
065           PERFORM CloseReportControl
065           GO TO VALIDATE-DETAIL-END.
065   
065        IF RecordRowCellText(1:10) = "CUSTOMFORM"
065           GO VALIDATE-DETAIL-NEXT
065        END-IF.

           ADD 1               TO D-EDIT-LINE.
           IF xtpAtOK
009           MOVE FUNCTION NUMVAL-C (CellValue(6)) TO TEMP-DR
009           MOVE FUNCTION NUMVAL-C (CellValue(7)) TO TEMP-CR
009           IF  TEMP-DR      NOT > ZEROES
009           AND TEMP-CR      NOT > ZEROES
009               MOVE "Y" TO ZERO-LINES
009           END-IF
              PERFORM VAL-INTER-START THRU
                      VAL-INTER-END
019           IF  ( D-JNC-JSRC NOT > SPACES
019           OR  D-JNC-TCD  NOT > SPACES )
              OR  D-S-FR-MSG = "POST-JNL"
                  PERFORM VAL-ANALYSIS-START
                     THRU VAL-ANALYSIS-END
019           END-IF
019           IF  D-JNC-JSRC = "AP" AND
019               D-JNC-TCD = "DSB" AND
019               D-S-FR-MSG = "POST-JNL"
019                PERFORM VALIDATE-AP-CHK-START
scamp              THRU VALIDATE-AP-CHK-END
019           END-IF
70fix         IF   CellValue(2) = "** missing **"
70fix         AND  D-S-FR-MSG = "POST-JNL"
70fix              MOVE "miss"     TO D-S-ERROR
70fix              MOVE "N"         TO D-JOURNAL-VALID
70fix         END-IF
              IF   CellValue(2) NOT = SPACES
                   PERFORM VALIDATE-GL-START
                     THRU VALIDATE-GL-END
              END-IF
062           IF   CellValue(4) NOT = SPACES
062                PERFORM VALIDATE-DATE-START
062                THRU VALIDATE-DATE-END
062           END-IF
              IF   D-S-ERROR NOT = SPACES
                   PERFORM DeleteReportControl
                   GO TO   VALIDATE-DETAIL-END
              END-IF
              GO TO VALIDATE-DETAIL-NEXT.
      *

           PERFORM CloseReportControl.
      *
       VALIDATE-DETAIL-END.
062   *
062    VALIDATE-DATE-START.
           MOVE FUNCTION NUMVAL ( CellValue(4) )  TO DATE-CCYYMMDD.
           PERFORM IS-DATE-VALID-CYMD.
           IF  DATE-VALID = "Y"
               GO TO VALIDATE-DATE-END.
           MOVE "Invalid"     TO D-S-ERROR.
           MOVE "N"           TO D-JOURNAL-VALID.
           MOVE "Transaction Date" to LINK-MSG-HDG
           STRING "Invalid date format. Date must be "
                                           DELIMITED BY SIZE
                  "in CCYY-MM-DD format."
                                           INTO LINK-EXTRA
               MOVE LINK-MSG-HDG           TO D-S-ERROR
               PERFORM INVOKE-MESSAGE-BOX.
       VALIDATE-DATE-END.
      *
      * Check that the ledger code entered is valied
       VALIDATE-GL-START.
007   * GENPGV does not allow you to access a gain loss account
007   * For alternate currency balancing transaction we will always
007   * have a gain/loss account. Do own validating of G/L code.
007        IF   D-JNL-TYPE = "L"
007        AND  CellValue(8) = "Revaluation"
007             MOVE COMPID       TO GENMST-CMP
007             MOVE CellValue(2) TO GENMST-ACC
007             PERFORM GENMST-READ
007             IF STAT-OK
007                IF GENMST-HOLD = "Y"
007                   MOVE "N" TO D-JOURNAL-VALID
007                   MOVE "HOLD" TO D-S-ERROR
007                END-IF
007             ELSE
007                MOVE "NOTF" TO D-S-ERROR
007                MOVE "N" TO D-JOURNAL-VALID
007             END-IF
007             GO TO VALIDATE-GL-END.
           MOVE CellValue(2)   TO D-GL-LEDGER-CODE(1).
           MOVE "P"            TO D-GL-SECURITY(1).
           MOVE "W"            TO D-GL-FUNCTION(1).
           MOVE "GJL"          TO D-GL-PROCESS-TYPE(1).
           IF   D-JNL-TYPE = "S"
                MOVE "STA"     TO D-GL-PROCESS-TYPE(1).
039b       IF   GENJNC-JSRC > SPACES
039b            MOVE "   "     TO D-GL-PROCESS-TYPE(1).
           MOVE D-GL-FIELDS    TO LINK-EXTRA.
           MOVE "GENPGV"       TO WW-PROG-NAME.
           PERFORM CALL-PROGRAM.
           MOVE LINK-EXTRA     TO D-GL-FIELDS.
           MOVE SPACES         TO LINK-EXTRA.
      *
           IF D-GL-RESULT(1) NOT = 0
              MOVE "N"       TO D-JOURNAL-VALID
              MOVE "Invalid" TO D-S-ERROR.
       VALIDATE-GL-END.
      *
       VAL-ANALYSIS-START.
107   ** If posting to previous years, ignore analysis
107       if postPrev = "Y"
107         go to val-analysis-end
107       end-if.
040
040   * Read GENMST to to find out if this code needs analysis
040        MOVE COMPID       TO GENMST-CMP.
040        MOVE CellValue(2) TO GENMST-ACC.
040        PERFORM GENMST-READ.
040        IF  NOT STAT-OK
040            GO TO VAL-ANALYSIS-END.
040        PERFORM COMER.
040   *
040   * Read the analysis entry to get the analysis details
040        MOVE COMPID         TO GENADC-CMP.
040        MOVE D-JNL-YEAR     TO GENADC-YEAR.
040        MOVE D-JNL-PER      TO GENADC-PER.
043        MOVE function numval (CellValue(11))  TO GENADC-AENTRY.
040        PERFORM GENADC-READ.
040        IF NOT STAT-OK
043           IF  GENMST-ANAREQ = "Y"
043               MOVE "N"        TO D-JOURNAL-VALID
043               MOVE "ana"      TO D-S-ERROR
043           END-IF
040           GO TO VAL-ANALYSIS-END.
040        PERFORM COMER.
040   *
040   * Check to see that ledger codes are the same
040        IF  GENMST-ANAREQ = "Y"
040        AND GENADC-ACC      <> CellValue(2)
040            MOVE SPACES     TO CellValue(11)
040            MOVE SPACES     TO CellValue(13).
040   *
040   * Make sure you have not entered analysis when not required
040        IF  GENMST-ANAREQ <> "Y"
040        AND CellValue(13) > SPACES
040            MOVE SPACES     TO CellValue(11)
040            MOVE SPACES     TO CellValue(13).
           IF  CellValue(13) = SPACES
               GO TO VAL-ANALYSIS-END.
      *
           MOVE CellValue(13)(6:20)  TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM-VAL        TO WS-NUM-VAL.
      *
017   *    IF   CellValue(6) > ZEROES
017        IF   TEMP-DR > ZEROES
                MOVE CellValue(6) TO NUMB-R
                PERFORM NUMB-CHECK
                MOVE NUM-VAL    TO WS-CALC-VALUE
           ELSE
                MOVE CellValue(7) TO NUMB-R
                PERFORM NUMB-CHECK
                MOVE NUM-VAL    TO WS-CALC-VALUE
                COMPUTE WS-CALC-VALUE = WS-CALC-VALUE * -1.
      *
013        IF  CellValue(13) = "Edit"
013        AND WS-CALC-VALUE <> ZEROES
013            MOVE "ana"      TO D-S-ERROR
013            MOVE "N"        TO D-JOURNAL-VALID
013            GO TO   VAL-ANALYSIS-END.
      *
           IF  WS-NUM-VAL NOT = WS-CALC-VALUE
               MOVE "N"        TO D-JOURNAL-VALID
               MOVE "ana"      TO D-S-ERROR.
       VAL-ANALYSIS-END.
      *
       VAL-INTER-START.
           MOVE CellValue(16) TO STORE-CELL-16.
           IF   CellValue(16) = "Browse"
                MOVE SPACES   TO STORE-CELL-16.
           MOVE CellValue(17) TO STORE-CELL-17.
           IF   CellValue(17) = "Browse"
                MOVE SPACES   TO STORE-CELL-17.

           IF  CellValue(14) = "1"
           AND ( CellValue(15) NOT > SPACES
           OR    STORE-CELL-16 NOT > SPACES
           OR    STORE-CELL-17 NOT > SPACES )
               MOVE "N"         TO D-JOURNAL-VALID
               MOVE "INTER"     TO D-S-ERROR
               GO TO VAL-INTER-END.
      *
           IF  CellValue(14) NOT = "1"
           AND ( CellValue(15) > SPACES
           OR    STORE-CELL-16 > SPACES
           OR    STORE-CELL-17 > SPACES )
               MOVE "INTER"     TO D-S-ERROR
               MOVE "N"         TO D-JOURNAL-VALID
               GO TO VAL-INTER-END.
      *
047        IF  CellValue(15) > SPACES
               MOVE CellValue(15) TO D-CHANGED-TEXT(15)
               MOVE SPACES TO D-S-ERROR
               PERFORM CHECK-COMP
               IF  D-S-ERROR > SPACES
                   MOVE "N" TO D-JOURNAL-VALID
                   GO TO VAL-INTER-END.
       VAL-INTER-END.
      *
019    VALIDATE-AP-CHK-START.
019        MOVE CellValue(8)    TO WS-COMMENT.
019        IF  WS-COMMENT(11:4) NOT = "Chq:"
019            GO TO VALIDATE-AP-CHK-END.
019   *
009        IF  WS-COMMENT(15:6) NOT = "000000"
009            GO TO VALIDATE-AP-CHK-END.
019        MOVE "Y"              TO AP-CHK-FLAG.
019    VALIDATE-AP-CHK-END.
      *
      * Check if posting period is already closed *
       CHK-PTO.
           IF D-TO-YEAR = SAV-G00YEAR
              IF GENCTL-CFLAG(D-TO-PER) = "C"
                 MOVE "xx" TO D-S-ERROR.
           IF D-TO-YEAR = SAV-G00YEAR - 1
              IF GENCTL-PFLAG(D-TO-PER) = "C"
                 MOVE "xx" TO D-S-ERROR.
      *
      * Check if posting period is already closed *
036    CHK-STD-PRD.
           MOVE D-JNL-YEAR TO D-JNL-YEAR-X.
           MOVE D-JNL-PER  TO D-JNL-PER-X.
           IF D-JNL-YEAR = SAV-G00YEAR
              IF GENCTL-CFLAG(D-JNL-PER) = "C"
                 MOVE "xx" TO D-S-ERROR.
           IF D-JNL-YEAR = SAV-G00YEAR - 1
              IF GENCTL-PFLAG(D-JNL-PER) = "C"
                 MOVE "xx" TO D-S-ERROR.

      **>--------------------------------------------------------------
      * Check if posting period is already closed *
       chk-prd.
107        perform chk-prd-start thru chk-prd-end.

107    chk-prd-start.
           move d-jnl-year-x    to d-jnl-year.
           move d-jnl-per-x     to d-jnl-per.
           
      * For current year
           if d-jnl-year = sav-g00year
             if genctl-cflag(d-jnl-per) = "C"
               move "xx"        to d-s-error
107            go to chk-prd-end
107          end-if
107        end-if.
                 
      * For previous 1 year
           if d-jnl-year = sav-g00year - 1
             if genctl-pflag(d-jnl-per) = "C"
               move "xx"        to d-s-error
107            go to chk-prd-end
107          end-if
107        end-if.

                 
107   * For previous 2, 3, 4 or 5 years
107   * - xx-prev - Period not defined for previous year selected
107   * - xx      - This period is closed
107        if postPrev = "Y"
107          perform genpyr-initialize-rec
107          move compID        to genpyr-cmp
107          move d-jnl-year    to genpyr-year
107          perform genpyr-read
107          if not stat-ok
107            move "xx-prev"   to d-s-error
107          else
107            perform comer
107            if genpyr-pflag(d-jnl-per) = spaces
107              move "xx-prev" to d-s-error
107            end-if
107            if genpyr-pflag(d-jnl-per) = "C"
107              move "xx-OC"   to d-s-error
107            end-if
107          end-if
107        end-if.

107    chk-prd-end.
      *
079   *CHK-FR-PRD.
079   *  MOVE D-FROM-YEAR  TO D-JNL-YEAR.
079   *  MOVE D-FROM-PER   TO D-JNL-PER.
079   *  IF D-JNL-YEAR = SAV-G00YEAR
079   *     IF GENCTL-CFLAG(D-JNL-PER) = "C"
079   *        MOVE "xx" TO D-S-ERROR.
079   *  IF D-JNL-YEAR = SAV-G00YEAR - 1
079   *     IF GENCTL-PFLAG(D-JNL-PER) = "C"
079   *        MOVE "xx" TO D-S-ERROR.
      *
071    CHK-TO-PRD.
071      MOVE D-TO-YEAR  TO D-JNL-YEAR.
071      MOVE D-TO-PER   TO D-JNL-PER.
071      IF D-JNL-YEAR = SAV-G00YEAR
071         IF GENCTL-CFLAG(D-JNL-PER) = "C"
071            MOVE "xx" TO D-S-ERROR.
071      IF D-JNL-YEAR = SAV-G00YEAR - 1
071         IF GENCTL-PFLAG(D-JNL-PER) = "C"
071            MOVE "xx" TO D-S-ERROR.
      *
      * ----------------------------------------------------------------
      * - Check that validate year was entered.
107   * - If a previous year 2-5 has been selected, check to see that
107   *   the year is valid
107   * - Check that the previous year is defined on GENPYR
       chk-yr.
107        perform chk-yr-start thru chk-yr-end.

107    chk-yr-start.
           move d-jnl-year-x    to d-jnl-year.
107        move spaces          to d-s-error.
107        move zeroes          to postPrevYear.
107        move "N"             to postPrev.

107   ** if allow GL posting to previous 5 years is allowed, see
107   ** whether this is such a posting
107        if d-esigs-post-prev = "Y"
107          compute postPrevYear = genctl-year - d-jnl-year
107          if postPrevYear = 2 or 3 or 4 or 5
107            move "Y"         to postPrev
107          end-if
107        end-if.
           
107        if postPrev = "N"
             if d-jnl-year not = d-add-yr(1) and
                d-jnl-year not = d-add-yr(2) and
                d-jnl-year not = d-add-yr(3)
                 move "XX"      to d-s-error
             end-if
107          go to chk-yr-end
107        end-if.

107   * For previous 5 years
107   * - validate that the year entered is valid for 5 previous years
107        if d-jnl-year not = d-add-yr(4) and
107           d-jnl-year not = d-add-yr(5) and
107           d-jnl-year not = d-add-yr(6) and
107           d-jnl-year not = d-add-yr(7)
107            move "XX"        to d-s-error
107            go to chk-yr-end
107        end-if.

107   ** - check that the year is defined on GENPYR
107        perform genpyr-initialize-rec.
107        move compID          to genpyr-cmp.
107        move d-jnl-year      to genpyr-year.
107        perform genpyr-read.
107        if not stat-ok
107           move "xx-prev"    to d-s-error
107           go to chk-yr-end
107        end-if.

107   ** - also check that the period is valid and open
107        perform chk-prd.

107    chk-yr-end.

      * ----------------------------------------------------------------
      * Check that valid auth year was entered
       auth-yr.
107        perform auth-yr-start thru auth-yr-end.
107
107    auth-yr-start.
107        move d-auth-year-x to d-auth-year.
107        
107        if d-auth-year = d-add-yr(1) or 
107                         d-add-yr(2) or 
107                         d-add-yr(3)
107          go to auth-yr-end
107        else
107          move "XX" to d-s-error
107        end-if.
107
107        if d-esigs-post-prev = "Y"
107          move spaces to d-s-error
107          if d-auth-year = d-add-yr(4) or
107                           d-add-yr(5) or
107                           d-add-yr(6) or
107                           d-add-yr(7)   
107            go to auth-yr-end
107          else
107            move "XX" to d-s-error
107          end-if
107        end-if.
107
107       auth-yr-end.
      *
      * Routine to browse on a journal number *
       BROWSE-JOURNAL.
           IF D-S-FR-MSG NOT = "B2-GB4"
               MOVE D-JNL-YEAR-X TO D-JNL-YEAR
               MOVE D-JNL-PER-X  TO D-JNL-PER
               MOVE D-JNL-NO-X   TO D-JNL-NO.
           IF D-S-FR-MSG = "BRW-G4A"
058        OR D-S-FR-MSG = "FRM-G4A"
               MOVE D-FROM-YEAR  TO D-JNL-YEAR
               MOVE D-FROM-PER   TO D-JNL-PER
               MOVE D-FROM-JNL   TO D-JNL-NO.
           MOVE SPACES      TO LINK-BROWSE.
           MOVE D-JNL-NO    TO LINK-BRW-1-N.
           MOVE SPACES      TO LINK-2.
           MOVE D-JNL-YEAR  TO LINK-YEAR.
           MOVE D-JNL-PER   TO LINK-PER.
           MOVE LINK-2      TO LINK-BRW-2-N.
           MOVE "GENPB4"    TO WW-PROG-NAME.
           MOVE "B"         TO LINK-BRW-ENQ.
           PERFORM CALL-PROGRAM.
           IF LINK-BRW-RET NOT = SPACES
              MOVE "xx"           TO D-S-TO-PAR
026a          MOVE LINK-BRW-RET   TO RETURN-LINK
              MOVE RETURN-JNL     TO D-JNL-NO
026c          MOVE RETURN-JNL     TO D-JNL-NO-X
              MOVE RETURN-PER     TO D-JNL-PER-X
067                                  D-JNL-PER
026a          MOVE RETURN-YEAR    TO D-JNL-YEAR
026a                                 D-JNL-YEAR-X.
      *
107        if d-esigs-post-prev not = "Y"
045c         if d-jnl-year not = d-menu-yrs(1) and
045c            d-jnl-year not = d-menu-yrs(2) and
045c            d-jnl-year not = d-menu-yrs(3) and
045c            d-jnl-year > zeroes            and
048             d-s-fr-msg not = "FRM-G4A"
045c            move "Journal Year"     to link-msg-hdg
045c            string "You may only maintain current, "
045c                   "next or previous year 1 journals."
045c                                       delimited by size
045c                                  into link-extra
107             end-string
045c            perform invoke-message-box
045c            move "year"             to d-s-error
107          end-if
107        end-if.

107        if d-esigs-post-prev = "Y"
107          if d-jnl-year not = d-menu-yrs(1) and
107             d-jnl-year not = d-menu-yrs(2) and
107             d-jnl-year not = d-menu-yrs(3) and
107             d-jnl-year not = d-menu-yrs(4) and
107             d-jnl-year not = d-menu-yrs(5) and
107             d-jnl-year not = d-menu-yrs(6) and
107             d-jnl-year not = d-menu-yrs(7) and
107             d-jnl-year > zeroes            and
107             d-s-fr-msg not = "FRM-G4A"
107             move "Journal Year" to link-msg-hdg
107             string "You may only maintain current, "
107                    "next, previous year 1, 2, 3, 4 or 5 "
107                    "journals."
107                                    delimited by size
107                               into link-extra
107             end-string
107             perform invoke-message-box
107             move "year"         to d-s-error
107          end-if
107        end-if.

107   ** if allow GL posting to previous 5 years is allowed, see
107   ** whether this is such a posting
107        move "N"             to postPrev.
107        if d-esigs-post-prev = "Y"
107          compute postPrevYear = genctl-year - d-jnl-year
107          if postPrevYear = 2 or 3 or 4 or 5
107            move "Y"         to postPrev
107          end-if
107        end-if.

           MOVE SPACES TO LINK-EXTRA.
      *
      *****************************************************************
      **  Routine to call Notepad (IMPNOT) to have RTF file moved    **
      **  to client (in c/s system) and return path to RTF file      **
      **  Input  : d-customer      Customer code                     **
      **  Output : d-rtf-file-name Name of rtf file                  **
      *****************************************************************
       READ-NOTEPAD.
           MOVE SPACES      TO LINK-EXTRA.
           MOVE "CRTF"      TO LINK-EXTRA-1.
           MOVE "GJ"        TO LINK-EXTRA-2.
           MOVE GENJNC-KEY  TO LINK-BROWSE.
      *
           MOVE "IMPNOT"   TO WW-PROG-NAME.
           PERFORM CALL-PROGRAM-NO-CANCEL.
           MOVE LINK-EXTRA         TO D-RTF-FILE-NAME.
           MOVE LINK-CLIENT-SERVER TO D-RTF-CLIENT-SERVER.
           MOVE SPACES     TO LINK-EXTRA.
      *
       CLEAR-NOTEPAD.
           MOVE SPACES      TO LINK-EXTRA.
           MOVE "CRTF"      TO LINK-EXTRA-1.
           MOVE "GJ"        TO LINK-EXTRA-2.
           MOVE SPACES      TO LINK-BROWSE.
      *
           MOVE "IMPNOT"   TO WW-PROG-NAME.
           PERFORM CALL-PROGRAM-NO-CANCEL.
           MOVE LINK-EXTRA         TO D-RTF-FILE-NAME.
           MOVE LINK-CLIENT-SERVER TO D-RTF-CLIENT-SERVER.
           MOVE SPACES     TO LINK-EXTRA.
      *
      * Create default values when a blank row inserted into the ledger
      * entries grid control
       CREATE-LEDGER-RECORD-DEFAULTS.
           move "GENPJML1" to xtpReportControl
064   *    MOVE 51         TO xtpNumberColumns
086a  *    MOVE 69         TO xtpNumberColumns
086b       MOVE 72         TO xtpNumberColumns
           perform CreateReportControl
      *
               *> Create default values when inserting a blank row
           move spaces       to RecordRow
033        IF  D-PASSED-LEDGER-CODE > SPACES
033            move xtpFalse      to RecordBlankRowDefaults
033        ELSE
               move xtpTrue      to RecordBlankRowDefaults
033        END-IF.
      *
           MOVE D-JNL-DATE           TO DATE-NORMAL.
           PERFORM DATE-TO-CYMD.
033        IF   D-PASSED-LEDGER-CODE > SPACES
033             MOVE D-PASSED-LEDGER-CODE TO CellValue(2).
      *
70OK       MOVE DATE-CCYYMMDD        TO CellValue(4)(1:8).
70FIX      MOVE D-JNL-REF            TO CellValue(5).
           MOVE D-JNL-NOTE           TO CellValue(8).
           MOVE SPACES               TO CellValue(11).
           MOVE SPACES               TO CellValue(13).
70FIX      MOVE "Edit"               TO CellValue(13).
           MOVE "43043"              TO CellHyperlinkEvent(13).
           MOVE xtpTrue              TO CellHasCheckBox(14).
      *
           IF   D-JNL-TYPE = "I"
                MOVE xtpTrue         TO CellEditable(14)
                MOVE xtpTrue         TO CellEditable(15)
                MOVE xtpTrue         TO CellEditable(16)
                MOVE xtpTrue         TO CellEditable(17)
           ELSE
                MOVE xtpFalse        TO CellEditable(14)
                MOVE xtpFalse        TO CellEditable(15)
                MOVE xtpFalse        TO CellEditable(16)
                MOVE xtpFalse        TO CellEditable(17).
           perform InsertReportRow.
      *
           perform FinishReportControl.
      *
      ** ---------------------------------------------------------------
      * Use this routine to call GENTJL to capture, change and post
       CALL-JOURNAL-BO.
           PERFORM CALL-JNL-START THRU CALL-JNL-END.

           MOVE D-VALID-POST      TO D-JOURNAL-VALID.
      *
       CALL-JNL-START.
      ** New journal
103        if ws-jnl-func = spaces and d-entry-mode = "N"
103          perform genjnd-initialize-rec
103          move zeroes to dim-dentry
103        end-if.

      ** Authorising a journal
104        if ws-jnl-func = "A"
104          perform genjnd-initialize-rec
104          move zeroes to dim-dentry
104        end-if.

           PERFORM SETUP-XML-PARAMETER.
           PERFORM SET-XML-IN.
      *
           IF WS-JNL-FUNC = SPACES
           AND D-ENTRY-MODE = "N"
               MOVE "NORM-ADD"    TO ESIG-TYPE.
      *
           IF WS-JNL-FUNC = SPACES
           AND D-ENTRY-MODE = "M"
               MOVE "NORM-MAINT"  TO ESIG-TYPE.
      *
           IF WS-JNL-FUNC = "A"
               MOVE "NORM-AUTH"   TO ESIG-TYPE
           ELSE
           IF WS-JNL-FUNC = "U"
               MOVE "NORM-UNAUTH" TO ESIG-TYPE
           ELSE
           IF WS-JNL-FUNC = "H"
               MOVE "NORM-HOLD"   TO ESIG-TYPE
           ELSE
           IF WS-JNL-FUNC = "C"
               MOVE "NORM-CANCEL" TO ESIG-TYPE
           ELSE
           IF WS-JNL-FUNC = "R"
               MOVE "NORM-REL"    TO ESIG-TYPE
           ELSE
           IF WS-JNL-FUNC = "P"
               MOVE "NORM-POST"   TO ESIG-TYPE.
      *
107        if postPrev = "Y"
107          if esig-type = "NORM-POST"
107            move "POST-PREV-POST" to esig-type
107          end-if
107        end-if.

           PERFORM ESIGNATURES-PRIOR.
           IF   D-S-ERROR = "sig-err"
083             PERFORM MAINT-NORMAL-JNL
                GO TO CALL-JNL-END.
      *
           PERFORM  GENJNC-UNLOCK.
      *
003        MOVE SPACES     TO GENJNC-KEY.
003        MOVE D-JNL-YEAR TO GENJNC-YEAR.
003        MOVE D-JNL-PER  TO GENJNC-PER.
003        MOVE D-JNL-NO   TO GENJNC-JNL.
003        PERFORM GENJNC-READ.
003        IF TIMESTAMP-SAV NOT = TIMESTAMP-BIN
003        AND D-ENTRY-MODE = "M"
003           MOVE "T/stamp" TO D-S-ERROR
003           GO TO CALL-JNL-END.

      *
           MOVE SPACES         TO LINK-EXTRA.
           MOVE "GENTJL"       TO WW-PROG-NAME.
           PERFORM CALL-BO-POST.
      **  Check for any exceptions - error message is in LINK-EXTRA
      **  We will use a simple Message box for the exception message
           IF LINK-COM-RETURN <> ZEROS
               MOVE LINK-COM-RETURN TO EDIT-EXCEPTION-NUM
               MOVE SPACES TO LINK-MSG-HDG
               STRING "Exception Raised (" DELIMITED BY SIZE
                      EDIT-EXCEPTION       DELIMITED BY SIZE
                      ")"                  DELIMITED BY SIZE
                  INTO LINK-MSG-HDG
               MOVE LINK-MSG-HDG       TO D-S-ERROR
               MOVE LINK-MSG-HDG       TO LINK-MSG-HDG
               PERFORM INVOKE-MESSAGE-BOX
               MOVE "N"    TO D-VALID-POST
               MOVE ZEROS  TO LINK-COM-RETURN
               MOVE SPACES TO LINK-EXTRA
               GO TO CALL-JNL-END.
      *
      **  Parse the XML - if invalid then goes to endjob with exception
      **  If valid this returns the number of nodes
           SET COMPAR-OBJECT TO COMPS2-XMLOUT.
           MOVE "N" TO COMPAR-TO-ENDJOB.
           PERFORM COMPAR-PARSE-XML.
           MOVE "Y" TO COMPAR-TO-ENDJOB.
           IF LINK-COM-RETURN <> ZERO
               MOVE "XML Parsing Message" TO LINK-MSG-HDG
               MOVE LINK-MSG-HDG          TO D-S-ERROR
               PERFORM INVOKE-MESSAGE-BOX
               MOVE "N"    TO D-VALID-POST
               MOVE ZEROS  TO LINK-COM-RETURN
               MOVE SPACES TO LINK-EXTRA
               GO TO CALL-JNL-END.
      *
      **  Select the single node 'ledgerdistributionnumber'
           MOVE "ledgerdistributionnumber" TO COMPAR-QUERY.
           PERFORM COMPAR-SELECT-SINGLE-NODE.
      *
           IF COMPAR-SINGLE-VALUE <> HIGH-VALUES
              MOVE COMPAR-SINGLE-VALUE TO WS-ALPHA-NUM.
           IF  WS-ALPHA-NUM > SPACES
               MOVE WS-ALPHA-NUM       TO NUMB-R
               PERFORM NUMB-CHECK
               MOVE NUM-VAL            TO D-EDIT-LINE.
      *
      **  Select the single node 'ErrorDescription'
           MOVE "errordescription" TO COMPAR-QUERY.
           PERFORM COMPAR-SELECT-SINGLE-NODE.
      *
           IF COMPAR-SINGLE-VALUE <> HIGH-VALUES
               MOVE SPACES TO LINK-MSG-HDG
               STRING "ErrorDescription Returned" DELIMITED BY SIZE
                  INTO LINK-MSG-HDG
               MOVE COMPAR-SINGLE-VALUE TO LINK-EXTRA
               MOVE LINK-MSG-HDG        TO D-S-ERROR
               PERFORM INVOKE-MESSAGE-BOX
               MOVE "N"    TO D-VALID-POST
               MOVE ZEROS  TO LINK-COM-RETURN
               MOVE SPACES TO LINK-EXTRA
               GO TO CALL-JNL-END.
      *
      **  Select the single node 'customerponumber'
           MOVE "gljournal" TO COMPAR-QUERY.
           PERFORM COMPAR-SELECT-SINGLE-NODE.
           MOVE "Y"                 TO D-VALID-POST.
           MOVE COMPAR-SINGLE-VALUE TO D-JNL-NO-X.
           MOVE D-JNL-NO-X          TO D-JNL-NO.
      *
           MOVE SPACES  TO GENJNC-REC.
           MOVE D-JNL-YEAR   TO GENJNC-YEAR.
           MOVE D-JNL-PER    TO GENJNC-PER.
           MOVE D-JNL-NO     TO GENJNC-JNL.
           PERFORM GENJNC-READ.
           IF NOT STAT-OK
               GO TO CALL-JNL-END.
           PERFORM COMER.
      *
           IF  WS-JNL-FUNC = "P"
               MOVE 1 TO ANY-JOURNALS-POSTED.
      *
           PERFORM DELETE-ANALYSIS-START THRU
                   DELETE-ANALYSIS-END
                   VARYING WS-DEL-ENTRY-SUB FROM 1 BY 1
                   UNTIL   WS-DEL-ENTRY-SUB > 5000
                   OR  WS-DEL-ANALYSIS(WS-DEL-ENTRY-SUB) NOT > ZEROES.
           PERFORM CLEAR-DEL-ENT.
      *
052   *    PERFORM ESIGNATURES-COMPLETE.
029A  *
029A       IF  D-ENTRY-MODE = "N"
029A       AND GENJNC-JTYP = "N"
029A           PERFORM JNL-TRIGGER.
068a  * Do this only if there are custom forms
068a       IF IMPFRM-COUNT > 0
054cus         PERFORM EXTRACT-CUSTOM-FORMS THRU
065                            EXTRACT-CUSTOM-FORMS-END.
      *
      *
       CALL-JNL-END.
052        IF  D-S-ERROR <> "sig-err"
052            PERFORM ESIGNATURES-COMPLETE.
      *
      ** ---------------------------------------------------------------
      * Create parameters for business object
       SETUP-XML-PARAMETER.
      * Create XmlParameters string to call GENTJL
      * <PostGlJournal>
      *  <Parameters>
      *   <IgnoreWarnings>N</IgnoreWarnings>
      *   <ApplyIfEntireDocumentValid>Y</ApplyIfEntireDocumentValid>
      *   <ValidateOnly>N</ValidateOnly>
      *   <ActionType>A</ActionType>
      *   <ValidatePasswords>Y</ValidatePasswords>
      *   <DeleteEntriesOnMaint>N<DeleteEntriesOnMaint>
      *  </Parameters>
      * </PostGlJournal>
      *
           MOVE "PostGlJournal"    TO XML-ROOT-NAME.
           PERFORM CREATE-XML-HEADER.
      *
           MOVE "<Parameters>"     TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
           MOVE "IgnoreWarnings"   TO XML-TAG-NAME.
           MOVE "Y"                TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "ApplyIfEntireDocumentValid"
                                   TO XML-TAG-NAME.
           MOVE "N"                TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "ValidateOnly"     TO XML-TAG-NAME.
           MOVE "N"                TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "ActionType"       TO XML-TAG-NAME.
           IF  D-ENTRY-MODE = "N"
               MOVE "A"            TO XML-TAG-VALUE
           ELSE
               MOVE "M"            TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "ValidatePasswords" TO XML-TAG-NAME.
           MOVE "N"                TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "DeleteEntriesOnMaint" TO XML-TAG-NAME.
           MOVE "Y"                TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
019        MOVE "RTGL"             TO XML-TAG-NAME.
019        IF  D-JNC-JSRC > SPACES
019        AND D-JNC-TCD  > SPACES
019            MOVE "Y"            TO XML-TAG-VALUE
019        ELSE
               MOVE "N"            TO XML-TAG-VALUE.
019        PERFORM OUTPUT-ELEMENT.
      *
           MOVE "</Parameters>"    TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
           MOVE "</PostGlJournal>" TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
           PERFORM ARRAY-FINAL-CREATE.
           SET  COMPS2-PARAMETERS  TO ARRAY-OBJECT.
           SET  ARRAY-OBJECT       TO NULL.
      *
      * Create XML in for business object
       SET-XML-IN.
           PERFORM SET-XML-IN-START
              THRU SET-XML-IN-END.
      *
       SET-XML-IN-START.
      * Create XmlIn string to call GENTJL.
      * <PostGlJournal>
      *   <Item>
      *     <JournalType>N</JournalType>
      *     <JournalNumber/>
      *     <AuthorizeJournal>D</AuthorizeJournal>
      *     <PostJournal>N</PostJournal>
      *     <CancelJournal>N</CancelJournal>
      *     <HoldJournal>N</HoldJournal>
      *     <JournalDate/>
      *     <JournalReference>Journal reference goes here</JournalReference>
      *     <Notation>This is the notation </Notation>
      *     <PostingPeriod>02</PostingPeriod>
      *     <PostingYear>2007</PostingYear>
      *     <SourceCode/>
      *     <Currency/>
      *     <JournalDetails>
      *       <EntryNumber/>
      *       <LedgerCode>00-1010</LedgerCode>
      *       <LedgerCodePassword/>
      *       <Date/>
      *       <Reference>54321</Reference>
      *       <EntryAmount>100.00</EntryAmount>
      *       <DeleteEntry/>
      *       <Comment>Transfer to petty cash</Comment>
      *     </JournalDetails>
      *   </Item>
      * </PostGlJournal>
      *
           MOVE "PostGlJournal"    TO XML-ROOT-NAME.
           PERFORM CREATE-XML-HEADER.
      *
           MOVE "<Item>"           TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
           MOVE "JournalType"      TO XML-TAG-NAME.
           MOVE D-JNL-TYPE         TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "JournalNumber"    TO XML-TAG-NAME.
           IF  D-ENTRY-MODE = "N"
               MOVE SPACES         TO XML-TAG-VALUE
           ELSE
               MOVE D-JNL-NO       TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           IF  WS-JNL-FUNC = "A"
               MOVE "AuthorizeJournal" TO XML-TAG-NAME
               MOVE "A"                TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
           IF  WS-JNL-FUNC = "U"
               MOVE "AuthorizeJournal" TO XML-TAG-NAME
               MOVE "U"                TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
           IF  WS-JNL-FUNC = "P"
               MOVE "PostJournal"      TO XML-TAG-NAME
               MOVE "Y"                TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
           IF  WS-JNL-FUNC = "C"
               MOVE "CancelJournal"    TO XML-TAG-NAME
               MOVE "Y"                TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
           IF  WS-JNL-FUNC = "H"
               MOVE "HoldJournal"      TO XML-TAG-NAME
               MOVE "Y"                TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
           IF  WS-JNL-FUNC = "R"
               MOVE "HoldJournal"      TO XML-TAG-NAME
               MOVE "N"                TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
           MOVE "JournalDate"      TO XML-TAG-NAME.
           MOVE D-JNL-DATE         TO DATE-NORMAL.
           PERFORM DATE-TO-CYMD.
           MOVE DATE-CCYYMMDD      TO ARRAY-EDITED-DATE.
           PERFORM OUTPUT-ELEMENT-DATE.
      *
           MOVE "JournalReference" TO XML-TAG-NAME.
           MOVE D-JNL-REF          TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "Notation"         TO XML-TAG-NAME.
           MOVE D-JNL-NOTE         TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "PostingPeriod"    TO XML-TAG-NAME.
           MOVE D-JNL-PER          TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "PostingYear"      TO XML-TAG-NAME.
           MOVE D-JNL-YEAR         TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "SourceCode"       TO XML-TAG-NAME.
           MOVE D-JNLSCODE         TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "Currency"         TO XML-TAG-NAME.
           MOVE D-CURR             TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
019   *
019        MOVE "Source"           TO XML-TAG-NAME.
019        MOVE D-JNC-JSRC         TO XML-TAG-VALUE.
019        PERFORM OUTPUT-ELEMENT.
019   *
019        MOVE "Type"             TO XML-TAG-NAME.
019        MOVE D-JNC-TCD          TO XML-TAG-VALUE.
019        PERFORM OUTPUT-ELEMENT.
      *
           MOVE 0          TO DETAIL-ENT.
           MOVE "GENPJML1" TO xtpReportControl.
064   *    MOVE 51         TO xtpNumberColumns
086a  *    MOVE 69         TO xtpNumberColumns
086b       MOVE 72         TO xtpNumberColumns
           PERFORM RetrieveReportControl.
      *
       SET-XML-IN-NEXT.
           PERFORM RetrieveNextReportRecord
           IF xtpAtOK
009           MOVE FUNCTION NUMVAL-C (CellValue(6)) TO TEMP-DR
009           MOVE FUNCTION NUMVAL-C (CellValue(7)) TO TEMP-CR
009           IF  WS-JNL-FUNC NOT = "P"
009           AND WS-JNL-FUNC NOT = " "
scamp             PERFORM INSERT-XML-DET
009           ELSE
009             IF  TEMP-DR       > ZEROES
009             OR  TEMP-CR       > ZEROES
scamp                 PERFORM INSERT-XML-DET
009             END-IF
009           END-IF
              GO TO SET-XML-IN-NEXT.
      *
065        perform CloseReportControl.
      *    PERFORM DeleteReportControl.
      *
       SET-XML-IN-CONT.
      *
           MOVE "</Item>"    TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
           MOVE "</PostGlJournal>" TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
           PERFORM ARRAY-FINAL-CREATE.
           SET COMPS2-XMLIN TO ARRAY-OBJECT.
      *
       SET-XML-IN-END.
      *
       *>--------------------------------------------------------------
      * Insert a new G/L Journal entry record from grid control
       *>--------------------------------------------------------------
scamp  INSERT-XML-DET.
scamp      perform INSERT-XML-DET-START thru INSERT-XML-DET-END.
       INSERT-XML-DET-START.
      *
           IF  CellValue(2) NOT > SPACES
               GO TO INSERT-XML-DET-END.
      *
           ADD 1 TO DETAIL-ENT.
      *
           MOVE "<JournalDetails>" TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
           MOVE "LedgerCode"       TO XML-TAG-NAME.
           MOVE CellValue(2)       TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "Date"             TO XML-TAG-NAME.
           MOVE FUNCTION NUMVAL ( CellValue(4) )
                                   TO ARRAY-EDITED-DATE.
           PERFORM OUTPUT-ELEMENT-DATE.
      *
           MOVE "Reference"        TO XML-TAG-NAME.
           MOVE CellValue(5)       TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE ZEROES             TO WS-AMOUNT.
           MOVE FUNCTION NUMVAL-C (CellValue(6))
                                   TO WS-AMOUNT.
           IF   WS-AMOUNT = ZEROES
                MOVE FUNCTION NUMVAL-C (CellValue(7))
                                   TO WS-AMOUNT
                COMPUTE WS-AMOUNT = WS-AMOUNT * -1.
      *
           MOVE "EntryAmount"      TO XML-TAG-NAME.
           MOVE WS-AMOUNT          TO EDIT-VALUE.
           MOVE EDIT-VALUE         TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "Comment"          TO XML-TAG-NAME.
           MOVE CellValue(8)       TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           MOVE "AnalysisEntry"    TO XML-TAG-NAME.
           MOVE SPACES             TO WS-ANALYSIS-DETAIL.
098        move function numval(cellvalue(11)) to ws-ana-no  *> Removing trailing zeroes
           MOVE WS-ANA-NO          TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
       
086        if dim-dentry > 0
086          move "Dimensionentry"   to xml-tag-name
086          move dim-dentry         to xml-tag-value
086          perform output-element
086        else
086          move "Dimensionentry"   to xml-tag-name
086          move genjnd-dentry      to xml-tag-value
086          perform output-element
086        end-if
      
           MOVE "InterCompanyDetail"   TO XML-TAG-NAME.
           IF   CellValue(14) = 0
                MOVE "N"               TO XML-TAG-VALUE
           ELSE
                MOVE "Y"               TO XML-TAG-VALUE.
           PERFORM OUTPUT-ELEMENT.
      *
           IF  CellValue(15) > SPACES
               MOVE "InterCompanyID"   TO XML-TAG-NAME
               MOVE CellValue(15)      TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
           IF  CellValue(16) > SPACES
           AND CellValue(16) NOT = "Browse"
               MOVE "InterCompanyDebit" TO XML-TAG-NAME
               MOVE CellValue(16)       TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
           IF  CellValue(17) > SPACES
           AND CellValue(17) NOT = "Browse"
               MOVE "InterCompanyCredit"   TO XML-TAG-NAME
               MOVE CellValue(17)          TO XML-TAG-VALUE
               PERFORM OUTPUT-ELEMENT.
      *
019        MOVE "SourceAp"         TO XML-TAG-NAME.
019        MOVE CellValue(20)      TO XML-TAG-VALUE.
019        PERFORM OUTPUT-ELEMENT.
      *
019        MOVE "SourceJournal"    TO XML-TAG-NAME.
019        MOVE CellValue(21)      TO XML-TAG-VALUE.
019        PERFORM OUTPUT-ELEMENT.
      *
019        IF  D-JNC-JSRC > SPACES
019        AND D-JNC-TCD  > SPACES
019            MOVE "ModifiedFlag"     TO XML-TAG-NAME
019            MOVE CellValue(22)      TO XML-TAG-VALUE
019            PERFORM OUTPUT-ELEMENT.
      *
019        MOVE "AdditionalReference" TO XML-TAG-NAME.
019        MOVE CellValue(23)      TO XML-TAG-VALUE.
019        PERFORM OUTPUT-ELEMENT.
      *
70fix      IF   CellValue(24)(1:1) <> CellValue(24)
70fix           STRING "CommitFlag: " DELIMITED BY SIZE
70fix                  CellValue(24)  DELIMITED BY SIZE
70fix                  INTO           WW-JOBDET-MSG
70fix           PERFORM        JOB-MESSAGE-DETAIL
70fix           MOVE SPACES           TO CellValue(24)
70fix      END-IF.
019        MOVE "CommitmentFlag"   TO XML-TAG-NAME.
019        MOVE CellValue(24)      TO XML-TAG-VALUE.
019        PERFORM OUTPUT-ELEMENT.
      *
019        MOVE "TransactionDate"  TO XML-TAG-NAME.
019        MOVE FUNCTION NUMVAL ( CellValue(25) )
019                                TO ARRAY-EDITED-DATE.
034        PERFORM OUTPUT-ELEMENT-DATE.
      *
034        MOVE "CurrencyInfo"     TO XML-TAG-NAME.
034        MOVE CellValue(26)      TO XML-TAG-VALUE.
034        PERFORM OUTPUT-ELEMENT.
      *
70FIX       MOVE "SubModJournal"     TO XML-TAG-NAME.
70FIX       MOVE FUNCTION NUMVAL (CellValue(27))       TO EDIT-10-VAL.
70FIX       MOVE EDIT-10-VAL          TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModInvReg"      TO XML-TAG-NAME.
70FIX       MOVE FUNCTION NUMVAL (CellValue(28))       TO EDIT-10-VAL.
70FIX       MOVE EDIT-10-VAL          TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModAssetReg"    TO XML-TAG-NAME.
70FIX       MOVE FUNCTION NUMVAL (CellValue(29))       TO EDIT-10-VAL.
70FIX       MOVE EDIT-10-VAL          TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModArInvoice"   TO XML-TAG-NAME.
70FIX       MOVE CellValue(30)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModApInvoice"   TO XML-TAG-NAME.
70FIX       MOVE CellValue(31)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModSupplier"    TO XML-TAG-NAME.
70FIX       MOVE CellValue(32)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModCustomer"    TO XML-TAG-NAME.
70FIX       MOVE CellValue(33)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModJnlRef"      TO XML-TAG-NAME.
70FIX       MOVE CellValue(34)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModCheck"       TO XML-TAG-NAME.
70FIX       MOVE CellValue(35)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModBank"        TO XML-TAG-NAME.
70FIX       MOVE CellValue(36)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModApBranch"    TO XML-TAG-NAME.
70FIX       MOVE CellValue(37)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModArBranch"    TO XML-TAG-NAME.
70FIX       MOVE CellValue(38)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModWarehouse"   TO XML-TAG-NAME.
70FIX       MOVE CellValue(39)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModStock"       TO XML-TAG-NAME.
70FIX       MOVE CellValue(40)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModArea"        TO XML-TAG-NAME.
70FIX       MOVE CellValue(41)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModTranDesc"    TO XML-TAG-NAME.
70FIX       MOVE CellValue(42)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModAsset"       TO XML-TAG-NAME.
70FIX       MOVE CellValue(43)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModGrn"         TO XML-TAG-NAME.
70FIX       MOVE CellValue(44)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModJob"         TO XML-TAG-NAME.
70FIX       MOVE CellValue(45)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModOperation"   TO XML-TAG-NAME.
70FIX       MOVE FUNCTION NUMVAL (CellValue(46))  TO EDIT-5-VAL.
70FIX       MOVE EDIT-5-VAL          TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModWorkCenter"  TO XML-TAG-NAME.
70FIX       MOVE CellValue(47)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModEmployee"    TO XML-TAG-NAME.
70FIX       MOVE CellValue(48)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
70FIX       MOVE "SubModSalesOrder"  TO XML-TAG-NAME.
70FIX       MOVE CellValue(49)       TO XML-TAG-VALUE.
70FIX       PERFORM OUTPUT-ELEMENT.
70FIX *
057         MOVE "DocumentDate"      TO XML-TAG-NAME.
057         MOVE FUNCTION NUMVAL (CellValue(50))
057                                  TO ARRAY-EDITED-DATE.
057         PERFORM OUTPUT-ELEMENT-DATE.
057   *
064         MOVE "PaymentReference"  TO XML-TAG-NAME.
064         MOVE CellValue(51)       TO XML-TAG-VALUE.
064         PERFORM OUTPUT-ELEMENT.

072        MOVE "MultiCurPay"        TO XML-TAG-NAME.
072        MOVE CellValue(53)        TO XML-TAG-VALUE.
072        PERFORM OUTPUT-ELEMENT.

072        IF CellValue(53) = "Y"
072            MOVE "PayTrnValue"        TO XML-TAG-NAME
072            MOVE ZEROES               TO WS-AMOUNT
072            MOVE FUNCTION NUMVAL-C (CellValue(54))
072                                      TO WS-AMOUNT
072            MOVE WS-AMOUNT            TO EDIT-VALUE
072            MOVE EDIT-VALUE           TO XML-TAG-VALUE
072            PERFORM OUTPUT-ELEMENT

072            MOVE "PayCurrency"        TO XML-TAG-NAME
072            MOVE CellValue(55)        TO XML-TAG-VALUE
072            PERFORM OUTPUT-ELEMENT

072            MOVE "PayConvRate"        TO XML-TAG-NAME
072            MOVE ZEROES               TO WS-RATE
072            MOVE FUNCTION NUMVAL-C (CellValue(56))
072                                      TO WS-RATE
072            MOVE WS-RATE              TO EDIT-RATE
072            MOVE EDIT-RATE            TO XML-TAG-VALUE
072            PERFORM OUTPUT-ELEMENT
072 
072            MOVE "PayPostMulDiv"      TO XML-TAG-NAME
072            MOVE CellValue(57)        TO XML-TAG-VALUE
072            PERFORM OUTPUT-ELEMENT.

086a       move "GroupPayment"           to xml-tag-name
086a       if CellValue(59) = "1"
086a         move "Y"                    to xml-tag-value
086a       else
086a         move spaces                 to xml-tag-value
086a       end-if
086a       perform output-element

086a       move "GrpPayVal"              to xml-tag-name
086a       move zeroes                   to ws-amount
086a       move function numval-c (CellValue(60))
086a                                     to ws-amount
086a       move ws-amount                to array-edited-value
086a       move array-edited-value       to xml-tag-value
086a       perform output-element
  
086a       move "GrpPayCurrency"         to xml-tag-name
086a       move CellValue(61)            to xml-tag-value
086a       perform output-element

086a       move "GrpPayConvRate"         to xml-tag-name
086a       move zeroes                   to ws-rate
086a       move function numval-c (CellValue(62))
086a                                     to ws-rate
086a       move ws-rate                  to array-edited-rate
086a       move array-edited-rate        to xml-tag-value
086a       perform output-element


086a         move "GrpInterCompany"        to xml-tag-name
086a         if CellValue(63) = "1"
086a           move "Y"                    to xml-tag-value
086a         else
086a           move spaces                 to xml-tag-value
086a         end-if
086a         perform output-element

086b       if CellValue(18) = "AP"
086a         move "PrimarySupplier"        to xml-tag-name
086a         move CellValue(64)            to xml-tag-value
086a         perform output-element
             
086a         move "PrimaryCompany"         to xml-tag-name
086a         move CellValue(65)            to xml-tag-value
086a         perform output-element
             
086a         move "SecondaryCompany"       to xml-tag-name
086a         move CellValue(66)            to xml-tag-value
086a         perform output-element
             
086a         move "XrefCheckRegister"      to xml-tag-name
086a         move function numval (CellValue(67))
                                           to edit-10-val
086a         move edit-10-val              to xml-tag-value
086a         perform output-element
             
086a         move "ApPaymentNumber"        to xml-tag-name
086a         move CellValue(68)            to xml-tag-value
086a         perform output-element
             
086a         move "GrpPayPostMulDiv"       to xml-tag-name
086a         move CellValue(69)            to xml-tag-value
086a         perform output-element
086b       end-if

086b       if CellValue(18) = "AR"
086b         move "PrimaryCompany"         to xml-tag-name 
086b         move CellValue(65)            to xml-tag-value
086b         perform output-element

086b         move "SecondaryCompany"       to xml-tag-name 
086b         move CellValue(66)            to xml-tag-value 
086b         perform output-element
             
086b         move "GroupIntercompany"      to xml-tag-name
086b         if CellValue(63) = spaces 
086b           move spaces                 to xml-tag-value
086b         else
086b           move "P"                    to xml-tag-value
086b         end-if
086b         if CellValue(63) = "1" and
086b            Cellvalue(66) <> compid
086b           move "S"                    to xml-tag-value
086b         end-if
086b         perform output-element 
             
086b         move "PrimaryCustomer"        to xml-tag-name 
086b         move CellValue(71)            to xml-tag-value 
086b         perform output-element

086b         move "ArPaymentNumber"        to xml-tag-name
086b         move CellValue(72)            to xml-tag-value
086b         perform output-element
086b       end-if

           MOVE "</JournalDetails>" TO ARRAY-DATA.
           MOVE ZEROES             TO ARRAY-LENGTH.
           PERFORM ARRAY-CREATE.
      *
       INSERT-XML-DET-END.
      *
       FORMAT-UNDIST.
           MOVE D-LVITEM-TEXT(6) TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM-VAL           TO D-JNLTOTDR.
      *
           MOVE D-LVITEM-TEXT(7) TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM-VAL           TO D-JNLTOTCR.

      * Calc undistributed amount
       CALC-UNDIST.
           COMPUTE D-JNLTOTUN = D-JNLTOTCR - D-JNLTOTDR.
           MOVE D-JNLTOTUN TO D-UNDIST.
           IF   D-UNDIST = ZEROES
                MOVE SPACES  TO D-DSP-MESG
           ELSE
                MOVE MSG407  TO D-DSP-MESG.
      *
071    JNL-OUT-OF-BAL.
071        INITIALIZE STDTASKDIALOGLINK.
071        MOVE "Journal out of balance"       TO STDTASKWINDOWTITLE.
071        MOVE "Journal out of balance"       TO STDTASKMAINTEXT.
071        STRING
071          "This journal is out of balance." DELIMITED BY SIZE
071          x"0a"                             DELIMITED BY SIZE
071          " What would you like to do?"     DELIMITED BY SIZE
071          INTO STDTASKCONTENTTEXT.
      *  
071        MOVE xtpTaskIconWarning             TO STDTASKMAINICON
071        MOVE 101                            TO STDTASKBUTTONID(1).
071        MOVE "Add Entries"                  TO STDTASKBUTTONTEXT(1).
071        MOVE 102                            TO STDTASKBUTTONID(2).  
071        MOVE "Hold Journal"                 TO STDTASKBUTTONTEXT(2).
071        MOVE 103                            TO STDTASKBUTTONID(3).  
071        MOVE "Cancel Journal"               TO STDTASKBUTTONTEXT(3).
      *  
071        INITIALIZE EXT-PARAMS.
071        MOVE STDTASKDIALOGLINK  TO EXT-PARAM-BLOB.
071        PERFORM INVOKE-TASK-DIALOG.
071        MOVE EXT-PARAM-BLOB     TO STDTASKDIALOGLINK.
071        INITIALIZE EXT-PARAMS.
      *
071        EVALUATE STDTASKDIALOGBUTTON
071          WHEN 101            
071            MOVE "ADD"                      TO D-S-TO-PAR
071          WHEN 102
071            MOVE "HOLD"                     TO D-S-TO-PAR
071          WHEN 103
071            MOVE "CANCEL"                   TO D-S-TO-PAR
071        END-EVALUATE.
      *  
      * Check that currency entered is valid
       VALIDATE-CURRENCY.
           PERFORM VALIDATE-CURR-START THRU
                   VALIDATE-CURR-END.
       VALIDATE-CURR-START.
           PERFORM TBLCUR-INITIALIZE-REC.
           MOVE    D-CURR          TO TBLCUR-CUR.
           PERFORM TBLCUR-READ.
           IF  NOT STAT-OK
               MOVE "invalid"      TO D-S-ERROR
           ELSE
               MOVE TBLCUR-DES     TO D-CURR-DESC.
       VALIDATE-CURR-END.
      *
      * Check that currency entered is valid
       VALIDATE-SOURCE.
           PERFORM VALIDATE-SRC-START THRU
                   VALIDATE-SRC-END.
       VALIDATE-SRC-START.
           IF D-JNLSCODE = "AP" OR "AR" OR "SA" OR "CS" OR "IN" OR "AS"
                      OR "PA" OR "WP"
                      OR "JE" OR "PV" OR "RV" OR "IC" OR "PE"
                      OR "AU" OR "YE" OR "HM"
076                   OR "ST" OR "AC" or "RE"
                          MOVE SPACES TO TBLUSR-DESC
                          MOVE "STDSRC" TO D-S-ERROR
           ELSE
              MOVE SPACES      TO TBLUSR-KEY
              MOVE D-JNLSCODE  TO TBLUSR-SCODE
              PERFORM TBLUSR-READ
              IF NOT STAT-LCK
                 IF NOT STAT-OK
                     MOVE SPACES TO TBLUSR-DESC
                     MOVE ERRNOT TO WW-ERROR-NUM
                     PERFORM LOOK-UP-ERROR.
      *
           MOVE TBLUSR-DESC TO D-SOURCE-DESC.
       VALIDATE-SRC-END.
      *
      * Routine to check a source code entry *
      ****************************************
       READ-SRC.
           IF D-JNLSCODE = "AP" OR "AR" OR "SA" OR "CS" OR "IN" OR "AS"
                      OR "PA" OR "WP"
                      OR "JE" OR "PV" OR "RV" OR "IC" OR "PE"
                      OR "AU" OR "YE" OR "HM"
076                   OR "ST" OR "AC" or "RE"
                          MOVE SPACES TO TBLUSR-DESC
                          MOVE "STDSRC" TO D-S-ERROR
           ELSE
              MOVE SPACES      TO TBLUSR-KEY
              MOVE D-JNLSCODE  TO TBLUSR-SCODE
              PERFORM TBLUSR-READ
              IF NOT STAT-LCK
                 IF NOT STAT-OK
                     MOVE SPACES TO TBLUSR-DESC
                     MOVE ERRNOT TO WW-ERROR-NUM
                     PERFORM LOOK-UP-ERROR.
      *
      * Routine to read for STANDARD CODE *
      *************************************
       READ-STD.
004        MOVE D-JNL-PER  TO D-JNL-PER-X.
           MOVE SPACES     TO GENSTC-KEY.
           MOVE D-STD-CODE TO GENSTC-CODE.
           PERFORM GENSTC-READ.
           IF STAT-LCK
              MOVE ERRLOC TO WW-ERROR-NUM
              PERFORM LOOK-UP-ERROR
           ELSE
              IF NOT STAT-OK
                 MOVE SPACES TO GENSTC-REC
                 MOVE ERRNOT TO WW-ERROR-NUM
                 PERFORM LOOK-UP-ERROR
              ELSE
                  IF GENSTC-DEB NOT = GENSTC-CRD
                     MOVE "OUTOFBAL" TO D-S-ERROR
                  ELSE
                     IF GENSTC-TRAN NOT > ZERO
                        MOVE "NOENTRIES" TO D-S-ERROR.
      *
           MOVE GENSTC-REF TO D-GS00REF.
      *
      **************************************************************
      * Routine to create a normal journal from a standard journal
       COPY-STD.
052        MOVE "NORM-ADD"           TO ESIG-TYPE.
052        PERFORM ESIGNATURES-PRIOR.
052        IF  D-S-ERROR = "sig-err"
052            NEXT SENTENCE
052        ELSE
039a           PERFORM COPY-STAND-START THRU
052                    COPY-STAND-END
052        END-IF.

052        IF  D-S-ERROR <> "sig-err"
052            PERFORM ESIGNATURES-COMPLETE.

084nk ** Close audit file
084nk      perform comnxk-initialize.
084nk      move compid           to comnxk-company.
084nk      move wsYear           to comnxk-post-year.
084nk      move wsPeriod         to comnxk-post-period.
084nk      move d-jnl-no         to comnxk-key.
084nk      perform comnxk-gen-fin-journal.

039a   COPY-STAND-START.
060a       MOVE SPACES         TO D-CHANGE-MAINT.
           MOVE "Copy std jnl" TO SQL-TRN-ACT.
           MOVE D-JNL-NO       TO SQL-TRN-DOC.
           MOVE D-JNL-YEAR     TO SQL-TRN-LIN.

           MOVE "E" TO COMER-TO-ENDJOB.

           PERFORM BEGIN-TRANSACTION.
039a
043a       MOVE D-JNL-COPY-DATE      TO D-JNL-DATE.
039a       MOVE ZEROES               TO D-LV-SIZE.
039a       MOVE ZEROES               TO D-JNLTOTDR.
039a       MOVE ZEROES               TO D-JNLTOTCR.

039a       MOVE D-JNL-TYPE           TO D-JNL-TYPE.
039a       MOVE GENSTC-REF           TO D-JNL-REF.
039a       MOVE GENSTC-NOTE          TO D-JNL-NOTE.
039a       MOVE SPACES               TO D-JNLSCODE.
      *
084nk      move d-jnl-year           to wsYear.
084nk      move d-jnl-per            to wsPeriod.
                            
084nk  COPY-STAND-NEXT-JOURNAL.
           PERFORM GetNextJournal.
      *
           MOVE SPACES           TO GENJNC-REC.
           MOVE D-JNL-YEAR       TO GENJNC-YEAR POST-YYYY.
           MOVE D-JNL-PER        TO GENJNC-PER POST-PP.
           MOVE D-JNL-NO         TO GENJNC-JNL.
           MOVE D-JNL-NO         TO D-JNL-NO-X.
           MOVE ZERO             TO GENJNC-TRAN.
           MOVE "N"              TO GENJNC-PRINT.
043a       MOVE D-JNL-COPY-DATE  TO DATE-NORMAL.
043a       PERFORM DATE-TO-CYMD.
043a       MOVE DATE-CCYYMMDD    TO GENJNC-JDAT.
           MOVE ZERO             TO GENJNC-TRAN.
           MOVE ZERO             TO GENJNC-DEB.
           MOVE ZERO             TO GENJNC-CRD.
           MOVE D-JNL-TYPE       TO GENJNC-JTYP.
           MOVE "J"              TO GENJNC-SRC.
           MOVE POST-PP-YYYY     TO D-LDG-PER.
           MOVE OPERATOR-CODE    TO GENJNC-OPCODE.
           MOVE "N"              TO GENJNC-STAT.
           MOVE GENSTC-REF       TO GENJNC-REF.
           MOVE GENSTC-NOTE      TO GENJNC-NOTE.
           IF D-JNL-TYPE = "U"
               MOVE D-JNLSCODE   TO GENJNC-SCODE.
           IF  D-JNL-TYPE = "L"
               MOVE D-CURR       TO GENJNC-CUR.
           PERFORM GENJNC-WRITE. 
084nk      if stat-dup
084nk         go to copy-stand-next-journal
084nk      end-if.
084nk      perform comer.

016        MOVE GENSTC-KEY       TO D-STD-JNL-KEY.
016        MOVE GENJNC-KEY       TO D-NEW-JNL-KEY.

           MOVE SPACES     TO GENSTD-KEY.
           MOVE D-STD-CODE TO GENSTD-CODE.
           PERFORM GENSTD-START-GE.
           IF STAT-INVALID-KEY
              NEXT SENTENCE
           ELSE
              PERFORM COPY-STD-NEXT THRU COPY-STD-END.
      *
      * Store journal header information in data block
           MOVE GENJNC-JTYP  TO D-JNL-TYPE.
           MOVE GENJNC-JDAT  TO DATE-CCYYMMDD.
           PERFORM DATE-FROM-CYMD.
           MOVE DATE-NORMAL  TO D-JNL-DATE.
           MOVE GENJNC-REF   TO D-JNL-REF.
           MOVE GENJNC-NOTE  TO D-JNL-NOTE.
           MOVE GENJNC-SCODE TO D-JNLSCODE.
           MOVE GENJNC-YEAR  TO D-JNL-YEAR.
           MOVE GENJNC-PER   TO D-JNL-PER.
           MOVE GENJNC-DEB   TO D-JNLTOTDR.
           MOVE GENJNC-CRD   TO D-JNLTOTCR.
           MOVE GENJNC-TRAN  TO DETAIL-ENT.
           MOVE GENJNC-CUR   TO D-CURR.
019        MOVE GENJNC-JSRC  TO D-JNC-JSRC.
019        MOVE GENJNC-TCD   TO D-JNC-TCD.
           ADD 1             TO DETAIL-ENT.

016        MOVE SPACES TO LINK-EXTRA-1 LINK-EXTRA-2 LINK-EXTRA-3
016                       LINK-BROWSE LINK-BROWSE-EXTRA.

016        MOVE "COPY"        TO LINK-EXTRA-1(1:4).
016        MOVE "GS"          TO LINK-EXTRA-2.
016        MOVE D-STD-JNL-KEY TO LINK-BROWSE.
016        MOVE "GJ"          TO LINK-EXTRA-2(7:6).
016        MOVE D-NEW-JNL-KEY TO LINK-BROWSE-EXTRA.
016        MOVE "IMPNOT"      TO WW-PROG-NAME.
016        PERFORM CALL-PROGRAM-NO-CANCEL.

016        MOVE SPACES TO LINK-EXTRA-1 LINK-EXTRA-2 LINK-EXTRA-3
016                       LINK-BROWSE LINK-BROWSE-EXTRA.
      *
           PERFORM GENJNC-READ.
           PERFORM COMER.
           MOVE TIMESTAMP-BIN  TO TIMESTAMP-SAV.

039a   COPY-STD-CONT.
           PERFORM COMMIT-TRANSACTION.

       COPY-STAND-END.

      *****************************************************************
      *  Now read through the standard journal file, writing a record
      *  for each found, and updating the entry and dr/cr totals on
      *  the journal header...
       COPY-STD-NEXT.
           PERFORM GENSTD-READ-NEXT.
           IF STAT-AT-END
              GO TO COPY-STD-END.
           PERFORM COMER.
      *
           IF GENSTD-CODE NOT = D-STD-CODE
              GO TO COPY-STD-END.
      *
      *    Create the new record...
      *
           ADD 1 TO GENJNC-TRAN.
           IF GENSTD-COD = "D"
              ADD GENSTD-AMT         TO GENJNC-DEB
           ELSE
              ADD GENSTD-AMT         TO GENJNC-CRD.
      *
           MOVE SPACES               TO GENJND-REC.
           MOVE D-JNL-YEAR           TO GENJND-YEAR.
           MOVE D-JNL-PER            TO GENJND-PER.
           MOVE D-JNL-NO             TO GENJND-JNL.
           MOVE GENJNC-TRAN          TO GENJND-ENT.
           MOVE GENSTD-COD           TO GENJND-COD.
           MOVE GENSTD-AMT           TO GENJND-AMT.
           MOVE GENSTD-ACC           TO GENJND-ACC.
           MOVE GENSTD-REF           TO GENJND-REF.
           MOVE GENSTD-COM           TO GENJND-COMM.
043a       MOVE D-JNL-COPY-DATE      TO DATE-NORMAL.
043a       PERFORM DATE-TO-CYMD.
043a       MOVE DATE-CCYYMMDD        TO GENJND-DATE.
086        if dim-dentry > 0
086          move dim-dentry        to genjnd-dentry
086        end-if
           PERFORM GENJND-WRITE.
           PERFORM COMER.
      *
           MOVE SPACES               TO GENJNC-AUTHORISED.
           MOVE SPACES               TO GENJNC-AUTHBY.
      *
           PERFORM GENJNC-REWRITE.
           PERFORM COMER.
           PERFORM GENJNC-READ.
           PERFORM COMER.
           MOVE TIMESTAMP-BIN        TO TIMESTAMP-SAV.
      *
           GO TO COPY-STD-NEXT.
      *
       COPY-STD-END.
029A       IF GENJNC-JTYP = "N"
029A          PERFORM JNL-TRIGGER.
      *
      ***************************************************************
084nk ** Get next journal and open audit with COMNXK
084nk  GetNextJournal.
084nk      perform comnxk-initialize.
084nk      move compid        to comnxk-company.
084nk      move wsYear        to comnxk-post-year.
084nk      move wsPeriod      to comnxk-post-period.
084nk      perform comnxk-gen-get-journal.
084nk      move comnxk-rt-key to d-jnl-no.

      ***************************************************************
      * Convert period number alpha to numeric
       GET-NUMERIC-PERIOD.
           MOVE D-JNL-YEAR-X       TO D-JNL-YEAR.
           MOVE D-JNL-PER-X        TO D-JNL-PER.
70FIX      MOVE D-JNL-NO-X         TO NUMB-R.
70FIX      PERFORM NUMB-CHECK.
70FIX      MOVE NUM                TO D-JNL-NO.
      *
      * Routine to browse on a standard code
       BROWSE-STANDARD.
           MOVE SPACES      TO LINK-BROWSE.
           MOVE D-STD-CODE  TO LINK-BRW-1.
           MOVE "GENPB5"    TO WW-PROG-NAME.
           MOVE "B"         TO LINK-BRW-ENQ.
           PERFORM CALL-PROGRAM.
           IF LINK-BRW-RET NOT = SPACES
              MOVE "xx" TO D-S-TO-PAR
              MOVE LINK-BRW-RET TO D-STD-CODE.
           MOVE SPACES      TO LINK-EXTRA.
      *
071    BROWSE-JNL.
071        IF D-S-FR-PAR = "O"
071           MOVE SPACES           TO LINK-BROWSE
071           MOVE SPACES           TO LINK-2
071           MOVE D-JOURNAL-FROM   TO LINK-BRW-1-N
071           MOVE D-AUTH-YEAR      TO LINK-YEAR
071           IF D-PER-SEL = 1
071              MOVE GENCTL-PER    TO LINK-PER
071           ELSE
071              MOVE D-PERIOD-FROM TO LINK-PER
071           END-IF
071           MOVE LINK-2           TO LINK-BRW-2-N
071           MOVE "GENPB4"         TO WW-PROG-NAME
071           MOVE "B"              TO LINK-BRW-ENQ
071           PERFORM CALL-PROGRAM
071           IF LINK-BRW-RET NOT = SPACES
071              MOVE "xx"          TO D-S-TO-PAR
071              MOVE LINK-BRW-RET  TO RETURN-LINK
071              MOVE RETURN-JNL    TO D-JOURNAL-FROM
071              MOVE RETURN-PER    TO D-PERIOD-FROM
071              MOVE RETURN-YEAR   TO D-AUTH-YEAR
071           END-IF                
071        ELSE                     
071           MOVE SPACES           TO LINK-BROWSE
071           MOVE SPACES           TO LINK-2
071           MOVE D-JOURNAL-TO     TO LINK-BRW-1-N
071           MOVE D-AUTH-YEAR      TO LINK-YEAR
071           EVALUATE D-PER-SEL
071             WHEN 1
071               MOVE GENCTL-PER    TO LINK-PER
071             WHEN 2
071               MOVE D-PERIOD-TO   TO LINK-PER
071             WHEN 3
071               MOVE D-PERIOD-FROM TO LINK-PER
071           END-EVALUATE               
071           MOVE LINK-2           TO LINK-BRW-2-N
071           MOVE "GENPB4"         TO WW-PROG-NAME
071           MOVE "B"              TO LINK-BRW-ENQ
071           PERFORM CALL-PROGRAM  
071           IF LINK-BRW-RET NOT =  SPACES
071              MOVE "xx"          TO D-S-TO-PAR
071              MOVE LINK-BRW-RET  TO RETURN-LINK
071              MOVE RETURN-JNL    TO D-JOURNAL-TO
071              MOVE RETURN-PER    TO D-PERIOD-TO
071              MOVE RETURN-YEAR   TO D-AUTH-YEAR
071           END-IF                
071        END-IF.
      *
      * Load auth journal unto
       LOAD-AUTH-JOURNALS.
           IF  D-DOCKING-IS-CLOSED(4) NOT = 1
051a           IF  SQL-FLAG = "Y"
051a               PERFORM SQL-LOAD-AUTHS-START THRU SQL-LOAD-AUTHS-END
051a           ELSE
                   PERFORM LOAD-AUTHS-START THRU LOAD-AUTHS-END
051a           END-IF
               PERFORM FinishReportControl.
      *
       LOAD-AUTHS-START.
           IF   D-NORM-AUTH = "N"
           AND  D-NORM-UNAUTH = "N"
022        AND  D-NORM-SUBMOD-AUTH = "N"
022        AND  D-NORM-SUBMOD-UNAUTH = "N"
                GO TO LOAD-AUTHS-END.
           MOVE "GENPJML2" TO xtpReportControl
024        MOVE 12         TO xtpNumberColumns
           PERFORM CreateReportControl
      *
           MOVE SPACES       TO GENJNC-KEY.
           MOVE D-AUTH-YEAR  TO GENJNC-YEAR.
           PERFORM GENJNC-START-GT.
      *
           IF STAT-INVALID-KEY
               GO TO LOAD-AUTHS-END.
      *
       LOAD-AUTHS-NEXT.
           PERFORM GENJNC-READ-NEXT.
           IF STAT-AT-END
              GO TO LOAD-AUTHS-END.
           PERFORM COMER.
      *
           IF STAT-AT-END
              GO TO LOAD-AUTHS-END.
           PERFORM COMER.
      *
           IF NOT STAT-OK
              GO TO LOAD-AUTHS-NEXT.
      *
           IF GENJNC-YEAR  NOT = D-AUTH-YEAR
               GO TO LOAD-AUTHS-END.
      *
           IF GENJNC-PER > D-PERIOD-TO
               GO TO LOAD-AUTHS-END.
      *
           IF GENJNC-STAT NOT = "N"
              GO TO LOAD-AUTHS-NEXT.
      *
           IF D-AUTH-OPTION = "2"
           AND GENJNC-AUTHORISED NOT = "Y"
              GO TO LOAD-AUTHS-NEXT.
      *
           IF D-AUTH-OPTION = "3"
           AND GENJNC-AUTHORISED = "Y"
               GO TO LOAD-AUTHS-NEXT.
      *
           IF GENJNC-PER < D-PERIOD-FROM
           OR GENJND-PER > D-PERIOD-TO
              GO TO LOAD-AUTHS-NEXT.
      *
           IF GENJNC-JNL < D-JOURNAL-FROM
           OR GENJNC-JNL > D-JOURNAL-TO
              GO TO LOAD-AUTHS-NEXT.
045a  *
045a       IF IM2-AUTH-SMOD = "N"
045a       AND (GENJNC-JSRC = "AR"
045a       OR   GENJNC-JSRC = "AP"
045a       OR   GENJNC-JSRC = "AS"
045a       OR   GENJNC-JSRC = "CS"
045a       OR   GENJNC-JSRC = "GR"
045a       OR   GENJNC-JSRC = "IN"
045a       OR   GENJNC-JSRC = "SA"
045a       OR   GENJNC-JSRC = "WP"
076        OR   GENJNC-JSRC = "RE"  )
045a            GO TO LOAD-AUTHS-NEXT.

      *
051a       PERFORM INSERT-AUTH-LISTVIEW.
      *
           GO TO LOAD-AUTHS-NEXT.
      *
       LOAD-AUTHS-END.
      *
051a   SQL-LOAD-AUTHS-START.
           IF   D-NORM-AUTH = "N"
           AND  D-NORM-UNAUTH = "N"
           AND  D-NORM-SUBMOD-AUTH = "N"
           AND  D-NORM-SUBMOD-UNAUTH = "N"
                GO TO SQL-LOAD-AUTHS-END.
           MOVE "GENPJML2" TO xtpReportControl.
           MOVE 12         TO xtpNumberColumns.
           PERFORM CreateReportControl.
      *
           PERFORM SQL-AUTHS-BUILD-COMMAND.
      *
       SQL-LOAD-AUTHS-NEXT.
           PERFORM SQL-FETCH-ROW.
           IF  STAT-AT-END
               GO TO SQL-LOAD-AUTHS-END.
           PERFORM COMER.
      *
           MOVE SQL-COL-NUM(1)     TO GENJNC-YEAR.
           MOVE SQL-COL-NUM(2)     TO GENJNC-PER.
           MOVE SQL-COL-NUM(3)     TO GENJNC-JNL.
           MOVE SQL-COL-DAT(4)     TO GENJNC-JDAT.
           MOVE SQL-COL-ALP(5)     TO GENJNC-JTYP.
           MOVE SQL-COL-ALP(6)     TO GENJNC-STAT.
           MOVE SQL-COL-ALP(7)     TO GENJNC-PRINT.
           MOVE SQL-COL-ALP(8)     TO GENJNC-REF.
           MOVE SQL-COL-ALP(9)     TO GENJNC-OPCODE.
           MOVE SQL-COL-ALP(10)    TO GENJNC-AUTHORISED.
           MOVE SQL-COL-ALP(11)    TO GENJNC-JSRC.
      *
           PERFORM INSERT-AUTH-LISTVIEW.
           GO TO SQL-LOAD-AUTHS-NEXT.
      *
       SQL-LOAD-AUTHS-END.
054        PERFORM SQL-SHUTDOWN.
      *
051a   SQL-AUTHS-BUILD-COMMAND.
           PERFORM SQL-AUTHS-BUILD-START THRU
                   SQL-AUTHS-BUILD-END.
       SQL-AUTHS-BUILD-START.
      * SELECT GlYear, GlPeriod, GlJournal,
      *        JournalDate, JnlPostingType,
      *        JnlStatus, JnlPrintFlag,
      *        Reference, Operator, Authorised,
      *        JournalSource
      * FROM   GenJournalCtl
      * WHERE  GlYear = 2013
      *    AND JnlStatus = 'N'
      *    AND (GlPeriod >= 1 and GlPeriod <= 12)
      *    AND (GlJournal >= 1 and GlJournal <= 9999999999)
      *    AND Authorised <> 'Y'
      *    AND Authorised = 'Y'
      *    AND  (  JournalSource <> 'AR'
      *    AND     JournalSource <> 'AP'
      *    AND     JournalSource <> 'AS'
      *    AND     JournalSource <> 'CS'
      *    AND     JournalSource <> 'GR'
      *    AND     JournalSource <> 'IN'
      *    AND     JournalSource <> 'SA'
      *    AND     JournalSource <> 'WP'
076   *    AND     JournalSource <> 'RE' )
      *
           PERFORM SQL-INITIALISE.
           MOVE "Y"                    TO SQL-WITH-NOLOCK.
           MOVE "Y"                    TO SQL-NEW-CON.
      *
      **  Define tables to be used, their alias and links
           MOVE SPACES                 TO SQL-CON.
           MOVE ZERO                   TO SQL-CX1.
           PERFORM SQL-CON-NEXT.
           MOVE "a GenJournalCtl"      TO SQL-TAB-NAM(1).
      *
           MOVE "a.GlYear            " TO SQL-COL-NAM(1).
           MOVE "N"                    TO SQL-COL-AND(1).
           MOVE "a.GlPeriod          " TO SQL-COL-NAM(2).
           MOVE "N"                    TO SQL-COL-AND(2).
           MOVE "a.GlJournal         " TO SQL-COL-NAM(3).
           MOVE "N"                    TO SQL-COL-AND(3).
           MOVE "a.JournalDate       " TO SQL-COL-NAM(4).
069        MOVE "D"                    TO SQL-COL-AND(4).
           MOVE "a.JnlPostingType    " TO SQL-COL-NAM(5).
           MOVE "a.JnlStatus         " TO SQL-COL-NAM(6).
           MOVE "a.JnlPrintFlag      " TO SQL-COL-NAM(7).
           MOVE "a.Reference         " TO SQL-COL-NAM(8).
           MOVE "a.Operator          " TO SQL-COL-NAM(9).
           MOVE "a.Authorised        " TO SQL-COL-NAM(10).
           MOVE "a.JournalSource     " TO SQL-COL-NAM(11).
      *
      **  Define conditions to be applied
            MOVE SPACES TO SQL-CON.
      *     MOVE 1                       TO SQL-CX1.
      * Year
            PERFORM SQL-CON-NEXT
            MOVE "a.GlYear = %1 AND"     TO SQL-CON(SQL-CX1:).
      * Status
            PERFORM SQL-CON-NEXT
            MOVE "a.JnlStatus = %6 AND"  TO SQL-CON(SQL-CX1:).
      * Periods
071         IF D-PER-SEL = 2
071            PERFORM SQL-CON-NEXT
071            MOVE "a.GlPeriod >= %2 AND"   TO SQL-CON(SQL-CX1:)
071            PERFORM SQL-CON-NEXT
071            MOVE "a.GlPeriod <= %3 AND"   TO SQL-CON(SQL-CX1:)
071         END-IF.
071   *
071         IF D-PER-SEL = 3
071            PERFORM SQL-CON-NEXT
071            MOVE "a.GlPeriod = %2 AND"    TO SQL-CON(SQL-CX1:)
071         END-IF.
      *
      * Journals
071         IF D-JNL-SEL = 2
071            PERFORM SQL-CON-NEXT
071            MOVE "a.GlJournal >=%4 AND"   TO SQL-CON(SQL-CX1:)
071            PERFORM SQL-CON-NEXT
071            MOVE "a.GlJournal <= %5 AND"  TO SQL-CON(SQL-CX1:)
071         END-IF.
071   *
071         IF D-JNL-SEL = 3
071            PERFORM SQL-CON-NEXT
071            MOVE "a.GlJournal = %4 AND"   TO SQL-CON(SQL-CX1:)
071         END-IF.
      *
      * Authorised
            IF D-AUTH-OPTION = "2"
                PERFORM SQL-CON-NEXT
                MOVE "a.Authorised =  %7 AND" TO SQL-CON(SQL-CX1:)
            END-IF.
      * UnAuthorised
            IF D-AUTH-OPTION = "3"
                PERFORM SQL-CON-NEXT
                MOVE "a.Authorised <> %7 AND" TO SQL-CON(SQL-CX1:)
            END-IF.
      * Sub module journals
            IF IM2-AUTH-SMOD = "N"
                PERFORM SQL-CON-NEXT
                MOVE "(JournalSource <> 'AR' AND " TO SQL-CON(SQL-CX1:)
                PERFORM SQL-CON-NEXT
                MOVE " JournalSource <> 'AP' AND " TO SQL-CON(SQL-CX1:)
                PERFORM SQL-CON-NEXT
                MOVE " JournalSource <> 'AS' AND " TO SQL-CON(SQL-CX1:)
                PERFORM SQL-CON-NEXT
                MOVE " JournalSource <> 'CS' AND " TO SQL-CON(SQL-CX1:)
                PERFORM SQL-CON-NEXT
                MOVE " JournalSource <> 'GR' AND " TO SQL-CON(SQL-CX1:)
                PERFORM SQL-CON-NEXT
                MOVE " JournalSource <> 'IN' AND " TO SQL-CON(SQL-CX1:)
                PERFORM SQL-CON-NEXT
                MOVE " JournalSource <> 'SA' AND " TO SQL-CON(SQL-CX1:)
                PERFORM SQL-CON-NEXT
                MOVE " JournalSource <> 'WP' AND " TO SQL-CON(SQL-CX1:)
076             PERFORM SQL-CON-NEXT
076             MOVE " JournalSource <> 'RE')    " TO SQL-CON(SQL-CX1:)
            END-IF.
      *
      **  Define variables

            MOVE  D-AUTH-YEAR           TO SQL-PAR-NUM(1).
            MOVE  "N"                   TO SQL-PAR-AND(1).
            MOVE  D-PERIOD-FROM         TO SQL-PAR-NUM(2).
            MOVE  "N"                   TO SQL-PAR-AND(2).
            MOVE  D-PERIOD-TO           TO SQL-PAR-NUM(3).
            MOVE  "N"                   TO SQL-PAR-AND(3).
            MOVE  D-JOURNAL-FROM        TO SQL-PAR-NUM(4).
            MOVE  "N"                   TO SQL-PAR-AND(4).
            MOVE  D-JOURNAL-TO          TO SQL-PAR-NUM(5).
            MOVE  "N"                   TO SQL-PAR-AND(5).
            MOVE  "N"                   TO SQL-PAR-ALP(6).
            MOVE  "Y"                   TO SQL-PAR-ALP(7).
      *
           PERFORM SQL-CON-END.
      **  Define sequence
      *
           MOVE "a.GlYear          "    TO SQL-SEQ-COL(1).
           MOVE "a.GlPeriod        "    TO SQL-SEQ-COL(2).
           MOVE "a.GlJournal       "    TO SQL-SEQ-COL(3).
      *
      **  Now build the SQL command
           PERFORM SQL-BUILD-COMMAND.
           PERFORM COMER.

       SQL-AUTHS-BUILD-END.
      *
051a   INSERT-AUTH-LISTVIEW.
           MOVE SPACES TO RecordRow

           MOVE xtpTrue TO CellHasCheckBox(1).
           IF GENJNC-AUTHORISED = "Y"
               MOVE xtpTrue TO CellIsChecked(1)
           ELSE
               MOVE xtpFalse TO CellIsChecked(1).
      *
           MOVE GENJNC-JNL     TO CellValue(2).
           MOVE GENJNC-JDAT    TO CellValue(3).
           MOVE GENJNC-PER     TO CellValue(4).
      *
           IF GENJNC-JTYP = "N"
               MOVE MSG-NRM    TO CellValue(5)
           ELSE
           IF GENJNC-JTYP = "P"
               MOVE MSG-PRV    TO CellValue(5)
           ELSE
           IF GENJNC-JTYP = "U"
               MOVE MSG-USR    TO CellValue(5)
           ELSE
           IF GENJNC-JTYP = "I"
               MOVE MSG-ICO    TO CellValue(5)
           ELSE
           IF GENJNC-JTYP = "E"
               MOVE MSG-PEA    TO CellValue(5)
           ELSE
           IF GENJNC-JTYP = "A"
               MOVE MSG-AUD    TO CellValue(5)
           ELSE
           IF GENJNC-JTYP = "S"
               MOVE MSG-STA    TO CellValue(5)
           ELSE
           IF GENJNC-JTYP = "L"
               MOVE MSG-ALTCUR TO CellValue(5).
      *
           IF GENJNC-STAT = "N"
               MOVE MSG-NOT    TO CellValue(6)
           ELSE
           IF GENJNC-STAT = "H"
               MOVE MSG-HLD    TO CellValue(6)
           ELSE
           IF GENJNC-STAT = "C"
               MOVE MSG-CNC    TO CellValue(6)
           ELSE
           IF GENJNC-STAT = "P"
               MOVE MSG-PST    TO CellValue(6).
      *
           IF GENJNC-PRINT = "Y"
               MOVE MSG-YES1   TO CellValue(7)
           ELSE
               MOVE MSG-NO1    TO CellValue(7).
      *
           MOVE GENJNC-REF     TO CellValue(8).
      *
           MOVE GENJNC-OPCODE  TO CellValue(9).
      *
           MOVE GENJNC-KEY     TO CellValue(10).
      *
           MOVE GENJNC-AUTHORISED TO CellValue(11).
      *
024        MOVE "43044"                TO CellHyperlinkEvent(12).
024        MOVE  "Click to enter G/L analysis"
024                                    TO CellTooltip(12).
024        MOVE "View"                 TO CellValue(12).
024   *
           PERFORM InsertReportRow.

      *
      * Update journal as authorised
       AUTH-JNLS.
           PERFORM AUTH-JOURNAL THRU AUTH-JOURNAL-EXIT.
       AUTH-JOURNAL.
052        MOVE "NORM-AUTH"            TO ESIG-TYPE.
052        PERFORM ESIGNATURES-PRIOR.
052        IF  D-S-ERROR = "sig-err"
052            GO TO AUTH-JOURNAL-EXIT.
           PERFORM BEGIN-TRANSACTION.
           PERFORM GENJNC-INITIALIZE-REC.
           MOVE D-AUTH-YEAR            TO GENJNC-YEAR.
           MOVE D-LVITEM-TEXT(4)       TO WS-ALP-PER.
           MOVE WS-NUM-PER             TO GENJNC-PER.
           MOVE D-LVITEM-TEXT(2)       TO WS-ALP-JNL.
           MOVE WS-NUM-JNL             TO GENJNC-JNL.
           PERFORM GENJNC-READ-LOCK.
           MOVE TIMESTAMP-BIN TO TIMESTAMP-SAV.
           IF STAT-LCK
              GO TO AUTH-JOURNAL
           ELSE
               IF NOT STAT-OK
                  MOVE SPACES TO GENJNC-REC
                  MOVE ERRNOT TO WW-ERROR-NUM
                  PERFORM LOOK-UP-ERROR.
      *
           MOVE "Y" TO GENJNC-AUTHORISED.
           MOVE OPERATOR-CODE TO GENJNC-AUTHBY.
      *
           PERFORM GENJNC-REWRITE.
           PERFORM COMER.
      *
           PERFORM COMMIT-TRANSACTION.
           PERFORM ESIGNATURES-COMPLETE.

       AUTH-JOURNAL-EXIT.
           EXIT.
      *
      * Update journal as un-authorised
       UN-AUTH-JNLS.
           PERFORM UN-AUTH-JOURNAL THRU UN-AUTH-JOURNAL-EXIT.
       UN-AUTH-JOURNAL.
052        MOVE "NORM-UNAUTH"          TO ESIG-TYPE.
052        PERFORM ESIGNATURES-PRIOR.
052        IF  D-S-ERROR = "sig-err"
052            GO TO UN-AUTH-JOURNAL-EXIT.
           PERFORM BEGIN-TRANSACTION.
           PERFORM GENJNC-INITIALIZE-REC.
           MOVE D-AUTH-YEAR            TO GENJNC-YEAR.
           MOVE D-LVITEM-TEXT(4)       TO WS-ALP-PER.
           MOVE WS-NUM-PER             TO GENJNC-PER.
           MOVE D-LVITEM-TEXT(2)       TO WS-ALP-JNL.
           MOVE WS-NUM-JNL             TO GENJNC-JNL.
           PERFORM GENJNC-READ-LOCK.
           MOVE TIMESTAMP-BIN TO TIMESTAMP-SAV.
           IF STAT-LCK
              GO TO UN-AUTH-JOURNAL
           ELSE
               IF NOT STAT-OK
                  MOVE SPACES TO GENJNC-REC
                  MOVE ERRNOT TO WW-ERROR-NUM
                  PERFORM LOOK-UP-ERROR.
      *
           MOVE SPACES TO GENJNC-AUTHORISED.
           MOVE SPACES TO GENJNC-AUTHBY.
      *
           PERFORM GENJNC-REWRITE.
           PERFORM COMER.
      *
           PERFORM COMMIT-TRANSACTION.
           PERFORM ESIGNATURES-COMPLETE.

       UN-AUTH-JOURNAL-EXIT.
           EXIT.
      *
      * Check if there is a password
       CHECK-PASSWORD.
           MOVE "GENMST"   TO LINK-PASS-TYP.
           MOVE D-CHANGED-TEXT(2) TO LINK-PASS-KEY
           MOVE COMPID  TO LINK-PASS-CMP
           PERFORM GET-PASSWORD-INFO
           IF LINK-PASS-OK = "Y"
               MOVE "Y" TO D-PASSWORD-REQUIRED
           ELSE
               MOVE "N" TO D-PASSWORD-REQUIRED.
           MOVE SPACES     TO LINK-EXTRA.
      *
      * Check if there is a password
       CHECK-AUD-PASS.
           MOVE "-GEN01"   TO LINK-PASS-TYP.
           MOVE SPACES     TO LINK-PASS-KEY
           MOVE COMPID     TO LINK-PASS-CMP
           PERFORM GET-PASSWORD-INFO
           IF LINK-PASS-OK = "Y"
               MOVE "Y" TO D-PASSWORD-REQUIRED
           ELSE
               MOVE "N" TO D-PASSWORD-REQUIRED.
           MOVE SPACES     TO LINK-EXTRA.
      *
      * Store entries that have been deleted
       STORE-DEL-ANA.
         ADD 1   TO WS-DEL-ENTRY-SUB.
         IF   D-LVITEM-TEXT(11) > ZEROES
              MOVE D-LVITEM-TEXT(11) TO WS-ANALYSIS-DETAIL
              MOVE WS-ANA-NO
                   TO WS-DEL-ANALYSIS(WS-DEL-ENTRY-SUB).
         IF   D-CHANGED-TEXT(11) > ZEROES
              MOVE D-CHANGED-TEXT(11)
                   TO WS-DEL-ANALYSIS(WS-DEL-ENTRY-SUB).
068a         MOVE "Y"    TO DEL-CUS-FRM.
068a  * Remove this code, its too early to delete the custom forms
068a  * Wait for customer to Cancel or Save the entry
068a  *   PERFORM DELETE-CUSTOM-FORMS.

      *
      * Clear deleted entries table
       CLEAR-DEL-ENT.
         MOVE SPACES TO WS-DEL-ENTRY-TABLE.
         MOVE ZEROES TO WS-DEL-ENTRY-SUB.
      *
       DIST-UNDIST-AMT.
           PERFORM DIST-AMT-START THRU DIST-AMT-END.
       DIST-AMT-START.
      *
      *
           MOVE D-LVITEM-TEXT(6) TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM-VAL           TO WS-DEBIT.
      *
           MOVE D-LVITEM-TEXT(7) TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM-VAL           TO WS-CREDIT.
           COMPUTE  WS-CREDIT = WS-CREDIT * -1.
      *
            IF   WS-DEBIT > ZEROES
                 GO TO DIST-AMT-DEBIT.
            IF   WS-CREDIT < ZEROES
                 GO TO DIST-AMT-CREDIT.
      *
            IF   D-UNDIST > ZEROES
                 GO TO DIST-AMT-DEBIT.
            IF   D-UNDIST < ZEROES
                 GO TO DIST-AMT-CREDIT.
      *
       DIST-AMT-DEBIT.
           COMPUTE  WS-DEBIT ROUNDED = WS-DEBIT + D-UNDIST.
           IF  WS-DEBIT < ZEROES
               COMPUTE WS-CREDIT = WS-DEBIT * -1
               MOVE ZEROES         TO WS-DEBIT.
           GO TO DIST-AMT-CONT.
      *
       DIST-AMT-CREDIT.
           COMPUTE WS-CREDIT ROUNDED = WS-CREDIT + D-UNDIST.
           IF  WS-CREDIT > ZEROES
               MOVE WS-CREDIT     TO  WS-DEBIT
               MOVE ZEROES        TO WS-CREDIT
           ELSE
               COMPUTE WS-CREDIT = WS-CREDIT * -1.
      *
       DIST-AMT-CONT.
      *
           MOVE WS-DEBIT          TO EDITED-TRNVALUE.
           MOVE EDITED-TRNVALUE   TO D-DEBIT-AMOUNT.

           MOVE WS-CREDIT         TO EDITED-TRNVALUE.
           MOVE EDITED-TRNVALUE   TO D-CREDIT-AMOUNT.
       DIST-AMT-END.
      *
      **  HEAD OF FORM
       HOF.
      *
      **  Routine to be Verify whether the transaction will be
      **  allowed. Can be used to disable/enable functions so that an
      **  operator is disallowed from a function.
      **  Output : STAT-OK     Function should be allowed
       ESIGNATURES-VERIFY.
           PERFORM TRN-INITIALISE.
      *
      * Only verify functions in eSignatures if they are not already
      * disallowed
      *
           MOVE TRNID-GEN-NRM-ADD TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N" TO D-NORM-ADD
           ELSE
               MOVE "Y" TO D-NORM-ADD.
      *
           MOVE TRNID-GEN-NRM-MAINT TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N" TO D-NORM-MAINT
           ELSE
               MOVE "Y" TO D-NORM-MAINT.
      *
           MOVE TRNID-GEN-NRM-AUTH TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N" TO D-NORM-AUTH
022                        D-NORM-SUBMOD-AUTH
           ELSE
               MOVE "Y" TO D-NORM-AUTH
022                        D-NORM-SUBMOD-AUTH.
      *
           MOVE TRNID-GEN-NRM-PRINT TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N"  TO D-NORM-PRINT
           ELSE
               MOVE "Y"  TO D-NORM-PRINT.
      *
           MOVE TRNID-GEN-NRM-UNAUTH TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N"  TO D-NORM-UNAUTH
022                         D-NORM-SUBMOD-UNAUTH
           ELSE
               MOVE "Y"  TO D-NORM-UNAUTH
022                         D-NORM-SUBMOD-UNAUTH.
      *
           MOVE TRNID-GEN-NRM-HOLD TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N"  TO D-NORM-HOLD
           ELSE
               MOVE "Y"  TO D-NORM-HOLD.
      *
           MOVE TRNID-GEN-NRM-CANCEL TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N"  TO D-NORM-CAN
           ELSE
               MOVE "Y"  TO D-NORM-CAN.
      *
           MOVE TRNID-GEN-NRM-REL TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N"  TO D-NORM-REL
           ELSE
               MOVE "Y"  TO D-NORM-REL.
      *
           MOVE TRNID-GEN-NRM-POST TO TRN-ID.
           PERFORM TRN-VERIFY.
           IF  STAT-CODE NOT = "00"
               MOVE "N"  TO D-NORM-POST
           ELSE
               MOVE "Y"  TO D-NORM-POST.

107   ** If allow GL post to previous year is setup, check user access
107   ** in eSignatures to post to previous
107        move "N"     to d-esigs-post-prev.
107        if d-genctl-post-prev = "Y"
107          move trnid-gen-prev-post  to trn-id
107          perform trn-verify
107          if stat-code = "00"
107            move "Y" to d-esigs-post-prev
107          end-if
107        end-if.
      *
      **  Prior to the transaction the parameters available must
      **  be passed to the Electronic Signature function
       ESIGNATURES-PRIOR.
           PERFORM TRN-INITIALISE.
      *
      *   Pass the transaction id as defined in IMPTRN.WRK
107        evaluate esig-type
107          when "NORM-ADD"
107            move trnid-gen-nrm-add    to trn-id
107          when "NORM-MAINT"
107            move trnid-gen-nrm-maint  to trn-id
107          when "NORM-AUTH"
107            move trnid-gen-nrm-auth   to trn-id
107          when "NORM-PRINT"
107            move trnid-gen-nrm-print  to trn-id
107          when "NORM-UNAUTH"
107            move trnid-gen-nrm-unauth to trn-id
107          when "NORM-HOLD"
107            move trnid-gen-nrm-hold   to trn-id
107          when "NORM-CANCEL"
107            move trnid-gen-nrm-cancel to trn-id
107          when "NORM-REL"
107            move trnid-gen-nrm-rel    to trn-id
107          when "NORM-POST"
107            move trnid-gen-nrm-post   to trn-id
107          when "POST-PREV-POST"
107            move trnid-gen-prev-post  to trn-id
107          when "REC-ADD"
107            move trnid-gen-rec-add    to trn-id
107          when "REC-MAINT"
107            move trnid-gen-rec-maint  to trn-id
107          when "REC-AUTH"
107            move trnid-gen-rec-auth   to trn-id
107          when "REC-PRINT"
107            move trnid-gen-rec-print  to trn-id
107          when "REC-UNAUTH"
107            move trnid-gen-rec-unauth to trn-id
107          when "REC-CANCEL"
107            move trnid-gen-rec-cancel to trn-id
107          when "REC-POST"
107            move trnid-gen-rec-post   to trn-id
107        end-evaluate.

      **  Pass variables defined for this transaction
           IF ESIG-TYPE = "NORM-ADD"
               MOVE SPACES               TO TRN-PAR-ALP(1)   *> %Key
               MOVE D-JNL-YEAR           TO TRN-PAR-NUM(2)   *> %GlYear
               MOVE D-JNL-PER            TO TRN-PAR-NUM(3)   *> %GlPeriod
               MOVE ZEROES               TO TRN-PAR-NUM(4)   *> %GlJournal
               MOVE "N"                  TO TRN-PAR-ALP(5)   *> %JnlPrintFlag
               MOVE D-JNL-DATE           TO DATE-NORMAL
               PERFORM DATE-TO-CYMD
               MOVE DATE-CCYYMMDD        TO TRN-PAR-DAT(6)   *> %JournalDate
               MOVE D-LV-SIZE            TO TRN-PAR-NUM(7)   *> %NumOfEntries
               MOVE D-JNLTOTDR           TO TRN-PAR-NUM(8)   *> %DebitAmount
               MOVE D-JNLTOTCR           TO TRN-PAR-NUM(9)   *> %CreditAmount
               MOVE D-JNL-TYPE           TO TRN-PAR-ALP(10)  *> %JnlPostingType
               IF   D-JNL-TYPE = "N"
                    MOVE "J"             TO TRN-PAR-ALP(11)  *> %Source
               ELSE
                    MOVE " "             TO TRN-PAR-ALP(11)
               END-IF
               MOVE OPERATOR-CODE        TO TRN-PAR-ALP(12)  *> %Operator
               MOVE "N"                  TO TRN-PAR-ALP(13)  *> %JnlStatus
               MOVE D-JNL-REF            TO TRN-PAR-ALP(14)  *> %Reference
               MOVE D-JNL-NOTE           TO TRN-PAR-ALP(15)  *> %Notation
               MOVE D-JNLSCODE           TO TRN-PAR-ALP(16)  *> %UserDefSource
               IF   D-JNL-TYPE = "L"
                    MOVE D-CURR          TO TRN-PAR-ALP(17)  *> %Currency
               ELSE
                    MOVE SPACES          TO TRN-PAR-ALP(17)
               END-IF.
      *
           IF ESIG-TYPE = "NORM-MAINT" OR "NORM-AUTH"
                       OR "NORM-PRINT" OR "NORM-UNAUTH"
                       OR "NORM-HOLD"  OR "NORM-CANCEL"
                       OR "NORM-REL"   OR "NORM-POST"
107                    OR "POST-PREV-POST"
101    *> We have not yet read the correct journal, genjnc-rec will
101    *> contain data for the last record read to load the listview
101    *> (this only when auth from authorize journals lv - GENPJML2)
101            if d-s-fr-msg = "auth-item"
101              perform genjnc-initialize-rec
101              move D-LVITEM-TEXT(10)    to genjnc-key
101              perform genjnc-read
101            end-if
               MOVE GENJNC-KEY           TO TRN-PAR-ALP(1)   *> %Key
               MOVE GENJNC-YEAR          TO TRN-PAR-NUM(2)   *> %GlYear
               MOVE GENJNC-PER           TO TRN-PAR-NUM(3)   *> %GlPeriod
               MOVE GENJNC-JNL           TO TRN-PAR-NUM(4)   *> %GlJournal
               MOVE GENJNC-PRINT         TO TRN-PAR-ALP(5)   *> %JnlPrintFlag
               MOVE GENJNC-JDAT          TO TRN-PAR-DAT(6)   *> %JournalDate
               MOVE GENJNC-TRAN          TO TRN-PAR-NUM(7)   *> %NumOfEntries
               MOVE GENJNC-DEB           TO TRN-PAR-NUM(8)   *> %DebitAmount
               MOVE GENJNC-CRD           TO TRN-PAR-NUM(9)   *> %CreditAmount
               MOVE GENJNC-JTYP          TO TRN-PAR-ALP(10)  *> %JnlPostingType
               MOVE GENJNC-SRC           TO TRN-PAR-ALP(11)  *> %Source
               MOVE GENJNC-OPCODE        TO TRN-PAR-ALP(12)  *> %Operator
               MOVE GENJNC-STAT          TO TRN-PAR-ALP(13)  *> %JnlStatus
               MOVE GENJNC-REF           TO TRN-PAR-ALP(14)  *> %Reference
               MOVE GENJNC-NOTE          TO TRN-PAR-ALP(15)  *> %Notation
               MOVE GENJNC-SCODE         TO TRN-PAR-ALP(16)  *> %UserDefSource
               MOVE GENJNC-CUR           TO TRN-PAR-ALP(17)  *> %Currency
               MOVE GENJNC-AUTHBY        TO TRN-PAR-ALP(18)  *> %AuthorizedBy
               MOVE GENJNC-POSTBY        TO TRN-PAR-ALP(19)  *> %PostedBy
               MOVE GENJNC-AUTHORISED    TO TRN-PAR-ALP(20). *> %Authorized
      *
           IF  ESIG-TYPE = "REC-ADD" OR "REC-MAINT"
                        OR "REC-AUTH" OR "REC-PRINT"
                        OR "REC-UNAUTH" OR "REC-CANCEL"
                        OR "REC-POST"
               MOVE GENRJC-KEY           TO TRN-PAR-ALP(1)   *> %Key
               MOVE GENRJC-CODE          TO TRN-PAR-ALP(2)   *> %Journal
               MOVE GENRJC-TRAN          TO TRN-PAR-NUM(3)   *> %NumOfEntries
               MOVE GENRJC-DEB           TO TRN-PAR-NUM(4)   *> %DebitAmount
               MOVE GENRJC-CRD           TO TRN-PAR-NUM(5)   *> %CreditAmount
               MOVE GENRJC-REF           TO TRN-PAR-ALP(6)   *> %Reference
               MOVE GENRJC-NOTE          TO TRN-PAR-ALP(7)   *> %Notation
               MOVE GENRJC-NYEAR         TO TRN-PAR-NUM(8)   *> %NextPostYear
               MOVE GENRJC-NPER          TO TRN-PAR-NUM(9)   *> %GenrjcNper
               MOVE GENRJC-EYEAR         TO TRN-PAR-NUM(10)  *> %GenrjcEyear
               MOVE GENRJC-EPER          TO TRN-PAR-NUM(11)  *> %NextPostPeriod
               MOVE GENRJC-FREQ          TO TRN-PAR-NUM(12)  *> %PostFrequency
               MOVE GENRJC-LYEAR         TO TRN-PAR-NUM(13)  *> %LastYearPosted
               MOVE GENRJC-LPER          TO TRN-PAR-NUM(14)  *> %LastPeriodPosted
               MOVE GENRJC-LJNL          TO TRN-PAR-NUM(15)  *> %LastJnlPostedTo
               MOVE GENRJC-SCODE         TO TRN-PAR-ALP(16)  *> %Source
               MOVE GENRJC-AUTHBY        TO TRN-PAR-ALP(17)  *> %AuthorisedBy
               MOVE GENRJC-AUTHORISED    TO TRN-PAR-ALP(18). *> %Authorised

           PERFORM TRN-PRIOR.
           IF STAT-CODE NOT = "00"
               MOVE "sig-err" TO D-S-ERROR
           ELSE
               MOVE TRN-RET-LOG-KEY TO TRN-SAV-LOG-KEY(1).
      *
      **  Now inform the Electronic Signature system that the
      **  transaction has completed
       ESIGNATURES-COMPLETE.
           PERFORM TRN-INIT-COMPLETE.
           MOVE TRN-SAV-LOG-KEY(1)  TO TRN-ORIG-LOG-KEY.

107        if postPrev = "Y"
107          if esig-type = "NORM-POST"
107            move "POST-PREV-POST" to esig-type
107          end-if
107        end-if.

107        IF ESIG-TYPE = "NORM-POST" OR "POST-PREV-POST"
               PERFORM GENJNC-READ
               PERFORM COMER.
           IF ESIG-TYPE = "REC-POST"
               PERFORM GENRJC-READ
               PERFORM COMER.

           IF ESIG-TYPE = "NORM-MAINT" OR "NORM-AUTH"
                       OR "NORM-PRINT" OR "NORM-UNAUTH"
                       OR "NORM-HOLD"  OR "NORM-CANCEL"
                       OR "NORM-REL"   OR "NORM-POST"
                       OR "NORM-ADD"
107                    OR "POST-PREV-POST"
               MOVE GENJNC-KEY           TO TRN-PAR-ALP(1)   *> %Key
               MOVE GENJNC-YEAR          TO TRN-PAR-NUM(2)   *> %GlYear
               MOVE GENJNC-PER           TO TRN-PAR-NUM(3)   *> %GlPeriod
               MOVE GENJNC-JNL           TO TRN-PAR-NUM(4)   *> %GlJournal
               MOVE GENJNC-PRINT         TO TRN-PAR-ALP(5)   *> %JnlPrintFlag
               MOVE GENJNC-JDAT          TO TRN-PAR-DAT(6)   *> %JournalDate
               MOVE GENJNC-TRAN          TO TRN-PAR-NUM(7)   *> %NumOfEntries
               MOVE GENJNC-DEB           TO TRN-PAR-NUM(8)   *> %DebitAmount
               MOVE GENJNC-CRD           TO TRN-PAR-NUM(9)   *> %CreditAmount
               MOVE GENJNC-JTYP          TO TRN-PAR-ALP(10)  *> %JnlPostingType
               MOVE GENJNC-SRC           TO TRN-PAR-ALP(11)  *> %Source
               MOVE GENJNC-OPCODE        TO TRN-PAR-ALP(12)  *> %Operator
               MOVE GENJNC-STAT          TO TRN-PAR-ALP(13)  *> %JnlStatus
               MOVE GENJNC-REF           TO TRN-PAR-ALP(14)  *> %Reference
               MOVE GENJNC-NOTE          TO TRN-PAR-ALP(15)  *> %Notation
               MOVE GENJNC-SCODE         TO TRN-PAR-ALP(16)  *> %UserDefSource
               MOVE GENJNC-CUR           TO TRN-PAR-ALP(17)  *> %Currency
               MOVE GENJNC-AUTHBY        TO TRN-PAR-ALP(18)  *> %AuthorizedBy
               MOVE GENJNC-POSTBY        TO TRN-PAR-ALP(19)  *> %PostedBy
               MOVE GENJNC-AUTHORISED    TO TRN-PAR-ALP(20). *> %Authorized
      *
           IF  ESIG-TYPE = "REC-ADD" OR "REC-MAINT"
                        OR "REC-AUTH" OR "REC-PRINT"
                        OR "REC-UNAUTH" OR "REC-CANCEL"
                        OR "REC-POST"
               MOVE GENRJC-KEY           TO TRN-PAR-ALP(1)   *> %Key
               MOVE GENRJC-CODE          TO TRN-PAR-ALP(2)   *> %Journal
               MOVE GENRJC-TRAN          TO TRN-PAR-NUM(3)   *> %NumOfEntries
               MOVE GENRJC-DEB           TO TRN-PAR-NUM(4)   *> %DebitAmount
               MOVE GENRJC-CRD           TO TRN-PAR-NUM(5)   *> %CreditAmount
               MOVE GENRJC-REF           TO TRN-PAR-ALP(6)   *> %Reference
               MOVE GENRJC-NOTE          TO TRN-PAR-ALP(7)   *> %Notation
               MOVE GENRJC-NYEAR         TO TRN-PAR-NUM(8)   *> %NextPostYear
               MOVE GENRJC-NPER          TO TRN-PAR-NUM(9)   *> %GenrjcNper
               MOVE GENRJC-EYEAR         TO TRN-PAR-NUM(10)  *> %GenrjcEyear
               MOVE GENRJC-EPER          TO TRN-PAR-NUM(11)  *> %NextPostPeriod
               MOVE GENRJC-FREQ          TO TRN-PAR-NUM(12)  *> %PostFrequency
               MOVE GENRJC-LYEAR         TO TRN-PAR-NUM(13)  *> %LastYearPosted
               MOVE GENRJC-LPER          TO TRN-PAR-NUM(14)  *> %LastPeriodPosted
               MOVE GENRJC-LJNL          TO TRN-PAR-NUM(15)  *> %LastJnlPostedTo
               MOVE GENRJC-SCODE         TO TRN-PAR-ALP(16)  *> %Source
               MOVE GENRJC-AUTHBY        TO TRN-PAR-ALP(17)  *> %AuthorisedBy
               MOVE GENRJC-AUTHORISED    TO TRN-PAR-ALP(18). *> %Authorised
      *
           PERFORM TRN-COMPLETE.
           IF STAT-CODE NOT = "00"
               MOVE "sig-err" TO D-S-ERROR.
      *
      * Validate supplied password
       VALIDATE-PASSWORD.
           MOVE SPACES         TO LINK-PASS.
           MOVE "GENMST"   TO LINK-PASS-TYP.
           MOVE D-CHANGED-TEXT(2) TO LINK-PASS-KEY
           MOVE COMPID  TO LINK-PASS-CMP
           MOVE D-LEDGER-PASSWORD TO LINK-PASS-ENT.
           PERFORM VERIFY-PASSWORD.
           IF LINK-PASS-OK = "N"
               MOVE "N"        TO D-PASSWORD-VALID
           ELSE
               MOVE "Y"        TO D-PASSWORD-VALID.
           MOVE SPACES         TO LINK-EXTRA.
      *
      * Validate auditors password
       VALIDATE-AUD-PASS.
           MOVE SPACES         TO LINK-PASS.
           MOVE "-GEN01"       TO LINK-PASS-TYP.
           MOVE SPACES         TO LINK-PASS-KEY
           MOVE COMPID         TO LINK-PASS-CMP
           MOVE D-LEDGER-PASSWORD TO LINK-PASS-ENT.
           PERFORM VERIFY-PASSWORD.
           IF LINK-PASS-OK = "N"
               MOVE "N"        TO D-PASSWORD-VALID
           ELSE
               MOVE "Y"        TO D-PASSWORD-VALID.
           MOVE SPACES         TO LINK-EXTRA.
      *
       CHECK-ANALYSIS-REQ.
           PERFORM GENMST-INITIALIZE-REC.
           MOVE COMPID                 TO GENMST-CMP.
           MOVE D-CHANGED-TEXT(2)      TO GENMST-ACC.
044        IF  PASTE-MODE = "Y"
044            MOVE CellValue(2)       TO GENMST-ACC
044        END-IF.
           PERFORM GENMST-READ.
           IF  NOT STAT-OK
               MOVE SPACES             TO GENMST-REC
           ELSE
               PERFORM COMER.
           IF  GENMST-ANAREQ = "Y"
               MOVE "Y"                TO D-ANALYSIS-REQUIRED
           ELSE
               MOVE "N"                TO D-ANALYSIS-REQUIRED.

107        if postPrev = "Y"
107          move "N"                  to d-analysis-required
107        end-if.

       ENTER-GL-ANALYSIS.
           MOVE SPACES          TO GENANA-ENTRY-FIELDS.
           MOVE SPACES          TO WS-ANALYSIS-DETAIL.
023        MOVE "G"             TO GENANA-CALL-FROM.
023        MOVE "GEN"           TO GENANA-SUB-MOD.
096        MOVE D-CHANGED-TEXT(11)   TO NUMB-R.
096        PERFORM NUMB-CHECK.
096        MOVE NUM-VAL(3:10)   TO WS-ANALYSIS-DETAIL
           MOVE 1               TO GENANA-LINE.
           IF   WS-ANA-NO > ZEROES
                MOVE WS-ANA-NO  TO GENANA-AENTRY.
           MOVE "N"             TO GENANA-GL-READ.
           MOVE D-CHANGED-TEXT(2)  TO GENANA-ACC.
           MOVE D-CHANGED-TEXT(3)  TO GENANA-SOURCE.
      *
007        MOVE D-CHANGED-TEXT(6) TO NUMB-R.
007        PERFORM NUMB-CHECK.
007        MOVE NUM-VAL    TO WS-DEBIT.
007        MOVE D-CHANGED-TEXT(7) TO NUMB-R.
007        PERFORM NUMB-CHECK.
007        MOVE NUM-VAL    TO WS-CREDIT.
007        IF  WS-DEBIT > ZEROES
007            MOVE WS-DEBIT TO GENANA-AMT
007        ELSE
007             COMPUTE GENANA-AMT = WS-CREDIT * -1.
           MOVE D-JNL-YEAR      TO GENANA-YEAR.
           MOVE D-JNL-PER       TO GENANA-PNO.
           MOVE D-CHANGED-TEXT(8) TO GENANA-CMT.
           PERFORM CAP-AND-POST-ANALYSIS.
           IF GENANA-JNL-DONE = "Y"
               NEXT SENTENCE
           ELSE
063            MOVE ZEROES      TO GENANA-AMT.
063   *         GO TO ENTER-GL-ANALYSIS.
           MOVE SPACES          TO WS-ANALYSIS-DETAIL.
           MOVE GENANA-AENTRY   TO WS-ANA-NO.
           MOVE GENANA-LINE     TO WS-ANA-LINE.
043        MOVE WS-ANA-NO          TO D-ANALYSiS-DETAIL.
           MOVE GENANA-AMT      TO EDIT-VALUE.
039        STRING "Edit:"       DELIMITED BY SIZE
039               EDIT-VALUE    DELIMITED BY SIZE
039                             INTO D-ANALYSIS-AMOUNT.
           PERFORM DEL-ANALYSIS-FILE.
      *
       DELETE-ANALYSIS-START.
           MOVE WS-DEL-ANALYSIS(WS-DEL-ENTRY-SUB)
                                TO WS-ANALYSIS-DETAIL.
           MOVE SPACES          TO GENANA-ENTRY-FIELDS.
           MOVE WS-ANA-NO       TO GENANA-AENTRY.
           MOVE D-JNL-YEAR      TO GENANA-YEAR.
           MOVE D-JNL-PER       TO GENANA-PNO.
           PERFORM DEL-ANALYSIS-ENTRY.
           MOVE ZEROES          TO GENANA-ENTRY-FIELDS.
       DELETE-ANALYSIS-END.
      *
      * Check that from journal number exists
       CHECK-EXIST.
           MOVE SPACES         TO GENJNC-KEY.
           MOVE D-FROM-YEAR    TO GENJNC-YEAR.
           MOVE D-FROM-PER     TO GENJNC-PER.
           MOVE D-FROM-JNL     TO GENJNC-JNL.
           PERFORM GENJNC-READ.
           IF NOT STAT-OK
               MOVE "XX" TO D-S-ERROR
           ELSE
               PERFORM COMER.
005        IF  GENJNC-JTYP = "P"
005        AND (D-TO-YEAR NOT = SAV-G00YEAR
005        OR   D-TO-PER  NOT = SAV-G00PER)
005            MOVE "PP"       TO D-S-ERROR.
      *
      *  Copy existing journal to a new journal
       COPY-EXIST.
           PERFORM COPY-EXIST-START THRU
                   COPY-EXIST-END.

016        MOVE SPACES        TO LINK-EXTRA-1 LINK-EXTRA-2 LINK-EXTRA-3
016                              LINK-BROWSE LINK-BROWSE-EXTRA.
016        MOVE "COPY"        TO LINK-EXTRA-1(1:4).
016        MOVE "GJ"          TO LINK-EXTRA-2.
016        MOVE D-STD-JNL-KEY TO LINK-BROWSE.
016        MOVE "GJ"          TO LINK-EXTRA-2(7:6).
016        MOVE D-NEW-JNL-KEY TO LINK-BROWSE-EXTRA.
016        MOVE "IMPNOT"      TO WW-PROG-NAME.
016        PERFORM CALL-PROGRAM-NO-CANCEL.
016        MOVE SPACES        TO LINK-EXTRA-1 LINK-EXTRA-2 LINK-EXTRA-3
016                              LINK-BROWSE LINK-BROWSE-EXTRA.
039a       PERFORM COMMIT-TRANSACTION.

039a       IF  D-S-ERROR <> "sig-err"
039a           PERFORM ESIGNATURES-COMPLETE.

016        MOVE GENJNC-PER    TO D-JNL-PER-X.
016        MOVE GENJNC-YEAR   TO D-JNL-YEAR-X.
016        MOVE GENJNC-JNL    TO D-JNL-NO-X.

084nk ** Close audit
084nk      perform comnxk-initialize.
084nk      move compid        to comnxk-company.
084nk      move wsYear        to comnxk-post-year.
084nk      move wsPeriod      to comnxk-post-period.
084nk      move d-jnl-no      to comnxk-key.
084nk      perform comnxk-gen-fin-journal.

       COPY-EXIST-START.
052        MOVE "NORM-ADD"    TO ESIG-TYPE.
052        PERFORM ESIGNATURES-PRIOR.
052        IF  D-S-ERROR = "sig-err"
052            GO TO COPY-EXIST-END.
039a       PERFORM BEGIN-TRANSACTION.
      *
           MOVE SPACES        TO GENJNC-KEY.
           MOVE D-FROM-YEAR   TO GENJNC-YEAR.
           MOVE D-FROM-PER    TO GENJNC-PER.
           MOVE D-FROM-JNL    TO GENJNC-JNL.
           PERFORM GENJNC-READ.
           IF NOT STAT-OK
               GO TO COPY-EXIST-END.
           PERFORM COMER.
      *
060a       MOVE SPACES        TO D-CHANGE-MAINT.
016        MOVE GENJNC-KEY    TO D-STD-JNL-KEY.

026d  * Check sub module journal
026d       IF  GENJNC-SRC = "E"
026d           MOVE SPACES      TO GENJNC-JSRC
026d           MOVE SPACES      TO GENJNC-TCD
026d           MOVE "J"         TO GENJNC-SRC
026d           MOVE "N"         TO GENJNC-JTYP
026d           MOVE "J"         TO GENJNC-SCODE.
039a
039a       MOVE D-TO-YEAR       TO D-JNL-YEAR.
039a       MOVE D-TO-PER        TO D-JNL-PER.
039a       MOVE GENJNC-JDAT     TO D-JNL-DATE.
039a       MOVE GENJNC-TRAN     TO D-LV-SIZE.
039a       MOVE GENJNC-DEB      TO D-JNLTOTDR.
039a       MOVE GENJNC-CRD      TO D-JNLTOTCR.
039a       IF   D-COPY-REVERSE = 1
039a            MOVE GENJNC-DEB TO D-JNLTOTCR
039a            MOVE GENJNC-CRD TO D-JNLTOTDR
039a       END-IF.
039a       MOVE GENJNC-JTYP     TO D-JNL-TYPE.
039a       MOVE GENJNC-REF      TO D-JNL-REF.
039a       MOVE GENJNC-NOTE     TO D-JNL-NOTE.
039a       MOVE GENJNC-SCODE    TO D-JNLSCODE.
      *
           MOVE D-TO-YEAR       TO D-JNL-YEAR
084nk                              wsYear.
           MOVE D-TO-PER        TO D-JNL-PER
084nk                              wsPeriod.

084nk  COPY-EXIST-NEXT-JOURNAL.
           PERFORM GetNextJournal.

           move d-to-year       to genjnc-year 
                                   d-jnl-year-x.
           move d-to-per        to genjnc-per  
                                   d-jnl-per-x.
           move d-jnl-no        to genjnc-jnl  
                                   d-jnl-no-x.
           move "N"             to genjnc-stat.
           move spaces          to genjnc-authby.
           move spaces          to genjnc-postby.
102        initialize genjnc-postdate.
           move spaces          to genjnc-authorised.
           move spaces          to genjnc-print.
           move d-jnl-copy-date to date-normal.
           perform date-to-cymd.
           move date-ccyymmdd   to genjnc-jdat.
           move operator-code   to genjnc-opcode.
           perform genjnc-write.
084nk      if stat-dup
084nk         go to copy-exist-next-journal
084nk      end-if.
           perform comer.

016        MOVE GENJNC-KEY     TO D-NEW-JNL-KEY.
      *
      *  Set up dictionary
70FIX      MOVE    26          TO FIELDKEYMAX.
70FIX      MOVE    676         TO FIELDDATAMAX.
           PERFORM CREATE-DICTIONARY.
           MOVE "Y" TO WS-OBJECT.
      *
           MOVE SPACES         TO GENJND-KEY.
           MOVE D-FROM-YEAR    TO GENJND-YEAR.
           MOVE D-FROM-PER     TO GENJND-PER.
           MOVE D-FROM-JNL     TO GENJND-JNL.
           PERFORM GENJND-START-GE.
           IF      STAT-INVALID-KEY
                   GO TO COPY-EXIST-LAST.
           PERFORM COMER.

       COPY-EXIST-NEXT.
           PERFORM GENJND-READ-NEXT.
           IF  STAT-AT-END
               GO TO COPY-EXIST-LAST.
           IF  NOT STAT-OK
               GO TO COPY-EXIST-LAST.
           PERFORM COMER.
      *
           IF  GENJND-YEAR     NOT = D-FROM-YEAR
           OR  GENJND-PER      NOT = D-FROM-PER
           OR  GENJND-JNL      NOT = D-FROM-JNL
               GO TO COPY-EXIST-LAST.
      *
           MOVE GENJND-KEY     TO FIELDKEY.
           MOVE GENJND-REC     TO DICTDATA.
           MOVE DICTDATA       TO FIELDTOUSE
           PERFORM ADD-TO-DICTIONARY.
      *
           GO TO COPY-EXIST-NEXT.

       COPY-EXIST-LAST.
           INVOKE FieldDict 'associations' returning
                               ORDCOLL-OBJECT
           INVOKE ORDCOLL-OBJECT "SIZE" RETURNING ORDCOL-SIZE1
      *
           IF ORDCOL-SIZE1 NOT > 0
               GO TO COPY-EXIST-DEL
           ELSE
               INVOKE ORDCOLL-OBJECT 'asSortedCollection'
                      RETURNING ORDCOLL-SRTREC.
               MOVE "Y" TO WS-SRTREC.
      *
           PERFORM VARYING ORDCOLL-SIZE FROM 1 BY 1
                   UNTIL   ORDCOLL-SIZE > ORDCOL-SIZE1
                   INVOKE ORDCOLL-SRTREC "at"  USING ORDCOLL-SIZE
                                         RETURNING ARRAY-REC
                   MOVE ARRAY-REC TO RETURN-STRING
                   PERFORM COPY-DET-START THRU
                           COPY-DET-END
           END-PERFORM.
      *
       COPY-EXIST-DEL.
           IF ORDCOLL-SRTREC NOT = NULL
           AND WS-SRTREC = "Y"
              INVOKE ORDCOLL-SRTREC "deepfinalize"
                                      RETURNING ORDCOLL-SRTREC.
           IF ORDCOLL-OBJECT NOT = NULL
           AND WS-OBJECT = "Y"
              INVOKE ORDCOLL-OBJECT "deepfinalize"
                                      RETURNING ORDCOLL-OBJECT.
      *
           PERFORM GET-NUMERIC-PERIOD.
      *
       COPY-EXIST-END.
029A       IF GENJNC-JTYP = "N"
029A          PERFORM JNL-TRIGGER.
      *
       COPY-DET-START.
           MOVE RETURN-RECORD  TO GENJND-REC.
014        MOVE GENJND-YEAR    TO OLD-JNL-YEAR.
014        MOVE GENJND-PER     TO OLD-JNL-PER.
           MOVE D-TO-YEAR      TO GENJND-YEAR.
           MOVE D-TO-PER       TO GENJND-PER.
           MOVE D-JNL-NO       TO GENJND-JNL.
      *
003        IF D-COPY-REVERSE = 1
003           IF GENJND-COD = "D"
003              MOVE "C" TO GENJND-COD
003           ELSE
003              MOVE "D" TO GENJND-COD.
027        IF D-COPY-REVERSE = 1
027           MOVE GENJND-IDR TO WS-IDR
027           MOVE GENJND-ICR TO GENJND-IDR
027           MOVE WS-IDR     TO GENJND-ICR
027        END-IF.
026d       MOVE SPACES    TO GENJND-SRC
026d       MOVE SPACES    TO GENJND-TCD.
      *
           MOVE D-JNL-COPY-DATE  TO DATE-NORMAL.
           PERFORM DATE-TO-CYMD.
           MOVE DATE-CCYYMMDD TO GENJND-DATE.
016        MOVE SPACES        TO GENJND-POSTED.
      *
           IF   GENJND-AENTRY > ZEROES
                PERFORM RE-NUMBER-AENTRY
                MOVE NEW-AENTRY TO GENJND-AENTRY.
           PERFORM GENJND-WRITE.
           PERFORM COMER.
065cuc     PERFORM COPY-CUSTOM-FORMS.

       COPY-DET-END.
      *
       BROWSE-DR-LEDGER.
           MOVE SPACES      TO LINK-BROWSE.
           MOVE "B"         TO LINK-BRW-ENQ.
           MOVE D-LVITEM-TEXT(16) TO LINK-BRW-1 D-S-TO-PAR.
           MOVE D-LVITEM-TEXT(15) TO LINK-BRW-2.
           MOVE "GENBGL"    TO WW-PROG-NAME.
           PERFORM CALL-PROGRAM.
           IF   LINK-BRW-RET > SPACES
                MOVE LINK-BRW-RET TO D-S-TO-PAR.
           MOVE SPACES      TO LINK-EXTRA.

       BROWSE-CR-LEDGER.
           MOVE SPACES      TO LINK-BROWSE.
           MOVE "B"         TO LINK-BRW-ENQ.
           MOVE D-LVITEM-TEXT(17) TO LINK-BRW-1 D-S-TO-PAR.
           MOVE D-LVITEM-TEXT(15) TO LINK-BRW-2.
           MOVE "GENBGL"    TO WW-PROG-NAME.
           PERFORM CALL-PROGRAM.
           IF   LINK-BRW-RET > SPACES
                MOVE LINK-BRW-RET TO D-S-TO-PAR.
           MOVE SPACES      TO LINK-EXTRA.
      *
       CHECK-DR-AMOUNT.
           MOVE D-CHANGED-TEXT(6)  TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM-VAL        TO WS-NUM-VAL.
      *
           IF WS-NUM-VAL < ZEROES
              MOVE "invalid" TO D-S-ERROR
              MOVE ZEROES    TO WS-DEBIT
              MOVE WS-DEBIT          TO EDIT-VALUE
              MOVE EDIT-VALUE        TO D-DEBIT-AMOUNT
           ELSE
              MOVE SPACES    TO D-S-ERROR.

       CHECK-CR-AMOUNT.
           MOVE D-CHANGED-TEXT(7)  TO NUMB-R.
           PERFORM NUMB-CHECK.
           MOVE NUM-VAL        TO WS-NUM-VAL.
      *
           IF WS-NUM-VAL < ZEROES
              MOVE "invalid"  TO D-S-ERROR
              MOVE ZEROES     TO WS-CREDIT
              MOVE WS-CREDIT  TO EDIT-VALUE
              MOVE EDIT-VALUE TO D-CREDIT-AMOUNT
           ELSE
              MOVE SPACES    TO D-S-ERROR.
      *
       SET-FUNC-KEYS.
      *
022   *
022        MOVE "D" TO D-AUTH-FUNC.
022        MOVE "D" TO D-UNAUTH-FUNC.
022   *

           IF D-NORM-AUTH = "Y"
022        IF  SUBMOD-JNL = "N"
              IF GENJNC-AUTHORISED = "Y"
                 MOVE "D"    TO D-AUTH-FUNC
              ELSE
                 IF  GENJNC-STAT = "C"
                 OR  GENJNC-STAT = "P"
                 OR  GENJNC-STAT = "H"
                     MOVE "D" TO D-AUTH-FUNC
                 ELSE
                     MOVE "E"    TO D-AUTH-FUNC
                 END-IF
              END-IF.
      *
022        IF D-NORM-SUBMOD-AUTH = "Y"
022        IF  SUBMOD-JNL = "Y"
022           IF GENJNC-AUTHORISED = "Y"
022              MOVE "D"    TO D-AUTH-FUNC
022           ELSE
022              IF  GENJNC-STAT = "C"
022              OR  GENJNC-STAT = "P"
022              OR  GENJNC-STAT = "H"
022                  MOVE "D" TO D-AUTH-FUNC
022              ELSE
022                  MOVE "E"    TO D-AUTH-FUNC
022              END-IF
022           END-IF.
      *
           IF D-NORM-UNAUTH = "Y"
022        IF  SUBMOD-JNL = "N"
              IF GENJNC-AUTHORISED = "Y"
                 MOVE "E"    TO D-UNAUTH-FUNC
              ELSE
                 MOVE "D"    TO D-UNAUTH-FUNC
              END-IF.
022   *    ELSE
022   *       MOVE "D"       TO D-UNAUTH-FUNC.
      *
022        IF D-NORM-SUBMOD-UNAUTH = "Y"
022        IF  SUBMOD-JNL = "Y"
022           IF GENJNC-AUTHORISED = "Y"
022              MOVE "E"    TO D-UNAUTH-FUNC
022           ELSE
022              MOVE "D"    TO D-UNAUTH-FUNC
022           END-IF.
      *
           IF D-NORM-POST = "Y"
               IF GENJNC-STAT = "P"
               OR GENJNC-STAT = "H"
               OR GENJNC-STAT = "C"
                   MOVE "D"   TO D-POST-FUNC
               ELSE
                   MOVE "E"   TO D-POST-FUNC
               END-IF
           ELSE
               MOVE "D"       TO D-POST-FUNC.
      *
           IF D-NORM-HOLD = "Y"
              IF GENJNC-STAT = "P"
              OR GENJNC-STAT = "H"
              OR GENJNC-STAT = "C"
                   MOVE "D"  TO D-HOLD-FUNC
              ELSE
                   MOVE "E"  TO D-HOLD-FUNC
              END-IF
           ELSE
              MOVE "D"       TO D-HOLD-FUNC.
      *
           IF D-NORM-REL = "Y"
              IF GENJNC-STAT = "H"
                 MOVE "E"    TO D-REL-FUNC
              ELSE
                 MOVE "D"    TO D-REL-FUNC
              END-IF
           ELSE
              MOVE "D"       TO D-REL-FUNC.
      *
           IF D-NORM-CAN = "Y"
              IF GENJNC-STAT = "H"
              OR GENJNC-STAT = "P"
              OR GENJNC-STAT = "C"
                 MOVE "D"    TO D-CAN-FUNC
              ELSE
                 MOVE "E"    TO D-CAN-FUNC
              END-IF
           ELSE
              MOVE "D"       TO D-CAN-FUNC.
      *************************************************
      **  Routine to get shared GM id for a company  **
      *************************************************
      *
       GET-SHARED-ID.
      *
      *    Input:  TEST-COMPID     Company to find IM0SHGEN for
      *            TEST-PER        Period we want to post into
      *
      *   Output:  SHARED-ERROR    Error ? (N,Y)
      *            SHARED-MSG      Error message
      *            SHARED-COMPID   IM0SHGEN for TEST-COMPID
      *            SHARED-DRIVES   IM0-GENP-DRIVES for TEST-COMPID
      *
      *
      * Call IMPSTD and save current settings of IM9REC
      *
      *
           PERFORM GET-ID-A THRU GET-ID-Z.
      *
      *
      * Restore original IM9REC for current company id..
      *
      *
      *
       GET-ID-A.
      *
           MOVE "Y"    TO SHARED-ERROR.
           MOVE SPACES TO SHARED-MSG.
           MOVE SPACE  TO SHARED-COMPID.
      *
           IF TEST-COMPID = COMPID
               MOVE MSG265 TO SHARED-MSG
               GO TO GET-ID-Z.
      *
      *    Read company control file of destination company.
      *    Find shared ledger file id.
      *
      *
           MOVE "ADMCTL"    TO WW-FILE-CODE.
           MOVE TEST-COMPID TO WW-COMPID.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-FILE-NAME TO ADMCTL-DATA.
      *
           PERFORM ADMCTL-OPEN-INPUT.
           IF NOT STAT-OK
               PERFORM ADMCTL-CLOSE
               MOVE MSG270 TO SHARED-MSG
               MOVE "noton" TO D-S-ERROR
               GO TO GET-ID-Z.
      *
           MOVE "00" TO ADMCTL-KEY.
           PERFORM ADMCTL-READ.
           IF STAT-LCK OR STAT-OK
               NEXT SENTENCE
           ELSE
               PERFORM ADMCTL-CLOSE
               MOVE MSG270 TO SHARED-MSG
               MOVE "noton" TO D-S-ERROR
               GO TO GET-ID-Z.
      *
           MOVE ADMCTL00-REC   TO SAV-ADMCTL00-REC.
           MOVE ADMCTL-REC     TO ADMCTL00-REC.
      *
           MOVE "50" TO ADMCTL-KEY.
           PERFORM ADMCTL-READ.
           IF STAT-LCK OR STAT-OK
               NEXT SENTENCE
           ELSE
               PERFORM ADMCTL-CLOSE
               MOVE MSG270 TO SHARED-MSG
               MOVE "noton" TO D-S-ERROR
               GO TO GET-ID-Z.
           MOVE ADMCTL50-REC   TO SAV-ADMCTL50-REC.
           MOVE ADMCTL-REC     TO ADMCTL50-REC.
      *
      * Read record type '09' for file exceptions...
      *
      *
           PERFORM ADMCTL-CLOSE.
      *
      *    Save destination company name...
      *
      *
           IF IM0GEN = "N"
               MOVE SAV-ADMCTL00-REC TO ADMCTL00-REC
               MOVE SAV-ADMCTL50-REC TO ADMCTL50-REC
               MOVE MSG275 TO SHARED-MSG
               MOVE "nogl" TO D-S-ERROR
               GO TO GET-ID-Z.
      *
           IF TEST-PER > IM0GPR
               MOVE SAV-ADMCTL00-REC TO ADMCTL00-REC
               MOVE SAV-ADMCTL50-REC TO ADMCTL50-REC
               MOVE MSG280 TO SHARED-MSG
               MOVE "posterr" TO D-S-ERROR
               GO TO GET-ID-Z.
      *
      * If the local currency for both companies is not the same
      * don't allow to port intercompany.
           IF WS-CUR NOT =  IM50-CUR
               MOVE SAV-ADMCTL00-REC TO ADMCTL00-REC
               MOVE SAV-ADMCTL50-REC TO ADMCTL50-REC
               MOVE MSG297 TO SHARED-MSG
               MOVE "curdif" TO D-S-ERROR
               GO TO GET-ID-Z.
      *
      *
      *    Save shared GM ID and drives...
      *
           MOVE IM0SHGEN        TO SHARED-COMPID.
      *
      * Now BUILD file-names for GM,GH,GD and GJ files for inter-company
      * company journal
      *
      * First, build file exceptions for IMPSTD for the new company ID
      *
           IF INTER-COMP-OPEN-FLAG = "Y"
               PERFORM GENMST-CLOSE
               PERFORM GENCTL-CLOSE
            MOVE " " TO INTER-COMP-OPEN-FLAG.
      *
      * Now build file names for GM etc...
           MOVE "GENCTL"    TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-FILE-NAME TO GENCTL-DATA GENCTL-FILE-NAME.
      *
           MOVE "GENMST"    TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-FILE-NAME TO GENMST-DATA GENMST-FILE-NAME.
           MOVE WW-OUT-PATH  TO GMDRV.
      *
           MOVE "GENHST"    TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-FILE-NAME TO GENHST-DATA GENHST-FILE-NAME.
           MOVE WW-OUT-PATH TO GHDRV.
      *
           MOVE "GENTRN"     TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-OUT-PATH TO GDDRV.
      *
           MOVE "GENJNC"     TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
      *
           MOVE "GENJND"     TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-OUT-PATH TO GJDRV.
      *
           MOVE "GENALC"     TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-OUT-PATH TO GXDRV.
      *
           MOVE "GENALD"     TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-OUT-PATH TO GYDRV.
      *
           MOVE "GENALH"     TO WW-FILE-CODE.
           PERFORM BUILD-FILE-NAME.
           MOVE WW-OUT-PATH TO GZDRV.
      *
           MOVE SAV-ADMCTL00-REC TO ADMCTL00-REC.
           MOVE SAV-ADMCTL50-REC TO ADMCTL50-REC.
      *
           MOVE "N" TO SHARED-ERROR.
      *
       GET-ID-Z.
      *
       RE-NUMBER-AENTRY.
           PERFORM RE-NUMBER-AENTRY-START THRU
                   RE-NUMBER-AENTRY-END.

       RE-NUMBER-AENTRY-START.
           MOVE COMPID         TO GENADC-CMP.
014        MOVE OLD-JNL-YEAR   TO GENADC-YEAR.
014        MOVE OLD-JNL-PER    TO GENADC-PER.
           MOVE GENJND-AENTRY  TO GENADC-AENTRY.
           PERFORM GENADC-READ.
           IF NOT STAT-OK
              GO TO RE-NUMBER-AENTRY-END.
           PERFORM COMER.
      *
084nk ** Get new analysis number
084nk      move d-to-year      to wsYear.
084nk      move d-to-per       to wsPeriod.
084nk      perform NextAnalysisNumber.

           MOVE D-TO-YEAR      TO GENADC-YEAR.
           MOVE D-TO-PER       TO GENADC-PER.
014        IF D-COPY-REVERSE = 1
014           COMPUTE  GENADC-TOTAMT = GENADC-TOTAMT * -1.
           MOVE NEW-AENTRY     TO GENADC-AENTRY.
040        MOVE SPACES         TO GENADC-GLUPD.
           PERFORM GENADC-WRITE.
           PERFORM COMER.
      *
084nk ** Set the audit to complete
084nk      perform comnxk-initialize.
084nk      move compID         to comnxk-company.
084nk      move wsYear         to comnxk-post-year.
084nk      move wsPeriod       to comnxk-post-period.
084nk      move new-aentry     to comnxk-key.
084nk      perform comnxk-gen-fin-analysis.

      * Now read GENADT for records.
           MOVE SPACES         TO GENADT-REC.
           MOVE COMPID         TO GENADT-CMP.
014        MOVE OLD-JNL-YEAR   TO GENADT-YEAR.
014        MOVE OLD-JNL-PER    TO GENADT-PER.
           MOVE GENJND-AENTRY  TO GENADT-AENTRY.
      *
           PERFORM GENADT-START-GE.
           IF STAT-INVALID-KEY
              GO TO RE-NUMBER-AENTRY-END.
      *
       RE-NUMBER-AENTRY-NEXT.
           PERFORM GENADT-READ-NEXT.
           IF STAT-AT-END
              GO TO RE-NUMBER-AENTRY-END.
           PERFORM COMER.
      *
           IF NOT STAT-OK
              GO TO RE-NUMBER-AENTRY-END.
      *
           IF GENADT-CMP NOT = COMPID
014        OR GENADT-YEAR NOT = OLD-JNL-YEAR
014        OR GENADT-PER NOT = OLD-JNL-PER
           OR GENADT-AENTRY NOT = GENJND-AENTRY
               GO TO RE-NUMBER-AENTRY-END.
      *
           MOVE D-TO-YEAR      TO GENADT-YEAR.
           MOVE D-TO-PER       TO GENADT-PER.
           MOVE NEW-AENTRY     TO GENADT-AENTRY.
014        IF D-COPY-REVERSE = 1
014           COMPUTE  GENADT-VALUE = GENADT-VALUE * -1.
           PERFORM GENADT-WRITE.
           PERFORM COMER.
      *
           GO TO RE-NUMBER-AENTRY-NEXT.
      *
       RE-NUMBER-AENTRY-END.
      *
      ** Get next analysis number
084nk  NextAnalysisNumber.
084nk ** Get next analysis number and start audit
084nk      perform comnxk-initialize.
084nk      move compID         to comnxk-company.
084nk      move wsYear         to comnxk-post-year.
084nk      move wsPeriod       to comnxk-post-period.
084nk      perform comnxk-gen-get-analysis.
084nk      move comnxk-rt-key  to new-aentry.
084nk
084nk ** Check that analysis entry doesn't already exist
090   * comment out below line as we want to retain the record details, 
090   * just the key will change
090   *084nk      perform genadc-initialize-rec.
084nk      move compID         to genadc-cmp.
084nk      move wsYear         to genadc-year.
084nk      move wsPeriod       to genadc-per.
084nk      move new-aentry     to genadc-aentry.
084nk      perform genadc-read.
084nk      if stat-ok
084nk         go to NextAnalysisNumber
084nk      end-if.
003   *
003    SAVE-CHANGED-NOTES.
003        MOVE SPACES      TO LINK-EXTRA.
003        MOVE "SRTF"      TO LINK-EXTRA-1.
70OK       MOVE D-RTF-FILE-NAME TO LINK-EXTRA-1(5:)
003        MOVE "GJ"        TO LINK-EXTRA-2.
003        MOVE GENJNC-KEY  TO LINK-BROWSE.
003   *
003        MOVE "IMPNOT"   TO WW-PROG-NAME.
003        PERFORM CALL-PROGRAM-NO-CANCEL.
003        MOVE SPACES     TO LINK-EXTRA.
      *
       CHECK-DEFAULT-OPTIONS.
071       IF D-AUTH-YEAR <> GENCTL-YEAR
071          MOVE "N"    TO D-DEFAULTS-LOADED
071       ELSE
071          MOVE "Y"    TO D-DEFAULTS-LOADED
071       END-IF.
071   *
071       IF D-DEFAULTS-LOADED <> "N"
071          IF D-PER-SEL <> 1
071             MOVE "N" TO D-DEFAULTS-LOADED
071          ELSE
071             MOVE "Y" TO D-DEFAULTS-LOADED
071          END-IF
071       END-IF.
071   *
071       IF D-DEFAULTS-LOADED <> "N"
071          IF D-JNL-SEL <> 1
071             MOVE "N" TO D-DEFAULTS-LOADED
071          ELSE
071             MOVE "Y" TO D-DEFAULTS-LOADED
071          END-IF
071       END-IF.
071   *
071       IF D-DEFAULTS-LOADED <> "N"
071          IF D-AUTH-OPTION <> "1"
071             MOVE "N" TO D-DEFAULTS-LOADED
071          ELSE 
071             MOVE "Y" TO D-DEFAULTS-LOADED
071          END-IF
071       END-IF.
      *
       SET-DEFAULT-OPTIONS.
071       MOVE GENCTL-YEAR TO D-AUTH-YEAR
071                           D-AUTH-YEAR-X.
071       MOVE 1           TO D-PER-SEL.
071       MOVE 1           TO D-JNL-SEL.
071       MOVE ZEROS       TO D-PERIOD-FROM
071                           D-PERIOD-TO
071                           D-JOURNAL-FROM
071                           D-JOURNAL-TO.
071       MOVE "1"         TO D-AUTH-OPTION.
      *
071    SET-PRINT-DEFAULTS.
071        MOVE "J"             TO D-FUNCTION.
071        MOVE "L"             TO D-MNT-FUNC.
071        MOVE D-G00YEAR       TO D-LSTYEAR.
071        MOVE "1"             TO D-LSTPR-AS.
071        MOVE D-G00PER        TO D-LSTPER.
071        MOVE "1"             TO D-LSTJL-AR.
071        MOVE ZEROS           TO D-LSTFRJNL
071                                D-LSTTOJNL.
071        MOVE "1"             TO D-PRINT-AUTH-JNLS.
      *
071        INITIALIZE              IMPFRO-LINK.
071        MOVE SPACES          TO IMPFRO-LINK.
071        MOVE "Ledger Period" TO LV-CAPTION.
071        PERFORM SETUP-PERIOD-DROPDOWN.
071        MOVE "GENPJMF4"         TO IMPFRO-LISTVIEW.
071        PERFORM SET-FORM-DYNAMIC-DROPDOWN.
      *
071        MOVE 1 TO D-LSTNOTPO    D-LSTHOLD     D-LSTCANC
071                  D-LSTPOST     D-LSTNORM     D-LSTPROV
071                  D-LSTUSER     D-LSTINTER    D-LSTPEND
071                  D-LSTAUD      D-LSTSTAT     D-LSTALTCUR.
      *                                          
071        MOVE 0 TO D-PRT-SMOD    D-PRT-API     D-PRT-APP
071                  D-PRT-ARI     D-PRT-ARP     D-PRT-ASS
071                  D-PRT-CSH     D-PRT-GRN     D-PRT-INV
071                  D-PRT-TPM     D-PRT-WIL     D-PRT-WPB.
      *
020a   PRINT-JNL.
071020*    IF D-LSTJL-AR = "A"
071        IF D-LSTJL-AR = "1"
020a          MOVE ZEROES      TO D-LSTFRJNL
70FIX         MOVE ALL-9S-10   TO D-LSTTOJNL.
020a  *
071020*    IF D-LSTPR-AS = "A"
071        IF D-LSTPR-AS = "1"
020a          MOVE ZEROES      TO D-LSTPER.
020a  *
020a       IF D-LSTTOJNL = SPACES OR ZEROES
70FIX         MOVE ALL-9S-10   TO D-LSTTOJNL.
020a  *
020a      PERFORM OUTPUT-REPORT-XMLIN.
020a  *
020a      MOVE "GENQJR" TO SRSCTL-BO-NAME.
020a      MOVE "CP"     TO SRSCTL-FUNCTION.
035       MOVE "Y"      TO SRSCTL-RUN-ASYNC.
020a      MOVE "tem_gl_journal_report"  TO SRSCTL-BO-RPT.
020a      MOVE "gl_journal_report_out" TO SRSCTL-BO-XSDOUT.
020a  *
020a      MOVE "SRSCTL" TO WW-PROG-NAME.
020a      PERFORM CALL-PROGRAM.
020a  *
020a  ***********************
020a  * Output the xml-in   *
020a  ***********************
020a   OUTPUT-REPORT-XMLIN.
020a  * First, setup Parameters XML..
020a       MOVE "Query" TO XML-ROOT-NAME.
020a       PERFORM CREATE-XML-HEADER.
020a  *
020a       MOVE "<Option>"   TO ARRAY-DATA.
020a       MOVE ZEROS       TO ARRAY-LENGTH.
020a       PERFORM ARRAY-CREATE.
020a  *
020a       MOVE "Type"                     TO XML-TAG-NAME.
020a       MOVE "N"                        TO XML-TAG-VALUE.
020a       PERFORM OUTPUT-ELEMENT.
020a  *
020a       MOVE "UpdatePrintedFlag"        TO XML-TAG-NAME.
020a       MOVE "Y"                        TO XML-TAG-VALUE.
020a       PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "AuthorizedJournals"       TO XML-TAG-NAME
071            EVALUATE D-PRINT-AUTH-JNLS
071              WHEN "1"
071                MOVE "B" TO XML-TAG-VALUE
071              WHEN "2"
071                MOVE "I" TO XML-TAG-VALUE
071              WHEN "3"
071                MOVE "E" TO XML-TAG-VALUE
071            END-EVALUATE
071020*        MOVE D-PRINT-AUTH-JNLS          TO XML-TAG-VALUE
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintNormalJournals"      TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTNORM = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintProvisionalJournals" TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTPROV = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintUserDefinedJournals" TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTUSER = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintInterCompanyJournals" TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTINTER = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintPeriodEndAdjustments" TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTPEND = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintAuditorsAdjustments" TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTAUD = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintStatisticalJournals" TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTSTAT = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintAlternateCurrencyJournals" TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTALTCUR = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintJournalsNotPosted"      TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTNOTPO = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintJournalsOnHold"      TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTHOLD = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintCancelledJournals"      TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTCANC = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "PrintPostedJournals"      TO XML-TAG-NAME
020a           MOVE "Y"                        TO XML-TAG-VALUE
020a           IF  D-LSTPOST = 0
020a               MOVE "N"                    TO XML-TAG-VALUE
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "Year"                     TO XML-TAG-NAME
020a           MOVE D-JNL-YEAR                 TO XML-TAG-VALUE
020a           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintApInvoiceJournals"   TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-API = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintApPaymentJournals"   TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-APP = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintArInvoiceJournals"   TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-ARI = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintArCashJournals"      TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-ARP = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintAssetJournals"       TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-ASS = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintCashbookJournals"    TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-CSH = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintGrnJournals"         TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-GRN = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintInventoryJournals"   TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-INV = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintTpmJournals"         TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-TPM = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintWipLaborJournals"    TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-WIL = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
023B       IF  PRINT-FLAG = "A"
023B           MOVE "PrintWipPartBillingJournals"
023B                                           TO XML-TAG-NAME
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B           IF  D-PRT-WPB = 0
023B               MOVE "N"                    TO XML-TAG-VALUE
023B           END-IF
023B           PERFORM OUTPUT-ELEMENT.
023B  *
076        IF  PRINT-FLAG = "A"
076            MOVE "PrintReturnToSupplierJournals"
076                                            TO XML-TAG-NAME
076            MOVE "Y"                        TO XML-TAG-VALUE
076            IF  D-PRT-RTS = 0
076                MOVE "N"                    TO XML-TAG-VALUE
076            END-IF
076            PERFORM OUTPUT-ELEMENT.
      *
020a       MOVE "Reprint"                      TO XML-TAG-NAME.
023B       IF  D-REPRINT = 0
023B           MOVE "N"                        TO XML-TAG-VALUE
023B       ELSE
023B           MOVE "Y"                        TO XML-TAG-VALUE
023B       END-IF.
020a       PERFORM OUTPUT-ELEMENT.
025a  *
025a       IF  PRINT-FLAG = "1"
025a           MOVE "Year"                     TO XML-TAG-NAME
025a           MOVE GENJNC-YEAR                TO XML-TAG-VALUE
025a           PERFORM OUTPUT-ELEMENT
025a
025a       END-IF.
020a  *
020a       MOVE "</Option>"                TO ARRAY-DATA.
020a       MOVE ZEROS                      TO ARRAY-LENGTH.
020a       PERFORM ARRAY-CREATE.
020a  *
020a       MOVE "<Filter>"                 TO ARRAY-DATA.
020a       MOVE ZEROS                      TO ARRAY-LENGTH.
020a       PERFORM ARRAY-CREATE.
020a  *
020a       IF  PRINT-FLAG = "1"
020a           MOVE "JournalNumber"            TO XML-TAG-NAME
020a           MOVE "FilterType"               TO XML-TAG-ATT-NAME(1)
020a           MOVE "S"                        TO XML-TAG-ATT-VALUE(1)
020a           MOVE "FilterValue"              TO XML-TAG-ATT-NAME(2)
020a           MOVE GENJNC-JNL                 TO XML-TAG-ATT-VALUE(2)
020a           PERFORM OUTPUT-ELEMENT-WITH-ATT
025a  *
025a           MOVE "LedgerPeriod"             TO XML-TAG-NAME
025a           MOVE "FilterType"               TO XML-TAG-ATT-NAME(1)
025a           MOVE "S"                        TO XML-TAG-ATT-VALUE(1)
025a           MOVE "FilterValue"              TO XML-TAG-ATT-NAME(2)
025a           MOVE GENJNC-PER                 TO XML-TAG-ATT-VALUE(2)
025a           PERFORM OUTPUT-ELEMENT-WITH-ATT
020a       END-IF.
020a  *
020a       IF  PRINT-FLAG = "A"
020a           MOVE "JournalNumber"            TO XML-TAG-NAME
020a           MOVE "FilterType"               TO XML-TAG-ATT-NAME(1)
071            IF D-LSTJL-AR = "1"
071               MOVE "A"                     TO XML-TAG-ATT-VALUE(1)
071            ELSE
071               MOVE "R"                     TO XML-TAG-ATT-VALUE(1)
071            END-IF
071020*        MOVE D-LSTJL-AR                 TO XML-TAG-ATT-VALUE(1)
020a           MOVE "FilterValue"              TO XML-TAG-ATT-NAME(2)
020a           MOVE SPACES                     TO XML-TAG-ATT-VALUE(2)
071020*        IF  D-LSTJL-AR = "R"
071            IF  D-LSTJL-AR = "2"
70OK               STRING D-LSTFRJNL           DELIMITED BY " "
020a               ","                         DELIMITED BY SIZE
70OK               D-LSTTOJNL                  DELIMITED BY " "
020a               INTO                        XML-TAG-ATT-VALUE(2)
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT-WITH-ATT
020a  *
020a           MOVE "LedgerPeriod"             TO XML-TAG-NAME
020a           MOVE "FilterType"               TO XML-TAG-ATT-NAME(1)
071            IF D-LSTPR-AS = "1"
071               MOVE "A"                     TO XML-TAG-ATT-VALUE(1)
071            ELSE
071               MOVE "S"                     TO XML-TAG-ATT-VALUE(1)
071            END-IF
071020*        MOVE D-LSTPR-AS                 TO XML-TAG-ATT-VALUE(1)
020a           MOVE "FilterValue"              TO XML-TAG-ATT-NAME(2)
020a           MOVE SPACES                     TO XML-TAG-ATT-VALUE(2)
071029*        IF  D-LSTPR-AS = "S"
071            IF  D-LSTPR-AS = "2"
020a               MOVE D-LSTPER               TO XML-TAG-ATT-VALUE(2)
020a           END-IF
020a           PERFORM OUTPUT-ELEMENT-WITH-ATT
020a       END-IF.
020a  *
020a       MOVE "</Filter>"                TO ARRAY-DATA.
020a       MOVE ZEROS                      TO ARRAY-LENGTH.
020a       PERFORM ARRAY-CREATE.
020a  *
020a       MOVE "</Query>"                 TO ARRAY-DATA.
020a       MOVE ZEROS                      TO ARRAY-LENGTH.
020a       PERFORM ARRAY-CREATE.
020a  *
020a       PERFORM ARRAY-FINAL-CREATE.
020a       SET SRSCTL-BO-XMLIN             TO ARRAY-OBJECT.
020a       SET ARRAY-OBJECT                TO NULL.
020a  *
      *
      *    Check if access allowed to printing of journals
      *
049    CHECK-REPORT-ACCESS.
049        MOVE "GENP11" TO WW-PROG-NAME.
049        PERFORM CHECK-MAINTENANCE-OTHER-PROG.  *> Check prg access
049        IF BRW-MAINT-FLAG NOT = "F"
049            MOVE WW-RET-STAT TO LINK-EXTRA
049            MOVE "A"      TO LINK-ERR-FLAG
049            MOVE "GENP11" TO LINK-DENY-PROGRAM
049            MOVE "IMPWER" TO WW-PROG-NAME
049            MOVE "CALLPG" TO WW-FUNCTION
049            PERFORM WW.

024   *
024    ZOOM-GLJ.
024        MOVE SPACES               TO ZOOM-LINK2.
024        MOVE D-AUTH-YEAR          TO ZOOM-YEAR.
024        MOVE FUNCTION NUMVAL-C (D-LVITEM-TEXT(4))     TO ZOOM-PER.
024        MOVE FUNCTION NUMVAL-C (D-LVITEM-TEXT(2))     TO ZOOM-JNL.
024        MOVE "GENPZ1"             TO WW-PROG-NAME.
024        MOVE ZOOM-LINK2           TO LINK-EXTRA.
024        PERFORM CALL-PROGRAM.
029A  *
029A   JNL-TRIGGER.
029A       MOVE 1       TO IMPTRG-NUMBER.
029A       MOVE GENJNC-KEY TO IMPTRG-KEY.
029A       PERFORM TRIGGER-POINT.
030a  *
030a   RESOURCE-LOCK-DEL.
030a  *
030a       MOVE SPACES     TO WW-LOCK-FIELDS.  *> Initialise the key
030a       MOVE COMPID     TO WW-LOCK-COM.
030a       MOVE "GENPJM"   TO WW-LOCK-TYP.
030a       MOVE GENJNC-KEY TO WW-LOCK-KEY.
030a       PERFORM RESOURCE-LOCK-DELETE.
030a  *
044    RECORDS-PASTED.
           MOVE "Y"            TO PASTE-MODE.
           PERFORM RECORDS-PASTED-START
                   THRU RECORDS-PASTED-END.
           MOVE "N"            TO PASTE-MODE.
       RECORDS-PASTED-START.
           MOVE "GENPJML1"     TO xtpCellControl.
           PERFORM CreateCellControl
      *
           MOVE "GENPJML1"     TO xtpReportControl.
086b       MOVE 72         TO xtpNumberColumns
           PERFORM RetrieveReportControl.
      *
           Move 0              TO xtpReportOutput.
      *
       RECORDS-PASTED-NEXT.
           PERFORM RetrieveNextReportRecord.
           IF xtpAtEnd
              GO TO RECORDS-PASTED-END.
      *
           MOVE SPACES              TO CellOutputRecord.
           MOVE RecordIndexReturned TO CellOutputRow.
           PERFORM CHECK-ANALYSIS-REQ.
      *
059        MOVE GENMST-DESC         TO CellOutputValue.
059        MOVE 3                   TO CellOutputColumn.
059        Perform InsertCellRecord.
      *
           IF  D-ANALYSIS-REQUIRED = "Y"
               MOVE 13              TO CellOutputColumn
               MOVE "LINK"          TO CellOutputHyperMethod
               MOVE "Edit"          TO CellOutputHyperCaption
               MOVE "43043"         TO CellOutputHyperEvent
               PERFORM InsertCellRecord
           ELSE
               MOVE SPACES          TO CellOutputValue
               MOVE 13              TO CellOutputColumn
               Perform InsertCellRecord
           END-IF.
           MOVE SPACES              TO CellOutputCellAttributes.
      *
           IF  D-JNL-TYPE = "I"
               MOVE 1               TO  CellOutputEditable
           ELSE
               MOVE 0               TO  CellOutputEditable
           END-IF.
      *
           IF  CellValue(14) = "Y" or "1"
               MOVE xtpTrue         TO CellOutputIsChecked
               MOVE 1               TO  CellOutputEditable
           ELSE
               MOVE xtpFalse        TO CellOutputIsChecked
           END-IF.
      *
           MOVE SPACES              TO  CellOutputValue
           MOVE 14                  TO CellOutputColumn
           PERFORM InsertCellRecord.
      *
           GO TO RECORDS-PASTED-NEXT.

       RECORDS-PASTED-END.
           PERFORM CloseReportControl.
           PERFORM FinishCellControl.
047   *
047    CHECK-COMP.
           PERFORM CHECK-COMP-START THRU CHECK-COMP-END.
       CHECK-COMP-START.
      * We should now read ADMOPC to check list of comps allowed/denied
      * depending on ADMOPR-CMP-ALL-DEN...

      * All companies allowed...
           IF ADMOPR-CMP-ALL-DEN = SPACES
              GO TO CHECK-COMP-END.

      *
      * Read list of companies for this operator...
           PERFORM ADMOPC-INITIALIZE-REC.
           MOVE OPERATOR-CODE      TO ADMOPC-OPR.
           MOVE D-CHANGED-TEXT(15)  TO ADMOPC-CMP.
           PERFORM ADMOPC-READ.


      * List is 'Allowed' - Company found - ok
      *                   - Company not found - error
      * List is 'Denied'  - Company not found - ok
      *                   - Company found - error
           IF STAT-OK OR STAT-LCK
              IF ADMOPR-CMP-ALL-DEN = "A"
                 GO TO CHECK-COMP-END
              END-IF
           ELSE
              IF ADMOPR-CMP-ALL-DEN = "D"
                 GO TO CHECK-COMP-END.

           MOVE "noaccess" TO D-S-ERROR.
       CHECK-COMP-END.
      *
061b   VALIDATE-PROV-PER.
           IF  D-JNL-YEAR <> GENCTL-YEAR
           OR  D-JNL-PER  <> GENCTL-PER
               MOVE "pererr" TO D-S-ERROR
           END-IF.
065   *-----------------------------------------------------------------
065   * Unpack custom form fields returned from grid and validate and/or
065   * save...
065   * Record format:
065   * 'CUSTOMFORM:nnn:Desc1:value1|Desc2:value2|Desc3:value3...
065   * where 'nnn'    - column number in grid
065   *       'Descn'  - field description
065   *       ':'      - separator between field description and value
065   *       'valuen' - actual form value entered for each field
065   *       '|'      - separator between each field
065    UNPACK-CUSTOM-FORM-FROM-GRID.
065        PERFORM UNPACK-CF-START THRU UNPACK-CF-END.
065   
065    UNPACK-CF-START.
065   * Before saving the custom form fields entered, delete all fields
065   * previously saved.
065   *    MOVE SPACES             TO LINK-CUST-KEY.
065   *    MOVE "GENJND"           TO LINK-CUST-TYPE.
065   *    MOVE D-JNL-YEAR         TO LINK-CUST-KEY(1:4).
065   *    MOVE D-JNL-PER          TO LINK-CUST-KEY(5:2).
065   *    MOVE D-JNL-NO           TO LINK-CUST-KEY(7:10).
065   *    MOVE ENTRY-JN           TO LINK-CUST-KEY(17:10).
065   *    PERFORM CUSTOM-FORM-DEL.
065   
065        MOVE 16 TO XX1.
065   
065    UNPACK-CF-DESC.
065   * First pick up custom form field description from row...
065        MOVE SPACES TO CF-DESCRIPTION.
065        MOVE 1 TO XX2.
065   
065   * Increment XX1 to bypass '|' which ended previous field...
065        IF RECORDROWCELLTEXT(XX1:1) = "|"
065           ADD 1 TO XX1.
065   
065    UNPACK-CF-DESC-NEXT.
065        IF RECORDROWCELLTEXT(XX1:) = SPACES
065           GO TO UNPACK-CF-END.
065   
065        IF RECORDROWCELLTEXT(XX1:1) = ":"
065           GO TO UNPACK-CF-DESC-DONE.
065   
065        MOVE RECORDROWCELLTEXT(XX1:1) TO CF-DESCRIPTION(XX2:1).
065        ADD 1 TO XX1.
065        ADD 1 TO XX2.
065        GO TO UNPACK-CF-DESC-NEXT.
065   
065    UNPACK-CF-DESC-DONE.
065   * Now, unpack actual custom form field value from row...
065        MOVE SPACES TO CF-VALUE.
065        ADD 1  TO XX1.
065        MOVE 1 TO XX2.
065   
065    UNPACK-CF-VALUE-NEXT.
065        IF RECORDROWCELLTEXT(XX1:) = SPACES
065           GO TO UNPACK-CF-VALUE-DONE.
065   
065        IF RecordRowCellText(XX1:1) = "|"
065           GO TO UNPACK-CF-VALUE-DONE.
065   
065        MOVE RECORDROWCELLTEXT(XX1:1) TO CF-VALUE(XX2:1).
065        ADD 1 TO XX1.
065        ADD 1 TO XX2.
065        GO TO UNPACK-CF-VALUE-NEXT.
065   
065    UNPACK-CF-VALUE-DONE.
065   * Got field description and value. Look up field properties in
065   * definition table...
065        PERFORM CUSTOM-FORM-FIND.
107a       if cf-name = spaces
107a          go to unpack-cf-desc
107a       end-if
065   
065   * Now save it and continue with next field or
065   * validate and exit if error found...
065        IF WS-FUNCTION = "V"
065           PERFORM VALIDATE-CUSTOM-FORM-FIELD
065           IF D-S-ERROR = "Y"
065              GO TO UNPACK-CF-END
065           END-IF
065           PERFORM SAVE-CUSTOM-FORM-FIELD.
065   
065        GO TO UNPACK-CF-DESC.
065   
065    UNPACK-CF-END.
065        EXIT.
065   *-----------------------------------------------------------------
065   * Routine to save a custom form field entered on the grid...
065    SAVE-CUSTOM-FORM-FIELD.
065        PERFORM SAVE-CF-START THRU SAVE-CF-END.
065   
065    SAVE-CF-START.
065        MOVE SPACES             TO LINK-CUST-KEY.
065        MOVE "GENJND"           TO LINK-CUST-TYPE.
065        MOVE D-JNL-YEAR         TO LINK-CUST-KEY(1:4).
065        MOVE D-JNL-PER          TO LINK-CUST-KEY(5:2).
065        MOVE D-JNL-NO           TO LINK-CUST-KEY(7:10).
065        MOVE ENTRY-JN           TO LINK-CUST-KEY(17:10).
065        MOVE CF-NAME            TO LINK-CUST-NAME.
065        MOVE CF-AND             TO LINK-CUST-AND.
065        EVALUATE LINK-CUST-AND
065        WHEN "A"
065             MOVE CF-VALUE                  TO LINK-CUST-DATA
065        WHEN "N"
065             MOVE FUNCTION numval(CF-VALUE) TO LINK-CUST-DATA-N
065        WHEN "D"
065             MOVE CF-DATE-CCYYMMDD          TO LINK-CUST-DATA-D
065        END-EVALUATE.
065        PERFORM CUSTOM-FORM-SAVE-SINGLE.
065   
065    SAVE-CF-END.
065        EXIT.
065   *-----------------------------------------------------------------
065   * Routine to validate a custom form field entered on the grid...
065    VALIDATE-CUSTOM-FORM-FIELD.
065        PERFORM VAL-CF-START THRU VAL-CF-END.
065   
065    VAL-CF-START.
065        MOVE "GENJND"           TO LINK-CUST-TYPE
065        MOVE CF-NAME            TO LINK-CUST-NAME.
065        MOVE CF-AND             TO LINK-CUST-AND.
065        EVALUATE LINK-CUST-AND
065        WHEN "A"
065             MOVE CF-VALUE      TO LINK-CUST-DATA
065        WHEN "N"
065             MOVE function numval(CF-VALUE) TO LINK-CUST-DATA-N
065        WHEN "D"
065             IF CF-VAL = 2
065                MOVE Function NumVal(CF-VALUE(1:2)) TO CF-DD
065                MOVE Function NumVal(CF-VALUE(4:2)) TO CF-MM
065                MOVE Function NumVal(CF-VALUE(7:4)) TO CF-CCYY
065             ELSE
065                MOVE Function NumVal(CF-VALUE(1:4)) TO CF-CCYY
065                MOVE Function NumVal(CF-VALUE(6:2)) TO CF-MM
065                MOVE Function NumVal(CF-VALUE(9:2)) TO CF-DD
065             END-IF
065             MOVE CF-DATE-CCYYMMDD         TO LINK-CUST-DATA-D
065        END-EVALUATE.
065        PERFORM CUSTOM-FORM-TEST-STRING.
065        IF LINK-CUST-STAT NOT = SPACES
065           MOVE "Y"                     TO D-S-ERROR
065           MOVE SPACES                  TO CellOutputRecord
065           MOVE CF-ROW                  TO CellOutputRow
065           MOVE RecordRowCellText(13:2) TO CellOutputColumn
065           MOVE Error-Icon              TO CellOutputIcon
065           PERFORM VARYING XX1 FROM 1 BY 1 UNTIL XX1 >
065                                             CF-GENJND-COUNT
065                    OR CF-GENJND-NAME(XX1) = CF-NAME
065           END-PERFORM
065           EVALUATE CF-GENJND-VAL(XX1)
065           WHEN 0                       *> Disallow spaces/zeros
065                STRING "Field '"           DELIMITED BY SIZE
065                       CF-DESCRIPTION      DELIMITED BY "  "
065                       "' cannot be spaces or zeros"
065                                           DELIMITED BY SIZE
065                                           INTO CellOutputTooltip
065                END-STRING
065           WHEN 2                       *> Allowed list
065                STRING "Field '"           DELIMITED BY SIZE
065                       CF-DESCRIPTION      DELIMITED BY "  "
065                       "' is not in the allowed list"
065                                           DELIMITED BY SIZE
065                                           INTO CellOutputTooltip
065                END-STRING
065           WHEN 3                       *> Allowed range
065                STRING "Field '"           DELIMITED BY SIZE
065                       CF-DESCRIPTION      DELIMITED BY "  "
065                       "' is not in the allowed range"
065                                           DELIMITED BY SIZE
065                                           INTO CellOutputTooltip
065                END-STRING
065           WHEN OTHER                   *> Look up
065                STRING "Field '"           DELIMITED BY SIZE
065                       CF-DESCRIPTION      DELIMITED BY "  "
065                       "' is not valid"    DELIMITED BY SIZE
065                                           INTO CellOutputTooltip
065                END-STRING
065           END-EVALUATE
065        PERFORM InsertCellRecord.
065   
065    VAL-CF-END.
065        EXIT.
065   
065   *-----------------------------------------------------------------
065   * After extracting field description and value from grid, find it
065   * in the stored table to pick up validation criteria.
065   * If it is not there it means that this is a new CF field added
065   * in this session. In this case, we have to reload the definition
065   * tables to pick it up...
065    CUSTOM-FORM-FIND.
065        MOVE SPACES TO CF-NAME.
065        MOVE SPACES TO CF-AND.
065        PERFORM FIND-CF-CSH-START THRU FIND-CF-CSH-END.
065   
065   *-----------------------------------------------------------------
065    FIND-CF-CSH-START.
065        MOVE ZEROS TO XX3.
065   
065    FIND-CF-CSH-NEXT.
065        ADD 1 TO XX3.
065        IF XX3 > CF-GENJND-COUNT
065           GO TO FIND-CF-CSH-NEW.
065   
065        IF CF-DESCRIPTION = CF-GENJND-DESC(XX3)
065           MOVE CF-GENJND-NAME(XX3) TO CF-NAME
065           MOVE CF-GENJND-AND(XX3)  TO CF-AND
065           MOVE CF-GENJND-VAL(XX3)  TO CF-VAL
065           GO TO FIND-CF-CSH-END.
065   
065        GO TO FIND-CF-CSH-NEXT.
065   
065   * This is a new custom form field. We have to add it to the
065   * defitions table...
065    FIND-CF-CSH-NEW.
065        MOVE XX1 TO XX1-SAVE.
065        PERFORM LOAD-CF-DEFINITIONS.
065        MOVE XX1-SAVE TO XX1.
107a  *> Recheck if field is now in table.If not found or there are no 
107a  *> custom fields defined just exit
107a       evaluate true
107a         when cf-genjnd-count = 0 or xx3 > cf-genjnd-count 
107a         go to find-cf-csh-end
107a       end-evaluate
107a  *
065        GO TO FIND-CF-CSH-START.
065   
065    FIND-CF-CSH-END.
065        EXIT.
065   
065   *-----------------------------------------------------------------
065   * Load all custom form field properties into table for use when
065   * saving and validating later
065    LOAD-CF-DEFINITIONS.
065        MOVE "GENJND"      TO LINK-CUST-TYPE.
065        PERFORM CUSTOM-FORM-READ-CTL.
065        MOVE LNK2         TO IMPFRM-LINK.
065        MOVE IMPFRM-COUNT TO CF-GENJND-COUNT.
107a       initialize        cf-genjnd-table
065        PERFORM VARYING XX1 FROM 1 BY 1
065                UNTIL XX1 > CF-GENJND-COUNT
065                MOVE IMPFRM-NAME(XX1) TO CF-GENJND-NAME(XX1)
065                MOVE IMPFRM-COL(XX1)  TO CF-GENJND-COL(XX1)
065                MOVE IMPFRM-DESC(XX1) TO CF-GENJND-DESC(XX1)
065                MOVE IMPFRM-AND(XX1)  TO CF-GENJND-AND(XX1)
065                MOVE IMPFRM-VAL(XX1)  TO CF-GENJND-VAL(XX1)
065                MOVE IMPFRM-LEN(XX1)  TO CF-GENJND-LEN(XX1)
065                MOVE IMPFRM-DEC(XX1)  TO CF-GENJND-DEC(XX1)
065                MOVE IMPFRM-DEF(XX1)  TO CF-GENJND-DEF(XX1)
065                MOVE IMPFRM-DAT(XX1)  TO CF-GENJND-DAT(XX1)
065        END-PERFORM.
065   *-----------------------------------------------------------------
065   * Output a custom form row, if there are custom form fields for
065   * the line into the grid...
065   * Record format:
065   * 'Desc1:value1|Desc2:value2|Desc3:value3
065   * where 'Descn'  - field description
065   *       ':'      - separator between field description and value
065   *       'valuen' - actual form value entered for each field
065   *       '|'      - separator between each field
065    LOAD-CUSTOM-FORM-IN-GRID.
065        PERFORM LOAD-CF-START THRU LOAD-CF-END.
065    LOAD-CF-START.

065        MOVE SPACES TO RecordRow.
065        MOVE "GENJND"          TO LINK-CUST-TYPE.
065        MOVE GENJND-KEY        TO LINK-CUST-KEY.
065        MOVE 52                TO REPORTCUSTOMCOLUMN.
065   * Read all custom form fields for current line into table...
065        PERFORM CUSTOM-FORM-READ-ALL.
065        MOVE LNK2         TO IMPFRM-LINK.
065        MOVE IMPFRM-COUNT TO CF-COUNT.
065        MOVE IMPFRM-TAB   TO CF-TABLE.
065   
065   * If any found, loop thru table to pick up each CF field and add
065   * to RecordRow...
065        IF CF-COUNT = ZEROS
065           GO TO LOAD-CF-END.
065        MOVE ZEROS TO XX4.
065        MOVE 1 TO XX2.
065   
065    LOAD-CF-NEXT.
065        ADD 1 TO XX4.
065        IF XX4 > CF-COUNT
065           GO TO LOAD-CF-END.
065   
065        IF CF-FIELD-NULL(XX4) = 1
065           GO TO LOAD-CF-NEXT.
065   
065        MOVE 1 TO XX1.
065   
065    LOAD-CF-DESC-NEXT.
065        IF XX1 > 30
065           GO TO LOAD-CF-DESC-DONE.
065   
065        IF CF-FIELD-DESC(XX4)(XX1:) = SPACES
065           GO TO LOAD-CF-DESC-DONE.
065   
065        MOVE CF-FIELD-DESC(XX4)(XX1:1) TO REPORTCUSTOMTEXT(XX2:1).
065        ADD 1 TO XX1.
065        ADD 1 TO XX2.
065        GO TO LOAD-CF-DESC-NEXT.
065   
065   * Now, move the actual custom form field value...
065    LOAD-CF-DESC-DONE.
065        MOVE ":" TO REPORTCUSTOMTEXT(XX2:1).
065        ADD 1 TO XX2.
065   
065        IF CF-FIELD-AND(XX4) = "D"
065           IF CF-FIELD-VAL(XX4)= 2
065              MOVE CF-FIELD-DAT(XX4) TO CF-DATE-CCYYMMDD
065              MOVE CF-DD             TO LST-ED-DD
065              MOVE CF-MM             TO LST-ED-MM
065              MOVE CF-CCYY           TO LST-ED-CCYY
065              MOVE LIST-EDIT-DATE    TO REPORTCUSTOMTEXT(XX2:)
065           ELSE
065              MOVE CF-FIELD-DAT(XX4) TO EDIT-DATE
065              MOVE EDIT-DATE         TO REPORTCUSTOMTEXT(XX2:)
065           END-IF
065           ADD 10 TO XX2
065           GO TO LOAD-CF-VALUE-DONE.
065   
065        IF CF-FIELD-AND(XX4) = "N"
065           MOVE ZEROS TO XX3
065           INSPECT CF-FIELD-ALP(XX4) TALLYING XX3 FOR LEADING SPACES
065           MOVE CF-FIELD-ALP(XX4)(XX3 + 1:) TO REPORTCUSTOMTEXT(XX2:)
065           SUBTRACT XX3 FROM 20 GIVING XX3
065           ADD XX3 TO XX2
065           GO TO LOAD-CF-VALUE-DONE.
065   
065        MOVE 1 TO XX1.
065   
065    LOAD-CF-VALUE-NEXT.
065        IF XX1 > MAX-NO-OF-CUSTOM-FORMS
065           GO TO LOAD-CF-VALUE-DONE.
065   
065        IF CF-FIELD-ALP(XX4)(XX1:) = SPACES
065           GO TO LOAD-CF-VALUE-DONE.
065   
065        MOVE CF-FIELD-ALP(XX4)(XX1:1) TO REPORTCUSTOMTEXT(XX2:1).
065        ADD 1 TO XX1.
065        ADD 1 TO XX2.
065        GO TO LOAD-CF-VALUE-NEXT.
065   
065    LOAD-CF-VALUE-DONE.
065        MOVE "|" TO REPORTCUSTOMTEXT(XX2:1).
065        ADD 1 TO XX2.
065   
065        GO TO LOAD-CF-NEXT.
065   
065    LOAD-CF-END.
065        IF REPORTCUSTOMTEXT NOT = SPACES
065           PERFORM INSERTCUSTOMFORMFIELDS.
065        EXIT.
065   *-----------------------------------------------------------------
065   * Copy custom form fields...
065    COPY-CUSTOM-FORMS.
065        PERFORM COPY-CF-START THRU COPY-CF-END.
065   
065    COPY-CF-START.
065        MOVE SPACES            TO LINK-CUST-TYPE.
065        MOVE SPACES            TO LINK-CUST-KEY.
065        MOVE "GENJND"          TO LINK-CUST-TYPE.
065        MOVE D-FROM-YEAR       TO LINK-CUST-KEY(1:4).
065        MOVE D-FROM-PER        TO LINK-CUST-KEY(5:2).
065        MOVE D-FROM-JNL        TO LINK-CUST-KEY(7:10).
065        MOVE GENJND-ENT        TO LINK-CUST-KEY(17:10).
065        MOVE GENJND-KEY        TO LINK-CUST-KEY2.
065        PERFORM CUSTOM-FORM-COPY.
065   
065    COPY-CF-END.
065            EXIT.
065   *-----------------------------------------------------------------
065   * Delete custom form deleting the line
065    DELETE-CUSTOM-FORMS.
065        PERFORM DEL-CF-START THRU DEL-CF-END.
065   
065    DEL-CF-START.

      * Check if journal number was allocated before deleting custom forms
068a       IF D-JNL-YEAR = 0 OR D-JNL-PER = 0 OR D-JNL-NO = 0
068a          GO TO DEL-CF-END
068a       END-IF.

065        MOVE SPACES         TO GENJND-KEY.
065        MOVE D-JNL-YEAR     TO GENJND-YEAR.
065        MOVE D-JNL-PER      TO GENJND-PER.
065        MOVE D-JNL-NO       TO GENJND-JNL.
065        PERFORM GENJND-START-GE.
065        IF STAT-INVALID-KEY
065           GO TO DEL-CF-END.
065        PERFORM COMER.
065   
065    DEL-CF-NEXT.
065        PERFORM GENJND-READ-NEXT.
065        IF STAT-AT-END
065           GO TO DEL-CF-END.
065        PERFORM COMER.

068a       IF (GENJND-YEAR > D-JNL-YEAR) OR
068a          (GENJND-PER > D-JNL-PER)   OR
068a          (GENJND-JNL > D-JNL-NO)
068a          GO TO DEL-CF-END
068a       END-IF.
065   
065        MOVE SPACES            TO LINK-CUST-KEY.
065        MOVE "GENJND"          TO LINK-CUST-TYPE.
065        MOVE GENJND-KEY        TO LINK-CUST-KEY.
065        PERFORM CUSTOM-FORM-DEL.
065   
065        GO TO DEL-CF-NEXT.
065    DEL-CF-END.
065            EXIT.
065   
065    EXTRACT-CUSTOM-FORMS.
065   * Extract custom form from the grid per line and save
065        MOVE "GENPJML1"  TO xtpCellControl.
065        PERFORM CreateCellControl.
065   
065        MOVE "GENPJML1" TO xtpReportControl.
086a  *    MOVE 58         TO xtpNumberColumns.
086a  *    MOVE 69         TO xtpNumberColumns.
086b       MOVE 72         TO xtpNumberColumns.
065        PERFORM RetrieveReportControl
065        MOVE  0          TO ENTRY-JN.
065        MOVE  0          TO CF-ROW.
107a       move "N"         to invalid-ent.
107a       perform varying xx1 from 1 by 1 until xx1 > impfrm-count
107a  * Before saving the custom form fields entered, delete all fields
107a  * previously saved.
107a          MOVE SPACES             TO LINK-CUST-KEY
107a          MOVE "GENJND"           TO LINK-CUST-TYPE
107a          MOVE D-JNL-YEAR         TO LINK-CUST-KEY(1:4)
107a          MOVE D-JNL-PER          TO LINK-CUST-KEY(5:2)
107a          MOVE D-JNL-NO           TO LINK-CUST-KEY(7:10)
107a          MOVE xx1                TO LINK-CUST-KEY(17:10)
107a          PERFORM CUSTOM-FORM-DEL
107a       end-perform
107a       .
065    EXTRACT-NEXT-CUSTOM.
065        PERFORM RetrieveNextReportRecord.
065        IF NOT xtpAtOK
065           GO TO EXTRACT-CUSTOM-FORMS-END.
065   
065        IF RecordRowCellText(1:10) = "CUSTOMFORM"
107a          if invalid-ent = "N"
065              MOVE "V"          TO WS-FUNCTION
065              ADD  1            TO CF-ROW
065              PERFORM UNPACK-CUSTOM-FORM-FROM-GRID
107a          end-if
065           GO TO EXTRACT-NEXT-CUSTOM
065        END-IF.
107a       move function numval-c(cellvalue(6)) to temp-dr
107a       move function numval-c(cellvalue(7)) to temp-cr
107a       if temp-dr not > zeroes and temp-cr  not > zeroes
107a          move "Y"  to invalid-ent
107a          go to extract-next-custom
107a       end-if
065        ADD  1                  TO ENTRY-JN.
107a       move "N"                to invalid-ent.
107a  * The code that was here has been moved up .The custom form will 
107a  * still be delete anyways
065   
065        GO TO EXTRACT-NEXT-CUSTOM.
065   
065    EXTRACT-CUSTOM-FORMS-END.
065        PERFORM DeleteReportControl
065        PERFORM FinishCellControl.
       
       
086    *>--------------------------------------------------------------
086    *> Routine to check if journal/SUBMOD journal is auth before it 
086    *> is posted
086    *>--------------------------------------------------------------
086    do-dimension-analysis.
086        if im0shgen = compid and d-jnl-type <> "I"
086          if (im2-aps-dana = "E" or "G") 
086          or (im2-ars-dana = "E" or "G")
086          or (im2-inv-dana = "E" or "G")
086          or (im2-ass-dana = "E" or "G")
086          or (im2-wip-dana = "E" or "G")
086          or (im2-csh-dana = "E" or "G")
086            if d-jnc-jsrc <> spaces
086              if d-submod-auth = "Y" *> Check SUBMOD Journal
086                if d-authorised = "Y" 
086                  perform genpjm-capture-dim-ana
086                end-if
086              else
086                perform genpjm-capture-dim-ana
086              end-if
086            else
086              if d-genctl-auth = "Y"  *> check journal
086               if d-authorised = "Y" 
086                  perform genpjm-capture-dim-ana
086               end-if
086              else
086                perform genpjm-capture-dim-ana
086              end-if
086            end-if
086          end-if
086        end-if
086        .
       
086    *>--------------------------------------------------------------
086    *> Routine to call the dimension analysis capture program
086    *>--------------------------------------------------------------
086    genpjm-capture-dim-ana.
rpm        move "Y" to OkToPost
086        move "N" to dim-batch
086				 initialize dim-link
086        if d-jnc-jsrc <> spaces   *> From a submodule journal
086          perform gl-dimension-at-gl-level
086          evaluate d-jnc-jsrc
086            when "SA"
086              if OkToPost = "Y"
086                *> check in the transaction originated from Sales 
086                *> Orders
086                *> to decide whether to call GENTDN
086                initialize dim-batch-det
086                move dim-sa-tbl to dim-sav-tbl
086                move dim-sa-lnk to dim-sav-tbl-lnk
086                move dim-sa-col to dim-sav-col
086                perform dim-check-batch
086              end-if
086            when "IN"
086              if OkToPost = "Y"
086                *> check in the transaction originated from Stock 
086                *> Take or Purchase Orders to decide whether to call 
086                *> Dimension Analysis Capture BO
086                initialize dim-batch-det
086                move dim-inv-tbl  to dim-sav-tbl
086                move dim-inv-lnk  to dim-sav-tbl-lnk
086                move dim-inv-col  to dim-sav-col
086                perform dim-check-batch
086              end-if
086            when "GR"
086              if OkToPost = "Y"
086                *> check in the transaction originated from GRN 
086                *> import to decide whether to call Dimension 
086                *> Analysis Capture BO
086                initialize dim-batch-det
086                move dim-grn-tbl  to dim-sav-tbl
086                move dim-grn-lnk  to dim-sav-tbl-lnk
086                move dim-grn-col  to dim-sav-col
086                perform dim-check-batch
086              end-if
086            when "WP"
086              if OkToPost = "Y"
086                *> check in the transaction originated from WIP labor
086                *> import to decide whether to call Dimension 
086                *> Analysis Capture BO
086                initialize dim-batch-det
086                if d-jnc-tcd = "LAB"
086                  move "Y" to dim-batch 
086                end-if
086              end-if
086            when "AS"
091             if OkToPost = "Y"
091            *> check in the transaction originated from Asset 
091            *> Depreciation calculation or Asset Acquistion to 
091            *> decide whether to call Dimension Analysis Capture BO
091               initialize dim-batch-det
091               move dim-ass-tbl to dim-sav-tbl
091               move dim-ass-lnk to dim-sav-tbl-lnk
091               move dim-ass-col to dim-sav-col
091               perform dim-check-batch
091             end-if
091kgk         when "AP"
091kgk          if OkToPost = "Y"
091kgk         *> check in the transaction originated from AP 
091kgk         *> Revaluation decide whether to call Dimension
091kgk         *>  Analysis Capture BO
091kgk            initialize dim-batch-det
091kgk            move dim-ap-tbl to dim-sav-tbl
091kgk            move dim-ap-lnk to dim-sav-tbl-lnk
091kgk            move dim-ap-col to dim-sav-col
091kgk            perform dim-check-batch
091kgk          end-if
091kgk         when "AR"
091kgk          if OkToPost = "Y"
091kgk         *> check in the transaction originated from AR 
091kgk         *> Revaluation decide whether to call Dimension
091kgk         *>  Analysis Capture BO
091kgk            initialize dim-batch-det
091kgk            move dim-ar-tbl to dim-sav-tbl
091kgk            move dim-ar-lnk to dim-sav-tbl-lnk
091kgk            move dim-ar-col to dim-sav-col
091kgk            perform dim-check-batch
091kgk          end-if
093            when "CS"
093             if OkToPost = "Y"
093            *> check in the transaction originated from Cash book 
093            *> variance decide whether to call Dimension
093            *>  Analysis Capture BO
093               initialize dim-batch-det
093               move dim-cs-tbl to dim-sav-tbl
093               move dim-cs-lnk to dim-sav-tbl-lnk
093               move dim-cs-col to dim-sav-col
093               perform dim-check-batch
093             end-if
086          end-evaluate
095        else 
095          perform sql-initialise 

095          move "GenJournalDetail" to sql-tab-tab(1)
095          move "DimensionEntry"   to sql-col-col(1)
095          move "N"                to sql-col-and(1)
095        *> Condition
095          move spaces                    to sql-con 
095          move 1                         to sql-cx1 
095          perform sql-con-next 
095          move "Journal = %1"          to sql-con(sql-cx1:)
095          perform sql-con-next                                       
095          move " AND GlYear = %2"      to sql-con(sql-cx1:) 
095          perform sql-con-next 
095          move " AND GlPeriod = %3"    to sql-con(sql-cx1:)
095          perform sql-con-next

095          perform sql-con-end
           
095        *> Parameters
095          move d-jnl-no                  to sql-par-num(1) 
095          move "N"                       to sql-par-and(1) 
095          move d-jnl-year                to sql-par-num(2) 
095          move "N"                       to sql-par-and(2)
095          move d-jnl-per                 to sql-par-num(3) 
095          move "N"                       to sql-par-and(3)

095          perform sql-fetch-single-row 
095          perform comer 

095          if sql-col-num(1) <> 0 
095            move "N" to OkToPost
095          end-if

095          perform sql-shutdown 
086        end-if

086        if OkToPost = "Y"
086          initialize gendan-entry-fields
086          perform gendtf-initialise
086          perform gendtf-initialize-rec
086          if d-jnc-jsrc <> spaces *> From a submodule journal 
086            move d-jnc-jsrc        to gendan-source 
086            move d-jnc-tcd         to gendan-tcd 
086          else
086            evaluate d-jnl-type
086              when "N"  move "JE"  to gendan-source
086              when "P"  move "PV"  to gendan-source
086              when "U"  move "WC"  to gendan-source    
086              when "E"  move "PE"  to gendan-source    
086              when "A"  move "AU"  to gendan-source    
086              when "S"  move "ST"  to gendan-source    
086              when "L"  move "PV"  to gendan-source   
086            end-evaluate
086          end-if
086          move "GEN"               to gendan-sub-mod
086          move "GJL"               to gendan-bus-process 
086          move d-jnl-year          to gendan-year
086          move d-jnl-per           to gendan-period
086          move "G"                 to gendan-call-from
086          perform genpjm-get-legder-codes
086          if dim-batch <> "Y"
086            if dim-rows > 0
086              perform cap-and-post-dimana
086            end-if
086          else
086            if dim-rows > 0
086              move dim-cnt                 to dimana-no-of-anas
086              move xml-root-name           to store-xml-root-name
086              initialize   dimana-entry-fields
086              move "P"  to dimana-entry-type 
086              perform validate-and-post-gl-dimanalysis
086              move store-xml-root-name     to xml-root-name
086              move dimana-ret-number       to dim-dentry
086            end-if
086            perform gendtf-close-delete-file
086          end-if
086        end-if
086        .
       
       *>--------------------------------------------------------------
       *> Routine to get the ledger codes from the GenJournalDetail and 
       *> pass the values to 'GENDAN.LNK'
       *> Input  : gendan-year     GL posting year
       *>        : gendan-period   GL posting period
       *>        : d-jnl-no        Journal number
       *>--------------------------------------------------------------
086    genpjm-get-legder-codes.
086        perform genpjm-get-legder-codes-1 thru 
086        genpjm-get-legder-codes-end.
086    genpjm-get-legder-codes-1.
086        perform sql-initialise
       
086    *> Tables
086        move "a GenJournalDetail"      to sql-tab-nam(1)
086        move "b GenMaster"             to sql-tab-nam(2)
086        move spaces to sql-tab-lnk(2,1)
086        string
086          "a.GlCode = b.GlCode"     delimited by size
086          " AND b.Company = '"      delimited by size
086          compid                    delimited by size
086          "'"                       delimited by size
086          into sql-tab-lnk(2,1)
086        end-string
099        if d-jnc-jsrc = "AP" and d-jnc-tcd = "DSB"
099          move "c ApGlDisburse"           to sql-tab-nam(3)
099          move "a.GlYear = c.GlYear"      to sql-tab-lnk(3,1)
099          move "a.GlPeriod = c.GlPeriod"  to sql-tab-lnk(3,2)
099          move "a.Journal = c.GlJournal"  to sql-tab-lnk(3,3)
099          move "a.SubModJournal = c.ChequeRegister"
099                                          to sql-tab-lnk(3,4)
099        end-if

086    *> Columns
086        move "a.GlYear"                to sql-col-nam(1)
086        move "N"                       to sql-col-and(1)
086        move "a.GlPeriod"              to sql-col-nam(2)
086        move "N"                       to sql-col-and(2)
086        move "a.Journal"               to sql-col-nam(3)
086        move "N"                       to sql-col-and(3)
086        move "a.EntryNumber"           to sql-col-nam(4)
086        move "N"                       to sql-col-and(4)
086        move "a.GlCode"                to sql-col-nam(5)
086        move "a.EntryType"             to sql-col-nam(6)
086        move "a.EntryValue"            to sql-col-nam(7)
086        move "N"                       to sql-col-and(7)
rpm        move "a.OriginZoomKey"         to sql-col-nam(8)
rpm        move "A"                       to sql-col-and(8)
086        move "b.ControlAccFlag"        to sql-col-nam(9)
086        move "a.SubModJournal"         to sql-col-nam(10)
086        move "N"                       to sql-col-and(10)
086        move "a.SubModInvoiceReg"      to sql-col-nam(11)
086        move "N"                       to sql-col-and(11)
086        move "a.SubModAssetReg"        to sql-col-nam(12)
086        move "N"                       to sql-col-and(12)
086        move "a.SubModArInvoice"       to sql-col-nam(13)
086        move "a.SubModApInvoice"       to sql-col-nam(14)
086        move "a.SubModSupplier"        to sql-col-nam(15)
086        move "a.SubModCustomer"        to sql-col-nam(16)
086        move "a.SubModRef"             to sql-col-nam(17)
086        move "a.SubModCheck"           to sql-col-nam(18)
086        move "a.SubModBank"            to sql-col-nam(19)
086        move "a.SubModApBranch"        to sql-col-nam(20)
086        move "a.SubModArBranch"        to sql-col-nam(21)
086        move "a.SubModWh"              to sql-col-nam(22)
086        move "a.SubModStock"           to sql-col-nam(23)
086        move "a.SubModJnlArea"         to sql-col-nam(24)
086        move "a.SubModAsset"           to sql-col-nam(25)
086        move "a.SubModGrn"             to sql-col-nam(26)
086        move "a.SubModJob"             to sql-col-nam(27)
086        move "a.SubModOperation"       to sql-col-nam(28)
086        move "a.SubModWorkCenter"      to sql-col-nam(29)
086        move "a.SubModEmployee"        to sql-col-nam(30)
086        move "a.SubModSalesOrder"      to sql-col-nam(31)
099        if d-jnc-jsrc = "AP" and d-jnc-tcd = "DSB"
099          move "c.DisbursementType"    to sql-col-nam(32)
099        end-if


086    *> Condition
086        move spaces                    to sql-con 
086        move 1                         to sql-cx1 
086        perform sql-con-next 
086        move "a.Journal = %1"          to sql-con(sql-cx1:)
086        perform sql-con-next                                         
086        move " AND a.GlYear = %2"      to sql-con(sql-cx1:) 
086        perform sql-con-next 
086        move " AND a.GlPeriod = %3"    to sql-con(sql-cx1:)
086        perform sql-con-next
097        move " AND Comment NOT LIKE '%Tax ptn.'"
097                                       to sql-con(sql-cx1:)
097        perform sql-con-next
097        move " AND Comment NOT LIKE '%With. tax'"
097                                       to sql-con(sql-cx1:)
097        perform sql-con-next
099        if d-jnc-jsrc = "AP" and d-jnc-tcd = "DSB"
099          move " AND SourceAp != 'H' AND Type = 'DSB' AND OriginZoomK
099   -      "ey = (STR(c.GlYear,4) + REPLACE(STR(c.GlPeriod, 2), ' ', '
099   -      "0') + CAST(c.GlCode as CHAR(35)) + c.Supplier + REPLACE(ST
099   -      "R(c.ChequeRegister, 10), ' ', '0')) + REPLACE(STR(c.DistrE
099   -      "ntry, 10), ' ', '0')"       to sql-con(sql-cx1:)
099          perform sql-con-next
099        end-if
 
086        perform sql-con-end 
       
086    *> Parameters
086        move d-jnl-no                  to sql-par-num(1) 
086        move "N"                       to sql-par-and(1) 
086        move d-jnl-year                to sql-par-num(2) 
086        move "N"                       to sql-par-and(2)
086        move d-jnl-per                 to sql-par-num(3) 
086        move "N"                       to sql-par-and(3) 

086    *> Flags
086        move "Y"                       to sql-with-nolock

086    *> Build command
086        perform sql-build-command
086        perform comer
           
086        move 0   to dim-cnt
086        .
       
086    *>  Fetch results
086    genpjm-get-legder-codes-fetch.
086        perform sql-fetch-row
086        if stat-at-end
086          go to genpjm-get-legder-codes-exit
086        end-if
086        perform comer
099        if d-jnc-jsrc = "AP"
099          if sql-col-alp(32) = "W"
099            go to genpjm-get-legder-codes-fetch
099          end-if
099        end-if

086        if d-jnc-jsrc <> spaces
086          if sql-col-num(10) > 0
086            move sql-col-num(10)   to gendan-jnl                     *> a.SubModJournal
086          else
086            if sql-col-num(11) > 0
086              move sql-col-num(11) to gendan-jnl                     *> a.SubModInvoiceReg 
086            end-if
086            if sql-col-num(12) > 0
086              move sql-col-num(12) to gendan-jnl                     *> a.SubModAssetReg 
086            end-if
086          end-if
086        else
086          move d-jnl-no            to gendan-jnl
086        end-if

086				 if sql-col-num(7) <> 0
086          perform genpjm-set-dim-details
086				 end-if

086        go to genpjm-get-legder-codes-fetch
086        .
086    
086    *>  Finalization
086    genpjm-get-legder-codes-exit.
086        perform gendtf-close
086        perform sql-shutdown                *> Complete SQL logic
086        .
086    genpjm-get-legder-codes-end.
086        exit
086        .

       
       *>--------------------------------------------------------------
086    genpjm-set-dim-details.
086        initialize gendan-line-details 
086				 add 1  to dim-cnt
086        move sql-col-alp(8)      to gendan-line-src-key

086        move sql-col-alp(5)      to gendan-line-ledger               *> a.GlCode
       
086        evaluate sql-col-alp(6)                                      *> a.EntryType
086          when "C" 
086            compute gendan-line-amt = sql-col-num(7) * -1            *> a.EntryAmount
086          when "D"
086            move sql-col-num(7)  to gendan-line-amt                  *> a.EntryAmount
086        end-evaluate

086        move sql-col-alp(9)      to    gendan-line-ctrl-flg          *> b.ControlAccFlag

086        if sql-col-alp(13) <> spaces
086           move sql-col-alp(13)  to    gendan-line-docno             *> a.SubModArInvoice
086        end-if
086        if sql-col-alp(14) <> spaces
086           move sql-col-alp(14)  to    gendan-line-docno             *> .aSubModApInvoice
086        end-if
086        if sql-col-alp(15) <> spaces
086           move sql-col-alp(15)  to    gendan-sup                    *> a.SubModSupplier
086        end-if
086        if sql-col-alp(16) <> spaces
086           move sql-col-alp(16)  to    gendan-line-cus               *> a.SubModCustomer
086        end-if
086        if sql-col-alp(17) <> spaces
086           move sql-col-alp(17)  to    gendan-line-ref               *> a.SubModRef
086        end-if
086        if sql-col-alp(18) <> spaces
086           move sql-col-alp(18)  to    gendan-line-check             *> a.SubModCheck
086        end-if
086        if sql-col-alp(19) <> spaces
086           move sql-col-alp(19)  to    gendan-bank                   *> a.SubModBank
086        end-if
086        if sql-col-alp(20) <> spaces
086           move sql-col-alp(20)  to    gendan-line-branch            *> a.SubModApBranch
086        end-if
086        if sql-col-alp(21) <> spaces
086           move sql-col-alp(21)  to    gendan-line-branch            *> a.SubModArBranch
086        end-if
086        if sql-col-alp(22) <> spaces
086           move sql-col-alp(22)  to    gendan-line-wh                *> a.SubModWh
086        end-if
086        if sql-col-alp(23) <> spaces
086           move sql-col-alp(23)  to    gendan-line-stk               *> a.SubModStock
086        end-if
086        if sql-col-alp(24) <> spaces
086           move sql-col-alp(24)  to    gendan-line-geo               *> a.SubModJnlArea
086        end-if
086        if sql-col-alp(25) <> spaces
086           move sql-col-alp(25)  to    gendan-line-asset             *> a.SubModAsset
086        end-if
086        if sql-col-alp(26) <> spaces
086           move sql-col-alp(26)  to    gendan-line-grn               *> a.SubModGrn
086        end-if
086        if sql-col-alp(27) <> spaces
086           move sql-col-alp(27)  to    gendan-line-job               *> a.SubModJob
086           if gendan-line-docno = spaces
086             move gendan-line-job to gendan-line-docno  
086           end-if
086        end-if
086        if sql-col-alp(28) <> spaces
086           move sql-col-alp(28)  to    gendan-line-oper              *> a.SubModOperation
086        end-if
086        if sql-col-alp(29) <> spaces
086           move sql-col-alp(29)  to    gendan-line-wc                *> a.SubModWorkCenter
086        end-if
086        if sql-col-alp(30) <> spaces
086           move sql-col-alp(30)  to    gendan-line-emp               *> a.SubModEmployee
086        end-if
086        if sql-col-alp(31) <> spaces
086           move sql-col-alp(31)  to    gendan-line-sord              *> SubModSalesOrder
086        end-if

086        move dim-cnt             to gendan-line
086        perform gendtf-write-file
           .
       
       *>--------------------------------------------------------------
rpm    gl-dimension-at-gl-level.
086    *> If this journal originated from a submodule we need to ensure that
086    *> we do not overwrite any dimensions that may have occured at
086    *> transaction entry level, therefore we only do dimension analysis
086    *> if we are setup at 'Gl Entry' level from a submodule journal
086        evaluate d-jnc-jsrc
086          when "AP"
086            if im2-aps-dana <> "G"
086              move "N"  to  OkToPost
086            end-if
086            if im2-aps-pst <> "Y" and (im2-aps-dana = "E" or "G")
086              perform get-dim-entry-num
086            end-if
086          when "AR"
086          when "SA"
086            if im2-ars-dana <> "G"
086              move "N"  to  OkToPost  
086            end-if
086            if im2-ars-pst <> "Y" and (im2-ars-dana = "E" or "G")
086              perform get-dim-entry-num
086            end-if
086          when "IN"
086          when "GR"
086            if im2-inv-dana <> "G"
086              move "N"  to  OkToPost
086            end-if
086            if im2-inv-pst <> "Y" and (im2-inv-dana = "E" or "G")
086              perform get-dim-entry-num
086            end-if
086          when "AS"
086            if im2-ass-dana <> "G"
086              move "N"  to  OkToPost
086            end-if
086            if im2-ass-pst <> "Y" and (im2-ass-dana = "E" or "G")
086              perform get-dim-entry-num
086            end-if
086          when "WP"
086            if im2-wip-dana <> "G"
086              move "N"  to  OkToPost
086            end-if
086            if im2-wip-pst <> "Y" and (im2-wip-dana = "E" or "G")
086              perform get-dim-entry-num
086            end-if
086          when "CS"
086            if im2-csh-dana <> "G"
086              move "N"  to  OkToPost  
086            end-if
086            if im2-csh-pst <> "Y" and (im2-csh-dana = "E" or "G")
086              perform get-dim-entry-num
086            end-if
095          when "RE"
095            if im2-inv-dana <> "G"
095              move "N"  to  OkToPost  
095            end-if
095            if im2-inv-pst <> "Y" and (im2-inv-dana = "E" or "G")
095              perform get-dim-entry-num
095            end-if
086        end-evaluate
086        .

086    *>--------------------------------------------------------------
086    *> Routine to get dimension entry 
086    get-dim-entry-num.
086        perform get-dim-entry-num-1 thru get-dim-entry-num-end.
086    get-dim-entry-num-1.
086        perform sql-initialise

086    *> Tables
086        move "a GenJournalDetail"    to sql-tab-nam(1)

086    *> Columns
086        move "a.DimensionEntry"      to sql-col-nam(1) 
086        move "N"                     to sql-col-and(1)
                             
086        move spaces                  to sql-con
086        move 1                       to sql-cx1
086        perform sql-con-next
086        move " a.GlYear  = %1 "             to sql-con(sql-cx1:)
086        perform sql-con-next
086        move " AND a.GlPeriod  = %2 "       to sql-con(sql-cx1:)
086        perform sql-con-next
086        move " AND a.Journal  = %3 "        to sql-con(sql-cx1:)
086        perform sql-con-next
086        move " AND a.DimensionEntry > 0 "   to sql-con(sql-cx1:)
086        perform sql-con-next
086
086        perform sql-con-end

086    *>  Parameters
086        move d-jnl-year              to sql-par-num(1)
086        move "N"                     to sql-par-and(1)
086        move d-jnl-per               to sql-par-num(2)
086        move "N"                     to sql-par-and(2)
086        move d-jnl-no                to sql-par-num(3)
086        move "N"                     to sql-par-and(3)
       
086    *> Flags
086        move "Y"                     to sql-with-nolock

086    *> Execute singleton SELECT
086        perform sql-fetch-single-row

086        move sql-col-num(1)          to dim-dentry
086        .
086    get-dim-entry-num-end.
086        perform sql-shutdown
086        .
       
       
086    *>--------------------------------------------------------------
086    *> check in the transaction originated from Sales Orders
086    *>--------------------------------------------------------------
086    *>  SELECT
086    *>    b.SalesOrder
086    *>    FROM
086    *>    GenJournalDetail a
086    *>    LEFT JOIN ArTrnDetail b ON a.Journal = b.GlJournal
086    *>  WHERE
086    *>    a.GlYear = 2016
086    *>    AND a.GlPeriod = 02
086    *>    AND a.Journal = 245
086    *>--------------------------------------------------------------
086    dim-check-batch.
086        perform dim-check-batch-1 thru dim-check-batch-end.
086    dim-check-batch-1.
086        perform sql-initialise
086        move zero to xx1

086    *> Tables
086        move "a GenJournalDetail"          to sql-tab-nam(1)
086        move dim-sav-tbl                   to sql-tab-nam(2)
086        move dim-sav-tbl-lnk               to sql-tab-lnk(2,1)

095        if d-jnc-jsrc = "AP"
095          move dim-ap-tbl-dis              to sql-tab-nam(3)
095          move dim-ap-lnk-dis-1            to sql-tab-lnk(3,1)
095          move dim-ap-lnk-dis-2            to sql-tab-lnk(3,2)
095          move dim-ap-lnk-dis-3            to sql-tab-lnk(3,3)
095        end-if

086    *> Columns
086        add 1 to xx1
086        move dim-sav-col                   to sql-col-nam(xx1)
091kgk     *> For modules where product class does not apply 
091kgk     if d-jnc-jsrc <> "AS" and d-jnc-jsrc <> "AP" and 
093           d-jnc-jsrc <> "AR" and d-jnc-jsrc <> "CS"
086           add 1 to xx1
086           move "b.ProductClass"           to sql-col-nam(xx1)
091        end-if
086				 *> Check if transation originates from purchase orders
086				 *> to decide whether to call dimension analysis capture
086				 *> business object
086        if d-jnc-jsrc = "IN"
086          add 1 to xx1
086          move "b.PurchaseOrder"              to sql-col-nam(xx1)
086        end-if
093
093    *> For Assets acquired through the count use EntryReference
093        if d-jnc-jsrc = "AS"
093           add 1 to xx1
093           move "b.EntryReference"        to sql-col-nam(xx1)
093        end-if

095        if d-jnc-jsrc = "AP"
095          add 1 to xx1
095          move dim-ap-col-dis              to sql-col-nam(xx1)
095        end-if

086        move spaces                        to sql-con
086        move 1                             to sql-cx1
086        perform sql-con-next
086        move " a.GlYear  = %1 "            to sql-con(sql-cx1:)
086        perform sql-con-next
086        move " AND a.GlPeriod  = %2 "      to sql-con(sql-cx1:)
086        perform sql-con-next
086        move " AND a.Journal  = %3 "       to sql-con(sql-cx1:)
086        perform sql-con-next

086        perform sql-con-end

086    *>  Parameters
086        move d-jnl-year              to sql-par-num(1)
086        move "N"                     to sql-par-and(1)
086        move d-jnl-per               to sql-par-num(2)
086        move "N"                     to sql-par-and(2)
086        move d-jnl-no                to sql-par-num(3)
086        move "N"                     to sql-par-and(3)
      *
086    *> Flags
086        move "Y" to sql-with-nolock
086    *> Execute singleton SELECT
086        perform sql-fetch-single-row
086        if stat-not-found
086          move "N"  to dim-batch
086        else
      *        
086          evaluate d-jnc-jsrc
086            when "SA"
086              if sql-col-alp(1) <> spaces *> From IMP041             *>SalesOrder
086                move "Y" to dim-batch
086              else
086                if sql-col-alp(2) = "_FIN" *> From ARSP80            *>ProductClass
086                  move "Y" to dim-batch
086                end-if
086              end-if
086            when "IN"
086              if sql-col-alp(1) = "STOCK TAKE ADJUSTMENT"            *> Notation
086              or sql-col-alp(3) <> spaces                            *> PurchaseOrder
086                move "Y" to dim-batch
086              end-if
086            when "GR"
086              if sql-col-alp(1) = "Created by Import"
086                move "Y" to dim-batch                                
086              end-if
091            when "AS"
091              if sql-col-alp(1) = "Acquisition Import"               *> Asset Import
091              or "Depreciation calculation"                          *> Depreciation Calc
093              or "Disposal on asset count"                           *> Disposal from the count 
091                  move "Y" to dim-batch
093              else
093                 if sql-col-alp(2)  = 'Count additional acquisition' *> Acquisition from Count
093                    move "Y" to dim-batch
093                 end-if
091              end-if
091kgk         when "AP"
091kgk           if sql-col-alp(1) = "Revaluation"                      *> Reference
095v             or sql-col-alp(1)(1:6) = "AV:GRN"
097              or sql-col-alp(1)(1:5) = "AR-AP"
091kgk               move "Y" to dim-batch
096              else 
096                  if sql-col-alp(2) = "Permanent Entry"
096                    move "Y" to dim-batch
096                  end-if
091kgk           end-if
091kgk         when "AR"
091kgk           if sql-col-alp(1) = "Reval"                            *> Reference
097              or sql-col-alp(1)(1:5) = "AP-AR"
091kgk               move "Y" to dim-batch
091kgk           end-if
093            when "CS"
093              if sql-col-alp(1) = "V"                            
093                  move "Y" to dim-batch
093              end-if
086          end-evaluate
086        end-if
086        .

086    dim-check-batch-end.
086        perform sql-shutdown                *> Complete SQL logic
086        .
      *
086b   CALL-ARSPGR.
086b       move spaces               to d-s-error
086b       move "N"                  to IsDome
086b       if d-pass-comp <> compid
086b         if d-pass-comp <> spaces
086b           perform change-company
086b         end-if
086b       end-if
086b
086b       if d-s-error = spaces
086b         move d-pass-payno       to link-brw-1
086b         move "ARSPGR"           to ww-prog-name
086b         move "B"                to link-brw-enq
086b         perform call-program
086b       end-if
086b
086b       if IsDome = "Y"
086b         perform impchc-context-restore
086b       end-if
086b       .
086b  *>---------------------------------------------------------------
086b   *> Routine to change the current company to another company
086b   *>---------------------------------------------------------------
086b   change-company.
086b       move d-pass-comp             to impchc-new-comp-context
086b       move "ARS"                   to impchc-new-comp-module
086b       perform impchc-context-set   *> log into secondary co
086b       if impchc-stat <> 0          *> error occurred
086b         move "CMP-ERR"             to d-s-error
086b         move "N"                   to IsDome
086b       else
086b         move "Y"                   to IsDome
086b       end-if
086b       .
086b  *-----------------------------------------------------------------
       CANCELREQ.
       REGISTER-MESSAGES.
      *
       ENDJOB.
086b       perform impchc-context-endjob-restore
           PERFORM DEL-ANALYSIS-FILE.
           PERFORM CLOSE-ALL-FILES.
           PERFORM CLEAR-GL-ENT-LOCK.
           CANCEL POST-PATH.
           PERFORM PRINT-CLOSE.
           PERFORM QUIT-DS.
      * Indicate if any journals posted in this run to CALLing
      * program...
           IF PASSED-LEDGER NOT = SPACES
              IF ANY-JOURNALS-POSTED = 1
                 MOVE "update" TO LINK-EXTRA.
           EXIT PROGRAM.

