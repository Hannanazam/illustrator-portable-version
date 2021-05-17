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

' SymbolsFromPageItems.vbs

' DESCRIPTION

' This script will group all of the page items of a document 
' into a new group and then use that new group to create a new 
' symbol and symbol instances.
'
'*************************************************************

' NOTE: Please open a document with pageItems in it before 
'       running this script.

'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

If (appRef.Documents.Count = 0)Then
    myMsg = "alert(""No document open, creating..."")"
    appRef.DoJavaScript myMsg
    Set docRef = appRef.Documents.Add
Else
    Set docRef = appRef.Documents(1)
End if

if(docRef.PageItems.Count = 0) Then
    myMsg = "alert(""No item in document, creating..."")"
    appRef.DoJavaScript myMsg
    Set pathArt = docRef.PathItems.Star(100, 225, 100, 50, 5)
End if
    
    numItems = docRef.PageItems.Count
    
    Set groupRef = docRef.GroupItems.Add
    groupRef.Move docRef, 2
    
    For i = numItems To 1 Step -1
        docRef.PageItems(i).Move groupRef, 2
    Next
    myMsg = "alert(""Duplicating item(s)..."")"
    appRef.DoJavaScript myMsg
    Set symbolRef = docRef.Symbols.Add(docRef.PageItems(1))
    
    Set symbolItemRef = docRef.SymbolItems.Add(symbolRef)
    symbolItemRef.Name = "MyNewSymbolItem"
    symbolItemRef.Duplicate