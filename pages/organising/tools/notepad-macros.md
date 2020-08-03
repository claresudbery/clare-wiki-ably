---
layout: page
location: pages/organising/tools//leaf
permalink: /pages/organising/tools//Sample-Notepad++-Macros
---

## Sample Notepad++ Macros

- All macros are stored in %AppData%\notepad++\shortcuts.xml
- You have to restart Notepad++ after editing shortcuts.xml, then the new/edited macros will be available from Macro menu
- You don't have to edit shortcuts.xml - you can just play and record macros and do all management via the Macro menu
- You don't have to have each action on a new line - you can have all actions on the same line. 
    - This can be really helpful when searching/replacing lists of values.
    - See "all-on-one-line" in the sample macros for an example.

There are several sample macros below, and I may have some more in Dropbox\IT Training\Misc\SampleNotepad++Macros.xml

```xml
		<!-- This one does Search and Replace in one file, some of it using regEx -->
        <Macro name="test5" Ctrl="no" Alt="no" Shift="no" Key="0">
		<!-- The next section does Replace All using regular expressions - replacing Goo"???" with Clare1 (eg Goo"book" would become Clare1) -->
		<!-- I think where it says lParam="2", that's what marks it as Replace All. -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='Goo&quot;([a-z])\w+&quot;' />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="Clare1" />
            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
		<!-- The next section does a normal Replace All - replacing ping with pong -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="ping" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="pong" />
            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
		<!-- The next section does a normal Replace All - replacing uuu with vvv -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="uuu" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="vvv" />
            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
		<!-- The next section does a normal Replace All - replacing vvu with xxx -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="vvu" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="xxx" />
            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
        </Macro>
		
        <Macro name="analysis-starters-in" Ctrl="no" Alt="no" Shift="no" Key="0">
			<!-- The next section does a Replace All using regEx -->
			<!-- Will replace this... -->
			<!-- COALESCE((SELECT SUM("Total") FROM "EstablishmentJobs" WHERE "EstablishmentID" = e."EstablishmentID" AND "JobID" = 26 AND "JobType" = 'Starters'),-1) jr30strt, --****COALESCE**** -->
			<!-- ...with this: -->
			<!-- CASE WHEN "StartersValue" = 'None' THEN 0 ELSE COALESCE((SELECT SUM("Total") FROM "EstablishmentJobs" WHERE "EstablishmentID" = e."EstablishmentID" AND "JobID" = 26 AND "JobType" = 'Starters'),-1) END jr30strt, --****COALESCE**** -- 085 -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='(COALESCE\(\(SELECT SUM\(&quot;Total&quot;\) FROM &quot;EstablishmentJobs&quot; WHERE &quot;EstablishmentID&quot; = e.&quot;EstablishmentID&quot; AND &quot;JobID&quot; IN \()([\d,]+)(\) AND &quot;JobType&quot; = &apos;Starters&apos;\),-1\) )([\w]*)(\, --\*\*\*\*COALESCE\*\*\*\*)' />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='CASE WHEN &quot;StartersValue&quot; = &apos;None&apos; THEN 0 ELSE $1$2$3END $4$5' />
            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
        </Macro>

        <Macro name="analysis-regex" Ctrl="no" Alt="no" Shift="no" Key="0">
			<!-- The next section does a Replace All using regEx (I think the value of 2 for lParam indicates Replace All) -->
			<!-- [),0) jr28strt, --****COALESCE****] will become [),-1) jr28strt, --****COALESCE****] -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="(\),0\) )([\w]*)(\, --\*\*\*\*COALESCE\*\*\*\*)" />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="\)\,-1\) $2$3" />
            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
        </Macro>

        <Macro name="sample-regex" Ctrl="no" Alt="no" Shift="no" Key="0">
			<!-- The next section does a Replace All using regEx (I think the value of 2 for lParam indicates Replace All) -->
			<!-- [xxxxx some common text, jr28strt, --COALESCE -- 064] will become [xxxxx some new text, jr28strt, --COALESCE  -- 064] -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="(some common text\, )([\w]*)(\, --COALESCE)" />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="some new text, $2$3" />
            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
        </Macro>
		
		<Macro name="all-on-one-line" Ctrl="no" Alt="no" Shift="no" Key="0">		
		<!-- Replace All - replacing totalstaff****COALESCE****_changedate with totalstaff_changedate -->            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1601" wParam="0" lParam="0" sParam="totalstaff****COALESCE****_changedate" />            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1602" wParam="0" lParam="0" sParam="totalstaff_changedate" />            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />	
		<!-- Replace All - replacing totalstarters****COALESCE****_changedate with totalstarters_changedate -->            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1601" wParam="0" lParam="0" sParam="totalstaff****COALESCE****_changedate" />            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1602" wParam="0" lParam="0" sParam="totalstaff_changedate" />            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />	
		<!-- Replace All - replacing totalleavers****COALESCE****_changedate with totalleavers_changedate -->            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1601" wParam="0" lParam="0" sParam="totalstaff****COALESCE****_changedate" />            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1602" wParam="0" lParam="0" sParam="totalstaff_changedate" />            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />	
		<!-- Replace All - replacing totalvacancies****COALESCE****_changedate with totalvacancies_changedate -->            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1601" wParam="0" lParam="0" sParam="totalstaff****COALESCE****_changedate" />            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />            <Action type="3" message="1602" wParam="0" lParam="0" sParam="totalstaff_changedate" />            <Action type="3" message="1702" wParam="0" lParam="768" sParam="" />            <Action type="3" message="1701" wParam="0" lParam="1609" sParam="" />
        </Macro>

		<!-- This one was an attempt to fix the problem where the regEx replace in all txt files was only working on files that were open in notepad++-->
        <Macro name="automate2" Ctrl="no" Alt="no" Shift="no" Key="0">
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='Gob&quot;([a-z])\w+&quot;' />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="Clare2Gob" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\CompareHtml\Auto Test\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.txt" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
        </Macro>
		
		<!-- This one does Search and Replace in lots of files, using regEx for some -->
        <Macro name="test6" Ctrl="no" Alt="no" Shift="no" Key="0">
		<!-- The next section does a Replace All in all *.txt files in the specified folder - replacing ring with wrong -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="ring" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="wrong" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="c:\Git\LivSmarter\CompareHtml\Auto Test\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.txt" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
		<!-- The next section does a Replace All in all *.txt files in the specified folder - replacing thing with thong -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="thing" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="thong" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\CompareHtml\Auto Test\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.txt" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
		<!-- The next section does Replace All using regular expressions in all *.txt files in the specified folder - replacing Goo"???" with Clare1 (eg Goo"book" would become Clare1) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='Goo&quot;([a-z])\w+&quot;' />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="Clare1" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\CompareHtml\Auto Test\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.txt" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
        </Macro>

		<!-- All the sections below will do a Replace All in all files of the specified extension in the specified folder -->
		<Macro name="automatedHtmlExtraction" Ctrl="no" Alt="no" Shift="no" Key="0">
			<!-- The next section does a search and replace using regEx -->
			<!-- eg ControlToValidate="boo" will be deleted -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='ControlToValidate="([a-z])\w+"' />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='runat="server"' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='<asp:RequiredFieldValidator' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='<span' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='<asp:RegularExpressionValidator' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='<span' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='Display="Dynamic"' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='style="color:Red;display:none;"' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="</asp:RequiredFieldValidator>" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="</span>" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="</asp:RegularExpressionValidator>" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="</span>" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='CssClass="' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='class="' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='content/themes/css/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='styles/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='src="Scripts/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='src="scripts/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='href="~/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='href="' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=".aspx" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=".html" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="~/content/images/" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="images/" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='<asp:TextBox ID="' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='<input name="' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="></asp:TextBox>" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='type="text" id="yyyy">' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='<asp:DropDownList' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='<select name="yyyy"' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='<asp:ListItem' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='<option' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"></asp:ListItem>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='">yyyy</option>' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="</asp:DropDownList>" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="</select>" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="<textarea" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='<textarea name="yyyy"' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='<asp:LinkButton' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='<a' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='OnClick="' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="href=&apos;javascript:WebForm_DoPostBackWithOptionsxyxyxyxyxy" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="xyxyxyxyxy" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='(new WebForm_PostBackOptions("' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='_Click"' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='", "", true, "", "", faPinglePonglePoogle' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="PinglePonglePoogle" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="lse, true))&apos;" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="</asp:LinkButton>" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam="</a>" />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam="webkitallowfullscreen mozallowfullscreen allowfullscreen>" />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="">' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/jquery-ui-1.10.3.custom.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/jquery-ui-1.10.3.custom.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/modernizr-2.6.2.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/modernizr-2.6.2.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/jquery.validate.min.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/jquery.validate.min.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/jquery.validate.unobtrusive.min.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/jquery.validate.unobtrusive.min.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/jquery.easing.1.3.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/jquery.easing.1.3.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/scrolltotop.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/scrolltotop.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/bootstrap-filestyle.min.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/bootstrap-filestyle.min.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/select2.min.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/select2.min.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/jquery.fancybox.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/jquery.fancybox.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/jquery.custom-checkbox.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/jquery.custom-checkbox.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace (don't worry, the commented-out sections don't muck up the xml) -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam=' <script src="scripts/custom.scripts.js"></script>' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam=' <!--<script src="scripts/custom.scripts.js"></script>-->' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\Experts\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Account\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Analysis\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Articles\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Exercise\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Experts\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Health\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Planner\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Exercise\exercise-demos\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Exercise\exercise-planners\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Planner\Exercise\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Planner\Meal\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Exercise\exercise-planners\favourite-plans\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Exercise\exercise-planners\manual-planner\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Exercise\exercise-planners\livsmarter-plans\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Exercise\exercise-planners\previous-plans\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Planner\Exercise\Create\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Planner\Exercise\LivSmarter\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Planner\Meal\Create\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a standard search and replace, but NOT in sub-folders -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='"images/' />
            <Action type="3" message="1625" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='"../../../../images/' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\LoggedIn\Planner\Meal\livsmarter-plans\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
        </Macro>

        <Macro name="regExFun" Ctrl="no" Alt="no" Shift="no" Key="0">
			<!-- The next section does a search and replace using regEx -->
			<!-- eg <option text="50g serving" Value="50" /> will become <option Value="50">50g serving</option> -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='(<option)( text=")([\s\S]*)(")( Value=")([\s\S]*)(") />' />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='$1$5$6$7>$3</option>' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
			<!-- The next section does a search and replace using regEx -->
			<!-- eg <span ID="revThing" style="color:Red;" ErrorMessage="Wrong"></span> will become <span ID="revThing" style="color:Red;" >Wrong</span> -->
            <Action type="3" message="1700" wParam="0" lParam="0" sParam="" />
            <Action type="3" message="1601" wParam="0" lParam="0" sParam='(<span )([\s\S]*)(ErrorMessage=")([\s\S]*)("></span>)' />
            <Action type="3" message="1625" wParam="0" lParam="2" sParam="" />
            <Action type="3" message="1602" wParam="0" lParam="0" sParam='$1$2>$4</span>' />
            <Action type="3" message="1653" wParam="0" lParam="0" sParam="C:\Git\LivSmarter\LivSmarter3Html\app\" />
            <Action type="3" message="1652" wParam="0" lParam="0" sParam="*.html" />
            <Action type="3" message="1702" wParam="0" lParam="32" sParam="" />
            <Action type="3" message="1701" wParam="0" lParam="1660" sParam="" />
        </Macro>
```