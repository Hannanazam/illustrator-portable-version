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

' CreateSpotSwatch.vbs

' DESCRIPTION

' Create a new spot color swatch in the general swatch group
' and apply a tint of the new spot swatch to a new path item.

' ************************************************************

Set appRef = CreateObject("Illustrator.Application")

Set docRef = appRef.Documents.Add(2) ' aiDocumentCMYKColor

spotName = "CreateSpotSwatch"

' Create CMYKColor
Set cmykColor = CreateObject("Illustrator.CMYKColor")
cmykColor.Cyan = 10
cmykColor.Magenta = 35
cmykColor.Yellow = 50
cmykColor.Black = 5

' Create Spot
Set spot = docRef.Spots.Add
spot.Color = cmykColor
spot.ColorType = 2 ' aiSpot
spot.Name = spotName

' Create new SpotColor using Spot created above and apply a 50% tint
Set spotColor = CreateObject("Illustrator.SpotColor")
spotColor.Tint = 50 ' 50% tint
spotColor.Spot = spot

' Apply the tinted spot swatch to a new path item
Set pathRef = docRef.PathItems.Rectangle(400, 200, 200, 100, false)
pathRef.Filled = true
pathRef.FillColor = spotColor
pathRef.Stroked = true