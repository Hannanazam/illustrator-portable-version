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

' CreateSwatch.vbs

' DESCRIPTION

' Create a new swatch added to the general swatch group.

' ************************************************************

Set appRef = CreateObject("Illustrator.Application")

Set docRef = appRef.Documents.Add

' Create the new color for the swatch
Set cmykColor = CreateObject("Illustrator.CMYKColor")
cmykColor.Cyan = 75
cmykColor.Magenta = 50
cmykColor.Yellow = 20
cmykColor.Black = 5

' Create the new swatch using the above color
Set swatch = docRef.Swatches.Add
swatch.Color = cmykColor
swatch.Name = "CreateSwatch"

' Apply the swatch to a new path item
Set pathRef = docRef.PathItems.Star(300, 300, 100, 30, 4, false)
pathRef.Filled = true
pathRef.FillColor = swatch.Color
pathRef.Stroked = true
pathRef.StrokeColor = swatch.Color