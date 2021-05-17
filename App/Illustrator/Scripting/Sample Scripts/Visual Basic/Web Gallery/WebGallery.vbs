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

' WebGallery.vbs

' DESCRIPTION

' This example demonstrates how a gallery can be created from 
' several Illustrator compatible files.
' The script first creates .ai and .pdf files then saves them 
' in a 'WebGallery' folder on the desktop, Illustrator 
' will then scan the WebGallery folder for files 
' and load them into Illustrator. Once in Illustrator the 
' documents are exported to JPEG and HTML format and an HTML file 
' is created which displays the files in a gallery format.
'
'*************************************************************
    Dim objApp
    Dim objExportOptions
    Dim objFileSys
    Dim objFile
    Dim objFiles
    Dim objFolder
    Dim objFolderGall
    Dim objFolderImg
    Dim objFolderPage
    Dim objFolderThumb
    Dim theFiles
    Dim f1 
    Dim myName
    Dim myPath
    Dim htmlFrame
    Dim htmlPage
    Dim htmlIndex
    Dim htmlIndexRow
    Dim htmlIndexRows
    Dim success
    Dim objFolderSamp
    Dim newItem
    Dim itemColor
    Dim pdfSvOpts
    Dim textRef
    
    const DESKTOP = &H0&
	set myShell = CreateObject("Shell.Application")
	set myDesktopFolder = myShell.Namespace(DESKTOP)
	set myDesktopFolderItem = myDesktopFolder.Self
	myDesktopPath = myDesktopFolderItem.Path
    
    Set objApp = CreateObject("Illustrator.Application")
    Set objExportOptions = CreateObject("Illustrator.ExportOptionsJPEG")
    Set objFileSys = CreateObject("Scripting.FileSystemObject")
    Set objFolder = objFileSys.GetFolder(myDesktopPath)
    Set pdfSvOpts = CreateObject("Illustrator.PDFSaveOptions")
    Set aiSvOpts = CreateObject("Illustrator.IllustratorSaveOptions")
    myMsg = "alert(""Creates 3 documents, saves the documents to a folder " & _
    "called \'WebGallery\' on the Desktop, exports each document as jpeg " & _
    "and html then creates the html gallery file - index.html."")"
    objApp.DoJavaScript myMsg
    
    ' check for folders and create if they don't exist
    If (objFileSys.FolderExists(objFolder & "\WebGallery")) Then
        Set objFolderSamp = objFileSys.GetFolder(objFolder & "\WebGallery")
	Else
        Set objFolderSamp = objFolder.SubFolders.Add("WebGallery")
    End If
    
	If (objFileSys.FolderExists(objFolderSamp & "\gallery")) Then
		Set objFolderGall = objFileSys.GetFolder(objFolderSamp & "\gallery")
	Else
		Set objFolderGall = objFolderSamp.SubFolders.Add("gallery")
	End If
	
	If (objFileSys.FolderExists(objFolderGall & "\images")) Then
		Set objFolderImg = objFileSys.GetFolder(objFolderGall & "\images")
	Else
		Set objFolderImg = objFolderGall.SubFolders.Add("images")
	End If

	If (objFileSys.FolderExists(objFolderGall & "\pages")) Then
		Set objFolderPage = objFileSys.GetFolder(objFolderGall & "\pages")
	Else
		Set objFolderPage = objFolderGall.SubFolders.Add("pages")
	End If
	
	If (objFileSys.FolderExists(objFolderGall & "\thumbnails")) Then
		Set objFolderThumb = objFileSys.GetFolder(objFolderGall & "\thumbnails")
	Else
		Set objFolderThumb = objFolderGall.SubFolders.Add("thumbnails")
	End If    
    
    'reserved characters (can't be in filenames processed)
    ' ^ (repeating index rows)
    ' ~ (image number)
    
    'create and save a document with a star in it
    Set docRef = objApp.Documents.Add
    Set newItem = docRef.PathItems.Star(300,400,100,50,5)
    Set itemColor = CreateObject("Illustrator.CMYKColor")
    itemColor.Magenta = 100
    newItem.FillColor = itemColor
    docRef.SaveAs (objFolderSamp & "\star.ai")

    'create and save a document with an ellipse in it
    Set docRef = objApp.Documents.Add
    Set newItem = docRef.PathItems.Ellipse(200,200,200,100)
    Set itemColor = CreateObject("Illustrator.CMYKColor")
    itemColor.Yellow = 100
    newItem.FillColor = itemColor
    docRef.SaveAs (objFolderSamp & "\ellipse.ai")

    'create and save a pdf file with some text
    Set docRef = objApp.Documents.Add
    Set textRef = docRef.TextFrames.Add()
    textRef.Contents = "Here is text from the PDF file."
    textRef.Top = 400
    textRef.Left = 100
    textRef.TextRange.CharacterAttributes.Size = 18
    objApp.Redraw
    pdfSvOpts.AcrobatLayers = true
    docRef.SaveAs objFolderSamp & "\text.pdf",pdfSvOpts

    'standard frameset html
    htmlFrame = ""
    htmlFrame = htmlFrame & "<HTML>" & vbCrLf
    htmlFrame = htmlFrame & "<HEAD>" & vbCrLf
    htmlFrame = htmlFrame & "<TITLE>Web Gallery</TITLE>" & vbCrLf
    htmlFrame = htmlFrame & "<META name=""generator"" content=""Adobe Illustrator Script-Generated Web Gallery"">" & vbCrLf
    htmlFrame = htmlFrame & "<META http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">" & vbCrLf
    htmlFrame = htmlFrame & "</HEAD>" & vbCrLf
    htmlFrame = htmlFrame & "<FRAMESET frameborder=1 cols=""20%,80%"">" & vbCrLf
    htmlFrame = htmlFrame & "<FRAME src=""index.html""  NAME=""LeftFrame""  scrolling=YES>" & vbCrLf
    htmlFrame = htmlFrame & "<FRAME src=""pages/1.html""  name=""RightFrame"" scrolling=YES>" & vbCrLf
    htmlFrame = htmlFrame & "<NOFRAMES>" & vbCrLf
    htmlFrame = htmlFrame & "<BODY>" & vbCrLf
    htmlFrame = htmlFrame & "Viewing this page requires a browser capable of displaying frames." & vbCrLf
    htmlFrame = htmlFrame & "</BODY>" & vbCrLf
    htmlFrame = htmlFrame & "</NOFRAMES>" & vbCrLf
    htmlFrame = htmlFrame & "</FRAMESET>" & vbCrLf
    htmlFrame = htmlFrame & "</HTML>" & vbCrLf
    'write frameset
    Set objFile = objFileSys.CreateTextFile(objFolderGall.Path & "\" & "frameset.html", True, False)
    objFile.Write htmlFrame
    objFile.Close
    
    'standard thumb index html
    htmlIndex = ""
    htmlIndex = htmlIndex & "<HTML>" & vbCrLf
    htmlIndex = htmlIndex & "<HEAD>" & vbCrLf
    htmlIndex = htmlIndex & "<TITLE>Web Gallery</TITLE>" & vbCrLf
    htmlIndex = htmlIndex & "<META name=""generator"" content=""Adobe Illustrator Script-Generated Web Gallery"">" & vbCrLf
    htmlIndex = htmlIndex & "<META http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">" & vbCrLf
    htmlIndex = htmlIndex & "</HEAD>" & vbCrLf
    htmlIndex = htmlIndex & "<BODY bgcolor=""#FFFFFF""  text=""#000000""  link=""#FF0000""  vlink=""#CCCC99""  alink=""#0000FF"" >" & vbCrLf
    htmlIndex = htmlIndex & "Thumbnails with hyperlinks" & vbCrLf
    htmlIndex = htmlIndex & "<P><TABLE border=""0"" cellspacing=""2"" cellpadding=""0"">" & vbCrLf
    htmlIndex = htmlIndex & "^" & vbCrLf
    'repeating row
    htmlIndexRow = ""
    htmlIndexRow = htmlIndexRow & "<TR><TD>" & vbCrLf
    htmlIndexRow = htmlIndexRow & "<P><A href=""pages/~.html"" target=""RightFrame""><IMG src=""thumbnails/~.jpg"" border=""0"" alt=1 align=""BOTTOM""></A><BR><BR>" & vbCrLf
    htmlIndexRow = htmlIndexRow & "<A href=""pages/~.html"" target=""RightFrame""><FONT size=""2""  face=""Arial"" >~.jpg</FONT></A><FONT size=""2""  face=""Arial"" ></FONT><BR><BR>" & vbCrLf
    htmlIndexRow = htmlIndexRow & "</TD></TR>" & vbCrLf
    '
    htmlIndex = htmlIndex & "</TABLE>" & vbCrLf
    htmlIndex = htmlIndex & "</BODY>" & vbCrLf
    htmlIndex = htmlIndex & "</HTML>" & vbCrLf
    'clear running string for final insertion
    htmlIndexRows = ""
    
    'standard image page html
    htmlPage = ""
    htmlPage = htmlPage & "</HTML>" & vbCrLf
    htmlPage = htmlPage & "<HTML>" & vbCrLf
    htmlPage = htmlPage & "<HEAD>" & vbCrLf
    htmlPage = htmlPage & "<TITLE>~</TITLE>" & vbCrLf
    htmlPage = htmlPage & "<META name=""generator"" content=""Adobe Illustrator Script-Generated Web Gallery"">" & vbCrLf
    htmlPage = htmlPage & "<META http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"">" & vbCrLf
    htmlPage = htmlPage & "</HEAD>" & vbCrLf
    htmlPage = htmlPage & "<BODY bgcolor=""#FFFFFF""  text=""#000000""  link=""#FF0000""  vlink=""#CCCC99""  alink=""#0000FF"" >" & vbCrLf
    htmlPage = htmlPage & "<TABLE border=""0"" cellpadding=""5"" cellspacing=""2"" width=""100%"" bgcolor=""#F0F0F0"" >" & vbCrLf
    htmlPage = htmlPage & "<TR>" & vbCrLf
    htmlPage = htmlPage & "<TD><FONT size=""2"" face=""Arial"" >Web Gallery / ~<BR><BR>" & Date & "</FONT>" & vbCrLf
    htmlPage = htmlPage & "</TD>" & vbCrLf
    htmlPage = htmlPage & "</TR>" & vbCrLf
    htmlPage = htmlPage & "</TABLE>" & vbCrLf
    htmlPage = htmlPage & "<P><CENTER><IMG src=""../images/~.jpg""  border=""0"" alt=1></CENTER></P>" & vbCrLf
    htmlPage = htmlPage & "</BODY>" & vbCrLf
    
    'loop thru all files that Illustrator can open
        Set theFiles = objFolderSamp.Files
        Dim i
        i = 0
        For Each f1 In theFiles
        i = i + 1
            myPath = f1.Path
            'open document in illustrator
            objApp.Open (myPath)
            
            If objApp.Documents.Count > 0 Then
                objExportOptions.HorizontalScale = 20
                objExportOptions.VerticalScale = 20
                objApp.Documents(1).Export objFolderThumb.Path & "\" & i & ".jpg", 1, objExportOptions
                objExportOptions.HorizontalScale = 75
                objExportOptions.VerticalScale = 75
                objApp.Documents(1).Export objFolderImg.Path & "\" & i & ".jpg", 1, objExportOptions
                objApp.Documents(1).Close (2) 'aiDoNotSaveChanges
                htmlIndexRows = htmlIndexRows & Replace(htmlIndexRow, "~", i)
                'and creating a page html file
                Set objFile = objFileSys.CreateTextFile(objFolderPage.Path & "\" & i & ".html", True, False)
                objFile.Write Replace(htmlPage, "~", i)
                objFile.Close
            End If
        Next
    
        'save thumbnail index
        htmlIndex = Replace(htmlIndex, "^", htmlIndexRows)
        Set objFile = objFileSys.CreateTextFile(objFolderGall.Path & "\" & "index.html", True, False)
        objFile.Write Replace(htmlIndex, "~", i)
        objFile.Close