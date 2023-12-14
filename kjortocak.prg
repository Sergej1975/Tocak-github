///////////////////////////////////////////////////////////////////////////////
//
//  Function-oriented code created by the Xbase++ FormDesigner
//    Creation date: 25-09-23 Time: 10:09:40
//
///////////////////////////////////////////////////////////////////////////////

*#include "Gra.ch"
*#include "Xbp.ch"
*#include "Appevent.ch"
*#include "Font.ch"

#PRAGMA LIBRARY( "ASCOM10.LIB" )
#pragma  library( "XppUi2.LIB" )
#include "xbpget.prg"
#include "xbpgetc.prg"
#include "getcol.prg"
#include "Kirla855.prg"
*#include "Parbuk.prg"
*#include "Radiogrp.prg"
#include "Tooltip.prg"
#include "Appevent.ch"
#include "Appedit.ch"
#include "Appbrow.ch"
#include "Common.ch"
#include "Gra.ch"
#include "Xbp.ch"
#include "Font.ch"
#include "Directry.ch"
#include "DLL.ch"


#pragma library("XppUi2")

PROCEDURE Main()
   LOCAL nEvent, mp1, mp2, aSize
   LOCAL  oXbp, drawingArea, aEditControls := {}

   PUBLIC proiz, modell, brojj, zabe , amorz , amorp, dodop, menupr, menuzad, zappr, zapzade, proizzz, modelll, trkloo, amorzz, aktivno
   PUBLIC amorpp, menuprr, menuzadd, zapprr, zapzadee, framee, zabee, brakee, dodopp, oDlg , slikk ,slikkk,slikkka, oDlg1, oDlg2, oBudzz, oD11, oD12 , oD13
   PUBLIC oXbp1, oXbp2 , oXbp3, oBrow , oDlgS, oBMP , oPs , ooo ,oDlgI , moddata, mdodata , otatko, odstrana, dostrana, oBmp , oBitmap ,oXbpS
   PUBLIC brake, frame, trklo, oSle , cFile , slikafile , oFiledlg , oMenu , oDlp, oLogDom , oID, oPW , oLogDom, oTl, oPD , mdodat, moddat
   PUBLIC element , element1

   proiz    = SPACE(30)
   proizzz  = SPACE(30)
   modelll  = SPACE(30)
   trkloo   = SPACE(30)
   amorzz   = SPACE(30)
   amorpp   = SPACE(30)
   menuprr  = SPACE(30)
   menuzadd = SPACE(30)
   zapprr   = SPACE(30)
   zapzadee = SPACE(30)
   framee   = SPACE(30)
   zabee    = SPACE(30)
   brakee   = SPACE(30)
   dodopp   = SPACE(30)
   slikk    = SPACE(50)
   slikkk   = SPACE(50)
   slikkka  = SPACE(50)
   brojj    = SPACE(2)
   dostrana = 0
   //moddat  = DATE()
   //mdodata  = DATE()
   element = SPACE(30)
   element1=(30)

   moddata   = SPACE(30)
   mdodata   = DATE()

   SET CENTURY ON
   SET EPOCH TO 1990
   SET COLLATION TO ASCII
   SET DATE FORMAT TO "dd.mm.yyyy"

  // IF IsMemberVar(XbpDialog(),"ClientSize") == .T.
  //    aSize := {0,0}
  // ELSE
  //    aSize := {1062,746}
  // ENDIF


  // oDlg := XbpDialog():new( AppDesktop(), , {587,121}, aSize, , .F.)
 //  IF aSize[1] == 0 .AND. aSize[2] == 0
 //     oDlg:ClientSize := {1046,707}
  // ENDIF



  // oDlg:taskList := .T.
  /// oDlg:title := "—×âæ×ü¡Ç"
  // oDlg:icon := 203
 //  oDlg:close := {|| oDlg:destroy(), PostAppEvent( xbeP_Quit ) }
 //  oDlg:create()

 //  drawingArea := oDlg:drawingArea
  // drawingArea:setFontCompoundName( "11.Courier New Cyr" )

   Lozinki()




   //oXbp := XbpPushButton():new( drawingArea, , {750,224}, {115,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   //oXbp:setFontCompoundName("11.Arial Cyr")
   //oXbp:caption      := "slika"
   //oXbp:tabStop := .T.
   //oXbp:create()
   //oXbp:activate := {|| Slikkk() }

   //oXbp := XbpSLE():new( drawingArea, , {192,24}, {150,24} )
   //oXbp:tabStop := .T.
   //oXbp:bufferLength:= 64
   //oXbp:Datalink      := { |x| IIF( PCOUNT()==0, slikkka, slikkka:=x )}
   //oXbp:setInputFocus := { |u1,u2,o| o:getdata(), slikkka :=ALLTRIM(slikkka,o),o:setData()}
   //oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
  //                 SetAppFocus(oXbp), NIL ) }
   //oXbp:create()
   //AAdd( getList, oXbp )


   //oXbpS := XbpSLE():new( drawingArea, , {192,24}, {150,24} )
   //oXbpS:clipsiblings:=.T.
   //oXbpS:tabStop := .T.
   //oXbpS :bufferLength := 64
   //oXbpS:Datalink      := { |x| IIF( PCOUNT()==0, slikkka, slikkka:=x )}
   //oXbpS:setInputFocus := { |u1,u2,o| o:getdata(), slikkka :=Lat2Kir(slikkka,o),o:setData()}
  // oXbpS:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
    //                SetAppFocus(oXbpS), NIL ) }
  // oXbpS:create()
   //AAdd( getList, oXbpS )

   oDlg:show()

   SetAppFocus(oID)


   nEvent := xbe_None
   DO WHILE nEvent <> xbeP_Close
      nEvent := AppEvent( @mp1, @mp2, @oXbp )
      oXbp:handleEvent( nEvent, mp1, mp2 )
   ENDDO
    Lozinki()
//RETURN
RETURN
PROCEDURE KreMeni()


   oXbp := XbpPushButton():new( oDlg, , {200,124}, {108,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Ýâ©­Ñ©§"
   oXbp:tabStop := .T.
   oXbp:setFontCompoundName("11.Arial Cyr")
   oXbp:create()
   oXbp:activate := {|| Pregled() }

   oXbp := XbpPushButton():new( oDlg, , {380,124}, {108,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:setFontCompoundName("11.Arial Cyr")
   oXbp:caption := "ìÕ©ä"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Vnes_tocak() }

   oXbp := XbpPushButton():new( oDlg, , {570,124}, {108,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:setFontCompoundName("11.Arial Cyr")
   oXbp:caption := "¸ôì©öæ¡"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Izvestaj() }

   oXbp := XbpPushButton():new( oDlg, , {750,124}, {115,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:setFontCompoundName("11.Arial Cyr")
   oXbp:caption      := "Çâ¡"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Zatvor(), oDlg:destroy(), PostAppEvent( xbeP_Quit ) }


RETURN

PROCEDURE KreMeniP()


   oXbp := XbpPushButton():new( oDlg, , {200,124}, {108,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Ýâ©­Ñ©§"
   oXbp:tabStop := .T.
   oXbp:setFontCompoundName("11.Arial Cyr")
   oXbp:create()
   oXbp:activate := {|| Pregled() }

  // oXbp := XbpPushButton():new( oDlg, , {380,124}, {108,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
  // oXbp:setFontCompoundName("11.Arial Cyr")
  // oXbp:caption := "ìÕ©ä"
  // oXbp:tabStop := .T.
  // oXbp:create()
  // oXbp:activate := {|| Vnes_tocak() }

  // oXbp := XbpPushButton():new( oDlg, , {570,124}, {108,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
  // oXbp:setFontCompoundName("11.Arial Cyr")
  // oXbp:caption := "¸ôì©öæ¡"
  // oXbp:tabStop := .T.
  // oXbp:create()
  // oXbp:activate := {|| Izvestaj() }

   oXbp := XbpPushButton():new( oDlg, , {750,124}, {115,48}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:setFontCompoundName("11.Arial Cyr")
   oXbp:caption      := "Çâ¡"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Zatvor(), oDlg:destroy(), PostAppEvent( xbeP_Quit ) }


RETURN
******************************
***** OTVARANJE DATOTEKA *****
******************************
FUNCTION Otvori(datot,excl)
LOCAL odg
DO WHILE .T.
   IF excl = .T.
      USE (datot) EXCLUSIVE
   ELSE
      USE (datot) SHARED
   ENDIF
   IF .NOT. NETERR()
      RETURN nil
   ELSE
      odg = ConfirmBox( , "ÝÖû¨Æ Žå¨, ØÖ¦ åÖ¤·å¨ ã¨ ó ª å¨Ô·.", ;
                          "×åë á ’¨: " + datot,                 ;
                           XBPMB_OKCANCEL,                      ;
                           XBPMB_WARNING )
      IF odg = XBPMB_RET_OK
      ELSE
         CLOSE DATABASES

         QUIT
      ENDIF
   ENDIF
ENDDO
RETURN nil

////////////////////////////////////////////////////
////////////////////////////////////////////////////

FUNCTION Slikkk()

   ///////SLIKA/////////////////////

//slikkka = "bmx.bmp"
     SELECT 300
     Otvori("tocak",.F.)
     slikkka = tocak->slika
  // oBMP := XbpBitmap():new():create()
  // oBMP:LoadFile(slikkka)

  // oBitmap:= XbpStatic():new(oDlg, , {30,100}, {160,160} )
 // oBitmap:type := XBPSTATIC_TYPE_BITMAP
 //  oBitmap:caption := oBMP
  // oBitmap:autoSize := .T.
  // oBitmap:create()


  ////////////////////////////////////////////////////
   //EnterPodSlika()
  // EnterPodSlika()
    // oDlg:forceStable()
   //  oDlg:refreshAll()

//msgbox(slikkka)

   oBMP := XbpBitmap():new():create()
   oBMP:LoadFile(slikkka)

   oBitmap:= XbpStatic():new(oDlg, , {30,100}, {160,160} )
   oBitmap:type := XBPSTATIC_TYPE_BITMAP
   oBitmap:caption := oBMP
   oBitmap:autoSize := .T.
   oBitmap:create()

RETURN

FUNCTION EnterPodSlika(oXpb,sele,poz)
LOCAL i
  // slikkka = slikkka

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
   //oXpbS:destroy()
 //  nEvent := xbe_None
 //  DO WHILE nEvent <> xbeP_Close
  //    nEvent := AppEvent( @mp1, @mp2, @oXbp )
  //    oXbp:handleEvent( nEvent, mp1, mp2 )
  // ENDDO
  // SELECT(sele)
   // oXbpS:forceStable()
  // oXbpS:refreshAll()
   SetAppFocus( getList[1] )

RETURN nil


//C:\ALASKA\XPPW32\Projects\Tocak\bmx.bmp