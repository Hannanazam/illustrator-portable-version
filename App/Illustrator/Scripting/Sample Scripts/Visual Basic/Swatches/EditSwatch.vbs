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

' EditSwatch.vbs

' DESCRIPTION

' Search for and edit the white swatch in the general swatch group.

' ************************************************************

Set appRef = CreateObject("Illustrator.Application")

Set docRef = appRef.Documents.Add(2) ' aiDocumentCMYKColor

' Find the first swatch in the document
swatchIndex = 3 ' white swatch
Set currentSwatch = docRef.Swatches(swatchIndex)

' Apply new color to the swatch
Set cmykColor = currentSwatch.Color
cmykColor.Cyan = 45
cmykColor.Magenta = 35
cmykColor.Yellow = 0
cmykColor.Black = 5

' Apply new name to the swatch
currentSwatch.Name = "EditedSwatch"

' Apply the edited swatch to a new path item
Set pathRef = docRef.PathItems.Polygon(300, 300, 200, 8, false)
pathRef.Filled = true
pathRef.FillColor = docRef.Swatches(swatchIndex).Color
pathRef.Stroked = true