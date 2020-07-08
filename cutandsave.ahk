#SingleInstance force
#Include helpers-bmpcapture\saveCoordinatesAsBmp.ahk

folderPath := A_ScriptDir "\images\"
saveCoordinatesAsBmp(folderPath, "sample.bmp", 15, 400, 300, 200)
