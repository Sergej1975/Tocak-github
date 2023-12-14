#include "Appevent.ch"
#include "DLL.CH"
#include "Common.ch"

PROCEDURE Main
LOCAL nEvent, mp1, mp2, oXbp
LOCAL oIco
LOCAL lPimpIt := IF(PCOUNT()>0,.T.,.F.)
LOCAL nIcoX := 64
LOCAL nIcoY := 64
LOCAL aPos  := {0,0}
LOCAL aSize :=SetAppWindow():CurrentSize()

   SetColor("N/W")
   CLS

   oIco := XbpIcon():new():create()
   oIco:load( NIL, 1000 ,nIcoX,nIcoY)

   aPos[1] := (aSize[1]/2)-(nIcoX  )-50
   aPos[2] := (aSize[2]/2)-(nIcoY/2)

   // Ersten Pushbutton erzeugen, Position bei :create() angeben
   oXbp := XbpPushButton():new()
   oXbp:caption := oIco // "A"
   oXbp:create( , , aPos, {nIcoX,nIcoY} )
   oXbp:activate:= {|| QOut( "Pushbutton A" ) }
   IF lPimpIt
      MachKreise(oXbp)
   ENDIF

   aPos[1] := (aSize[1]/2)+50

   // Zweiten Pushbutton erzeugen, Position bei :new() angeben
   oXbp := XbpPushButton():new( , , aPos, {nIcoX,nIcoY} )
   oXbp:caption := oIco // "B"
   oXbp:create()
   oXbp:activate:= {|| QOut( "Pushbutton B" ) }
   IF lPimpIt
      MachKreise(oXbp)
   ENDIF

   // Event loop = Programmsteuerung
   nEvent := 0
   DO WHILE nEvent <> xbeP_Close
      nEvent := AppEvent( @mp1, @mp2, @oXbp )
      DO CASE
         CASE nEvent == xbeP_Keyboard .AND. mp1 == xbeK_ALT_F4
            EXIT
      OTHERWISE
         oXbp:HandleEvent( nEvent, mp1, mp2 )
      ENDCASE
   ENDDO

RETURN

*-------------------------------------------------------------------------*

#define SM_CXBORDER     5
#define SM_CYBORDER     6
#define SM_CXDLGFRAME   7
#define SM_CYDLGFRAME   8

PROCEDURE MachKreise(oObj)
LOCAL hHwnd
LOCAL aTmp
LOCAL nLeftRect
LOCAL nTopRect
LOCAL nRightRect
LOCAL nBottomRect
LOCAL hRgn
LOCAL nFrame := GetSystemMetrics(SM_CYBORDER)

   hHwnd := oObj:GetHwnd()
   aTmp  := oObj:Currentsize()

   nLeftRect   := 0       +nFrame
   nTopRect    := aTmp[2] -nFrame
   nRightRect  := aTmp[1] -nFrame
   nBottomRect := 0       +nFrame

   // now construct a Region and call its API function
   //
   hRgn := CreateEllipticRgn(nLeftRect,nTopRect,nRightRect,nBottomRect)
   SetWindowRgn(hHwnd,hRgn,.t.)

   // clean up
   //
   IF .NOT. EMPTY(hRgn)
       DeleteObject(hRgn)
   ENDIF

RETURN

DLLFUNCTION GetSystemMetrics( nIndex ) USING STDCALL FROM USER32.DLL
DLLFUNCTION CreateEllipticRgn(nLeftRect,nTopRect,nRightRect,nBottomRect) USING STDCALL FROM GDI32.DLL
DLLFUNCTION SetWindowRgn(hHwnd,hRgn,bRedraw) USING STDCALL FROM USER32.DLL
DLLFUNCTION DeleteObject( hObject ) USING STDCALL FROM GDI32.DLL

*-------------------------------------------------------------------------*

*
* eof
*




