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

' ExportFlashAnimation.vbs

' DESCRIPTION

' This script will create 15 layers which are exported as frames 
' into a .swf.
' You have to have a Shockwave/Flash player installed to view the animation.
' 
' This sample consists of a single filled path item whose size and 
' opacity are animated to create a motion sequence, and leverages 
' the capability of Illustrators Flash export to create frames from
' graphic elements defined in individual layers.
' 
'*************************************************************

' Create the general AI objects
Set appRef = CreateObject("Illustrator.Application")
Set wshShell = CreateObject("WScript.Shell")
exportFolder = wshShell.SpecialFolders("Desktop")
Set sourceDoc = appRef.Documents.Add(2)
sourceDoc.Layers(1).Name = "Frame 1"

Set starItem = sourceDoc.PathItems.Star(300, 400, 50, 20, 4)

Set starColor = CreateObject("Illustrator.RGBColor")
starColor.Red = 255
starItem.FillColor = starColor

'Dim dupItem As Illustrator.PathItem
frameCount = 15

'The original path item (starItem) defined in the "Frame 1" layer
'is duplicated to a new named layer. The effect of the Resize and
'Opacity property changes is to gradually upscale the item while
'making it progressively more transparent.

For ctr = 2 To frameCount
	Set newLayer = sourceDoc.Layers.Add
	newLayer.Name = "Frame " + CStr(ctr)
	Set dupItem = starItem.Duplicate
	dupItem.MoveToBeginning newLayer
	dupItem.Resize ctr * 100, ctr * 100, true, true, true, true, 1, 6 '(ScaleX,ScaleY,ChangePositions,ChangeFillPatterns,ChangeFillGradients,
                                                                        'ChangeStrokePatterns,ChangeLineWidths,ScaleAbout AiTransformCenter)
	dupItem.Opacity = 100 - (100 / frameCount) * ctr
Next

'Flash export options are setup to export each layer as a separate
'compressed animation frame, and to specify a loopoing playback at
'the rate of 15 frames per second

Set exportOpts = CreateObject("Illustrator.ExportOptionsFlash")
exportOpts.ExportStyle = 2 'aiLayersAsFrames
exportOpts.FrameRate = frameCount
exportOpts.Looping = True
exportOpts.ImageFormat = 2 'aiLossy
exportOpts.ArtClipping = 1 'aiOutputArtBounds
exportOpts.Replacing = 1 'aiSaveChanges

'The .swf file is saved to the Illustrator directory
swfFile = exportFolder & "\Animation.swf"
sourceDoc.Export swfFile, 7, exportOpts

