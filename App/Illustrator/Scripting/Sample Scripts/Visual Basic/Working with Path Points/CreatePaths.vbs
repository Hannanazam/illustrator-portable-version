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

' CreatePaths.vbs

' DESCRIPTION

' This example shows how to create a path of straight lines and
' how to create a path with smooth lines.
'
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")
Set docRef = appRef.Documents.Add

Rem Create a color to use for the paths

Set greenColor = CreateObject("Illustrator.CMYKColor")
greenColor.Black = 0
greenColor.Cyan = 81.96
greenColor.Magenta = 0
greenColor.Yellow = 100

Rem Create the first path from 4 straight lines

Set linePath = appRef.ActiveDocument.PathItems.Add
linePath.SetEntirePath Array(Array(100, 100), _
			Array(300, 300), _
			Array(100, 300), _
			Array(300, 100))
linePath.Closed = False
linePath.Stroked = True
linePath.StrokeWidth = 2
linePath.StrokeColor = greenColor
linePath.Filled = False
linePath.StrokeJoin = 3 ' aiRoundEndJoin

Rem Create the smooth path
greenColor.Yellow = 32

Set smoothPath = appRef.ActiveDocument.PathItems.Add

smoothPath.Closed = False
smoothPath.Stroked = True
smoothPath.StrokeWidth = 2
smoothPath.StrokeColor = greenColor
smoothPath.Filled = False

' Create the PathPoints that the smooth path is constructed from

Set newPathPoint = smoothPath.PathPoints.Add
newPathPoint.Anchor = Array(100, 100)
newPathPoint.LeftDirection = Array(100, 20)
newPathPoint.RightDirection = Array(100, 180)
newPathPoint.PointType = 2 ' aiSmooth

Set newPathPoint = smoothPath.PathPoints.Add
newPathPoint.Anchor = Array(300, 300)
newPathPoint.LeftDirection = Array(330, 250)
newPathPoint.RightDirection = Array(270, 350)
newPathPoint.PointType = 2 ' aiSmooth

Set newPathPoint = smoothPath.PathPoints.Add
newPathPoint.Anchor = Array(100, 300)
newPathPoint.LeftDirection = Array(130, 350)
newPathPoint.RightDirection = Array(70, 250)
newPathPoint.PointType = 2 ' aiSmooth

Set newPathPoint = smoothPath.PathPoints.Add
newPathPoint.Anchor = Array(300, 100)
newPathPoint.LeftDirection = Array(300, 180)
newPathPoint.RightDirection = Array(300, 20)
newPathPoint.PointType = 2 ' aiSmooth

