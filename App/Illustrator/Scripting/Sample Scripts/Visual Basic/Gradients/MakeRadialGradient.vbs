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

' MakeRadialGradient.vbs

' DESCRIPTION

' This Sample creates a radial gradient and adds it to the Swatches 
' palette then applies it to a new path item in a new document.
' It shows the use of the PathItems and GradientStops collections, 
' RGBColor, Gradient and GradientStop objects.
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

' Open a new document
Set docRef = appRef.Documents.Add

' Create a new path item in the document
Set pathRef = docRef.PathItems.Rectangle(700, 100, 300, 300, false)

' Call createGradient function to create gradient myGradient
Set myGradient = createGradient()

' Apply gradient myGradient to the path item
pathRef.Filled = true
pathRef.FillColor = myGradient


Function createGradient()
	' Create a new gradient
	' A new gradient always has 2 gradient stops
	Set theGradient = appRef.ActiveDocument.Gradients.Add
	theGradient.Name = "MyRadialGradient"
	theGradient.Type =  2 ' aiRadialGradient

	' Add 2 new gradient stops
	Set newStop1 = theGradient.GradientStops.Add
	Set newStop2 = theGradient.GradientStops.Add
	Set newStop3 = theGradient.GradientStops.Add
	Set newStop4 = theGradient.GradientStops.Add

	' Create color objects for all the gradient stops
	Set startColor = CreateObject("Illustrator.CMYKColor")
	Set newStop1Color = CreateObject("Illustrator.CMYKColor")
	Set newStop2Color = CreateObject("Illustrator.CMYKColor")
	Set newStop3Color = CreateObject("Illustrator.CMYKColor")
	Set newStop4Color = CreateObject("Illustrator.CMYKColor")
	Set endColor = CreateObject("Illustrator.CMYKColor")
	startColor.Cyan = 1
	startColor.Magenta = 96
	startColor.Yellow = 91
	startColor.Black = 0
	newStop1Color.Cyan = 3
	newStop1Color.Magenta = 1
	newStop1Color.Yellow = 91
	newStop1Color.Black = 0
	newStop2Color.Cyan = 92
	newStop2Color.Magenta = 7
	newStop2Color.Yellow = 93
	newStop2Color.Black = 0
	newStop3Color.Cyan = 0
	newStop3Color.Magenta = 98
	newStop3Color.Yellow = 3
	newStop3Color.Black = 0
	newStop4Color.Cyan = 97
	newStop4Color.Magenta = 98
	newStop4Color.Yellow = 1
	newStop4Color.Black = 0
	endColor.Cyan = 90
	endColor.Magenta = 7
	endColor.Yellow = 3
	endColor.Black = 0

	' Modify the first gradient stop
	Set gradientStop1 = theGradient.GradientStops(1)
	gradientStop1.RampPoint = 0
	gradientStop1.MidPoint = 50
	gradientStop1.Color = startColor
	
	' Modify newStop1
	Set gradientStop2 = theGradient.GradientStops(2)
	gradientStop2.RampPoint = 20
	gradientStop2.MidPoint = 50
	gradientStop2.Color = newStop1Color
	gradientStop2.Opacity = 20
	
	' Modify newStop2
	Set gradientStop3 = theGradient.GradientStops(3)
	gradientStop3.RampPoint = 40
	gradientStop3.MidPoint = 50
	gradientStop3.Color = newStop2Color
	gradientStop3.Opacity = 40

	' Modify newStop3
	Set gradientStop4 = theGradient.GradientStops(4)
	gradientStop4.RampPoint = 60
	gradientStop4.MidPoint = 50
	gradientStop4.Color = newStop1Color
	gradientStop4.Opacity = 40
	
	' Modify newStop4
	Set gradientStop5 = theGradient.GradientStops(5)
	gradientStop5.RampPoint = 80
	gradientStop5.MidPoint = 50
	gradientStop5.Color = newStop2Color
	gradientStop5.Opacity = 20

	' Modify the last gradient stop
	Set gradientStop6 = theGradient.GradientStops(6)
	gradientStop6.RampPoint = 100
	gradientStop6.Color = endColor
	
	' Construct an Illustrator.GradientColor object referring to the
	' newly created gradient
	Set createGradient = CreateObject("Illustrator.GradientColor")
	createGradient.Gradient = theGradient
End Function
