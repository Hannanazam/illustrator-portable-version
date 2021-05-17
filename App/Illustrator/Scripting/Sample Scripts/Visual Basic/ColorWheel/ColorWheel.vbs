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

' ColorWheel.vbs

' DESCRIPTION

' This example shows how to draw lines between points on a circle.
' It also demonstrates how to create RGB colors and apply them as 
' either a stroke color or a fill color. The default values draw
' the circle as shown in Result.ai.
' 
'*************************************************************

' NOTE: To change the size of the ColorWheel change the "myRadius" variable.
'       To change other values read comments inside the script.

' General Illustrator objects
Set aiApp = CreateObject("Illustrator.Application")

myMsg = "alert(""Number of Dot = 16  Width of Lines = 3  Opacity of Lines = 30. Please change values in script to use different values"")"
aiApp.DoJavaScript myMsg

' Change values here to draw the colorwheel with different values
myNumberOfDots = 16
myPathWidth = 3
myPathOpacity = 30

' OR
' Input the values from the user
' myNumberOfDots = InputBox("Enter Number of Dots on the Circle", "ColorWheel", 16)
' myPathWidth = InputBox("Enter width of Lines", "ColorWheel", 3)
' myPathOpacity = InputBox("Enter Opacity of Lines", "ColorWheel",30)

myRadius = 60.0
myCenterX = 300.0
myCenterY = 300.0

' Get the user supplied number of dots on the circle
pi = 4.0 * Atn(1)
pi2 = pi * 2.0
myStepSize = (2.0 * pi) / myNumberOfDots

Set aiDoc = aiApp.Documents.Add(aiDocumentRGBColor)
Set aiGroup = aiDoc.GroupItems.Add

' Generate a list (an array) of positions for the dots
' The array will have (x,y) in each of its entries
Dim myList()
ReDim myList(myNumberOfDots, 2)

myAngle = 0
For myIndex = 0 To (myNumberOfDots - 1)
    myList(myIndex, 0) = myCenterX + (myRadius * Cos(myAngle))
    myList(myIndex, 1) = myCenterY + (myRadius * Sin(myAngle))
    myAngle = myAngle + myStepSize
Next

halfNumberOfDots = myNumberOfDots / 2

' Draw lines between each dot
myAngle = 0

' Set the graphic state of the document to match as many of the properties that you
' want new graphic to be created with as possible
aiDoc.DefaultFilled = False
aiDoc.DefaultStroked = True
aiDoc.DefaultStrokeWidth = CDbl(myPathWidth)

Dim StartP(1)
Dim EndP(1)

For myIndex = 1 To myNumberOfDots
    Set myColor = GetColor(myAngle)
    aiDoc.DefaultStrokeColor = myColor
    myAngle = myAngle + myStepSize

    StartP(0) = myList(myIndex - 1, 0)
    StartP(1) = myList(myIndex - 1, 1)
    myEndNodeIndex = myIndex + 1
    
    For myInnerIndex = 2 To halfNumberOfDots
        If (myEndNodeIndex > myNumberOfDots) Then
            myEndNodeIndex = myEndNodeIndex - myNumberOfDots
        End If
        EndP(0) = myList(myEndNodeIndex - 1, 0)
        EndP(1) = myList(myEndNodeIndex - 1, 1)
        myEndNodeIndex = myEndNodeIndex + 1
        
        CreateLine aiGroup, (StartP(0)), (StartP(1)), (EndP(0)), (EndP(1)), CDbl(myPathOpacity)
    Next
Next

' Draw the little dots
myAngle = 0

' Set the graphic state of the document to match as many of the properties that you
' want new graphic to be created with as possible
aiDoc.DefaultFilled = True
aiDoc.DefaultStroked = False
For myIndex = 0 To (myNumberOfDots - 1)
    aiDoc.DefaultFillColor = GetColor(myAngle)
    
    Set aiPath = aiGroup.PathItems.Ellipse(myList(myIndex, 1) + 3, myList(myIndex, 0) - 3, 6, 6)
    aiPath.Opacity = 85
    myAngle = myAngle + myStepSize
Next

aiApp.Redraw

' ***************************************************

Function GetColor(inAngle)

	myPI34 = (3 * pi) / 4
	myPI64 = (6 * pi) / 4

	' Calculate Red
	If ((inAngle < myPI34) Or (inAngle > myPI64)) Then
	    If (inAngle > myPI64) Then
		dist = inAngle - myPI64
	    Else
		dist = inAngle
	    End If
	    myRed = (1 - (dist / myPI34)) * 255
	Else
	    myRed = 0
	End If

	' Calculate Green
	dist = Abs(inAngle - myPI34)
	If (dist < myPI34) Then
	    myGreen = (1 - (dist / myPI34)) * 255
	Else
	    myGreen = 0
	End If

	' Calculate Blue
	dist = Abs(inAngle - myPI64)
	If (dist < myPI34) Then
	    myBlue = (1 - (dist / myPI34)) * 255
	Else
	    myBlue = 0
	End If

	Set theRGBValue = CreateObject("Illustrator.RGBColor")

	theRGBValue.Red = myRed
	theRGBValue.Green = myGreen
	theRGBValue.Blue = myBlue

	Set GetColor = theRGBValue
End Function


' ***************************************************

Private Sub CreateLine(inGroupItem, inStartX, inStartY, inEndX, inEndY, inOpacity)
	
	Set aiPath = inGroupItem.PathItems.Add

	aiPath.SetEntirePath Array( Array(inStartX, inStartY), Array(inEndX, inEndY) )

	' If you want to modify the LeftDirection or the RightDirection point of the individual
	' segments in the path you will have to create the path segment as in the following code:
	' CreatePathPoint aiPath, inStartX, inStartY
	' CreatePathPoint aiPath, inEndX, inEndY

	aiPath.Opacity = inOpacity

End Sub


' ***************************************************

Private Sub CreatePathPoint(inPathItem, inX, inY)
	Set aiPathPoint = inPathItem.PathPoints.Add

	aiPathPoint.Anchor = Array(inX, inY)
	aiPathPoint.LeftDirection = Array(inX, inY)
	aiPathPoint.RightDirection = Array(inX, inY)
	aiPathPoint.PointType = 1
End Sub
