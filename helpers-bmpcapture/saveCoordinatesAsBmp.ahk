#Include helpers-bmpcapture\Gdip_All.ahk
#Include helpers-win\win-utils.ahk

saveCoordinatesAsBmp(folderPath, fileName, x, y, w, h) {
  filePathWithFileName := folderPath fileName                   

  pToken := Gdip_Startup()

  coordinates = %x%|%y%|%w%|%h%
  snap := Gdip_BitmapFromScreen(coordinates)

  saveToFileResult := Gdip_SaveBitmapToFile(snap, filePathWithFileName)

  disposeImageResult := Gdip_DisposeImage(snap)

  results := { "folderPath": folderPath, "fileName": fileName, "snap": snap, "saveToFileResult": saveToFileResult, "disposeImageResult": disposeImageResult  }
  showStatus(results)   
}

showStatus(results) {
  houveAlgumErroAoSalvarArquivo := results["saveToFileResult"] + results["disposeImageResult"]
  if (!houveAlgumErroAoSalvarArquivo) {
      showSomeStatus("""" results["fileName"] """ was successfully saved :)", 5)
  } else {
    if(results["saveToFileResult"]) {
      saveToFileResultErrorDescriptionMap := { -1: "Extension supplied is not a supported file format", -2: "Could not get a list of encoders on system", -3: "Could not find matching encoder for specified file format", -4: "Could not get WideChar name of output file", -5: "Could not save file to disk" }
      saveToFileResultErrorDescription := saveToFileResultErrorDescriptionMap[results["saveToFileResult"]]
      msg := "error while saving """ results["fileName"] """: " saveToFileResultErrorDescription
      showSomeStatus(msg, 15)
    }
    else if(results["disposeImageResult"]) {
      msg := """" results["fileName"] """ was saved | although there was an error at disposing the image"
      showSomeStatus(msg, 15)
    }
  }
}


