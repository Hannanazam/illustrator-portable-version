'*************************************************************
' 
' ADOBE SYSTEMS INCORPORATED 
' Copyright 2005-2010 Adobe Systems Incorporated 
' All Rights Reserved 

' NOTICE:  Adobe permits you to use, modify, and 
' distribute this file in accordance with the terms
' of the Adobe license agreement accompanying it.  
' If you have received this file from a source 
' other than Adobe, then your use, modification,
' or distribution of it requires the prior 
' written permission of Adobe. 
' 
'*************************************************************

' Calendar.vbs

' DESCRIPTION

' This example shows how you can use a template document, which 
' defines a standardized graphical layout for a calendar, to 
' display dynamically generated current month and year data. 
' This uses a combination of the powerful Visual Basic programming 
' feature set and Illustrators rich graphics and text 
' manipulation capabilities.
' 
'*************************************************************


Set appRef = CreateObject("Illustrator.Application")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")

' Creating a folder browser in VBScript can be a problem (relying on either Windows API calls
' or use of ActiveX controls which may not be present on a given system). Instead, use
' Illustrator's built-in JavaScript to display a file browser. DoJavaScript can return a value,
' in this example it's the platform specific full path to the chosen template file.

doJavaScript = "var templateFile = File.openDialog(""Select CalendarTemplate.ai file:""); if (templateFile) filePath = templateFile.fsName;"
myFilePath = appRef.DoJavaScript(doJavaScript)

If (fileSystemObject.FileExists(myFilePath)) Then
	' Open the template file.
	appRef.Open(myFilePath)
	Set templateRef = appRef.ActiveDocument

	' Determine the number of days in the current month

	daysInMonth = 31
	While (Not IsDate(CStr(Month(Date)) & "/" & CStr(daysInMonth) & "/" & CStr(Year(Date))))
		daysInMonth = daysInMonth - 1
	Wend

	' Determine what day of the week the first falls on using Monday as "week day 1"

	day1DayOfWeek = Weekday(DateValue(CStr(Month(Date)) & "/01/" & CStr(Year(Date))), vbMonday)
	daysHeader = Array("M", "T", "W", "T", "F", "S", "S")

	' Fill out a matrix of 6 rows (weeks) times 7 columns (week days) with the day
	' (a month can span up to 6 weeks)
	' value as a string in the correct offset given the position of day 1 in relation
	' to the first Monday of the month

	nRows = 6
	nCols = 7
	Dim calRows(6)
	dayCnt = 1
	For rowCnt = 1 To nRows
		calRows(rowCnt - 1) = Array("", "", "", "", "", "", "")
		For colCnt = 1 To nCols
			If (dayCnt > daysInMonth) Then
  				Exit For
			End If
			If (Not (rowCnt = 1 And colCnt < day1DayOfWeek)) Then
  				calRows(rowCnt - 1)(colCnt - 1) = CStr(dayCnt)
  				dayCnt = dayCnt + 1
			End If
		Next
	Next

	' Next, join the day strings with tab delimiters to assemble each
	' weeks paragraph text. Make the weekend values red.

	Set weekendColor = CreateObject("Illustrator.CMYKColor")
	weekendColor.Magenta = 100
	weekendColor.Yellow = 90

	For Each textArt In templateRef.TextFrames
		If (textArt.Contents = "#Name") Then
  			textArt.Contents = FormatDateTime(Date, 1 )
		Else
  			If (textArt.Contents = "#Days") Then
				' Assemble the header and numerical days and add to the text item
	    			sText = Join(daysHeader, vbTab)
    				For rowCnt = 1 To nRows
      				sText = sText & vbCrLf & Join(calRows(rowCnt - 1), vbTab)
    				Next
    				textArt.Contents = sText
				' colorize the weekend dates
				For Each lineRef In textArt.Lines
					If (lineRef.Words.Count >= 12) Then
	    					lineRef.Words(12).CharacterAttributes.FillColor = weekendColor
					End If
					If (lineRef.Words.Count >= 13) Then
	   					lineRef.Words(13).CharacterAttributes.FillColor = weekendColor
					End If
    				Next
			End If
		End If
	Next

	Set textArt = Nothing
	Set weekendColor = Nothing
End If
