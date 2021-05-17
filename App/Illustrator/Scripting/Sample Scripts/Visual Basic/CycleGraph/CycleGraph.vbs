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

' CycleGraph.vbs

' DESCRIPTION

' This sample accepts radius and step values from the developer
' and draws a cyclic graph figure from it. 
' To draw different objects try the values given in the 
' Examples1.ai file.
' 
'*************************************************************

' Create the general AI objects
Set appObj = CreateObject("Illustrator.Application")
Set docObj = appObj.Documents.Add

' Set the document properties
docObj.DefaultFilled = False
docObj.DefaultStroked = True
pathWidth = 1
docObj.DefaultStrokeWidth = pathWidth
pathOpacity = 100

Set groupObj = docObj.ActiveLayer.GroupItems.Add

myMsg = "alert(""Values used to draw the CycleGraph: Big Radius - 100, Small Radius - 35, Pen Distance - 30, Points/Cycle - 50, Cycles - 7. Change values in the script to draw different objects."")"

appObj.DoJavaScript myMsg

' Change values here to create different objects from Examples1.ai
bigRadius = 100
smallRadius = 35
penDistance = 30
stepsPerCycle = 50
cycles = 7

' OR
' Get the values from the user
' bigRadius = InputBox("Enter Big Radius", "CycleGraph", 100)
' smallRadius = InputBox("Enter Small Radius", "CycleGraph", 35)
' penDistance = InputBox("Enter Pen Distance", "CycleGraph", 30)
' stepsPerCycle = InputBox("Enter Points/Cycle", "CycleGraph", 50)
' cycles = InputBox("Enter Cycles", "CycleGraph", 7)

' set center of large circle at middle of page
docWidth = docObj.Width
docHeight = docObj.Height
BigX = docWidth / 2
BigY = docHeight / 2

' set small circle at top of large circle
SmallX = BigX
SmallY = BigY + bigRadius - smallRadius
radiusDifference = bigRadius - smallRadius

' initial angles
alphaAngle = 0
betaAngle = 0

' initialize pi value, step sizes
pi = 4 * Atn(1)
bigStepSize = (2 * pi) / stepsPerCycle
smallStepSize = bigStepSize * bigRadius / smallRadius

' initialize trailing point
prevX = SmallX
prevY = SmallY + penDistance
' for each step
For i = 0 To stepsPerCycle * cycles
    alphaAngle = alphaAngle + bigStepSize
    betaAngle = betaAngle - smallStepSize
    SmallX = BigX + (radiusDifference * Sin(alphaAngle))
    SmallY = BigY + (radiusDifference * Cos(alphaAngle))
    X = SmallX + (penDistance * Sin(betaAngle))
    Y = SmallY + (penDistance * Cos(betaAngle))
    CreateLine groupObj, prevX, prevY, X, Y, pathOpacity
    prevX = X
    prevY = Y
Next

' ****************************************************************

' Factor inToFactor into the array outArray

Private Function Factor(inToFactor, outArray())
	
	If (inToFactor > 1) Then
	    ReDim outArray(Sqr(inToFactor))
	    factorCount = 0
	    toFactor = inToFactor
	    ' Factor out all powers of 2
	    Do While ((toFactor Mod 2) = 0)
		outArray(factorCount) = 2
		factorCount = factorCount + 1
		toFactor = toFactor / 2
	    Loop
	    limit = toFactor
	    ' Walk through the odd numbers, testing each one
	    For testFactor = 3 To limit Step 2
		Do While ((toFactor Mod testFactor) = 0)
		    outArray(factorCount) = testFactor
		    factorCount = factorCount + 1
		    toFactor = toFactor / testFactor
		Loop
	    Next
	    ReDim Preserve outArray(factorCount - 1)
	    Factor = factorCount - 1
	Else
	    ' if number to factor is less than 1, return single factor 1
	    ReDim outArray(1)
	    factorCount = 0
	    outArray(0) = 1
	    Factor = 0
	End If
	
End Function

' ****************************************************************

' Calculate the cycles using the radii entered

Private Sub CalculateCycles
	
	' The required number of cycles (times around the Big circle) is
	' determined by the largest common multiple of the radii of the
	' Big and Small circles
	If (StrComp(bigRadiusText.Text, "") And StrComp(smallRadiusText.Text, "")) Then
	    toFactor1 = bigRadiusText.Text
	    toFactor2 = smallRadiusText.Text

	    ' Get the factors of each radius
	   
	    factors1 = Factor(toFactor1, factor1List)
	    factors2 = Factor(toFactor2, factor2List)

	    ' Cross off all factors held in common
	    For i = 0 To factors2
		For j = 0 To factors1
		    If (factor1List(j) = factor2List(i)) Then
			factor1List(j) = 1
			factor2List(i) = 1
		    End If
		Next
	    Next
	    cycles = 1
	    ' and multiply together all remaining factors in the small radius
	    For i = 0 To factors2
		cycles = cycles * factor2List(i)
	    Next
	    ' to determine the number of cycles
	    cyclesText.Text = cycles
	End If

End Sub

' ****************************************************************

' Create the path items

Private Sub CreateLine(inGroupItem, inStartX, inStartY, inEndX, inEndY, inOpacity)
	
	Set pathItem = inGroupItem.PathItems.Add
	pathItem.SetEntirePath Array(Array(inStartX, inStartY), Array(inEndX, inEndY))
	pathItem.Opacity = inOpacity

End Sub

' ****************************************************************

' Calculate the required number of cycles every time the Big radius is changed

Private Sub bigRadiusText_Change
	
	CalculateCycles

End Sub

' ****************************************************************

' Calculate the required number of cycles every time the Small radius is changed

Private Sub smallRadiusText_Change
	
	CalculateCycles

End Sub


