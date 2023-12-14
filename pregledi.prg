///////////////////////////////////////////////////////////////////////////////
//
//  Function-oriented code created by the Xbase++ FormDesigner
//    Creation date: 25-09-23 Time: 10:20:27
//
///////////////////////////////////////////////////////////////////////////////

#include "Gra.ch"
#include "Xbp.ch"
#include "Appevent.ch"
#include "Font.ch"

#PRAGMA LIBRARY( "ASCOM10.LIB" )


FUNCTION Pregledi
   LOCAL nEvent, mp1, mp2, aSize , brojka
   LOCAL oDlg, oXbp, drawingArea, aEditControls := {}

   brojka = SPACE(30)
   *proizzz = SPACE(30)

   IF IsMemberVar(XbpDialog(),"ClientSize") == .T.
      aSize := {0,0}
   ELSE
      aSize := {1062,746}
   ENDIF

   SELECT 300
   Otvori("tocak",.T.)


   oDlg := XbpDialog():new( AppDesktop(), , {587,121}, aSize, , .F.)
   IF aSize[1] == 0 .AND. aSize[2] == 0
      oDlg:ClientSize := {1046,707}
   ENDIF
   oDlg:taskList := .T.
   oDlg:title := "Pregled na velosipedi"
   oDlg:create()

   drawingArea := oDlg:drawingArea
   drawingArea:setFontCompoundName( "8.Arial" )

   oBudzz := XbpBrowse():new( oDlg,,{204,542}, {67,100},, .F. ):create()
   oBudzz:setFontCompoundName("12.Courier New Cyr")
   oBudzz:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }
   oBudzz:hScroll := .F.

   bBlock := &( "{|x| IIf(x==NIL,FIELD->broj,FIELD->broj:=x) }" )
   oBudzz:addColumn( bBlock,2,"broj",,4)

   oBudzz:skipBlock     := {|n| DbSkipper(n) }
   oBudzz:goTopBlock    := {| | DbGoTop()    }
   oBudzz:goBottomBlock := {| | DbGoBottom() }
   oBudzz:phyPosBlock   := {| | Recno()      }

// ÇÖ¦Ô· ¢ÐÖÆÖë· ó  ë¨áå·Æ ÐÔÖ ãÆáÖÐçë ’¨
//   oBrow:posBlock      := {| | OrdKeyNo()   }
   oBudzz:posBlock      := {| | Recno()   }
   oBudzz:lastPosBlock  := {| | LASTREC() }
   oBudzz:firstPosBlock := {| | 1         }

// ¡Æå·ë·á Ž ªçÔÆ¤·Ž : Entr() ÖåÆ ÆÖ –¨ ¬Ö ·ó¢¨á¨õ ãÐÖ¬Öå (ENTER ·Ð· 2ÇÐ·Æ)
   oBudzz:itemMarked  := {| | Entrggp(oBudzz) }
   oBudzz:cursorMode    := 3
   oBudzz:forceStable()
   oBudzz:show()


   // ©Æá ÔÖå ó   ØÐ·Æ ¤·Ž å  ã¨¬  –¨ ¢·¦¨: oBudz = XbpDialog(...
   SetAppWindow( oBudzz )

// Õ¨Æ  Øá·Ò· ªÖÆçã · ÖëÖŽ ¨Æá Ô, ÔÖ...
   SetAppFocus( oBudzz )


   oXbp := XbpPushButton():new( drawingArea, , {252,60}, {96,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Nazad"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| oDlg:destroy() }

   oXbp := XbpStatic():new( drawingArea, , {432,648}, {156,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "PREGLED NA VELOSIPEDI"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_CENTER
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,516}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Proizvoditel"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,480}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Model"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,444}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Materijal na ramka"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,408}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Trkala"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,372}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Tip na kocnici"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,336}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Amortizer preden"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,300}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Amortizer zaden"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   /////////////////////////////////////////////

   /////////////SLIKA SLIKA

   oD11           := XbpDialog():new( oDlg, , {104,156}, {396,384} )
   *oD11:title     := "1.1. Ý×§â¡ü¡ äÝ×â©§ äæ©Ý©Õ Õ¡ ô¡öæ¸æ¡ ×§ £èü¡ì¡"
   oD11:taskList  := .T.
   *oD11:icon      := 211
   *oD11:close     := {|mp1,mp2,obj| aktivno := .F., Izlez11()}
   oD11:maxButton := .T.
   oD11:minButton := .F.
   oD11:border    := 12
   oD11:create()

   oXbp              := XbpSLE():new( oDl1, , {636,516}, {300,24})
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, slikaaa, slikaaa:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), slikaaa :=Lat2Kirp(slikaaa,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )


   /*oXbp := XbpStatic():new( oD11, , {1,1}, {390,380}, { { XBP_PP_BGCLR, -255 } } )
   *oXbp:loadFile("lezz")
  * oXbp:caption := "Slika"
   *oXbp:clipSiblings := .T.
   *oXbp:type := XBPSTATIC_TYPE_GROUPBOX
   *oXbp:create()

   *oXbp := XbpStatic():new( drawingArea, , {108,156}, {394,382}, { { XBP_PP_BGCLR, -255 } } )
  * oXbp:load( NIL, 202 )

   // display bitmap in the PS
   *oXbp:draw( {50,100} )
   oXbp:type = XBPSTATIC_TYPE_BITMAP
   oXbp:caption := 202
   *oXbp:clipSiblings := .T.
   *oXbp:draw()
   *oXbp:caption := "Slika"
   oXbp:clipSiblings := .T.
   *oXbp:type := XBPSTATIC_TYPE_GROUPBOX
   oXbp:create()
                  */


   /////////////////////////////////////////

   oXbp := XbpStatic():new( drawingArea, , {540,264}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Zapcanik napred"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,228}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Zapcanik zaden"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,192}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Menuvac napred"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,156}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Menuvac zaden"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,120}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Dodatna oprema"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()


   /////////////////////
   ////PROIZVODITEL

   oXbp              := XbpSLE():new( oDlg, , {636,516}, {300,24})
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, proizzz, proizzz:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), proizzz :=Lat2Kir(proizzz,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )


   ////////////////////////////
   //MODEL

   oXbp := XbpSLE():new( drawingArea, , {636,480}, {300,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, modelll, modelll:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), modelll :=Lat2Kirp(modelll,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   //////////////////////
   // RAMKA

   oXbp := XbpSLE():new( drawingArea, , {636,444}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, framee, framee:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), framee :=Lat2Kirp(framee,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ////////////////////////////////////
   // TRKALA
   oXbp := XbpSLE():new( drawingArea, , {636,408}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, trkloo, trkloo:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), trkloo :=Lat2Kirp(trkloo,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ///////////////////////////////
   // KOCNICI

   oXbp := XbpSLE():new( drawingArea, , {636,372}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
    oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, brakee, brakee:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), brakee :=Lat2Kirp(brakee,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ///////////////////////////
   // AMORTIZER PREDEN

   oXbp := XbpSLE():new( drawingArea, , {636,336}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
    oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, amorpp, amorpp:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), amorpp :=Lat2Kirp(amorpp,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ///////////////////////////////////
   // AMORTIZER ZADEN

   oXbp := XbpSLE():new( drawingArea, , {636,300}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
    oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, amorzz, amorzz:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), amorzz :=Lat2Kirp(amorzz,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   /////////////////////////////////////
   //  ZAPCANIK NAPRED

   oXbp := XbpSLE():new( drawingArea, , {636,264}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
    oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, zapprr, zapprr:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), zapprr :=Lat2Kirp(zapprr,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   /////////////////////////////////
   //ZAPCANIK NAZAD

   oXbp := XbpSLE():new( drawingArea, , {636,228}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
    oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, zapzadee, zapzadee:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), zapzadee :=Lat2Kirp(zapzadee,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ////////////////////////////////////
   // MENUVAC NAPRED

   oXbp := XbpSLE():new( drawingArea, , {636,192}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
    oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, menuprr, menuprr:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), menuprr :=Lat2Kirp(menuprr,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   /////////////////////////////////////////
   // MENUVAC NAZAD

   oXbp := XbpSLE():new( drawingArea, , {636,156}, {132,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
    oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, menuzadd, menuzadd:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), menuzadd :=Lat2Kirp(menuzadd,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ///////////////////////////////////
   // DODATNA OPREMA

   oXbp := XbpSLE():new( drawingArea, , {636,120}, {300,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } ) // dodatna oprema
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, dodopp, dodopp:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), dodopp :=Lat2Kirp(dodopp,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ///////////////////////////////////////
   //ZABELESKA

   oXbp := XbpSLE():new( drawingArea, , {850,590}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } ) // zabeleska
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, zabee, zabee:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), zabee :=Lat2Kirp(zabee,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   /////////////////////////////////////////////

   oXbp := XbpStatic():new( drawingArea, , {108,588}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Velosiped broj:"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()



   oXbp := XbpPushButton():new( drawingArea, , {304,590}, {115,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Prikazi"
   oXbp:tabStop := .T.
   oXbp:create()
   *oXbp:activate := {|| Pregledi()}



   oXbp := XbpStatic():new( drawingArea, , {750,590}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Zabeleska"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()


   oXbp := XbpPushButton():new( drawingArea, , {684,60}, {115,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Izlez od program"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| oDlg:destroy(), PostAppEvent( xbeP_Quit ) }

   oDlg:show()

   nEvent := xbe_None
   DO WHILE nEvent <> xbeP_Close
      nEvent := AppEvent( @mp1, @mp2, @oXbp )
      oXbp:handleEvent( nEvent, mp1, mp2 )
   ENDDO



///////////////////////////////////////
////////////////////////////////////

FUNCTION Entrggp(oBudzz)
LOCAL i
   SELECT 300


   proizzz  = tocak->proizvodit
   modelll  = tocak->model
   trkloo   = tocak->trkala
   amorzz   = tocak->amortzad
   amorpp   = tocak->amortpred
   menuprr  = tocak->menpred
   menuzadd = tocak->menzad
   zapprr   = tocak->zappred
   zapzadee = tocak->zapzad
   framee   = tocak->ramka
   zabee    = tocak->zabeleska
   brakee   = tocak->kocnici
   dodopp   = tocak->dodopr


   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT


   oBudzz:forceStable()
   oBudzz:refreshAll()


RETURN NIL



****************************
*** LATINICA VO KIRILICA ***
****************************
FUNCTION Lat2Kirp(lat)
LOCAL ii, kir, mat
   mat = SUBSTR(LTRIM(lat) + SPACE(70),1,LEN(lat))
   kir = ""
   FOR ii = 1 TO LEN(lat)
      IF ASC(SUBSTR(mat,ii,1)) < 128
         kir = kir + LatKir855(SUBSTR(mat,ii,1))
      ELSE
         kir = kir + SUBSTR(mat,ii,1)
      ENDIF
   NEXT
RETURN kir
****************************
***  KIRILICA VO LATINICA***
****************************
FUNCTION Kir2Latp(lat)
LOCAL ii, kir, mat
   mat = SUBSTR(LTRIM(lat) + SPACE(70),1,LEN(lat))
   kir = ""
   FOR ii = 1 TO LEN(lat)
      IF ASC(SUBSTR(mat,ii,1)) >= 128
         kir = kir + KirLat855(SUBSTR(mat,ii,1))
      ELSE
         kir = kir + SUBSTR(mat,ii,1)
      ENDIF
   NEXT
RETURN kir