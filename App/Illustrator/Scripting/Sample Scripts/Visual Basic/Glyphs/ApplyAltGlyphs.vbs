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

' ApplyAlternateGlyphs.vbs

' DESCRIPTION

' Adds Asian text to a new document then sets the alternate glyph
' form of each Asian character.

' ************************************************************

Set appRef = CreateObject("Illustrator.Application")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")
Set openOptions = CreateObject("Illustrator.OpenOptions")
openOptions.UpdateLegacyText = True

doJavaScript = "var asianTextFile = File.openDialog(""Select AsianText.ai file:""); if (asianTextFile) filePath = asianTextFile.fsName;"
asianTextFilePath = appRef.DoJavaScript(doJavaScript)

If (fileSystemObject.FileExists(asianTextFilePath)) Then

	Set docRef = appRef.Open(asianTextFilePath, 2, openOptions) ' 2 aiDocumentCMYKColor

	'Get the text frame containing the Asian text
	Set textRef = docRef.TextFrames(1)
	
	Set char1Ref = textRef.TextRange.Characters(1)
	Set char2Ref = textRef.TextRange.Characters(2)
	Set char3Ref = textRef.TextRange.Characters(3)

	' Set the alternate glyph of each Asian character
	char1Ref.CharacterAttributes.AlternateGlyphs = 2 'aiExpert
	char2Ref.CharacterAttributes.AlternateGlyphs = 3 'aiJIS78Form
	char3Ref.CharacterAttributes.AlternateGlyphs = 11 'aiJIS04Form

End If