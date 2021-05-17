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

' ImportDatasets.vbs

' DESCRIPTION

' This sample script will create 2 variables (text and visiblity)
' and 10 datasets (alternating between visible and hidden). The
' variables are then exported to an ImportedDatasets folder on
' the desktop and the document is closed. The document is 
' re-opened and the saved variables are imported.
'
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

const DESKTOP = &H0&
set myShell = CreateObject("Shell.Application")
set myDesktopFolder = myShell.Namespace(DESKTOP)
set myDesktopFolderItem = myDesktopFolder.Self
myDesktopPath = myDesktopFolderItem.Path

Set objFileSys = CreateObject("Scripting.FileSystemObject")
Set objFolder = objFileSys.GetFolder(myDesktopPath)

If (objFileSys.FolderExists(objFolder & "\ImportedDatasets")) Then
    Set importFolder = objFileSys.GetFolder(objFolder & "\ImportedDatasets")
Else
    Set importFolder = objFolder.SubFolders.Add("ImportedDatasets")
End If
	
saveFolder = importFolder.Path
aiFilename = "\DS_V.ai"
xmlFilename = "\DS_V.xml"

' Create a new document and add some art, a text frame and path item.
' Add a text item and assign a content variable to it

Set docRef = appRef.Documents.Add
numberStyles = docRef.GraphicStyles.Count
if (numberStyles > 1) then
Set textRef = docRef.TextFrames.Add
textRef.Position = Array(100, 400)
textRef.Contents = "Visible"

Set textVar = docRef.Variables.Add
textVar.Kind = 3 ' aiTextual

textRef.ContentVariable = textVar

' Add a rectangle, and assign a visibility variable to it

Set pathRef = docRef.PathItems.Rectangle(450, 300, 100, 100)
docRef.GraphicStyles(2).ApplyTo pathRef.PageItem
Set visibilityVar = docRef.Variables.Add
visibilityVar.Kind = 2  ' aiVisibility

pathRef.VisibilityVariable = visibilityVar

docRef.SaveAs (saveFolder & aiFilename)

' Create 10 data sets, alternating between hidden and visible

i = 1
Do While (i < 11)
	If ((i Mod 2) = 0) Then
	    textRef.Contents = "Hidden"
	    pathRef.Hidden = True
	Else
	    textRef.Contents = "Visible"
	    pathRef.Hidden = False
	End If

	Set datasetRef = docRef.DataSets.Add
	i = i + 1
Loop

' Export the datasets, and close the file

docRef.ExportVariables (saveFolder & xmlFilename)
docRef.Close (2)

' Re-open the file and import the datasets

Set docRef = appRef.Open(saveFolder & aiFilename)
docRef.ImportVariables (saveFolder & xmlFilename)
docRef.Save

myMsg = "alert(""Done"")"
appRef.DoJavaScript myMsg
else
 myMsg = "alert(""This script requires at least 2 graphic styles."")"
appRef.DoJavaScript myMsg
docRef.Close (2)

end if
