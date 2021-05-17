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

' ContactSheet.vbs

' DESCRIPTION

' This sample iterates through all images in a folder and 
' creates a named thumb nail for each of these images. The 
' number of rows and columns are hard-coded as the InputBox 
' VBScript function cannot be called within Illustrator.
' 
'*************************************************************

' Main Code - execution begins here

' Create the Application object and get a set of image files to work with
Set appRef = CreateObject("Illustrator.Application")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")

' Creating a folder browser in VBScript can be a problem (relying on either Windows API calls
' or use of ActiveX controls which may not be present on a given system). Instead, use
' Illustrator's built-in JavaScript to display a file browser. DoJavaScript can return a value,
' in this example it's the platform specific full path to the chosen folder.

doJavaScript = "var imagesFolder = Folder.selectDialog(""Select images folder:""); if (imagesFolder) folderPath = imagesFolder.fsName;"
imagesFolderPath = appRef.DoJavaScript(doJavaScript)

If (fileSystemObject.FolderExists(imagesFolderPath)) Then

	doJavaScript = "var numRows = prompt(""Enter number of rows:"", ""4""); if (numRows) numRows = parseInt(numRows); else numRows = 0;"
	numRows = appRef.DoJavaScript(doJavaScript)

	doJavaScript = "var numCols = prompt(""Enter number of columns:"", ""4""); if (numCols) numCols = parseInt(numCols); else numCols = 0;"
	numCols = appRef.DoJavaScript(doJavaScript)
	
	If (numRows > 0 And numCols > 0) Then
		imagesFolderPathTemp = Replace( imagesFolderPath, "\", "\\")
		doJavaScript = "alert(""Path to the test files used: " & CStr(imagesFolderPathTemp) & "    Number of rows: " & numRows & "  Number of columns: " & numCols & "  "")"
		appRef.DoJavaScript doJavaScript

		' Call function DoIt to iterate through all images in the folder 
		' and create the contact sheet
		Call DoIt(imagesFolderPath, CStr(numRows), CStr(numCols), 24, 22)
	Else
		doJavaScript = "alert(""Script requires at least 1 row and 1 column!"");"
		appRef.DoJavaScript doJavaScript
	End If

End If
'*************************************************************

' This routine iterates through all images in the folder and creates a named
' thumb nail for each of these

Sub DoIt(sDirName, verticalCount, horizontalCount, horizontalSpacing, verticalSpacing)
          
        ' Get the test files from the folder sDirName
        Set fso = CreateObject("Scripting.FileSystemObject")
	Set fldr = fso.GetFolder(sDirName)
	Set fls = fldr.Files
        numImages = verticalCount * horizontalCount
        Dim numFiles
        numFiles = fls.count
        Dim fileNames(5)
        
	
	' Add a new document
	Set docRef = appRef.Documents.Add
        
        ' Determine the dimensions of the document
        docPageOrigin = docRef.PageOrigin
        docLeft = docPageOrigin(0)
  	docTop = docRef.Height - docPageOrigin(1)
        printableWidth = docRef.Width - docLeft * 2
        printableHeight = docRef.Height - docPageOrigin(1) * 2
        
        ' Calculate the size of the individual grid spaces that the images will be placed in
        ' Dim gridWidth, gridHeight As Double
       
        gridWidth = (printableWidth + horizontalSpacing) / horizontalCount
        gridHeight = (printableHeight + verticalSpacing) / verticalCount
        
        ' Calculate the size of the individual images based on the printable document area,
        ' and on the number of images to be placed across and down the page
       
        imageWidth = gridWidth - horizontalSpacing
        imageHeight = gridHeight - verticalSpacing
           
        ' Normalize the image size so we end up with a square image
        
        If imageWidth < imageHeight Then
        	imageSize = imageWidth
                xAdjustment = 0
                yAdjustment = (imageHeight - imageWidth) / 2
        Else
                imageSize = imageHeight
                xAdjustment = (imageWidth - imageHeight) / 2
                yAdjustment = 0
        End If
            
        ' Calculate the bounding box for the first image to be placed
        ' Dim imageLeft, imageRight, imageTop, imageBottom As Double
        imageLeft = docLeft + xAdjustment
        imageRight = imageLeft + imageSize
            
        imageTop = docTop - yAdjustment
        imageBottom = imageTop - imageSize
            
        ' Iterate over the images in the list, positioning then one at a time
        ' After they are positioned, place a border around then to make them stand out better
        
        i = 1
        num = 0
        Dim aFile
        For each aFile in fls
		' Ignore system files.
		If not aFile.attributes and 4 Then
			num = num + 1
            		fileNames(num) = CStr(aFile)
		End If
        Next
        For j = 1 to numImages
        	
                Call AddRasterItemToPage(docRef,  fileNames(i), imageLeft, imageTop, (imageSize))
                    
                Call MakeFramingRectangle(docRef, imageLeft, imageTop, imageRight, imageBottom)
                Set fileObject = fso.getFile(fileNames(i))
                
                Call MakeTextLabel(docRef, CStr(fileObject.Name), imageLeft + imageSize / 2, imageBottom - 2)
                
                ' Calculate a new image position for the next iteration of the loop
                If j Mod horizontalCount <> 0 Then
                    ' Not at the end of row yet, move to next position in the row
                    imageLeft = imageLeft + gridWidth
                    imageRight = imageRight + gridWidth
                Else
                    ' If at the end of a row, first check to see if we have run out of rows
                    If j / horizontalCount >= verticalCount Then
                        Exit For
                    End If
                    
                    imageLeft = docLeft + xAdjustment
                    imageRight = imageLeft + imageSize
                        
                    imageTop = imageTop - gridHeight
                    imageBottom = imageBottom - gridHeight
                End If
                if (i = num) then
                    i = 1
                else
                    i = i + 1
                end if
        Next
            
        Set docRef = Nothing
        Set appRef = Nothing
End Sub

'*************************************************************

' This routine makes the labels for the thumbnails

Sub MakeTextLabel(aDocument, theText, xCenter, yVertPos)
                          
        ' Create the new text label
        Set aTextItem = aDocument.TextFrames.Add
        aTextItem.Contents = theText
        
        ' Calculate the final position and move the text label there
        aTextItem.Position = Array(xCenter - (aTextItem.Width / 2), yVertPos)
        
        ' Set the color of the text to default Illustrator color:
        ' No stroke & blank fill
        Set blackCMYK = CreateObject("Illustrator.CMYKColor")
        blackCMYK.Black = 100
        blackCMYK.Cyan = 0
        blackCMYK.Magenta = 0
        blackCMYK.Yellow = 0
        
        Set aTextRange = aTextItem.TextRange
        Set noStroke = CreateObject("Illustrator.NoColor")
        aTextRange.CharacterAttributes.StrokeColor = noStroke
        aTextRange.CharacterAttributes.FillColor = blackCMYK

End Sub

'*************************************************************

' This routine adds all images in the folder as RasterItems 
' to the Document

Sub AddRasterItemToPage(aDocument, theFile, imageLeft, imageTop, imageSize)
        
        ' Create a new raster item and link it to the image file
        Set aPlacedItem = aDocument.PlacedItems.Add
   	aPlacedItem.File = theFile
        
        ' Get the raster item dimensions
        itemWidth = aPlacedItem.Width
        itemHeight = aPlacedItem.Height
        
        ' Calculate the scale factors so the raster item can be fitted to the grid
        X_ScaleFactor = (imageSize / itemWidth) * 100
        Y_ScaleFactor = (imageSize / itemHeight) * 100
        
        ' Determine which of the scale factors to use
        If X_ScaleFactor < Y_ScaleFactor Then
            scaleFactor = X_ScaleFactor
        Else
            scaleFactor = Y_ScaleFactor
        End If
        
        ' Actually resize the raster item
        Call aPlacedItem.Resize(scaleFactor, scaleFactor)
                
        ' Get the new raster item dimensions
        itemWidth = aPlacedItem.Width
        itemHeight = aPlacedItem.Height
        
        ' Move the raster item to the middle of its grid cell
        aPlacedItem.Position = Array(imageLeft + (imageSize - itemWidth) / 2, _
                                     imageTop - (imageSize - itemHeight) / 2)
        
        Exit Sub

End Sub

'*************************************************************

Sub MakeFramingRectangle(aDocument, left, top, right, bottom)
        
        ' Add but not show the rectangle yet
       
        Set myPath = aDocument.PathItems.Rectangle(top, left, right - left, top - bottom)
        myPath.Hidden = True
        
        ' Make a black color
        Set blackCMYK = CreateObject("Illustrator.CMYKColor")
        
        blackCMYK.Black = 100
        blackCMYK.Cyan = 0
        blackCMYK.Magenta = 0
        blackCMYK.Yellow = 0
        
        ' Set the Color to 100% black
        myPath.StrokeColor = blackCMYK
        
        ' Make sure it is not filled
        myPath.Filled = False
        
        ' Show the resulting path
        myPath.Hidden = False
End Sub

'*************************************************************
