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

' CreateSwatchGroup.vbs

' DESCRIPTION

' Create a new swatch group and add swatches to it from 
' the general swatches group.

' ************************************************************

Set appRef = CreateObject("Illustrator.Application")

Set docRef = appRef.Documents.Add(2) ' aiDocumentCMYKColor

' Create a new SwatchGroup
Set swatchGroup = docRef.SwatchGroups.Add
swatchGroup.Name = "CreateSwatchGroup"

Set swatches = docRef.Swatches

' Get list of swatches in general swatch group
Set genSwatchGroup = docRef.SwatchGroups(1)

' Collect 5 random swatches from general swatch group and move to new group
i = 0
While i < 5
	swatches = genSwatchGroup.GetAllSwatches()
	' Returns an array, not a collection
	swatchCount = UBound(swatches)
	Randomize ' Initialize random number generator
	swatchIndex = Int(swatchCount * Rnd)
	' New swatch group does not allow patterns or gradients
	If TypeName(swatches(swatchIndex).Color) <> "PatternColor" And TypeName(swatches(swatchIndex).Color) <> "GradientColor" Then
		swatchGroup.AddSwatch(swatches(swatchIndex))
		i = i + 1
	End If
Wend

' Updates swatch list with swatches moved to new swatch group
swatches = swatchGroup.GetAllSwatches()

' Create new art in the document and apply each swatch in the new swatch group to a path item
Set groupItems = docRef.GroupItems
Set groupRef = groupItems.Add
Set pathItems = groupRef.PathItems

Set pathRef1 = pathItems.Add
pathRef1.SetEntirePath(Array(Array(52.37, 438.33),Array(262.7, 395.03),Array(262.7, 481.63),Array(52.37, 438.33)))
pathRef1.Filled = true
pathRef1.FillColor = swatches(0).Color
								
Set pathRef2 = pathItems.Add
pathRef2.SetEntirePath(Array(Array(306, 691.97),Array(262.7, 481.63),Array(349.3, 481.63),Array(306, 691.97)))
pathRef2.Filled = true
pathRef2.FillColor = swatches(1).Color
								
Set pathRef3 = pathItems.Add
pathRef3.SetEntirePath(Array(Array(559.63, 438.33),Array(349.3, 481.63),Array(349.3, 395.03),Array(559.63, 438.33)))
pathRef3.Filled = true
pathRef3.FillColor = swatches(2).Color
								
Set pathRef4 = pathItems.Add
pathRef4.SetEntirePath(Array(Array(306, 184.7),Array(349.3, 395.03),Array(262.7, 395.03),Array(306, 184.7)))
pathRef4.Filled = true
pathRef4.FillColor = swatches(3).Color
								
Set pathRef5 = pathItems.Add
pathRef5.SetEntirePath(Array(Array(262.7, 481.63),Array(349.3, 481.63),Array(349.3, 395.03),Array(262.7, 395.03),Array(262.7, 481.63)))
pathRef5.Filled = true
pathRef5.FillColor = swatches(4).Color
