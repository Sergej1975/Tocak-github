//#pragma  library( "XppUi2.LIB" )
//#include "xbpget.prg"
//#include "xbpgetc.prg"
//#include "getcol.prg"
//#include "Kirla855.prg"
//#include "Parbuk.prg"
//#include "Parbuk_Al.prg"
//#include "Radiogrp.prg"
//#include "Tooltip.prg"
#include "Appevent.ch"
#include "Appedit.ch"
#include "Appbrow.ch"
#include "Common.ch"
#include "Gra.ch"
#include "Xbp.ch"
#include "Font.ch"
#include "Directry.ch"



FUNCTION Lozinki()
   LOCAL  mp1, mp2, oXbp, slogce




///////////////////////////

   // CharMirr("sergej", [6])

  // msgbox(DTOC(mdodata))


   mprog = SPACE(6)

   lozinka = .F.
   prikazi = .F.
   indgre  = .F.
   mstra = 1
   pozslog = 1



   IF IsMemberVar(XbpDialog(),"ClientSize") == .T.
      aSize := {0,0}
   ELSE
      aSize := {1062,746}
   ENDIF

   oDlg := XbpDialog():new( AppDesktop(), , {587,121}, aSize, , .F.)
   IF aSize[1] == 0 .AND. aSize[2] == 0
      oDlg:ClientSize := {1046,707}
   ENDIF



   oDlg:taskList := .T.
   oDlg:title := "—×âæ×ü¡Ç"
   oDlg:icon := 203
   oDlg:close := {|| oDlg:destroy(), PostAppEvent( xbeP_Quit ) }
   oDlg:create()

   drawingArea := oDlg:drawingArea
   drawingArea:setFontCompoundName( "11.Courier New Cyr" )

   //oHelp := MagicHelp():New()
    oXbp := XbpStatic():new( drawingArea, , {10,10}, {1023,726}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:type = XBPSTATIC_TYPE_BITMAP
   oXbp:caption := 201
   oXbp:clipSiblings := .T.
   *oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()                             // HELP

   oDlp          := XbpDialog():new( drawingArea, , {290,220}, {520,285} )
   oDlp:title    := "Ýá·Ž ë  ó  á ¢Öå "
   oDlp:icon     := 203
   oDlp:taskList := .F.
   oDlp:close    := {|mp1,mp2,obj| obj:destroy() }
   oDlp:clipSiblings := .T.
   oDlp:create()
   //oDlp:drawingArea:setColorBG( GRA_CLR_PALEGRAY )

   oNov:= oDlp:drawingArea
   oNov:setFontCompoundName( "11.Courier New Cyr" )
//   oNov:setFontCompoundName( "11.Arial Cyr" )
 //  oPS := XbpPresSpace():new()
  // oPS:create(oNov:winDevice())

// ZNAKOT: OD TUKA
   oXbp := xbpStatic():new(oNov,,{22,22},{200,200})
   oXbp:clipSiblings := .T.
   oXbp:type = XBPSTATIC_TYPE_BITMAP
   oXbp:caption = 211
   oXbp:create()

   oXbp             := XbpStatic():new( oNov, , {238,115}, {110,20} )
   oXbp:caption     := "§ å :"
   oXbp:options     := XBPSTATIC_TEXT_RIGHT
   oXbp:setFontCompoundName( "11.Arial Cyr" )
   oXbp:create()

   oXbp:= XbpGET():new( oNov, , {351,115}, {110,20} )
   oXbp:tabStop  := .T.
   //oXbp:clipSiblings := .T.
   oXbp:killInputFocus := {|u1,u2,o| o:getData(),o:setData()}
   oXbp:dataLink := {|x| IIf( PCOUNT()==0, mdodata, mdodata := x ) }
   oXbp:setFontCompoundName("12.Courier New Cyr")
   oXbp:create()
   oXbp:setData()
   AAdd(getList,oXbp)



   oXbp             := XbpStatic():new( oNov, , {238,84}, {110,20} )
   oXbp:caption     := "ÇÖá·ãÔ·Æ:"
   oXbp:options     := XBPSTATIC_TEXT_RIGHT
   oXbp:setFontCompoundName( "11.Arial Cyr" )
   oXbp:create()

   oID              := XbpSLE():new( oNov, , {351,83}, {90,22} )
   oID:clipSiblings := .T.
   oID:group        := XBP_BEGIN_GROUP
   oID:tabStop      := .T.
   oID:bufferLength := 10
   oID:setFontCompoundName( "11.Courier New Cyr" )
   oID:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oPW), NIL ) }
   oID:create()

        //oID:helpLink := MagicHelpLabel():New(1)
////// 09.01.2016

   oXbp             := XbpStatic():new( oNov, , {238,52}, {110,20} )
   oXbp:caption     := "ÑÖóçÔ¬:"
   oXbp:setFontCompoundName( "11.Arial Cyr" )
   oXbp:options     := XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oPW              := XbpSLE():new( oNov, , {351,51}, {90,22} )
   oPW:group        := XBP_WITHIN_GROUP
   oPW:tabStop      := .T.
   oPW:bufferLength := 10
   oPW:setFontCompoundName( "11.Courier New Cyr" )
   oPW:unReadable   := .T.
   oPW:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oTl), NIL ) }
   oPW:create()


   oTl             := XbpPushButton():new( oNov, , {351,11}, {75,25} )
   oTl:caption     := "×Ç"
   oTl:tabStop     := .T.
   oTl:group       := XBP_END_GROUP
   oTl:activate    := {|| Testloz(oDlp,oID,oPW) }
   oTl:keyboard    := {|nKey,x,obj| IIf( nKey == xbeK_RETURN, ;
                                     PostAppEvent( xbeP_Activate,,, obj ), NIL ) }
   oTl:create()

   SetAppFocus(oDlp )
   SetAppFocus( oID )

   moddata = DTOC(mdodata)

RETURN


FUNCTION Testloz(oDl,oID,oPW)
LOCAL uspesno,dol,i,lat
PUBLIC mplozin
   cUserID   := UPPER(AllTrim( oID:getData()))  // <-vazno
   cPassWord := AllTrim( oPW:getData() )
   mkorisn = cUserID
   mlozin1 = Tastatura(cPassWord)

   IF mlozin1 = "latinica/kirilica"
      MsgBox("ìÖ ÐÖóçÔ¬Öå Ô¨ ãÒ¨¨å¨ ¦  Ò¨õ å¨ latinica · Æ·á·Ð·¤ ","Õ¨·ãØá ë¨Ô ÐÖóçÔ¬")
      SetAppFocus( oPW )
      RETURN .F.
   ENDIF

   SELECT 800
   Otvori("Toc00",.F.)
   LOCATE FOR ALLTRIM(cUserID) == ALLTRIM(Toc00->matbroj)
   IF !FOUND()

      MsgBox("Nepostoe;ki korisnik")
      oDlp:destroy()
      SetAppFocus( oDlg )

   ENDIF

   IF FOUND()
      mmatbroj  = Toc00->matbroj
      mtip_anal = Toc00->tip_anal
      IF mlozin1 == ALLTRIM(Toc00->lozin1)
         dlozin1 = ALLTRIM(Toc00->lozin1)
         xmime = RTRIM(Toc00->ime) + " " + Toc00->prezime
         mpriv = Toc00->priv   // privilegii za upis vo sifrarnici/

         msifoddel = Toc00->sifoed

         IF Toc00->priv = "x"
            MsgBox(xmime,"ÇÖá·ãÔ·Æ  " + moddata )
            Kremeni()
         ENDIF
         IF Toc00->priv = "i" .OR. Toc00->priv = "a"  .OR. Toc00->priv = "s"
            MsgBox(xmime,"ÇÖá·ãÔ·Æ  "+ moddata)
            KremeniP()
         ENDIF

         oDlp:destroy()
         lozinka = .T.
         uspesno = .T.


         CLOSE 800

         SetAppWindow():enable()

      ELSE
         MsgBox("Õ¨·ãØá ë¨Ô ÐÖóçÔ¬","ÝÖá Æ  ó  ¬á¨õÆ !" )
         SetAppFocus( oPW )
         uspesno = .F.
      ENDIF
   ELSE
      MsgBox("Õ¨·ãØá ëÔ  ·¦¨Ôå·ª·Æ ¤·Ž ","ÝÖá Æ  ó  ¬á¨õÆ !")
      SetAppFocus( oID )
      uspesno = .F.
   ENDIF


RETURN uspesno
**********************************
* VNESENO: KIRILICA ILI LATINICA *
**********************************
FUNCTION Tastatura(ppp)
LOCAL rrr,dol,i,lat,asc,chr,lll
   dol = LEN(ppp)
   lat = ""
   FOR i = 1 TO dol
      chr =  SUBSTR(ppp,i,1)
      asc =  ASC(chr)
      IF asc >= 32 .AND. asc <= 126
         lat = lat + "L"
      ELSE
         lat = lat + "K"
      ENDIF
   NEXT

   IF lat = REPLICATE("K",dol)
      lll = KirLat855(ppp)
      rrr = Kodiraj(lll)
   ELSE
      IF lat = REPLICATE("L",dol)
         rrr = Kodiraj(ppp)
      ELSE
         rrr = "latinica/kirilica"
      ENDIF
   ENDIF

RETURN rrr