; Misfit Model 3D - NSI Script (Installer Script)
;
; Copyright (c) 2004-2007 Kevin Worcester
;
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, 
; USA.
;
; See the COPYING file for full license text.


!define VERSION "1.3.8"
!define FILE_VERSION "1_3_8"

Name "Maverick Model 3D ${VERSION}"
OutFile "mm3d-${FILE_VERSION}-win32-installer.exe"

SetCompressor lzma
Icon src\pixmap\mm3dlogo-32x32.ico
UninstallIcon src\pixmap\mm3dlogo-32x32.ico
BrandingText "Maverick Model 3D"
CRCCheck on
XPStyle on

InstallDir "$PROGRAMFILES\Maverick Model 3D"
InstallDirRegKey HKCU "Software\MaverickModel\Maverick Model 3D" "INSTDIR"

LicenseData COPYING

Page license
Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "Maverick Model 3D"

    SectionIn RO

    ; Create file type
    WriteRegStr HKCR "MaverickModel.Mm3dModelFile" "" "MM3D Model File"
    WriteRegStr HKCR "MaverickModel.Mm3dModelFile\shell\open\command" "" '"$INSTDIR\mm3d.exe" "%1"'
    WriteRegStr HKCR "MaverickModel.Mm3dModelFile\shell\edit" "" "Edit Model"
    WriteRegStr HKCR "MaverickModel.Mm3dModelFile\shell\edit\command" "" '"$INSTDIR\mm3d.exe" "%1"'

    SetOutPath "$INSTDIR"
    WriteRegStr HKCU "Software\MaverickModel\Maverick Model 3D" "INSTDIR" "$INSTDIR"

    File COPYING
    File build/mingw32-x86/mm3d.exe
    File /r /x .svn /x *.htm /x Makefile /x Makefile.* /x *.ts doc imageformats i18n
    File dll\*.dll

    WriteUninstaller "Uninstall.exe"

SectionEnd

Section "Start Menu Shortcuts"

    ; SetShellVarContext all
    CreateDirectory "$SMPROGRAMS\Maverick Model 3D"
    CreateShortcut "$SMPROGRAMS\Maverick Model 3D\Maverick Model 3D.lnk"    "$INSTDIR\mm3d.exe"
    CreateShortcut "$SMPROGRAMS\Maverick Model 3D\Help Documentation.lnk" "$INSTDIR\doc\html\olh_index.html"
    CreateShortcut "$SMPROGRAMS\Maverick Model 3D\License.lnk"            "$INSTDIR\doc\html\olh_license.html"
    CreateShortcut "$SMPROGRAMS\Maverick Model 3D\MM3D Web Page.lnk"      "http://code.google.com/p/maverick-model-3d/"
    CreateShortcut "$SMPROGRAMS\Maverick Model 3D\Uninstall.lnk"          "$INSTDIR\Uninstall.exe"

SectionEnd

SubSection /e "Associate file types"

    Section "MM3D (Misfit Model 3D)"
        WriteRegStr HKCR ".mm3d" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "Cal3d"
        WriteRegStr HKCR ".cal" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "COB (Truespace)"
        WriteRegStr HKCR ".cob" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "DXF (Autocad DXF)"
        WriteRegStr HKCR ".dxf" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "LWO (Lightwave)"
        WriteRegStr HKCR ".lwo" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "MS3D (Milkshape)"
        WriteRegStr HKCR ".ms3d" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "MD2 (Quake)"
        WriteRegStr HKCR ".md2" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "MD3 (Quake)"
        WriteRegStr HKCR ".md3" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

    Section /o "OBJ (Alias Wavefront)"
        WriteRegStr HKCR ".obj" "" "MaverickModel.Mm3dModelFile"
    SectionEnd

SubSectionEnd

Section "Uninstall"

    Delete "$INSTDIR\mm3d.exe"
    Delete "$INSTDIR\mingw*.dll"
    Delete "$INSTDIR\qt*.dll"
    Delete "$INSTDIR\COPYING"
    Delete "$INSTDIR\Uninstall.exe"
    RMDir /r /REBOOTOK "$INSTDIR\doc"
    RMDir /r /REBOOTOK "$INSTDIR\i18n"
    RMDir /r /REBOOTOK "$INSTDIR\plugins"
    RMDir /r /REBOOTOK "$INSTDIR\userhome"
    RMDir /r /REBOOTOK "$INSTDIR\imageformats"
    RMDir $INSTDIR

    ; SetShellVarContext all
    RMDir /r /REBOOTOK "$SMPROGRAMS\Maverick Model 3D"

    DeleteRegKey HKCR "MaverickModel.Mm3dModelFile"

SectionEnd

