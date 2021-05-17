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

' MakeLinearGradient.vbs

' DESCRIPTION

' This Sample creates a linear gradient and adds it to the Swatches 
' palette then applies it to all path item objects in the document.
' It shows the use of the PathItems and GradientStops collections, 
' RGBColor, Gradient and GradientStop objects.
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")
If (appRef.Documents.Count > 0) Then
	Set docPathItems = appRef.ActiveDocument.PathItems
	' Check whether a gradient called 'MyLinearGradient' already exists
	If (docPathItems.Count > 0) Then
		gradientExists = false
		Set myGradients = appRef.ActiveDocument.Gradients
		If (myGradients.Count > 0) Then
			For Each currentGradient in myGradients
				If (currentGradient.Name = "MyLinearGradient") Then
					gradientExists = true
				End If
			Next
		End If

		If (gradientExists = false) Then
			' Create new linear gradient
			
			Set myGradient = createGradient()
		
			' Apply gradient to all path items in the document
			For Each currentPath in docPathItems
				currentPath.Filled = true
				currentPath.FillColor = myGradient
			Next

			' Display an alert using JavaScript.
			appRef.DoJavaScript("alert('Note that MyLinearGradient has been added to the Swatches panel.');")
		Else
			' Display an alert using JavaScript.
			appRef.DoJavaScript("alert('Gradient already exists, start script from a new document.');")
		End If
	Else
		' Display an alert using JavaScript.
		appRef.DoJavaScript("alert('No path items in the document.');")
	End If
Else
	' Display an alert using JavaScript.
	appRef.DoJavaScript("alert('Please open a document with path items.');")
End If

Function createGradient()
	' Create a new gradient
	' A new gradient always has 2 gradient stops
	Set theGradient = appRef.ActiveDocument.Gradients.Add
	theGradient.Name = "MyLinearGradient"
	theGradient.Type =  1 ' aiLinearGradient

	' Add 2 new gradient stops
	Set newStop1 = theGradient.GradientStops.Add
	Set newStop2 = theGradient.GradientStops.Add

	' Create color objects for all the gradient stops
	Set startColor = CreateObject("Illustrator.RGBColor")
	Set newStop1Color = CreateObject("Illustrator.RGBColor")
	Set newStop2Color = CreateObject("Illustrator.RGBColor")
	Set endColor = CreateObject("Illustrator.RGBColor")
	startColor.Red = 0
	startColor.Green = 100
	startColor.Blue = 255
	newStop1Color.Red = 0
	newStop1Color.Green = 0
	newStop1Color.Blue = 120
	newStop2Color.Red = 120
	newStop2Color.Green = 0
	newStop2Color.Blue = 0
	endColor.Red = 220
	endColor.Green = 0
	endColor.Blue = 100

	' Modify the first gradient stop
	Set gradientStop1 = theGradient.GradientStops(1)
	gradientStop1.RampPoint = 5
	gradientStop1.MidPoint = 50
	gradientStop1.Color = startColor
	
	' Modify newStop1
	Set gradientStop2 = theGradient.GradientStops(2)
	gradientStop2.RampPoint = 30
	gradientStop2.MidPoint = 50
	gradientStop2.Color = newStop1Color
	gradientStop2.Opacity = 0.5
	
	' Modify newStop2
	Set gradientStop3 = theGradient.GradientStops(3)
	gradientStop3.RampPoint = 55
	gradientStop3.MidPoint = 50
	gradientStop3.Color = newStop2Color

	' Modify the last gradient stop
	Set gradientStop4 = theGradient.GradientStops(4)
	gradientStop4.RampPoint = 90
	gradientStop4.Color = endColor
	gradientStop4.Opacity = 0.25
	
	' Construct an Illustrator.GradientColor object referring to the
	' newly created gradient
	Set createGradient = CreateObject("Illustrator.GradientColor")
	createGradient.Gradient = theGradient
End Function