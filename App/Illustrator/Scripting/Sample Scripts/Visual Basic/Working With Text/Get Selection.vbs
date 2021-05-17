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

' Get Selection.vbs

' DESCRIPTION

' This example illustrates different ways of using the 
' selection property. Try to run it with text selected, 
' paths selected and the bounding box of text art items selected.
' 
'*************************************************************

GetTextSelection

Private Sub GetTextSelection
	Set appRef = CreateObject("Illustrator.Application")

	If (appRef.Documents.Count < 1) Then
		appRef.DoJavaScript "alert('Open document and select some text items.')"
		' OR
		' MsgBox "Open document and select some text items."
		Exit Sub
	End If

	If (IsEmpty(appRef.Selection)) Then
		appRef.DoJavaScript "alert('Nothing is selected.')"
		' OR
		' MsgBox "Nothing is selected"
		Exit Sub
	End If
    
	Rem If the user has selected characters inside a text art item then the type of
	Rem the selection is string

	If (TypeName(appRef.Selection) = "TextRange") Then
		myMsg = "alert(""The following text is selected: > " & appRef.Selection.Contents & "<"")"
		appRef.DoJavaScript myMsg
		' MsgBox "The following text is selected: >" & appRef.Selection.Contents & "<"
		Exit Sub
	End If
     
	Rem If one or more art items are selected then a variant array of Objects is returned
	
	selectedItems = appRef.Selection
	If (TypeName(selectedItems) <> "Variant()") Then
		myMsg = "alert(""Unknown selection type = " & TypeName(selectedItems) & ")"
		appRef.DoJavaScript myMsg
		' MsgBox "Unknown selection type = " & TypeName(selectedItems)
		Exit Sub
	End If
	    
	Rem run through the returned array
	Rem (startIndex will always be 0)

	startIndex = LBound(selectedItems)
	endIndex = UBound(selectedItems)
	
	For index = startIndex To endIndex
		Set pageObject = selectedItems(index)
        
		Set artItem = pageObject.PageItem
		If (artItem.PageItemType = 10 ) Then ' chk if aiTextFrame
			myMsg = "alert(""Text art item selected: >" & artItem.Contents & "<"")"
			appRef.DoJavaScript myMsg
			' MsgBox "Text art item selected: >" & artItem.Contents & "<"
		Else
			myMsg = "alert(""Selection: " & TypeName(pageObject) & """)"
			appRef.DoJavaScript myMsg
			' MsgBox TypeName(pageObject)
		End If
	Next
End Sub