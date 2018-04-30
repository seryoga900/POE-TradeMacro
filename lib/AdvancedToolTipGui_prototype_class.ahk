; AutoHotkey
; Language:       	English 
; Authors:		Eruyome |	https://github.com/eruyome
;
; Class Function:
;	Advanced ToolTip for table-like contents using a GUI.

#SingleInstance,force
#Include, %A_ScriptDir%\DebugPrintArray.ahk

GroupAdd, PoEWindowGrp, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile.exe
GroupAdd, PoEWindowGrp, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExileSteam.exe
GroupAdd, PoEWindowGrp, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_x64.exe
GroupAdd, PoEWindowGrp, Path of Exile ahk_class POEWindowClass ahk_exe PathOfExile_x64Steam.exe

/*
	init tooltip gui, don't do this for every tooltip call
*/
AdvTT := new AdvancedToolTipGui("", "", "", "", "Verdana", 8)

Return

^XButton1::
	


	item := {}
	item.name := "Gloom Bite"
	item.basetype := "Ceremonial Axe"
	item.lvl := 61
	item.baselvl := 51
	item.msockets := 3
	item.dps := {}
	item.dps.ele := 36.0
	item.dps.phys := 147.0
	item.dps.total := 183.0
	item.dps.chaos := 0.0
	item.dps.qphys := 162.3
	item.dps.qtotal := 198.3

	/*
		create tooltip gui
	*/
	AdvTT.CreateGui()

	/*
		add tables/content to the tooltip
	*/
	;-------------- table 01 ------------------------------------------------------------
	table01 := new AdvTT.Table(AdvTT.getF(), AdvTT.getFS(), -1, "", "FEFEFE", false)

	table01.AddCell(1, 1, item.name, "", "", "", true, "", "")
	table01.AddCell(2, 1, item.basetype, "", "", "", true, "", "")

	;-------------- table 02 ------------------------------------------------------------
	table02 := new AdvTT.Table(AdvTT.getF(), AdvTT.getFS(), -1, "", "FEFEFE", true)

	table02.AddCell(1, 1, "Item Level:", "", "", "", true, "", "")
	table02.AddCell(1, 2,  item.lvl, "right", "", "", true, "", "")
	table02.AddCell(1, 3,  "", "", "", "", true, "", "")
	table02.AddCell(1, 4,  "Base Level:", "", "bold", "", true, "", "")
	table02.AddCell(1, 5,  item.baselvl, "right", "", "", true, "", "")

	table02.AddCell(2, 1,  "Max Sockets:", "", "", "", true, "", "")
	table02.AddCell(2, 2,  item.msockets, "right", "", "", true, "", "")
	table02.AddCell(2, 3,  "", "", "", "", true, "", "")
	table02.AddCell(2, 4,  "")
	table02.AddCell(2, 5,  "")
		
	table02.AddCell(3, 1,  "Ele DPS:", "", "", "", true, "", "")
	table02.AddCell(3, 2,  item.dps.ele, "right", "", "", true, "", "")
	table02.AddCell(3, 3,  "", "", "", "", true, "", "")
	table02.AddCell(3, 4,  "Chaos DPS:", "", "italic", "", true, "", "")
	table02.AddCell(3, 5,  item.dps.chaos, "right", "", "", true, "", "")

	table02.AddCell(4, 1,  "Phys DPS:", "", "", "", true, "", "Consolas")
	table02.AddCell(4, 2,  item.dps.phys, "right", "", "", true, "", "")
	table02.AddCell(4, 3,  "", "", "", "", true, "", "")
	table02.AddCell(4, 4,  "Q20 Phys:", "", "underline", "", true, "", "")
	table02.AddCell(4, 5,  item.dps.qphys, "right", "", "", true, "", "")

	table02.AddCell(5, 1,  "Total DPS:", "", "", "", true, "", "")
	table02.AddCell(5, 2,  item.dps.total, "right", "", "", true, "", "")
	table02.AddCell(5, 3,  "", "", "", "", true, "", "")
	table02.AddCell(5, 4,  "Q20 Total:", "", "strike", "", true, "", "")
	table02.AddCell(5, 5,  item.dps.qtotal, "right", "", "", true, "", "")

	;-------------- table 03 ------------------------------------------------------------
	table03 := new AdvTT.Table(AdvTT.getF(), AdvTT.getFS(), -1, "", "FEFEFE", true)

	table03.AddCell(1, 1,  "Mod", "", "bold", "26292d", true, "", "")
	table03.AddCell(1, 2,  "Tier/Affix", "", "bold", "26292d", true, "", "")
	table03.AddCell(1, 3,  "Stuff", "", "bold", "26292d", true, "", "")

	table03.AddCell(2, 1,  "+20 to Maximum Life", "", "", "", true, "", "")
	table03.AddCell(2, 2,  "test", "", "", "", "", false, "", "")
	table03.AddSubCell(2, 2, 1,  "6", "", "", "", true)
	table03.AddSubCell(2, 2, 2,  "P", "center", "", "red", true, "", "", true)
	table03.AddSubCell(2, 2, 3,  "S", "center", "", "blue", true, "", "", true)
	table03.AddCell(2, 3,  "text", "", "", "", true, "", "")

	;-------------- table 04 ------------------------------------------------------------
	table04 := new AdvTT.Table(AdvTT.getF(), AdvTT.getFS(), -1, "", "", false)

	multilineText := "Multiline Text (no auto breaks):`n`n"
	multilineText .= "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ut ex arcu.`nMaecenas elit dui, ullamcorper tempus cursus eu, gravida eu lacus, `nMaecenas elit dui, ullamcorper tempus cursus eu, gravida eu lacus."
	table04.AddCell(1, 1,  multilineText, "", "", "", true, "", "")

	/*
		(optional) add all tables to an array to handle table drawing via loops, instead of simply calling
		".drawTable()" for every single table.
	*/
	tooltipContents := []
	tooltipContents.push({"table": table01, "drawTableParams" : []})
	tooltipContents.push({"table": table02, "drawTableParams" : []})
	tooltipContents.push({"table": table03, "drawTableParams" : [5, 10]})
	tooltipContents.push({"table": table04, "drawTableParams" : [5, 10]})

	/*
		draw tables onto the tooltip gui, function not part of this class
	*/
	drawAllToolTipTables(tooltipContents)

	; alternative:
	; table01.drawTable()
	; table02.drawTable()
	; table03.drawTable(5, 10)
	; table04.drawTable(5, 10)

	/*
		auto-size, position and show the tooltip
		(or set absolute position)
	*/
	;AdvTT.ShowToolTip(true, 1000, 100)
	AdvTT.ShowToolTip()
Return

drawAllToolTipTables(tooltipContents) {
	For key, val in tooltipContents {
		p := val.drawTableParams
		
		If (key = 1) {
			If (not p[2]) {
				p[2] := 5
				p[1] := p[1] ? p[1] : 5
			}
		}
		
		If (p.length() = 0) {
			val.table.drawTable()
		}
		Else If (p.length() = 1) {
			val.table.drawTable(p[1])
		} 
		Else If (p.length() = 2) {
			val.table.drawTable(p[1], p[2])
		}
		Else If (p.length() = 3) {
			val.table.drawTable(p[1], p[2], p[3])
		}
		Else If (p.length() = 4) {
			val.table.drawTable(p[1], p[2], p[3], p[4])
		}
	}
}

GuiClose:
ExitApp

class AdvancedToolTipGui
{
	static guiName := "AdvancedToolTipGuiWindow"

	__New(params*)
	{
		c := params.MaxIndex()
		If (c > 15) {
			throw "Too many parameters passed to AdvancedToolTipGui.New()"
		}
		
		; set defaults
		this.borderColor		:= (params[1] = "" or not params[1]) ? "a65b24" : params[1]
		this.backgroundColor	:= (params[2] = "" or not params[2]) ? "000000" : params[2]
		this.borderWidth		:= (params[3] = "" or not params[3]) ? 2 : params[3]
		this.opacity			:= (params[4] = "" or not params[4]) ? 215 : params[4]
		this.defTTFont			:= (params[5] = "" or not params[5]) ? "Consolas" : params[5]
		this.defTTFontSize		:= (params[6] = "" or not params[6]) ? 9 : params[6]
		this.timeoutInterval	:= (params[7] = "" or not params[7]) ? 1000 : params[7]
		this.mouseMoveThreshold	:= (params[8] = "" or not params[8]) ? 50 : params[8]
		this.useToolTipTimeout	:= (params[9] = "" or not params[9]) ? false : params[9]
		this.toolTipTimeoutSec	:= (params[10] = "" or not params[10]) ? 15 : params[10]		
		this.xPos				:= (params[11] = "" or not params[11]) ? 0 : params[11]
		this.yPos				:= (params[12] = "" or not params[12]) ? 0 : params[12]
		this.usedFixedCoords	:= (params[13] = "" or not params[13]) ? false : params[13]
		this.appAHKGroup		:= (not params[14]) ? "PoEWindowGrp" : params[14]
		this.appAHKID			:= (not params[15]) ? "" : params[15]
		
		this.fixedXPos			:= this.xPos
		this.fixedYPos			:= this.yPos
		this.guiMargin			:= this.borderWidth + 5
		this.parentWindow		:= 
		this.startMouseXPos		:=
		this.startMouseYPos		:=
		this.timer			:= ObjBindMethod(this, "destroyToolTip")
		this.toolTipTimeout		:= 0		
	}
	
	CreateGui()
	{
		GuiMargin := this.guiMargin
		GuiName := this.guiName
		Gui, %GuiName%:Destroy

		Gui, %GuiName%:New, +AlwaysOnTop +ToolWindow +hwndTTHWnd
		Gui, %GuiName%:Margin, %GuiMargin%, %GuiMargin%
		
		Gui, %GuiName%:Color, 000000

		DetectHiddenWindows, On
		; make window invisible
		WinSet, Transparent, 0, ahk_id %TTHWnd%
		
		; maximize the window before removing the borders/title bar etc
		; otherwise there will be some remnants visible that aren't really part of the gui
		; "maximize" option or "WinMaximize" don't work because they activate/focus the window.
		Gui, %GuiName%:Show, AutoSize NoActivate, CustomTooltip

		; maximize window using PostMessage / WinMove
		;PostMessage, 0x112, 0xF030,,, ahk_id %TTHWnd%
		WinMove, ahk_id %TTHWnd%, , 0, 0 , A_ScreenWidth, A_ScreenHeight

		; PostMessage would require some delay
		;Sleep, 10

		; make tooltip clickthrough and remove borders
		WinSet, ExStyle, +0x20, ahk_id %TTHWnd% ; 0x20 = WS_EX_CLICKTHROUGH
		WinSet, Style, -0xC00000, ahk_id %TTHWnd%

		this.parentWindow := TTHwnd
	}
	
	SetToolTipSizeAndPosition() {
		xPos := this.xPos
		yPos := this.yPos
		GuiName := this.guiName
		TTHwnd := this.parentWindow
		
		; restore window to actual size
		Gui, %GuiName%:Show, x%xPos% y%yPos% AutoSize Restore NoActivate, CustomTooltip

		; add a border to the window, has to be done after auto-resizing the window
		WinGetPos, TTX, TTY, TTW, TTH, ahk_id %TTHwnd%

		this.GuiAddBorder(this.borderColor, this.borderWidth, TTW, TTH, GuiName, TTHWnd)
		this.CheckAndCorrectWindowPosition(GuiName, TTHwnd, TTX, TTY, TTW, TTH)
	}
	
	CheckAndCorrectWindowPosition(GuiName, TTHwnd, TTX, TTY, TTW, TTH) {
		appAHKGroup	:= this.appAHKGroup
		
		If (appAHKGroup) {
			WinGet, applicationHwnd, ID, ahk_group %appAHKGroup%
		} Else If (this.appAHKID) {
			applicationHwnd := this.appAHKID
		}		
		this.applicationHwnd := applicationHwnd
		
		; get monitor info
		monitors := MDMF_Enum()
		; get the display monitor that has the largest area of intersection with the specified window
		; returned 0 = no intersection/no specified window
		appOnMonitorHwnd := MDMF_FromHWND(applicationHwnd)
		
		boundingRectangle := {}
		For, key, monitor in monitors {
			useMonitor := false
			isOnMonitorX := (this.xPos >= monitor.Left) and (this.xPos <= monitor.Right)
			isOnMonitorY := (this.yPos >= monitor.top) and (this.yPos <= monitor.bottom)
			isOnMonitor  := isOnMonitorX and isOnMonitorY
			useAppTarget := ((appAHKGroup or applicationHwnd) and appOnMonitorHwnd)
			
			If (not this.useFixedCoords) {
				; if we don't use fixed coords, use the monitor where the application is on to draw the tooltip, no matter where the mouse is,
				; unless there is no application specified
				If ((appOnMonitorHwnd = monitor.handle) or (not useAppTarget and isOnMonitor)) {
					useMonitor := true					
				}
			}
			Else {				
				If (isOnMonitor) {
					useMonitor := true
				}
			}
			
			If (useMonitor) {
				boundingRectangle.top := monitor.top
				boundingRectangle.left := monitor.left
				boundingRectangle.bottom := monitor.bottom
				boundingRectangle.right := monitor.right
				boundingRectangle.h := monitor.name
			}		
		}
		
		; cursor size
		SysGet, CursorW, 13
		SysGet, CursorH, 14
		
		; position the tooltip beneath the cursor and try to center it horizontally
		originalCursorY := TTY
		TTY := TTY + CursorH + 3
		TTX := TTX - (Round(TTW / 2) - Round(CursorW / 2))	
		
		nTTX := TTX
		nTTY := TTY

		; negative left = left non-primary monitor
		If (boundingRectangle.left < 0) {
			xOffset := boundingRectangle.right + (TTX + TTW)
			If (xOffset > boundingRectangle.right) {
				nTTX := TTX - xOffset
			}
			If (TTX < boundingRectangle.left) {
				nTTX := boundingRectangle.left
			}
		}
		Else {
			xOffset := boundingRectangle.right - (TTX + TTW)
			If (xOffset < boundingRectangle.left) {
				nTTX := TTX + xOffset
			}
			If (TTX < boundingRectangle.left) {
				nTTX := boundingRectangle.left
			}
		}
		
		yOffset := boundingRectangle.bottom - (TTY + TTH)
		yOffsetTop := originalCursorY - TTH - 3
		If (yOffset < boundingRectangle.top) {			
			If (yOffsetTop >= boundingRectangle.top) {
				; move tooltip over cursor
				nTTY := yOffsetTop
			}
			Else {
				nTTY := TTY + yOffset
			}
		}
		If (TTY < boundingRectangle.top) {
			nTTY := boundingRectangle.top
		}
		
		If (nTTX != TTX or nTTY != TTY) {
			this.xPos := nTTX
			this.yPos := nTTY
			WinMove, ahk_id %TTHwnd%, , nTTX, nTTY
		} Else {
			this.xPos := TTX
			this.yPos := TTY
			WinMove, ahk_id %TTHwnd%, , TTX, TTY
		}
	}
	
	ShowToolTip(useFixedCoords = false, x = false, y = false) {
		CoordMode, Mouse, Screen
		MouseGetPos, startMouseXPos, startMouseYPos
		
		If ((useFixedCoords and x and y) or this.useFixedCoords) {
			this.useFixedCoords := true
			this.xPos := x ? x : this.fixedXPos
			this.yPos := y ? y : this.fixedYPos
		} Else If (x and y) {
			this.xPos := x === false ? 0 : x
			this.yPos := y === false ? 0 : y
		} Else {
			this.xPos := startMouseXPos
			this.yPos := startMouseYPos
		}
		
		Opacity := this.opacity
		TTHwnd := this.parentWindow		
		
		this.SetToolTipSizeAndPosition()
		
		; make window visible again
		WinSet, Transparent, %Opacity%, ahk_id %TTHWnd%
		
		; set tooltip timeout/timer
		this.startMouseXPos := startMouseXPos
		this.startMouseYPos := startMouseYPos
		this.startTimer()
	}

	startTimer() {
		timer := this.timer
		this.toolTipTimeout := 0
		SetTimer % timer, % this.timeoutInterval
	}
	/*
	stopTimer() {
		timer := this.timer
		SetTimer % timer, Off
	}
	*/
	destroyToolTip(instantly = false) {
		GuiName := this.guiName
		timer := this.timer		
		this.toolTipTimeout += (this.timeoutInterval / 1000)
		
		CoordMode, Mouse, Screen
		If (not instantly) {			
			MouseGetPos, CurrX, CurrY
			MouseMoved := (CurrX - this.startMouseXPos) ** 2 + (CurrY - this.startMouseYPos) ** 2 > this.mouseMoveThreshold ** 2
		}
		
		If (instantly or MouseMoved or (this.useToolTipTimeout and (this.tooltipTimeout >= this.toolTipTimeoutSec))) {
			Gui, %GuiName%:Destroy
			SetTimer % timer, Off
		}
	}
	
	MonitorInfo() {		
		SysGet, iMonCnt, MonitorCount
		
		aDictMonInfo := []
		Loop, %iMonCnt%
		{
			vDictMonInfo := {}

			SysGet, Mon, Monitor, %A_Index%

			vDictMonInfo.Insert("Left", MonLeft)
			vDictMonInfo.Insert("Right", MonRight)
			vDictMonInfo.Insert("Top", MonTop)
			vDictMonInfo.Insert("Bottom", MonBottom)
			vDictMonInfo.Insert("W", Abs(MonRight-MonLeft))
			vDictMonInfo.Insert("H", Abs(MonTop-MonBottom))
			vDictMonInfo.Insert("Num", A_Index)
			aDictMonInfo.Insert(vDictMonInfo)
		}
		
		return aDictMonInfo
	}
		
	getF() {
		return this.defTTFont
	}
	getFS() {
		return this.defTTFontSize
	}
	getHwnd() {
		return this.parentWindow
	}
	
	GuiAddBorder(Color, Width, pW, pH, GuiName = "", parentHwnd = "") {
		; -------------------------------------------------------------------------------------------------------------------------------
		; Color        -  border color as used with the 'Gui, Color, ...' command, must be a "string"
		; Width        -  the width of the border in pixels
		; pW, pH	   -  the width and height of the parent window.
		; GuiName	   -  the name of the parent window.
		; parentHwnd   -  the ahk_id of the parent window.
		;                 You should not pass other control options!
		; -------------------------------------------------------------------------------------------------------------------------------
		LFW := WinExist() ; save the last-found window, if any
		If (not GuiName and parentHwnd) {		
			DefGui := A_DefaultGui ; save the current default GUI		
		}

		Try {
			Gui, %GuiName%Border:New, +Parent%parentHwnd% +LastFound -Caption +hwndBorderW
			Gui, %GuiName%Border:Color, %Color%
			X1 := Width, X2 := pW - Width, Y1 := Width, Y2 := pH - Width
			WinSet, Region, 0-0 %pW%-0 %pW%-%pH% 0-%pH% 0-0   %X1%-%Y1% %X2%-%Y1% %X2%-%Y2% %X1%-%Y2% %X1%-%Y1%, ahk_id %BorderW%
			Gui, %GuiName%Border:Show, x0 y0 w%pW% h%pH%
			createdBorder := true
		} Catch e {
			Msgbox Creating ToolTip border failed because target window doesn't exist.
		}
		
		If (not GuiName and parentHwnd) {	
			Gui, %DefGui%:Default ; restore the default Gui
		}
		
		If (LFW) ; restore the last-found window, if any
			WinExist(LFW)
	}
	
	class Table {
		/*
			Table class

			guiDefFont	: default font used by the entire tooltip gui
			guiDefFontSize	: default font size used by the entire tooltip gui
			fontSize		: table-wide font size, if "-1" the tooltip gui default font size is being used
			font			: table-wide font, if "-1" the tooltip gui default font is being used
			color		: table-wide font color in hex or a valid name like "white"
			grid			: show table grid/borders
			assocVar		: 
		*/
		
		__New(guiDefFont, guiDefFontSize, fontSize = -1, font = -1, color = "Default", grid = false, assocVar = "") {
			class_parent := SubStr(this.__class,1,InStr(this.__class,".",0,-1)-1)
			
			this.guiName := %class_parent%.guiName ":"

			this.assocVar := "v" assocVar
			this.assocHwnd := "hwnd" assocVar "H"
			
			this.defaultFont := guiDefFont
			this.defaultFontSize := guiDefFontSize		
			this.font := (font >= 0 or StrLen(font)) ? font : this.defaultFont
			this.fontSize := (fontSize >= 0) ? fontSize : this.defaultFontSize
			this.fColor := color
			
			this.rows := []
			this.maxColumns := 0
			this.showGrid := grid
		}

		AddCell(rowIndex, cellIndex, value, alignment = "left", fontOptions = "", bgColor = "Trans", isSpacingCell = false, fColor = "", font = "") {					
			/*
				rowIndex		:
				cellIndex		:
				measurementObj	: object with saved text measurements, will only be used when the default fons and fontsize are used for text output, should be global in the calling script
				value		: cell contents
				alignment		: horizontal text-alignment (left, right, center)
				fontOptions	: additional options like "bold", "italic", "strikethrough", "underline"
				bgColor		: background color in hex or a valid name like "red"
				isSpacingCell	: if the cell is empty, make it a fontSize * 4 pixel width spacing cell
				fColor		: font color in hex or a valid name like "white"
				font			: font family
			*/
			
			If (not this.rows[rowIndex]) {
				this.rows[rowIndex] := []
			}
			
			this.rows[rowIndex][cellIndex] := {}
			this.rows[rowIndex][cellIndex].subCells := []
			this.rows[rowIndex][cellIndex].font := StrLen(font) ? font : this.font
			
			this.rows[rowIndex][cellIndex].alignment := StrLen(alignment) ? alignment : "left"		
			this.rows[rowIndex][cellIndex].color := fColor
			this.rows[rowIndex][cellIndex].bgColor := bgColor
			this.rows[rowIndex][cellIndex].fontOptions := fontOptions
			this.maxColumns := cellIndex >= this.maxColumns ? cellIndex : cellIndex > this.maxColumns
			
			/*
				text width and height measuring for single and multiline text (no auto line breaks)
			*/
			newValue := ""
			width := 0
			height := 0
			value := Trim(value)

			Loop, Parse, value, `n, `r
			{
				string := A_LoopField			
				StringReplace, string, string, `r,, All
				StringReplace, string, string, `n,, All
				
				emptyLine := false
				If (not StrLen(string)) {
					string := "A"				; don't prevent emtpy lines, just having a linebreak will break the text measuring 
					emptyLine := true				
				}
				string := " " Trim(string) " "	; add spaces as table padding
				
				If (emptyLine) {
					newValue .= "`n"
				} Else {
					newValue .= string "`n"
				}		
				
				If (StrLen(string)) {
					size := this.Font_DrawText(string, "", "s" this.fontSize ", " this.rows[rowIndex][cellIndex].font, "CALCRECT SINGLELINE NOCLIP")
					width := width > size.W ? width : size.W
					height += size.H
				}
			}
			
			this.rows[rowIndex][cellIndex].value := newValue
			this.rows[rowIndex][cellIndex].height := height
			this.rows[rowIndex][cellIndex].width := (not StrLen(value) and isSpacingCell) ? this.fontSize *4 : width
		}
		
		AddSubCell(rI, cI, sCI, value, alignment = "left", fontOptions = "", bgColor = "Trans", isSpacingCell = false, fColor = "", font = "", noSpacing = false) {
			/*
				rowIndex		:
				cellIndex		:
				measurementObj	: object with saved text measurements, will only be used when the default fons and fontsize are used for text output, should be global in the calling script
				value		: cell contents
				alignment		: horizontal text-alignment (left, right, center)
				fontOptions	: additional options like "bold", "italic", "strikethrough", "underline"
				bgColor		: background color in hex or a valid name like "red"
				isSpacingCell	: if the cell is empty, make it a 10 pixel width spacing cell
				fColor		: font color in hex or a valid name like "white"
				font			: font family
				noSpacing		: don't add table padding (left/right)
			*/
			
			If (not this.rows[rI]) {
				this.rows[rI] := []
			}
			
			If (not this.rows[rI][cI].haskey("value")) {
				this.AddCell(rI, cI)			
			}
			this.rows[rI][cI].value := " " ; empty cell, only show subcell contents		
			this.rows[rI][cI].subCells[sCI] := {}
			this.rows[rI][cI].subCells[sCI].value := noSpacing ? value : " " value "  " ; add spaces as table padding
			
			; font priority: subcell > cell > table
			this.rows[rI][cI].subCells[sCI].font := StrLen(font) ? font : this.rows[rI][cI]
			If (not StrLen(this.rows[rI][cI].subCells[sCI].font)) {
				this.rows[rI][cI].subCells[sCI].font := this.font
			}		
			
			this.rows[rI][cI].subCells[sCI].alignment := StrLen(alignment) ? alignment : "left"		
			this.rows[rI][cI].subCells[sCI].color := fColor
			this.rows[rI][cI].subCells[sCI].bgColor := bgColor
			this.rows[rI][cI].subCells[sCI].fontOptions := fontOptions

			/*
				text width and height measuring for singleline text
			*/
			measuringText := noSpacing ? this.rows[rI][cI].subCells[sCI].value " " : this.rows[rI][cI].subCells[sCI].value
			size := this.Font_DrawText(measuringText, "", "s" this.fontSize ", " this.rows[rI][cI].subCells[sCI].font, "CALCRECT SINGLELINE NOCLIP")
			this.rows[rI][cI].subCells[sCI].width := (not StrLen(value) and isSpacingCell) ? 10 : size.W
			this.rows[rI][cI].subCells[sCI].height := size.H

			For key, subcell in this.rows[rI][cI].subCells {
				If (key = 1) {
					this.rows[rI][cI].width := 0
				}
				this.rows[rI][cI].width += subcell.width
			}
		}
		
		DrawTable(guiMargin = 5, topMargin = 0, tableXPos = "", tableYPos = "") {	
			/*
				guiMargin	: left and right table margins
				topMargin	: top table margin
				tableXPos	: table x coordinate origin, don't use for relative positioning
				tableYPos	: table y coordinate origin, don't use for relative positioning
			*/
			
			columnWidths := []		
			rowHeights := []		
			Loop, % this.maxColumns {
				w := 0
				i := A_Index
				For key, row in this.rows {
					w := (w >= row[i].width) ? w : row[i].width
				}
				columnWidths[i] := w
			}
			For key, row in this.rows {
				h := 0
				For k, cell in row {
					h := (h >= cell.height) ? h : cell.height
				}
				rowHeights.push(h)
			}
			
			guiName := this.GuiName
			guiFontOptions := " s" this.fontSize
			guiFontOptions .= StrLen(this.fColor) ? " c" this.fColor : ""
			Gui, %guiName%Font, %guiFontOptions%, % this.font 
			
			shiftY := 0
			If (not StrLen(tableXPos)) {
				If (this.showGrid) {
					tableXPos := "x" guiMargin + 5
				} Else {
					tableXPos := "x" guiMargin
				}
			}
			tableYPos := not StrLen(tableYPos) ? "y+" guiMargin + topMargin : tableYPos + topMargin
			
			For key, row in this.rows {
				height := rowHeights[key] + Round((this.fontSize / 3))
				shiftY := height - 1
				
				; shiftY needs to be changed further if the previous row has a different height than the current one
				If (key >= 2 and rowHeights[key] != rowHeights[key-1]) {
					shiftY := shiftY - (rowHeights[key] - rowHeights[key-1])
				}
				
				For k, cell in row {
					width := columnWidths[k] + Round(this.fontSize * 2.3)
					this.DrawCell(cell, guiName, k, key, guiFontOptions, tableXPos, tableYPos, shiftY, width, height)				
				}
			}		
		}
		
		DrawCell(cell, guiName, k, key, guiFontOptions, tableXPos, tableYPos, shiftY, width, height, recurse = false) {
			/*
				cell			: cell object
				guiName		: name of the tooltip gui
				k			: cell index
				key			: row index
				guiFontOptions	: font options like font, size, style and color
				tableXPos		: table x coordinate origin
				tableYPos		: table y coordinate origin
				shiftY		: cell y shift (used to overlap cell borders, creating a 1px border)
				width		: cell width in px
				height		: cell height in px
				recurse		: cells use this option to recursively draw subcells
			*/
			
			addedBackground := false
			
			; loop to overlay an empty cell over all subcells (easier positioning of the following column in the row)
			Loop, 2 {
				If (k = 1 and key = 1) {
					yPos := " " tableYPos
					yPosProgress := yPos
				} Else If (k = 1) {
					yPos := " yp+" shiftY
					yPosProgress := yPos
				} Else {
					yPos := (recurse and tableYPos != "null") ? " yp+" tableYPos : " yp+0"
					yPos := A_Index = 2 ? " ys+0" : yPos
					
					If (recurse) {
						yPosProgress := (tableYPos != "null") ? " yp+" tableYPos + 1 : " yp+1"				
					} Else {
						yPosProgress := "yp+0"
					}				
				}

				If (k = 1 and not recurse) {
					xPos := " " tableXPos
					xPos := A_Index = 2 ? xPos : xPos
				} Else {
					xPos := (recurse and tableXPos != "null") ? tableXPos : " x+-1"
					xPos := A_Index = 2 ? " xs+0" : xPos
				}
				
				If (A_Index = 2) {
					cell.bgColor := "Trans"
				}
				
				options := ""
				options .= StrLen(cell.color) ? " c" cell.color : ""				
				options .= " w" width 
				options .= " h" height
				
				If (cell.subCells.length() and not recurse and not A_Index = 2) {
					options .= " Section"
				}

				If (cell.bgColor = "Trans") {
					options .= " BackGroundTrans"
				} Else If (StrLen(cell.bgColor)) {
					options .= " BackGroundTrans"
					bgColor := cell.bgColor
					Gui, %guiName%Add, Progress, w%width% h%height% %yPosProgress% %xPos% Background%bgColor%		
					options .= recurse ? " xp yp-1" : " xp yp"
					addedBackground := true
				}
				
				If (not addedBackground) {
					options .= yPos
					options .= xPos
				}
				
				If (this.showGrid and not recurse) {
					options .= " +Border"
				}

				If (cell.fColor or cell.font or cell.fontOptions) {
					elementFontOptions := StrLen(cell.fColor) ? " c" cell.fColor : ""
					elementFontOptions .= StrLen(cell.fontOptions) ? " " cell.fontOptions : ""
					elementFont := StrLen(cell.font) ? cell.font : this.font
					Gui, %guiName%Font, %elementFontOptions%, % elementFont 
				}
				
				If (RegExMatch(cell.alignment, "i)left|center|right")) {
					options .= " " cell.alignment
				}
				
				Gui, %guiName%Add, Text, %options%, % cell.value
				If (cell.fColor or cell.font) {
					Gui, %guiName%Font, %guiFontOptions% " norm", % this.font 
				}
				
				If (cell.subCells.length() and not recurse and A_Index = 1) {
					For j, subcell in cell.subcells {
						_recurse := true
						_width := subcell.width
						_xPosShift := (j = 1) ? " xs+0" : "null"
						_yPosShift := (j = 1) ? 1 : "null"		
						_height := height - 4
						this.DrawCell(subcell, guiName, 0, 0, guiFontOptions, _xPosShift, _yPosShift, shiftY, _width, _height, _recurse)	
					}
				}
				
				If (not cell.subCells.length()) {
					Break
				}
			}
		}
		
		/*
		Original script by majkinetor.
		Fixed by Eruyome.
		
		https://github.com/majkinetor/mm-autohotkey/blob/master/Font/Font.ahk
		
		 Function:  CreateFont
					Creates the font and optinally, sets it for the control.
		 Parameters:
					hCtrl - Handle of the control. If omitted, function will create font and return its handle.
					Font  - AHK font defintion ("s10 italic, Courier New"). If you already have created font, pass its handle here.
					bRedraw	  - If this parameter is TRUE, the control redraws itself. By default 1.
		 Returns:	
					Font handle.
		 */
		CreateFont(HCtrl="", Font="", BRedraw=1) {
			static WM_SETFONT := 0x30

			;if Font is not integer
			if (not RegExMatch(Trim(Font), "^\d+$"))
			{
				StringSplit, Font, Font, `,,%A_Space%%A_Tab%
				fontStyle := Font1, fontFace := Font2

			  ;parse font 
				italic      := InStr(Font1, "italic")    ?  1    :  0 
				underline   := InStr(Font1, "underline") ?  1    :  0 
				strikeout   := InStr(Font1, "strikeout") ?  1    :  0 
				weight      := InStr(Font1, "bold")      ? 700   : 400 

			  ;height 

				RegExMatch(Font1, "(?<=[S|s])(\d{1,2})(?=[ ,]*)", height) 
				ifEqual, height,, SetEnv, height, 10
				RegRead, LogPixels, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontDPI, LogPixels 
				height := -DllCall("MulDiv", "int", Height, "int", LogPixels, "int", 72) 
			
				IfEqual, Font2,,SetEnv Font2, MS Sans Serif
			 ;create font 
				hFont   := DllCall("CreateFont", "int",  height, "int",  0, "int",  0, "int", 0
								  ,"int",  weight,   "Uint", italic,   "Uint", underline 
								  ,"uint", strikeOut, "Uint", nCharSet, "Uint", 0, "Uint", 0, "Uint", 0, "Uint", 0, "str", Font2, "Uint")
			} else hFont := Font
			ifNotEqual, HCtrl,,SendMessage, WM_SETFONT, hFont, BRedraw,,ahk_id %HCtrl%
			return hFont
		}

		/*
		Original script by majkinetor.
		Fixed by Eruyome.
		
		https://github.com/majkinetor/mm-autohotkey/blob/master/Font/Font.ahk
		
		 Function: DrawText
				   Draws text using specified font on device context or calculates width and height of the text.
		 Parameters: 
				Text	- Text to be drawn or measured. 
				DC		- Device context to use. If omitted, function will use Desktop's DC.
				Font	- If string, font description in AHK syntax. If number, font handle. If omitted, uses the system font to calculate text metrics.
				Flags	- Drawing/Calculating flags. Space separated combination of flag names. For the description of the flags see <http://msdn.microsoft.com/en-us/library/ms901121.aspx>.
				Rect	- Bounding rectangle. Space separated list of left,top,right,bottom coordinates. 
						  Width could also be used with CALCRECT WORDBREAK style to calculate word-wrapped height of the text given its width.
						
		 Flags:
				CALCRECT, BOTTOM, CALCRECT, CENTER, VCENTER, TABSTOP, SINGLELINE, RIGHT, NOPREFIX, NOCLIP, INTERNAL, EXPANDTABS, AHKSIZE.
		 Returns:
				Decimal number. Width "." Height of text. If AHKSIZE flag is set, the size will be returned as w%w% h%h%
		 */    
		Font_DrawText(Text, DC="", Font="", Flags="", Rect="") {
			static DT_AHKSIZE=0, DT_CALCRECT=0x400, DT_WORDBREAK=0x10, DT_BOTTOM=0x8, DT_CENTER=0x1, DT_VCENTER=0x4, DT_TABSTOP=0x80, DT_SINGLELINE=0x20, DT_RIGHT=0x2, DT_NOPREFIX=0x800, DT_NOCLIP=0x100, DT_INTERNAL=0x1000, DT_EXPANDTABS=0x40

			hFlag := (Rect = "") ? DT_NOCLIP : 0

			StringSplit, Rect, Rect, %A_Space%
			loop, parse, Flags, %A_Space%
				ifEqual, A_LoopField,,continue
				else hFlag |= DT_%A_LoopField%

			if (RegExMatch(Trim(Font), "^\d+$")) {
				hFont := Font, bUserHandle := 1
			}
			else if (Font != "") {
				hFont := this.CreateFont( "", Font)
			}
			else {
				hFlag |= DT_INTERNAL
			}

			IfEqual, hDC,,SetEnv, hDC, % DllCall("GetDC", "Uint", 0, "Uint")
			ifNotEqual, hFont,, SetEnv, hOldFont, % DllCall("SelectObject", "Uint", hDC, "Uint", hFont)

			VarSetCapacity(RECT, 16)
			if (Rect0 != 0)
				loop, 4
					NumPut(Rect%A_Index%, RECT, (A_Index-1)*4)

			h := DllCall("DrawTextA", "Uint", hDC, "Str", Text, "int", StrLen(Text), "uint", &RECT, "uint", hFlag)

			;clean
			ifNotEqual, hOldFont,,DllCall("SelectObject", "Uint", hDC, "Uint", hOldFont) 
			ifNotEqual, bUserHandle, 1, DllCall("DeleteObject", "Uint", hFont)
			ifNotEqual, DC,,DllCall("ReleaseDC", "Uint", 0, "Uint", hDC) 
			
			w	:= NumGet(RECT, 8, "Int")
			
			return InStr(Flags, "AHKSIZE") ? "w" w " h" h : { "W" : w, "H": h }
		} 
	}
}


; ======================================================================================================================
; Multiple Display Monitors Functions -> msdn.microsoft.com/en-us/library/dd145072(v=vs.85).aspx =======================
; ======================================================================================================================
; Enumerates display monitors and returns an object containing the properties of all monitors or the specified monitor.
; ======================================================================================================================
MDMF_Enum(HMON := "") {
   Static EnumProc := RegisterCallback("MDMF_EnumProc")	   
   Static Monitors := {}
   If (HMON = "") ; new enumeration
	  Monitors := {}
   If (Monitors.MaxIndex() = "") ; enumerate
	  If !DllCall("User32.dll\EnumDisplayMonitors", "Ptr", 0, "Ptr", 0, "Ptr", EnumProc, "Ptr", &Monitors, "UInt")
		 Return False
   Return (HMON = "") ? Monitors : Monitors.HasKey(HMON) ? Monitors[HMON] : False
}
; ======================================================================================================================
;  Callback function that is called by the MDMF_Enum function.
; ======================================================================================================================
MDMF_EnumProc(HMON, HDC, PRECT, ObjectAddr) {
   Monitors := Object(ObjectAddr)
   Monitors[HMON] := MDMF_GetInfo(HMON)
   Return True
}
; ======================================================================================================================
;  Retrieves the display monitor that has the largest area of intersection with a specified window.
; ======================================================================================================================
MDMF_FromHWND(HWND) {
   Return DllCall("User32.dll\MonitorFromWindow", "Ptr", HWND, "UInt", 0, "UPtr")
}
; ======================================================================================================================
; Retrieves the display monitor that contains a specified point.
; If either X or Y is empty, the function will use the current cursor position for this value.
; ======================================================================================================================
MDMF_FromPoint(X := "", Y := "") {
   VarSetCapacity(PT, 8, 0)
   If (X = "") || (Y = "") {
	  DllCall("User32.dll\GetCursorPos", "Ptr", &PT)
	  If (X = "")
		 X := NumGet(PT, 0, "Int")
	  If (Y = "")
		 Y := NumGet(PT, 4, "Int")
   }
   Return DllCall("User32.dll\MonitorFromPoint", "Int64", (X & 0xFFFFFFFF) | (Y << 32), "UInt", 0, "UPtr")
}
; ======================================================================================================================
; Retrieves the display monitor that has the largest area of intersection with a specified rectangle.
; Parameters are consistent with the common AHK definition of a rectangle, which is X, Y, W, H instead of
; Left, Top, Right, Bottom.
; ======================================================================================================================
MDMF_FromRect(X, Y, W, H) {
   VarSetCapacity(RC, 16, 0)
   NumPut(X, RC, 0, "Int"), NumPut(Y, RC, 4, Int), NumPut(X + W, RC, 8, "Int"), NumPut(Y + H, RC, 12, "Int")
   Return DllCall("User32.dll\MonitorFromRect", "Ptr", &RC, "UInt", 0, "UPtr")
}
; ======================================================================================================================
; Retrieves information about a display monitor.
; ======================================================================================================================
MDMF_GetInfo(HMON) {
   NumPut(VarSetCapacity(MIEX, 40 + (32 << !!A_IsUnicode)), MIEX, 0, "UInt")
   If DllCall("User32.dll\GetMonitorInfo", "Ptr", HMON, "Ptr", &MIEX) {
	  MonName := StrGet(&MIEX + 40, 32)    ; CCHDEVICENAME = 32
	  MonNum := RegExReplace(MonName, ".*(\d+)$", "$1")
	  obj := {Name:      (Name := StrGet(&MIEX + 40, 32))
			, Handle:	 HMON
			, Num:       RegExReplace(Name, ".*(\d+)$", "$1")
			, Left:      NumGet(MIEX, 4, "Int")    ; display rectangle
			, Top:       NumGet(MIEX, 8, "Int")    ; "
			, Right:     NumGet(MIEX, 12, "Int")   ; "
			, Bottom:    NumGet(MIEX, 16, "Int")   ; "
			;, WALeft:    NumGet(MIEX, 20, "Int")   ; work area
			;, WATop:     NumGet(MIEX, 24, "Int")   ; "
			;, WARight:   NumGet(MIEX, 28, "Int")   ; "
			;, WABottom:  NumGet(MIEX, 32, "Int")   ; "
			, Primary:   NumGet(MIEX, 36, "UInt")} ; contains a non-zero value for the primary monitor.
		
		obj.W := Abs(obj.Right - obj.Left)   ; "
		obj.H := Abs(obj.Top - obj.Bottom)   ; "	
		return obj
   }
   Return False
}