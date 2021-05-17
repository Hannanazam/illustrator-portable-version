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

' KernRomanText.vbs

' DESCRIPTION

' Adds a new text frame to a new document containing Roman and
' Asian text then applies Roman only kerning to the entire text 
' range.

'*************************************************************


Set appRef = CreateObject("Illustrator.Application")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")
Set openOptions = CreateObject("Illustrator.OpenOptions")
openOptions.UpdateLegacyText = True

doJavaScript = "var mixedTextFile = File.openDialog(""Select MixedText.ai file:""); if (mixedTextFile) filePath = mixedTextFile.fsName;"
mixedTextFilePath = appRef.DoJavaScript(doJavaScript)

If (fileSystemObject.FileExists(mixedTextFilePath)) Then

	Set docRef = appRef.Open(mixedTextFilePath, 2, openOptions) ' 2 aiDocumentCMYKColor

	Set textRef = docRef.TextFrames(1)

	' Create a new character style and set the kerning method and fill color
	Set charStyle = docRef.CharacterStyles.Add("KernRomanText")
	charStyle.CharacterAttributes.KerningMethod = 3 ' aiMetricsRomanOnly

	Set cmykColor = CreateObject("Illustrator.CMYKColor")
	cmykColor.Cyan = 50
	cmykColor.Magenta = 20
	cmykColor.Yellow = 10
	cmykColor.Black = 5
	charStyle.CharacterAttributes.FillColor = cmykColor

	' Apply the new character style to the text range
	charStyle.ApplyTo textRef.TextRange

End If