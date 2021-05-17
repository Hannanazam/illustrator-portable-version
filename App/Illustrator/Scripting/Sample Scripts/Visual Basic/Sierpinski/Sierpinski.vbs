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

' Sierpinski.vbs

' DESCRIPTION

' This example creates a Sierpinski fractal.
' The fractal pattern is created by taking each straight line segment
'
'              ---------------
'
' and replacing it with a set of 5 segments (each of length equal to
' 1/3 the length of the original segment
'
'                   -----
'                   |   |
'                   |   |
'              -----     -----
'
' The result file Sample.ai is given in this sample folder.
'
'*************************************************************

Dim appObj
Dim docObj
Dim groupObj
Dim swatchSelection
Dim selection
Dim swatchCount
Dim documentSwatches
Dim inputBoxMessage
Dim i
Dim Points
Dim Level
Dim NewPoints
Dim myMsg

Set appObj = CreateObject("Illustrator.Application")
Set docObj = appObj.Documents.Add
Set groupObj = docObj.GroupItems.Add

Rem set default properties for the lines that we are going to create
docObj.DefaultFilled = False
docObj.DefaultStroked = True
docObj.DefaultStrokeWidth = 1
swatchCount = docObj.Swatches.Count

If (swatchCount > 0) Then
    
    Rem choose a default swatch
    docObj.DefaultStrokeColor = docObj.Swatches(4).Color
    
Else
    ' Use a specific color
    Set blackColorRef = CreateObject("Illustrator.CMYKColor")
    blackColorRef.Black = 100
    docObj.DefaultStrokeColor = blackColorRef
End If

Rem create the initial lines
Dim PointList()
Points = 4
ReDim PointList(Points, 1)

PointList(0, 0) = 100
PointList(0, 1) = 100
PointList(1, 0) = 400
PointList(1, 1) = 100
PointList(2, 0) = 400
PointList(2, 1) = 400
PointList(3, 0) = 100
PointList(3, 1) = 400
PointList(4, 0) = 100
PointList(4, 1) = 100

Dim NewPointList()
Dim StartX
Dim StartY
Dim EndX
Dim EndY
Dim DeltaX
Dim DeltaY
Dim Delta

For Level = 0 To 2
    ' delete the previous levels display
    If (Not (groupObj Is Nothing)) Then
        docObj.GroupItems.Remove groupObj
        Set groupObj = Nothing
    End If
    
    Rem create a group that will hold this level of the fractal
    Set groupObj = docObj.GroupItems.Add
    ReDim NewPointList(5 * (Points + 1) + 1, 2)
    NewPoints = 0
    ' replace each straight line segment with the 5 segments
    ' of the replicator
    For i = 0 To Points - 1
        StartX = PointList(i, 0)
        StartY = PointList(i, 1)
        EndX = PointList(i + 1, 0)
        EndY = PointList(i + 1, 1)
        DeltaX = EndX - StartX
        Deltay = EndY - StartY
        NewPointList(NewPoints, 0) = StartX
        NewPointList(NewPoints, 1) = StartY
        NewPoints = NewPoints + 1
        If (0 = Deltay) Then
            Delta = DeltaX / 3
            NewPointList(NewPoints, 0) = StartX + Delta
            NewPointList(NewPoints, 1) = StartY
            NewPoints = NewPoints + 1
            NewPointList(NewPoints, 0) = StartX + Delta
            NewPointList(NewPoints, 1) = StartY + Delta
            NewPoints = NewPoints + 1
            NewPointList(NewPoints, 0) = StartX + (2 * Delta)
            NewPointList(NewPoints, 1) = StartY + Delta
            NewPoints = NewPoints + 1
            NewPointList(NewPoints, 0) = StartX + (2 * Delta)
            NewPointList(NewPoints, 1) = StartY
            NewPoints = NewPoints + 1
        Else
            Delta = Deltay / 3
            NewPointList(NewPoints, 0) = StartX
            NewPointList(NewPoints, 1) = StartY + Delta
            NewPoints = NewPoints + 1
            NewPointList(NewPoints, 0) = StartX - Delta
            NewPointList(NewPoints, 1) = StartY + Delta
            NewPoints = NewPoints + 1
            NewPointList(NewPoints, 0) = StartX - Delta
            NewPointList(NewPoints, 1) = StartY + (2 * Delta)
            NewPoints = NewPoints + 1
            NewPointList(NewPoints, 0) = StartX
            NewPointList(NewPoints, 1) = StartY + (2 * Delta)
            NewPoints = NewPoints + 1
       End If
    Next
    
    NewPointList(NewPoints, 0) = EndX
    NewPointList(NewPoints, 1) = EndY
    Points = NewPoints
    ReDim PointList(Points, 2)
    
    For i = 0 To Points
        PointList(i, 0) = NewPointList(i, 0)
        PointList(i, 1) = NewPointList(i, 1)
    Next
    
    For i = 0 To Points - 1
        CreateLine groupObj, PointList(i, 0), PointList(i, 1), PointList(i + 1, 0), PointList(i + 1, 1), 100
    Next
Next

'*************************************************************
	
Rem a utility routine for creating lines with an start and an end point

Private Sub CreateLine(inGroupItem, inStartX, inStartY, inEndX, inEndY, inOpacity)
	Dim pathItem
	Set pathItem = inGroupItem.PathItems.Add
	pathItem.SetEntirePath Array(Array(inStartX, inStartY), Array(inEndX, inEndY))
	pathItem.Opacity = inOpacity

End Sub

'*************************************************************