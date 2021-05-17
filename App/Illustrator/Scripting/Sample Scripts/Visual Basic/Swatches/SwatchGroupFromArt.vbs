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

' SwatchGroupFromArt.vbs

' DESCRIPTION

' Create a new swatch group using colors in selected path item art.

' ************************************************************

Set appRef = CreateObject("Illustrator.Application")

' Check there is at least 1 document open
If appRef.Documents.Count > 0  Then
	Set docRef = appRef.ActiveDocument
	
	' Check there is a selection in the document
	If Not IsEmpty(appRef.Selection)  Then		
		' Add a new swatch group if it does not already exist
		Set swatchGroup = docRef.SwatchGroups(1)
		swatchGroupExists = false
		For Each swatchGroupRef In docRef.SwatchGroups	
			If swatchGroupRef.Name = "SwatchGroupFromArt" Then
				Set swatchGroup = swatchGroupRef
				swatchGroupExists = true
				Exit For	
			End If		
		Next
	
		If Not swatchGroupExists Then
			' Create new swatch group
			Set swatchGroup = docRef.SwatchGroups.Add
			swatchGroup.Name = "SwatchGroupFromArt"
		End If
		
		' Iterate through selected items		
		IterateSelection(appRef.Selection)
	Else
		' Must use JavaScript to display an alert
		appRef.DoJavaScript("alert(""Select some path art with colors applied before running this script"");")
	End If

Else
	' Must use JavaScript to display an alert
	appRef.DoJavaScript("alert(""Open a document containing some colored path art before running this script"");")
End If

Sub IterateSelection(selectedItems)
	' Get the fill color of each selected item
	For Each pathRef In selectedItems
	
		' Iterate path items within group items
		If TypeName(pathRef) = "GroupItem" Then
			IterateSelection(pathRef.PathItems)		
		ElseIf TypeName(pathRef) = "PathItem" Then
			' Do not continue if fill color is a gradient or a pattern
			If TypeName(pathRef.FillColor) <> "GradientColor" And TypeName(pathRef.FillColor) <> "PatternColor" Then
				' Iterate through existing swatches, checking if the color already exists in a swatch
				swatchExists = false
				For Each swatchRef In docRef.Swatches
					Set currentSwatchColor = swatchRef.Color
					If ColorEquals(pathRef.FillColor, currentSwatchColor) Then
						' Add the existing swatch to the swatch group
						swatchGroup.AddSwatch(swatchRef)
						swatchExists = true
						Exit For
					End If
				Next
				If swatchExists = false Then
					' Create a new swatch in the swatch group
					Set newSwatch = docRef.Swatches.Add
					newSwatch.Color = pathRef.FillColor
					swatchGroup.AddSwatch(newSwatch)
				End If
			End If
		End If
	Next
End Sub

Function ColorEquals(fillColor, swatchColor)
	ColorEquals = false					
	' Compare colors
	If TypeName(fillColor) = TypeName(swatchColor) Then
		Select Case TypeName(swatchColor)
			Case "CMYKColor"
				ColorEquals = CMYKColorEquals(fillColor, swatchColor)
			Case "RGBColor"
				ColorEquals= RGBColorEquals(fillColor, swatchColor)
			Case "GrayColor"
				ColorEquals = GrayColorEquals(fillColor, swatchColor)
			Case "LabColor"
				ColorEquals = LabColorEquals(fillColor, swatchColor)
			Case "SpotColor"
				ColorEquals = SpotColorEquals(fillColor, swatchColor)
			Case "NoColor"
			Case "PatternColor"
			Case "GradientColor"
			Case Else
		End Select
	End If
End Function

Function CMYKColorEquals(fillColor, swatchColor)
	CMYKColorEquals = false
	If fillColor.Cyan = swatchColor.Cyan And fillColor.Magenta = swatchColor.Magenta And fillColor.Yellow = swatchColor.Yellow And fillColor.Black = swatchColor.Black Then
		CMYKColorEquals = true
	End If
End Function

Function RGBColorEquals(fillColor, swatchColor)
	RGBColorEquals = false
	If fillColor.Red = swatchColor.Red And fillColor.Green = swatchColor.Green And fillColor.Blue = swatchColor.Blue Then
		RGBColorEquals = true
	End If
End Function

Function GrayColorEquals(fillColor, swatchColor)
	GrayColorEquals = false
	If fillColor.Gray = swatchColor.Gray Then
		GrayColorEquals = true
	End If
End Function

Function LabColorEquals(fillColor, swatchColor)
	LabColorEquals = false
	If fillColor.L = swatchColor.L And fillColor.A = swatchColor.A And fillColor.B = swatchColor.B Then
		LabColorEquals = true
	End If
End Function

Function SpotColorEquals(fillColor, swatchColor)
	SpotColorEquals = false
	Select Case TypeName(swatchColor.Spot.Color)
		Case "CMYKColor"
			SpotColorEquals = CMYKColorEquals(fillColor.Spot.Color, swatchColor.Spot.Color)
		Case "RGBColor"
			SpotColorEquals = RGBColorEquals(fillColor.Spot.Color, swatchColor.Spot.Color)
		Case "GrayColor"
			SpotColorEquals = GrayColorEquals(fillColor.Spot.Color, swatchColor.Spot.Color)
		Case "LabColor"
			SpotColorEquals = LabColorEquals(fillColor.Spot.Color, swatchColor.Spot.Color)
		Case Else
	End Select
End Function