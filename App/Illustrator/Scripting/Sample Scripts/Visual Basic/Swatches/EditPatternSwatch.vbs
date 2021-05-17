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

' EditPatternSwatch.vbs

' DESCRIPTION

' Search for and edit the first pattern swatch in the general swatch group.

' ************************************************************

Set appRef = CreateObject("Illustrator.Application")

Set docRef = appRef.Documents.Add

Set swatchRef = docRef.Swatches(1)

' Iterate through the document swatches looking for patterns
' if a pattern swatch is found edit it
For Each currentSwatch in docRef.Swatches
	If TypeName(currentSwatch.color) = "PatternColor" Then
		' Edit the pattern swatch
		currentSwatch.Color.Pattern.Name = "EditedPatternSwatch"
		currentSwatch.Color.Reflect = true
		currentSwatch.Color.ReflectAngle = 10.0
		currentSwatch.Color.Rotation = 45
		currentSwatch.Color.ScaleFactor = Array(150,150)
		currentSwatch.Color.ShearAngle = 50
		Set swatchRef = currentSwatch
		Exit For
	End If
Next

' Apply the edited pattern swatch to a new path item
Set pathRef = docRef.PathItems.Star(300, 300, 100, 30, 5, false)
pathRef.Filled = true
pathRef.FillColor = swatchRef.Color
pathRef.Stroked = true