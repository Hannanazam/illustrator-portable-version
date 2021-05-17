'*************************************************************
' 
' ADOBE SYSTEMS INCORPORATED 
' Copyright 2008-2010 Adobe Systems Incorporated 
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

' SaveArtboardsAsPDF.vbs

' DESCRIPTION

' Creates a new document containing several artboards then
' saves the artboards to PDF.
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

' Create new document with 3 artboards
Set docRef = appRef.Documents.Add(1, 612.0, 792.0, 3, 2, 20.0, 3)

' Add a star to each artboard
Set artboardRef = docRef.Artboards(1)
rect = artboardRef.ArtboardRect
Set star1 = docRef.PathItems.Star (rect(0) + 300, rect(1) - 350, 200, 50, 5, false)
Set starColor = CreateObject("Illustrator.RGBColor")
starColor.Red = 255
starColor.Green = 0
starColor.Blue = 0
star1.FillColor = starColor

Set artboardRef = docRef.Artboards(2)
rect = artboardRef.ArtboardRect
Set star2 = docRef.PathItems.Star (rect(0) + 300, rect(1) - 350, 200, 50, 5, false)
starColor.Red = 0
starColor.Green = 255
starColor.Blue = 0
star2.FillColor = starColor

Set artboardRef = docRef.Artboards(3)
rect = artboardRef.ArtboardRect
Set star3 = docRef.PathItems.Star (rect(0) + 300, rect(1) - 350, 200, 50, 5, false)
starColor.Red = 0
starColor.Green = 0
starColor.Blue = 255
star3.FillColor = starColor

' Save the artboards to a PDF file
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")

' Creating a folder browser in VBScript can be a problem (relying on either Windows API calls
' or use of ActiveX controls which may not be present on a given system). Instead, use
' Illustrator's built-in JavaScript to display a file browser. DoJavaScript can return a value,
' in this example it's the platform specific full path to the chosen export folder.
' Save the artboards to PDF
destFolder = appRef.DoJavaScript("var destFolder = Folder.selectDialog('Select the folder to save the PDF files to:'); if (destFolder) folderPath = destFolder.fsName;")

If (fileSystemObject.FolderExists(destFolder)) Then
	destFile = destFolder + "\Artboard"
	Set pdfSaveOptions = CreateObject("Illustrator.PDFSaveOptions")
	docRef.SaveAs destFile, pdfSaveOptions
End If

