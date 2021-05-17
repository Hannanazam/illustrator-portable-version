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

' CreateArtboards.vbs

' DESCRIPTION

' Creates a new document containing 6 artboards, then adds art spread
' across the artboards.
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

' Create new document with 6 artboards
Set docRef = appRef.Documents.Add(2, 612.0, 792.0, 6, 1, 20.0, 3)

' Create rectangle
Set artboardRef = docRef.Artboards(1)
rect = artboardRef.ArtboardRect
Set rectPath = docRef.PathItems.Rectangle(rect(1) - 20, rect(0) + 20, 1200, 2350, false)
Set rectColor = CreateObject("Illustrator.CMYKColor")
rectColor.Cyan = 0
rectColor.Magenta = 0
rectColor.Yellow = 20
rectColor.Black = 0
rectPath.fillColor = rectColor

' Create first star
Set star1 = docRef.PathItems.Star(620, 1610, 200, 100, 7, false)
Set starColor = CreateObject("Illustrator.CMYKColor")
starColor.Cyan = 50
starColor.Magenta = 50
starColor.Yellow = 0
starColor.Black = 0
star1.fillColor = starColor

' Create second star
Set star2 = docRef.PathItems.Star(620, 795, 200, 100, 7, false)
starColor.Cyan = 0
starColor.Yellow = 50
star2.fillColor = starColor

' Create 50 random stars
for i = 1 To 50 
	Randomize ' Initialize random number generator
	centerX = (Rnd * 1200) + 40
	centerY = (Rnd * 2300) + 40
	Set randomStar = docRef.PathItems.Star(centerX, centerY, 50, 20, 9, false)

	' Create a random CMYK color and assign as the fill color
	starColor.Cyan = Rnd * 100
	starColor.Magenta = Rnd * 100
	starColor.Yellow = Rnd * 100
	randomStar.fillColor = starColor
Next