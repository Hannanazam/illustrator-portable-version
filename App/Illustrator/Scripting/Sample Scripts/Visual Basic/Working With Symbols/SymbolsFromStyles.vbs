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

' SymbolsFromStyles.vbs

' DESCRIPTION

' This script creates a pageItem for each art style. It also
' creates a symbol and symbolItem for each new pageItem.
'
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")
Set docRef = appRef.Documents.Add
y = 700

' create a pageItem for each art style, create a
' symbol and symbolItem for each new pageItem.

For i = 1 To docRef.GraphicStyles.Count
	Set itemRef = docRef.PathItems.Ellipse(y, 100, 40, 20)
	docRef.GraphicStyles(i).ApplyTo itemRef
	Set symbolRef = docRef.Symbols.Add(itemRef.PageItem)
	Set symbolItemRef = docRef.SymbolItems.Add(symbolRef)
	symbolItemRef.Left = 300
	symbolItemRef.Top = y
	y = y - 40  ' stagger the height of the page items
Next

