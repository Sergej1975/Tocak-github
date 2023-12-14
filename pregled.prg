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


FUNCTION Pregled()
   LOCAL nEvent, mp1, mp2, aSize , brojka
   LOCAL  oXbp, oXbp1, oXbp2, oXbp3, drawingArea, aEditControls := {}

   brojka = 0
   *proizzz = SPACE(30)

   IF IsMemberVar(XbpDialog(),"ClientSize") == .T.
      aSize := {0,0}
   ELSE
      aSize := {1062,746}
   ENDIF

   SELECT 300
   Otvori("tocak",.T.)


   oDlg2 := XbpDialog():new( AppDesktop(), , {587,121}, aSize, , .F.)
   IF aSize[1] == 0 .AND. aSize[2] == 0
      oDlg2:ClientSize := {1046,707}
   ENDIF
   oDlg2:taskList := .T.
   oDlg2:title := "—×âæ×ü¡Ç"
   oDlg2:icon := 203
   oDlg2:create()



   drawingArea := oDlg2:drawingArea
   drawingArea:setFontCompoundName( "9.Arial Cyr" )

   oBudzz := XbpBrowse():new( oDlg2,,{204,542}, {67,100},, .F. ):create()
   oBudzz:setFontCompoundName("12.Courier New Cyr")
   oBudzz:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }
   oBudzz:hScroll := .F.



///////////////////////////////////////////////
//////////////////////////////////////////
   bBlock  := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->broj,'##'),FIELD->broj:=x) }" )   //:= &( "{|x| IIf(x==NIL,FIELD->broj,'###',FIELD->broj:=x) }" )
   oBudzz:addColumn( bBlock,2,"¢áÖŽ",,4)



   oBudzz:skipBlock     := {|n| DbSkipper(n) }
   oBudzz:goTopBlock    := {| | DbGoTop()    }
   oBudzz:goBottomBlock := {| | DbGoBottom() }
   oBudzz:phyPosBlock   := {| | Recno()      }



// ÇÖ¦Ô· ¢ÐÖÆÖë· ó  ë¨áå·Æ ÐÔÖ ãÆáÖÐçë ’¨
  // oBudzz:posBlock      := {| | OrdKeyNo()   }
   oBudzz:posBlock      := {| | Recno()   }
   oBudzz:lastPosBlock  := {| | LASTREC() }
   oBudzz:firstPosBlock := {| | 1         }



// ¡Æå·ë·á Ž ªçÔÆ¤·Ž : Entr() ÖåÆ ÆÖ –¨ ¬Ö ·ó¢¨á¨õ ãÐÖ¬Öå (ENTER ·Ð· 2ÇÐ·Æ)
   oBudzz:itemMarked  := {| | Entrgg(oBudzz) }
   oBudzz:cursorMode    := 3
   oBudzz:forceStable()
   oBudzz:show()



///////////////////////////////////////


// ©Æá ÔÖå ó   ØÐ·Æ ¤·Ž å  ã¨¬  –¨ ¢·¦¨: oBudz = XbpDialog(...
   SetAppWindow( oBudzz )

// Õ¨Æ  Øá·Ò· ªÖÆçã · ÖëÖŽ ¨Æá Ô, ÔÖ...
   SetAppFocus( oBudzz )

//////////////////////////////////////////////////
//////////////////////////////////////////////
   oXbp := XbpPushButton():new( drawingArea, , {252,60}, {124,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Õ ó ¦ ÆÖÔ Ò¨Ô·"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| oDlg2:destroy() }

   oXbp := XbpStatic():new( drawingArea, , {432,648}, {180,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Ýâ©­Ñ©§ Õ¡ ì©Ñ×ä¸Ý©§¸"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_CENTER
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,550}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "äÐ·Æ "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,516}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÝáÖ·óëÖ¦·å¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,480}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {505,444}, {120,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Ó å¨á·Ž Ð Ô  á ÒÆ "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {540,408}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "æáÆ Ð "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {505,372}, {120,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "æ·Ø Ô  ÆÖûÔ·¤·"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,336}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "¡ÒÖáå·ó¨á Øá¨¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,300}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "¡ÒÖáå·ó¨á ó ¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   /////////////////////////////////////////////

    /////////////////////////////////////////

   oXbp := XbpStatic():new( drawingArea, , {516,264}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ô Øû Ô·Æ Øá¨¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,228}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ô Øû Ô·Æ ó ¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,192}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Ó¨Ôçë û Øá¨¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,156}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Ó¨Ôçë û ó ¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {516,120}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "§Ö¦ åÔ  ÖØá¨Ò "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {220,120}, {150,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "(ô¬ÖÐ¨Ò· ó  ¤¨Ð  ãÐ·Æ )"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   //oD11           := XbpDialog():new( drawingArea, , {104,156}, {390,260} )
   //oD11:taskList  := .F.
   //oD11:icon      := 203
   //oD11:close     := {|| oD11:destroy() }
   //oD11:maxButton := .F.
  // oD11:minButton := .F.
   //oD11:border    := 12
   //oD11:create()

   //drawingArea:=oD11:drawingArea




   /////////////////////
   ////PROIZVODITEL

   oXbp := XbpSLE():new( drawingArea, , {636,516}, {300,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } })
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), modelll :=Lat2Kir(modelll,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), framee :=Lat2Kir(framee,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), trkloo :=Lat2Kir(trkloo,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), brakee :=Lat2Kir(brakee,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), amorpp :=Lat2Kir(amorpp,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), amorzz :=Lat2Kir(amorzz,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), zapprr :=Lat2Kir(zapprr,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), zapzadee :=Lat2Kir(zapzadee,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), menuprr :=Lat2Kir(menuprr,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), menuzadd :=Lat2Kir(menuzadd,o),o:setData()}
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
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), dodopp :=Lat2Kir(dodopp,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   ///////////////////////////////////////
   //ZABELESKA

   oXbp := XbpSLE():new( drawingArea, , {750,590}, {184,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } ) // zabeleska
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, zabee, zabee:=x )}
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), zabee :=Lat2Kir(zabee,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpSLE():new( drawingArea, , {636,550}, {350,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:clipSiblings := .T.
   oXbp:tabStop      := .T.
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:Datalink      := { |x| IIF( PCOUNT()>=0, slikkka, slikkka:=x )}
   //oXbp:setInputFocus := { |u1,u2,o| o:getdata(), slikkka :=Lat2Kir(slikkka,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )



   /////////////////////////////////////////////

   oXbp := XbpStatic():new( drawingArea, , {77,588}, {120,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ì¨ÐÖã·Ø¨¦ ¢áÖŽ:"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()


  // oXbp := XbpPushButton():new( drawingArea, , {304,590}, {115,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
  // oXbp:caption := "Prikazi"
  // oXbp:tabStop := .T.
  // oXbp:create()
  // oXbp:activate := {|| Sliki()}



   oXbp := XbpStatic():new( drawingArea, , {650,590}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ô ¢¨Ð¨õÆ "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()


   oXbp := XbpPushButton():new( drawingArea, , {684,60}, {115,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "¸ôÑ©ô"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| oDlg2:destroy()}

  /* oXbp := XbpPushButton():new( drawingArea, , {5,5}, {50,24} )
   oXbp:caption := "ô¬ÖÐ¨Ò·"
   oXbp:tabStop := .T.
   oXbp:activate := {|| Zgolemi() }
   oXbp:create()*/



   oDlg2:show()



  // nEvent := xbe_None
  // DO WHILE nEvent <> xbeP_Close
  //    nEvent := AppEvent( @mp1, @mp2, @oXbp )
   //   oXbp:handleEvent( nEvent, mp1, mp2 )
  // ENDDO

RETURN

///////////////////////////////////////
////////////////////////////////////

FUNCTION Entrgg(oBudzz)
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
   slikkka  = ALLTRIM(tocak->slika)



   //drawingArea := oDlg2:drawingArea
   //drawingArea:setFontCompoundName( "9.Arial Cyr" )

   oD11           := XbpDialog():new( oDlg2, , {104,156}, {390,260} )
   oD11:taskList  := .T.
   oD11:icon      := 203
   oD11:close     := {|| oD11:destroy() }
   oD11:maxButton := .T.
   oD11:minButton := .T.
   oD11:border    := 12
  // oD11:handler:XBE_RESIZE:= {|| ResizePicture(@oPicture, oD11:width - 20, oD11:height - 20)}
   oD11:create()

   drawingArea := oD11:drawingArea
   drawingArea:setFontCompoundName( "9.Arial Cyr" )

   oBMP := XbpBitmap():new():create()
   oBMP:LoadFile(slikkka)

   oXbp:= XbpStatic():new(drawingArea, , {1,1} )
   oXbp:type := XBPSTATIC_TYPE_BITMAP
   oXbp:caption := oBMP
   oXbp:autoSize := .T.
   oXbp:create()







   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT

   //Sliki(oDlg2)



   oBudzz:forceStable()
   oBudzz:refreshAll()


RETURN NIL





****************************
*** LATINICA VO KIRILICA ***
****************************
FUNCTION Lat2Kir(lat)
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
FUNCTION Kir2Lat(lat)
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


///////////////////////////
///////////////////////////

PROCEDURE ResizePicture(oPicture, nWidth, nHeight)
   LOCAL nOrigWidth, nOrigHeight, nNewWidth, nNewHeight, nRatio

   // Get the original dimensions of the picture
   nOrigWidth := oPicture:width
   nOrigHeight := oPicture:height

   // Calculate the aspect ratio of the picture
   nRatio := nOrigWidth / nOrigHeight

   // Calculate the new dimensions based on the desired width or height
   IF nWidth > 0
      nNewWidth := nWidth
      nNewHeight := Int(nNewWidth / nRatio)
   ELSEIF nHeight > 0
      nNewHeight := nHeight
      nNewWidth := Int(nNewHeight * nRatio)
   ELSE
      // Invalid width and height values
      RETURN
   ENDIF

   // Set the new size for the picture
   oPicture:setSize(nNewWidth, nNewHeight)

   RETURN





FUNCTION Sliki(oDlg2)


SELECT 300



   oD11           := XbpDialog():new( oDlg2, , {104,156}, {390,260} )
   oD11:taskList  := .F.
   oD11:icon      := 203
   oD11:close     := {|| oD11:destroy() }
   oD11:maxButton := .F.
   oD11:minButton := .F.
   oD11:border    := 12

   oD11:create()

   drawingArea:=oD11:drawingArea

 
     IF tocak->broj = "1"

         oXbp1 := XbpStatic():new( drawingArea, , {1,1}, {378,250}, { { XBP_PP_BGCLR, -255 } } )
         oXbp1:type = XBPSTATIC_TYPE_BITMAP
         oXbp1:caption := 205
         oXbp1:clipSiblings := .T.
         oXbp1:create()


         oXbp := XbpPushButton():new( drawingArea, , {5,5}, {50,24} )
         oXbp:caption := "ô¬ÖÐ¨Ò·"
         oXbp:tabStop := .T.
         oXbp:activate := {|| Zgolemi() }
         oXbp:create()

      ENDIF

     IF tocak->broj = "2"

         oXbp2 := XbpStatic():new( drawingArea, , {1,1}, {396,384} )
         oXbp2:type = XBPSTATIC_TYPE_BITMAP
         oXbp2:caption := 206
         oXbp2:clipSiblings := .T.
         oXbp2:create()

         oXbp := XbpPushButton():new( drawingArea, , {5,5}, {50,24} )
         oXbp:caption := "ô¬ÖÐ¨Ò·"
         oXbp:tabStop := .T.
         oXbp:activate := {|| Zgolemi1() }
         oXbp:create()

     //    oD11:destroy()
     //    oD13:destroy()
     ENDIF

     IF tocak->broj = "3"
         oXbp3 := XbpStatic():new( drawingArea, , {1,1}, {396,384}, { { XBP_PP_BGCLR, -255 } } )
         oXbp3:type = XBPSTATIC_TYPE_BITMAP
         oXbp3:caption := 207
         oXbp3:clipSiblings := .T.
         oXbp3:create()

         oXbp := XbpPushButton():new( drawingArea, , {5,5}, {50,24} )
         oXbp:caption := "ô¬ÖÐ¨Ò·"
         oXbp:tabStop := .T.
         oXbp:activate := {|| Zgolemi2() }
         oXbp:create()

       //  oD11:destroy()
       //  oD12:destroy()
     ENDIF



RETURN

FUNCTION Zgolemi()
LOCAL oD21, oXbp21
SELECT 300

     oD21           := XbpDialog():new( oDlg2, , {10,10}, {1023,695} )
     oD21:taskList  := .F.
     oD21:icon      := 203
     oD21:close     := {|| oD21:destroy() }
     oD21:maxButton := .F.
     oD21:minButton := .F.
     oD21:border    := 12
     oD21:create()

     drawingArea := oD21:drawingArea

     oXbp21 := XbpStatic():new( drawingArea, , {1,1}, {1023,707} )
     oXbp21:type = XBPSTATIC_TYPE_BITMAP
     oXbp21:caption := 201
     oXbp21:clipSiblings := .T.
     oXbp21:create()

RETURN NIL

FUNCTION Zgolemi1()
LOCAL oD21, oXbp21
SELECT 300

     oD21           := XbpDialog():new( oDlg2, , {10,10}, {1023,695} )
     oD21:taskList  := .F.
     oD21:icon      := 203
     oD21:close     := {|| oD21:destroy() }
     oD21:maxButton := .F.
     oD21:minButton := .F.
     oD21:border    := 12
     oD21:create()

     drawingArea := oD21:drawingArea

     oXbp21 := XbpStatic():new( drawingArea, , {1,1}, {1023,707} )
     oXbp21:type = XBPSTATIC_TYPE_BITMAP
     oXbp21:caption := 204
     oXbp21:clipSiblings := .T.
     oXbp21:create()

RETURN NIL

FUNCTION Zgolemi2()
LOCAL oD21, oXbp21
SELECT 300

     oD21           := XbpDialog():new( oDlg2, , {10,10}, {1023,695} )
     oD21:taskList  := .F.
     oD21:icon      := 203
     oD21:close     := {|| oD21:destroy() }
     oD21:maxButton := .F.
     oD21:minButton := .F.
     oD21:border    := 12
     oD21:create()

     drawingArea := oD21:drawingArea

     oXbp21 := XbpStatic():new( drawingArea, , {1,1}, {1023,707} )
     oXbp21:type = XBPSTATIC_TYPE_BITMAP
     oXbp21:caption := 202
     oXbp21:clipSiblings := .T.
     oXbp21:create()

RETURN NIL