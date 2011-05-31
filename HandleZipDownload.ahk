path = %1%
EnvGet userDir, USERPROFILE
SplitPath path, file, , ext, fileNoExt 
destBaseDir = %userDir%\Downloads
destDir = %destBaseDir%\%fileNoExt%
if (FileExist(destDir)) {
  destDir = %destDir%%A_Now%
}

destPath = %destBaseDir%\%file%
if (FileExist(destPath)) {
    destPath = %destBaseDir%\%fileNoExt%%A_Now%.%ext%
}

FileCopy %path%, %destPath%
FileCreateDir %destDir%

RunWait "c:\Program Files\7-Zip\7z.exe" x %destPath%, %destDir%
FileRecycle %destPath%

Run %destDir%
