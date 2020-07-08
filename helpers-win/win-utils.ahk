showSomeStatus(text, seconds) {
  new StatusGui(text, seconds)
}

class StatusGui {
  __New(text, seconds = 5) {
      this.text := text
      this.seconds := seconds * 1000
      this.timer := ObjBindMethod(this, "internalCloseGui")
      timer := this.timer
      SetTimer % timer, % this.seconds    
      this.internalDrawGui(text)
  }  
  
  internalCloseGui() {
    Gui, Destroy
    timer := this.timer
    SetTimer % timer, Off
  }

  internalDrawGui(text) {
    textheight := 15
    textwidth := 500
    marginX := 0
    marginy := 0
    winbarHeight := 20
    winXAdjust := 25
    dx := A_ScreenWidth - textwidth - 2 * marginX - winXAdjust
    dy := A_ScreenHeight - textheight - 24 - 2 * marginY - winbarHeight

    Gui, Destroy

    Gui, +AlwaysOnTop
    Gui, Add, Text,text W%textwidth% H%textheight% 0x2, %text%
    Gui, -Caption
    Gui, Show,, feedback
    WinMove, feedback, , dx, dy
  }
}

