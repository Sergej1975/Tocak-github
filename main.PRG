

#include "Common.ch"

/* Overloaded AppSys which does nothing
 */
PROCEDURE AppSys

   /* use the ANSI charset by default */
  * SET CHARSET TO OEM

   /* $TODO: create your application container here */
RETURN



#include "Gra.ch"
#include "Xbp.ch"
#include "Appevent.ch"
#include "Font.ch"
*#include "Kirla855.prg"

#PRAGMA LIBRARY( "ASCOM10.LIB" )

FUNCTION Vnes_tocak()

   LOCAL nEvent, mp1, mp2, aSize , frames, trkla, brakes
   LOCAL oDlg, oXbp, drawingArea, aEditControls := {}


   frames  := { "Cro-Mo" , "Aluminium"  , "Carbon", "Titanium" }
   trkla  := {"26'", "29'", "27,5'", "700C", "20'"}
   brakes := {"V-brake", "Disc-hydraulic", "Disc-mechanic", "M-brake", "U-brake", "Drums"}
   brake = "ÆÖûÔ·¤·"
   frame = "á ÒÆ "
   trklo = "åáÆ Ð "
   amorz = SPACE(30)
   amorp = SPACE(30)
   dodop = SPACE(30)
   menupr= SPACE(30)
   menuzad=SPACE(30)
   zappr = SPACE(30)
   zapzade=SPACE(30)
   brojj = SPACE(2)


   IF IsMemberVar(XbpDialog(),"ClientSize") == .T.
      aSize := {0,0}
   ELSE
      aSize := {1062,746}
   ENDIF

   //SELECT 300
   //Otvori("tocak",.T.)

   CLOSE 300
   SELECT 400
   Otvori("tocakW",.T.)
   ZAP

   APPEND ALL FROM tocak

   APPEND BLANK

   GOTO TOP

   FOR i = 1 TO LEN(getList)
        getList[i]:setData()
   NEXT


   PUBLIC getList := {}, aTabela := {}


   oDlg1 := XbpDialog():new( AppDesktop(), , {587,121}, aSize, , .F.)
   IF aSize[1] == 0 .AND. aSize[2] == 0
      oDlg1:ClientSize := {1046,707}
   ENDIF

   oDlg1:taskList := .T.
   oDlg1:title := "—×âæ×ü¡Ç"
   oDlg1:icon := 203
 *  oDlg1:close := {|| oDlg1:destroy(), PostAppEvent( xbeP_Quit ) }
   oDlg1:create()

   drawingArea := oDlg1:drawingArea
   drawingArea:setFontCompoundName( "9.Arial Cyr" )
   *drawingArea:setColorBG( 10 )


   oBrow := XbpBrowse():new( oDlg1,,{25,400}, {1000,300},, .F. ):create()
   oBrow:setFontCompoundName("12.Courier New Cyr")
   oBrow:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->broj,'###'),FIELD->broj:=x) }" )
   oBrow:addColumn( bBlock,3,"£â×",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->proizvodit,'##########'),FIELD->proizvodit:=x) }" )
   oBrow:addColumn( bBlock,10,"Ýâ×¸ôì×§¸æ©Ñ",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->model,'#######'),FIELD->model:=x) }" )
   oBrow:addColumn( bBlock,10,"Ó×§©Ñ",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->ramka,'#######'),FIELD->ramka:=x) }" )
   oBrow:addColumn( bBlock,10,"â¡ÓÇ¡",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->trkala,'#######'),FIELD->trkala:=x) }" )
   oBrow:addColumn( bBlock,10,"æâÇ¡Ñ¡",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->kocnici,'#######'),FIELD->kocnici:=x) }" )
   oBrow:addColumn( bBlock,10,"Ç×üÕ¸¥¸",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->amortpred,'##########'),FIELD->amortpred:=x) }" )
   oBrow:addColumn( bBlock,10,"¡Ó×âæ.Ýâ©§",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->amortzad,'##########'),FIELD->amortzad:=x) }" )
   oBrow:addColumn( bBlock,10,"¡Ó×âæ.ô¡§",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->menpred,'##########'),FIELD->menpred:=x) }" )
   oBrow:addColumn( bBlock,10,"Ó©Õè.Ýâ©§",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->menzad,'##########'),FIELD->menzad:=x) }" )
   oBrow:addColumn( bBlock,10,"Ó©Õè.ô¡§",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->zappred,'##########'),FIELD->zappred:=x) }" )
   oBrow:addColumn( bBlock,10,"ô¡Ýü.Ýâ©§",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->zapzad,'##########'),FIELD->zapzad:=x) }" )
   oBrow:addColumn( bBlock,10,"ô¡Ýü.ô¡§",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->dodopr,'##########'),FIELD->dodopr:=x) }" )
   oBrow:addColumn( bBlock,10,"§×§.×Ýâ©Ó¡",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->zabeleska,'##########'),FIELD->zabeleska:=x) }" )
   oBrow:addColumn( bBlock,10,"ô¡£©Ñ©öÇ¡",,4)

   bBlock := &( "{|x| IIf(x==NIL,TRANSFORM(FIELD->slika,'##########'),FIELD->slika:=x) }" )
   oBrow:addColumn( bBlock,10,"äÑ¸Ç¡",,4)

   oBrow:skipBlock     := {|n| DbSkipper(n) }
   oBrow:goTopBlock    := {| | DbGoTop()    }
   oBrow:goBottomBlock := {| | DbGoBottom() }
   oBrow:phyPosBlock   := {| | Recno()      }



// ÇÖ¦Ô· ¢ÐÖÆÖë· ó  ë¨áå·Æ ÐÔÖ ãÆáÖÐçë ’¨
   oBrow:posBlock      := {| | OrdKeyNo()   }
   oBrow:posBlock      := {| | Recno()   }
   oBrow:lastPosBlock  := {| | LASTREC() }
   oBrow:firstPosBlock := {| | 1         }



// ¡Æå·ë·á Ž ªçÔÆ¤·Ž : Entr() ÖåÆ ÆÖ –¨ ¬Ö ·ó¢¨á¨õ ãÐÖ¬Öå (ENTER ·Ð· 2ÇÐ·Æ)
   oBrow:itemMarked  := {| | Entrgg1(oBrow) }
   oBrow:cursorMode  := 3
   oBrow:forceStable()
   oBrow:show()




   oXbp := XbpStatic():new( drawingArea, , {50,310}, {120,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÝáÖ·óëÖ¦·å¨Ð"
   *oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {84,265}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {48,210}, {120,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "×¦¢¨á· á ÒÆ "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {60,165}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "×¦¢¨á· åáÆ Ð "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {60,120}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "×¦¢¨á· ÆÖûÔ·¤·"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {700,360}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "¡ÒÖáå·ó¨á Øá¨¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {700,312}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "¡ÒÖáå·ó¨á ó ¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {700,260}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Ó¨Ôçë û Øá¨¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {700,216}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "Ó¨Ôçë û ó ¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {700,120}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ô Øû Ô·Æ ó ¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {700,168}, {108,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ô Øû Ô·Æ Øá¨¦¨Ô"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {48,72}, {120,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "§Ö¦ åÔ  ÖØá¨Ò "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {84,24}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "äÐ·Æ "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   //broj na velosiped

   oXbp := XbpSLE():new( drawingArea, , {192,360}, {40,24} )
   oXbp:tabStop := .T.
   oXbp:clipSiblings:=.T.
   oXbp:bufferLength:= 3
   //oXbp:editable   := .F.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, brojj, brojj:=x )}
   oXbp:create()
   AAdd( getList, oXbp )


   oXbp := XbpSLE():new( drawingArea, , {192,312}, {180,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:clipSiblings:=.T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, proiz, proiz:=x )}
   oXbp:setFontCompoundName( "11.Courier New Cyr" )
   oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
                         SetAppFocus(oXbp), NIL ) }
   oXbp:setInputFocus := { |u1,u2,o| o:getdata(), proiz :=Lat2Kir(proiz,o),o:setData()}
   oXbp:create()
   AAdd( getList, oXbp )

   // model

   oXbp := XbpSLE():new( drawingArea, , {192,264}, {180,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, modell, modell:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   //materijal na ramka

  // oXbp := XbpCombobox():new( drawingArea, , {192,150}, {84,84}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
 //  oXbp:tabstop := .T.
 //  oXbp:create()
 //  oXbp:XbpSLE:dataLink := {|x| IIf( x==NIL, frame, frame := x ) }
 //  oXbp:XbpSLE:setData()
 //  bAction := {|mp1, mp2, obj| obj:XbpSLE:getData()}
 //  oXbp:ItemMarked := bAction

 //  FOR i := 1 TO 4
 //     oXbp:addItem( frames[i] )
 //  NEXT

 //  frames := NIL
 //  nEvent := 0


   oXbp := XbpSLE():new( drawingArea, , {192,210}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, frame, frame:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpPushButton():new( drawingArea, , {290,212}, {24,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := 210
   oXbp:setFontCompoundName( "9.Arial Cyr" )
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Ramka() }


   // golemina na trkalo


   oXbp := XbpSLE():new( drawingArea, , {192,165}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, trklo, trklo:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpPushButton():new( drawingArea, , {290,166}, {24,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := 210
   oXbp:setFontCompoundName( "9.Arial Cyr" )
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Trkala() }

  // oXbp := XbpCombobox():new( drawingArea, , {192,105}, {84,84}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
  // oXbp:tabstop := .T.
  // oXbp:create()
  // oXbp:XbpSLE:dataLink := {|x| IIf( x==NIL, trklo, trklo := x ) }
  // oXbp:XbpSLE:setData()
  // bAction := {|mp1, mp2, obj| obj:XbpSLE:getData()}
  // oXbp:ItemMarked := bAction

  // FOR i := 1 TO 5
  //    oXbp:addItem( trkla[i] )
  // NEXT

 //  trkla := NIL
 //  nEvent := 0


   ////// tip na kocnici

   oXbp := XbpSLE():new( drawingArea, , {192,120}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, brake, brake:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   oXbp := XbpPushButton():new( drawingArea, , {290,120}, {24,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := 210
   oXbp:setFontCompoundName( "9.Arial Cyr" )
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Kocnici() }

  // oXbp := XbpCombobox():new( drawingArea, , {192,60}, {84,84}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
 //  oXbp:tabstop := .T.
 //  oXbp:create()
 //  oXbp:XbpSLE:dataLink := {|x| IIf( x==NIL, brake, brake := x ) }
 //  oXbp:XbpSLE:setData()
  // bAction := {|mp1, mp2, obj| obj:XbpSLE:getData()}
 //  oXbp:ItemMarked := bAction

  // FOR i := 1 TO 6
  ///    oXbp:addItem( brakes[i] )
 //  NEXT

 //  brakes := NIL
 //  nEvent := 0


  // oXbp := XbpCheckBox():new( drawingArea, , {192,360}, {36,24}, { { XBP_PP_BGCLR, -255 } } )
  // oXbp:caption := "Ima"
  // oXbp:tabStop := .T.
  // oXbp:create()
  // oXbp:selected := {|| NIL }

   oXbp := XbpStatic():new( drawingArea, , {820,360}, {44,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   //amortizer preden

   oXbp := XbpSLE():new( drawingArea, , {884,360}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, amorp, amorp:=x )}
   oXbp:create()
   AAdd( getList, oXbp )


   oXbp := XbpStatic():new( drawingArea, , {820,312}, {44,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   //amortizer zaden

   oXbp := XbpSLE():new( drawingArea, , {884,312}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, amorz, amorz:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   //menuvac preden

   oXbp := XbpSLE():new( drawingArea, , {884,264}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, menupr, menupr:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   //menuvac zaden

   oXbp := XbpSLE():new( drawingArea, , {884,216}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, menuzad, menuzad:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   //zapcanik preden

   oXbp := XbpSLE():new( drawingArea, , {884,168}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, zappr, zappr:=x )}
   oXbp:create()
   AAdd( getList, oXbp )


   oXbp := XbpStatic():new( drawingArea, , {820,266}, {44,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {820,168}, {44,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpStatic():new( drawingArea, , {820,120}, {44,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   //zapcanik zaden

   oXbp := XbpSLE():new( drawingArea, , {884,120}, {84,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, zapzade, zapzade:=x )}
   oXbp:create()
   AAdd( getList, oXbp )



   oXbp := XbpStatic():new( drawingArea, , {820,216}, {44,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ÓÖ¦¨Ð"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   //dodatna oprema

   oXbp := XbpSLE():new( drawingArea, , {192,72}, {180,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, dodop, dodop:=x )}
   oXbp:create()
   AAdd( getList, oXbp )

   //SLIKA

   oSLE := XbpSLE():new( drawingArea, , {192,24}, {180,24} )
   oSLE:tabStop := .T.
   oSLE :bufferLength := 64
   oSLE:Datalink      := { |x| IIF( PCOUNT()==0, slikk, slikk:=x )}
   oSLE:cargo := ""
   oSLE:create()
   AAdd( getList, oSLE )

   //zabeleska sle

   oXbp := XbpSLE():new( drawingArea, , {490,72}, {180,24}, { { XBP_PP_BGCLR, XBPSYSCLR_ENTRYFIELD } } )
   oXbp:tabStop := .T.
   oXbp:Datalink      := { |x| IIF( PCOUNT()==0, zabe, zabe:=x )}
   oXbp:create()
   AAdd( getList, oXbp )


   oXbp := XbpStatic():new( drawingArea, , {388,72}, {84,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "ô ¢¨Ð¨õÆ "
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpPushButton():new( drawingArea, , {390,24}, {100,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "§Ö¦ ¦· ãÐ·Æ "
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Filesliki() }

   oXbp := XbpStatic():new( drawingArea, , {132,360}, {36,24}, { { XBP_PP_BGCLR, -255 } } )
   oXbp:caption := "£áÖŽ"
   oXbp:clipSiblings := .T.
   oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
   oXbp:create()

   oXbp := XbpPushButton():new( drawingArea, , {884,56}, {120,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "Õ¡ô¡§ Ç×Õ Ó©Õ¸"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| oDlg1:destroy() }


   oXbp := XbpPushButton():new( drawingArea, , {884,24}, {120,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "¸ôÑ©ô"
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Zatvor(),oDlg:destroy() }     // , PostAppEvent( xbeP_Quit )

   oXbp := XbpPushButton():new( drawingArea, , {520,16}, {130,40}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "¡êèâ¸â¡“©"
   oXbp:setFontCompoundName( "9.Arial Cyr" )
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Azugg() }

   oXbp := XbpPushButton():new( drawingArea, , {684,24}, {124,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
   oXbp:caption := "ô¡ÇÑèü¸"
   oXbp:setFontCompoundName( "9.Arial Cyr" )
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Zakluci() }

   //slikk = "slika"

   oDlg1:show()
   //Filesliki()

   SetAppWindow( oBrow )

// Õ¨Æ  Øá·Ò· ªÖÆçã · ÖëÖŽ ¨Æá Ô, ÔÖ...
   //SetAppFocus( oDlg1 )

   SetAppFocus( oBrow )

  nEvent := xbe_None
   DO WHILE nEvent <> xbeP_Close
     nEvent := AppEvent( @mp1, @mp2, @oXbp )
      oXbp:handleEvent( nEvent, mp1, mp2 )
   ENDDO
RETURN


******************************************************
*** BARANJE NA PRETHODNO VNESENA SIFRA NA OPERACIJA **
******************************************************
FUNCTION BarTab(aTabela,broj)
LOCAL i, mret
mret = .F.
FOR i = 1 TO LEN(aTabela)
   IF aTabela[i] = broj
      mret = .T.
      EXIT
   ENDIF
NEXT
RETURN mret

/////////////////////////////////////////
////////////////////////////////////
FUNCTION DodTab(aTabela,broj)
   AAdd(aTabela,broj)
RETURN nil


///////////////////////////////////////////////////////////////
//////////////////////////////////////////////



FUNCTION Azugg(oBrow)
LOCAL i, slog, pslog, ima

   SELECT 400
   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   slog = RECNO()

   IF slog = LASTREC()
      pslog = .T.
   ELSE
      pslog = .F.
   ENDIF

      REPLACE tocakW->proizvodit WITH proiz,;
              tocakW->model WITH modell, ;
              tocakW->broj WITH brojj,;
              tocakW->zabeleska WITH zabe,;
              tocakW->kocnici WITH brake,;
              tocakW->ramka WITH frame,;
              tocakW->trkala WITH trklo,;
              tocakW->amortzad WITH amorz,;
              tocakW->amortpred WITH amorp,;
              tocakW->dodopr WITH dodop,;
              tocakW->menpred WITH menupr,;
              tocakW->menzad WITH menuzad,;
              tocakW->zappred WITH zappr,;
              tocakW->zapzad WITH zapzade,;
              tocakW->slika WITH slikk
//msgbox("prefrli")
      IF pslog = .T.
         GOTO BOTTOM
         APPEND BLANK
             // sreduvanje na redni broevi (po dodavanje na nov slog)
         GOTO slog
        // oBrow:down()
      ENDIF

   // GOTO BOTTOM
//   ENDIF

 // oBrow:forceStable()
 // oBrow:refreshAll()

   Entrgg1(oBrow)

RETURN nil


//////////////////////////
//////////////////////////////////

FUNCTION Zakluci()

   SELECT 300
   Otvori("tocak",.F.)

   CLOSE 400
   SELECT 400
   Otvori("tocakW",.T.)

   DO WHILE !EOF()
      brojj = tocakw->broj
      IF LEN(ALLTRIM(brojj)) > 0  // dali vo brojj ima nekakov podatok
         SELECT 300
         LOCATE FOR brojj = tocak->broj
         IF !FOUND()
            APPEND BLANK
            REPLACE tocak->broj WITH brojj
         ENDIF

         IF RLOCK()
            REPLACE tocak->proizvodit WITH tocakW->proizvodit,;
                    tocak->model      WITH tocakW->model, ;
                    tocak->zabeleska  WITH tocakW->zabeleska,;
                    tocak->kocnici    WITH tocakW->kocnici,;
                    tocak->ramka      WITH tocakW->ramka,;
                    tocak->trkala     WITH tocakW->trkala,;
                    tocak->amortzad   WITH tocakW->amortzad,;
                    tocak->amortpred  WITH tocakW->amortpred,;
                    tocak->dodopr     WITH tocakW->dodopr,;
                    tocak->menpred    WITH tocakW->menpred,;
                    tocak->menzad     WITH tocakW->menzad,;
                    tocak->zappred    WITH tocakW->zappred,;
                    tocak->zapzad     WITH tocakW->zapzad,;
                    tocak->slika      WITH tocakW->slika,;
                    tocak->broj       WITH tocakW->broj
msgbox("prefrleno?")
         ENDIF
         SELECT 400
      ENDIF
      SKIP
   ENDDO

   CLOSE 300
msgbox("Uspesno azuriranje")
RETURN

/////////////////////////////////////////////////
///////////////////////////////////////////////
FUNCTION Entrgg1(oDlg1)
LOCAL i

   SELECT 400



   brojj   = tocakW->broj
   proiz   = tocakW->proizvodit
   modell  = tocakW->model
   trklo   = tocakW->trkala
   amorz   = tocakW->amortzad
   amorp   = tocakW->amortpred
   menupr  = tocakW->menpred
   menuzad = tocakW->menzad
   zappr   = tocakW->zappred
   zapzade = tocakW->zapzad
   frame   = tocakW->ramka
   zabe    = tocakW->zabeleska
   brake   = tocakW->kocnici
   dodop   = tocakW->dodopr
   //slikk   = tocakW->slika



   oBrow:forceStable()
   oBrow:refreshAll()

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT


RETURN NIL


///////////////////////////////////////
///////////////////////////////////////



FUNCTION Filesliki()

   // Create file dialog
   oFileDlg   := XbpFileDialog():new()
   oFileDlg:title := "slika"
   oFileDlg:fileFilters := { {"SLIKI", "*.BMP;*.JPG;*.PNG"},{"All Files","*.*"}}
   oFileDlg:create()

   // prefrli od fileDialog vo slikk variabla

   slikk := oFileDlg:open( oSLE:cargo )

   IF ! Empty( slikk )

      oSLE:setData( slikk )
   ENDIF


RETURN

/////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////



FUNCTION ReadFilePath( oFileDlg, oSLE )

        slikk := oFileDlg:open( oSLE:cargo )

   IF ! Empty( slikk )
    //  oSLE:cargo := slikk
      oSLE:setData( slikk )
     // SetAppWindow():setTitle( cFile )
   ENDIF
RETURN




////////////////////////////////////////////////////

FUNCTION Ramka(x1,y1,x2,y2,poz)
LOCAL i, sele, oBrowa

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   sele = SELECT()

   SELECT 10
   Otvori("ramka",.T.)
   //ZAP
  // APPEND FROM ucserget FOR !DELETED() .AND. ucserget->bris = " "

   SELECT 10
   GOTO TOP

   oBrowa := XbpBrowse():new( oDlg1,,{330,212}, {120,170},, .F. ):create()
   oBrowa :hScroll:=.F.
   oBrowa:setFontCompoundName("12.Courier New Cyr")
   oBrowa:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->ramka,FIELD->ramka:=x) }" )
   oBrowa:addColumn( bBlock,30,"â¡ÓÇ¡",,4)

   // navigation codeblocks for the browser
   oBrowa:skipBlock     := {|n| DbSkipper(n) }
   oBrowa:goTopBlock    := {| | DbGoTop()    }
   oBrowa:goBottomBlock := {| | DbGoBottom() }
   oBrowa:phyPosBlock   := {| | Recno()      }

   oBrowa:posBlock      := {| | OrdKeyNo()     }
   oBrowa:lastPosBlock  := {| | LASTREC()    }
   oBrowa:firstPosBlock := {| | 1            }
   oBrowa:itemSelected  := {| | EnterPodR(oBrowa,sele,poz)  }
   oBrowa:cursorMode    := 3
   oBrowa:show()
   SetAppFocus( oBrowa )


RETURN nil

/////////////////////////////////////////////
//////////////////////////////////////////////

FUNCTION Trkala(x1,y1,x2,y2,poz)
LOCAL i, sele, oBrowa

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   sele = SELECT()

   SELECT 20
   Otvori("trkala",.T.)
   //ZAP
  // APPEND FROM ucserget FOR !DELETED() .AND. ucserget->bris = " "

   SELECT 20
   GOTO TOP

   oBrowa := XbpBrowse():new( oDlg1,,{330,112}, {120,170},, .F. ):create()
   oBrowa :hScroll:=.F.
   oBrowa:setFontCompoundName("12.Courier New Cyr")
   oBrowa:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->trkala,FIELD->trkala:=x) }" )
   oBrowa:addColumn( bBlock,30,"æâÇ¡Ñ¡",,4)

   // navigation codeblocks for the browser
   oBrowa:skipBlock     := {|n| DbSkipper(n) }
   oBrowa:goTopBlock    := {| | DbGoTop()    }
   oBrowa:goBottomBlock := {| | DbGoBottom() }
   oBrowa:phyPosBlock   := {| | Recno()      }

   oBrowa:posBlock      := {| | OrdKeyNo()     }
   oBrowa:lastPosBlock  := {| | LASTREC()    }
   oBrowa:firstPosBlock := {| | 1            }
   oBrowa:itemSelected  := {| | EnterPodT(oBrowa,sele,poz)  }
   oBrowa:cursorMode    := 3
   oBrowa:show()
   SetAppFocus( oBrowa )


RETURN nil

////////////////////////////////////////////

FUNCTION Kocnici(x1,y1,x2,y2,poz)
LOCAL i, sele, oBrowa

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   sele = SELECT()

   SELECT 30
   Otvori("kocnici",.T.)
   //ZAP
  // APPEND FROM ucserget FOR !DELETED() .AND. ucserget->bris = " "

   SELECT 30
   GOTO TOP

   oBrowa := XbpBrowse():new( oDlg1,,{330,12}, {120,170},, .F. ):create()
   oBrowa :hScroll:=.F.
   oBrowa:setFontCompoundName("12.Courier New Cyr")
   oBrowa:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->kocnici,FIELD->kocnici:=x) }" )
   oBrowa:addColumn( bBlock,30,"Ç×üÕ¸¥¸",,4)

   // navigation codeblocks for the browser
   oBrowa:skipBlock     := {|n| DbSkipper(n) }
   oBrowa:goTopBlock    := {| | DbGoTop()    }
   oBrowa:goBottomBlock := {| | DbGoBottom() }
   oBrowa:phyPosBlock   := {| | Recno()      }

   oBrowa:posBlock      := {| | OrdKeyNo()     }
   oBrowa:lastPosBlock  := {| | LASTREC()    }
   oBrowa:firstPosBlock := {| | 1            }
   oBrowa:itemSelected  := {| | EnterPodK(oBrowa,sele,poz)  }
   oBrowa:cursorMode    := 3
   oBrowa:show()
   SetAppFocus( oBrowa )


RETURN nil
///////////////////////////////////////////
FUNCTION EnterPodR(oBrowa,sele,poz)
LOCAL i
   frame = ramka->ramka

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
   oBrowa:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

RETURN nil

////////////////////////////////////////////
FUNCTION EnterPodT(oBrowa,sele,poz)
LOCAL i
   trklo = trkala->trkala
   //mnazpod = ucsergetw->nazpod
   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
   oBrowa:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

RETURN nil

//////////////////////////////////////
FUNCTION EnterPodK(oBrowa,sele,poz)
LOCAL i
   brake = kocnici->kocnici
   //mnazpod = ucsergetw->nazpod
   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
   oBrowa:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

RETURN nil

////////////////////////////////

FUNCTION Zatvor()
   aktivno = .F.
   COMMIT
   CLOSE DATABASES
RETURN nil
































///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////redundant//////////////////

/*FUNCTION Dalimoze(oDlg)
LOCAL i

       SELECT 400

//msgbox("Brojot veke go ima, cao1!")
      // Otvori("tocak",.T.)
// msgbox("Brojot veke go ima, cao2!")

     //  proiz = tocak->proizvodit

       FOR i = 1 TO LEN(getList)
       getList[i]:getData()
       NEXT



       LOCATE FOR tocakW->broj = brojj
msgbox("locate for tocakW->broj",tocakW->broj,"ova e brojj", brojj)

       IF FOUND()

msgbox("£áÖŽÖå ë¨–¨ ¬Ö ·Ò  ëÖ ¨ë·¦¨Ô¤·Ž . ×¦¢¨á· ¦áç¬ ¢áÖŽ!")

       Prikazi()

       // oXbp := XbpPushButton():new( oDlg1, , {384,648}, {120,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
      //  oXbp:caption := "Ýá·Æ é·"
      //  oXbp:tabStop := .T.
      //  oXbp:create()
      // oXbp:activate := {|| Prikazi() }

       ENDIF

       IF !FOUND()
msgbox("äÐÖ¢Ö¦¨Ô ¢áÖŽ. §ÖóëÖÐ¨ÔÖ ëÔ¨ãçë ’¨!")


        oXbp := XbpPushButton():new( oDlg1, , {470,16}, {130,40}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
        oXbp:caption := "ìÔ¨ã· ë¨ÐÖã·Ø¨¦"
        oXbp:setFontCompoundName( "9.Arial Cyr" )
        oXbp:tabStop := .T.
        oXbp:create()
        oXbp:activate := {|| Azugg() }

         ENDIF


RETURN   */

////////////////////////////////////////
///////////////////////////////////////

/*FUNCTION Prikazi()
LOCAL i //, oXbp, oDlg1

SELECT 400
Otvori("tocakW",.T.)

   LOCATE FOR tocakW->broj = brojj
msgbox("ova e tocakW->broj"+tocakW->broj, tocakW->broj)

   proiz   = tocakW->proizvodit
   modell  = tocakW->model
   trklo   = tocakW->trkala
   amorz   = tocakW->amortzad
   amorp   = tocakW->amortpred
   menupr  = tocakW->menpred
   menuzad = tocakW->menzad
   zappr   = tocakW->zappred
   zapzade = tocakW->zapzad
   frame   = tocakW->ramka
   zabe    = tocakW->zabeleska
   brake   = tocakW->kocnici
   dodop   = tocakW->dodopr

   FOR i = 1 TO LEN(getList)
       getList[i]:setData()
   NEXT



    Dugme()

RETURN NIL  */

///////////////////////////////////////
///////////////////

/*FUNCTION Dugme()

        oXbp := XbpPushButton():new( oDlg1, , {470,16}, {130,40}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
        oXbp:caption := "Zakluci"
        oXbp:setFontCompoundName( "9.Arial Cyr" )
        oXbp:tabStop := .T.
        oXbp:create()
        oXbp:activate := {|| Azuriranje() }
RETURN */
//////////////////////////////////////
//////////////////////////////////////

/*FUNCTION Azuriranje()
LOCAL i, slog, pslog, ima


   SELECT 400
   Otvori("tocakW",.T.)
   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   slog = RECNO()

   IF slog = LASTREC()
      pslog = .T.
   ELSE
      pslog = .F.
   ENDIF


   ima = BarTab(aTabela,brojj)
msgbox("koregirano1")
                                */
    // FOR i = 1 TO LEN(getList)
   //   getList[i]:setData()
   //  NEXT
     //IF RLOCK()
     // DO WHILE EOF()
       //     brojj = tocak->broj
   /*    ima = BarTab(aTabela,brojj)

   IF ima = .F.
      DodTab(aTabela,broj)
      proiz   = tocakW->proizvodit
      modell  = tocakW->model
      trklo   = tocakW->trkala
      amorz   = tocakW->amortzad
      amorp   = tocakW->amortpred
      menupr  = tocakW->menpred
      menuzad = tocakW->menzad
      zappr   = tocakW->zappred
      zapzade = tocakW->zapzad
      frame   = tocakW->ramka
      zabe    = tocakW->zabeleska
      brake   = tocakW->kocnici
      dodop   = tocakW->dodopr

      IF pslog = .T.
         GOTO BOTTOM
         APPEND BLANK
             // sreduvanje na redni broevi (po dodavanje na nov slog)
         GOTO slog
         oBrow:down()
      ENDIF


   ENDIF

   /*    LOCATE FOR tocakW->broj = brojj
msgbox(">>tocakWbroj"+tocakW->broj+"<< >>brojj"+brojj+"<<", str(recno()))

       //  IF !FOUND()
//msgbox("found")

         REPLACE tocakW->proizvodit WITH proiz,;
                 tocakW->model WITH modell, ;
                 tocakW->broj WITH brojj,;
                 tocakW->zabeleska WITH zabe,;
                 tocakW->kocnici WITH brake,;
                 tocakW->ramka WITH frame,;
                 tocakW->trkala WITH trklo,;
                 tocakW->amortzad WITH amorz,;
                 tocakW->amortpred WITH amorp,;
                 tocakW->dodopr WITH dodop,;
                 tocakW->menpred WITH menupr,;
                 tocakW->menzad WITH menuzad,;
                 tocakW->zappred WITH zappr,;
                 tocakW->zapzad WITH zapzade,;
                 tocakW->slika WITH slikk
     COMMIT
     CLOSE 400

 //    oXbp := XbpPushButton():new( oDlg1, , {384,648}, {120,24}, { { XBP_PP_BGCLR, XBPSYSCLR_BUTTONMIDDLE }, { XBP_PP_FGCLR, -58 } } )
 //    oXbp:caption := "Zakluci"
 //    oXbp:tabStop := .T.
 //    oXbp:create()
 //    oXbp:activate := {|| Zakluci() }


//msgbox(modell)
          /*     tocak->zabeleska WITH zabe,;
              tocak->kocnici WITH brake,;
              tocak->ramka WITH frame,;
              tocak->trkala WITH trklo,;
              tocak->amortzad WITH amorz,;
              tocak->amortpred WITH amorp,;
              tocak->dodopr WITH dodop,;
              tocak->menpred WITH menupr,;
              tocak->menzad WITH menuzad,;
              tocak->zappred WITH zappr,;
              tocak->zapzad WITH zapzade,;
              tocak->slika WITH slikk   */
               /*
      // ENDIF
//msgbox("i sega")
    //  ENDDO
    // IF pslog = .T.
     //    GOTO BOTTOM
        * APPEND BLANK
              // sreduvanje na redni broevi (po dodavanje na nov slog)
      //   GOTO slog
         *oDlg:down()

    //  ENDIF

//tocak->broj WITH brojj,;

//msgbox("koregirano rep")



//msgbox("koregirano2")



   // COMMIT
//msgbox("koregiranocomm")
  //  CLOSE 300
//msgbox("koregiranocloss")


//msgbox("koregiranoskroz")
        Entrgg1()
RETURN NIL    */

/////////////////////////////////////////////////////
////////////////////////////////////////////////////
/*FUNCTION Gotov11()
   IF mizlez = .F.
      RETURN nil
   ENDIF

   SELECT 10
   Otvori("buc01",.F.)

   CLOSE 100
   SELECT 100
   Otvori(mdir3+"buc01w",.T.)
   DO WHILE !EOF()
      msifpod = buc01w->sifpod
      IF msifpod <> 0  // dali vo msifpod ima nekakov podatok
      //   LEN(ALLTRIM(csifpod)) > 0   // pretpostavka csifpod = CHR(10) "          " => ""

         SELECT 10
         LOCATE FOR msifpod = buc01->sifpod
         IF !FOUND()
            APPEND BLANK
            REPLACE buc01->sifpod   WITH msifpod
         ENDIF
         IF RLOCK()
            REPLACE buc01->nazpod  WITH buc01w->nazpod, ;
                    buc01->L_d     WITH buc01w->L_d   , ;
                    buc01->L_v     WITH buc01w->L_v   , ;
                    buc01->L_n     WITH buc01w->L_n   , ;
                    buc01->bris    WITH buc01w->bris, ;
                    buc01->rbr WITH buc01w->rbr ,;
                    buc01->korisn  WITH mkorisn
         ENDIF
         SELECT 100
      ENDIF
      SKIP
   ENDDO

   CLOSE 10
   MsgBox("¸óëáõ·ëå¨ çØ·ã ëÖ õ·ªá áÔ·ÆÖå","èãØ¨õÔÖ!")

   mizlez = .F.
   Izlez11()
RETURN nil  */
/////////////////////////////////////////////////////////////////////
/*FUNCTION Entr11(oBrow)
LOCAL i
   SELECT 100
   mrbr    = buc01w->rbr
   msifpod = buc01w->sifpod
   mnazpod = buc01w->nazpod
   mL_d    = buc01w->L_d
   mL_v    = buc01w->L_v
   mL_n    = buc01w->L_n

   IF msifpod == 0
      getList[1]:editable := .T.
      getList[1]:configure()
      SetAppFocus( getList[1] )
   ELSE
      getList[1]:editable := .F.
      getList[1]:configure()
      SetAppFocus( getList[2] )
   ENDIF

   oBrow:forceStable()
   oBrow:refreshAll()

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT
RETURN nil   */

//FUNCTION Frbr(odbaza)
  // REPLACE (odbaza)->rbr WITH nrbr
   //nrbr = nrbr + 1
//RETURN .T.


///////////////////////////////////////////////////
//////////////////////////////////////////////

/*
PROCEDURE Filesliki()
   LOCAL  oXbp
  // LOCAL oSLE, oFileDlg//, oDlgs // oD2s//, oDfile



   //SetColor("N/W")
   //CLS
   //oDlgS           := XbpDialog():new( AppDesktop(), , {1000,230}, {400,200} )
  // oDlgS:taskList  := .T.
  // oDlgS:icon      := 203
   //oDlgS:close     := {|| oDlgS:destroy() }
  // oDlgS:maxButton := .T.
  /// oDlgS:minButton := .T.
   //oDlgS:hasMenubar := .T.
  // oDlgS:border    := 12
  // oDlgS:create()

  // drawingArea := oDlgS:drawingArea
  // drawingArea:setFontCompoundName( "9.Arial Cyr" )

  // SetAppWindow( oDlgS )
  // SetAppFocus( oDlgS )


  // Create file dialog with desktop as parent
   oFileDlg   := XbpFileDialog():new()
   oFileDlg:title := "slika"
   oFileDlg:fileFilters := { {"SLIKI", "*.BMP;*.JPG;*.PNG"}  }
   oFileDlg:create()

    // Create SLE
  // oXbp       := XbpSLE():new():create(oDlg1 ,, {100,100}, {350,24} )
   //oSLE:Datalink      := { |x| IIF( PCOUNT()==0, slikafile, slikafile:=x )}
  // oXbp:cargo := ""

   // Default menu for managing text files
  // TextFileMenu( oDlgs:menuBar(), oFileDlg, oSLE )
     slikk := oFileDlg:open( oXbp )
     Entrgg1(oDlg1)
    // ReadFilePath( oFileDlg, oXbp )
//    Event loop
 //  nEvent := 0
 //  DO WHILE nEvent <> xbeP_Close
 //     nEvent := AppEvent( @mp1, @mp2, @oXbp )
 //     oXbp:HandleEvent( nEvent, mp1, mp2 )
 //  ENDDO
RETURN

//FUNCTION Entrgg1(oDlg1)
//LOCAL i

 //  SELECT 400
  // oBrow:forceStable()
  // oBrow:refreshAll()

  // FOR i = 1 TO LEN(getList)
   //   getList[i]:setData()
  // NEXT


//RETURN NIL

//FUNCTION TextFileMenu( oMenuBar, oFileDlg, oSLE )
  // LOCAL oMenu := XbpMenu():new(oMenuBar):create()

 //  oMenu:title := "~File"
  //

 //  oMenu:addItem( { "~New", ;
  //    {|| oSLE:setData(""), oSLE:cargo := "", ;
   //       SetAppWindow():setTitle( "No name" ), ;
    //      oMenu:disableItem(4) } } )

  // oMenu:addItem( { "~Open...", ;

        //  IIf( Empty(oSLE:cargo), NIL, oMenu:enableItem(1)) } } )


  // oMenu:addItem( { ,, XBPMENUBAR_MIS_SEPARATOR,0 } )


 //  oMenu:addItem( { "~Save", ;
  //    {|| WriteFile( oSLE:cargo, oMLE ) }, ;
  //    0, XBPMENUBAR_MIA_DISABLED } )


   //oMenu:addItem( { "Save ~as...", ;
     // {|| WriteFile( oFileDlg:saveAs( oSLE:cargo ), oMLE ) } } )


   //oMenuBar:addItem( {oMenu, NIL} )

//RETURN oMenu

FUNCTION ReadFilePath( oFileDlg, oXbp )
    slikk := oFileDlg:open( oXbp )

  // IF ! Empty( slikk )
    //  oXbp:cargo := slikk
     // oXbp:setData( slikk )
//msgbox(cfile)

//msgbox("cfile1")
   //   SetAppWindow():setTitle( "äÐ·Æ " )
  // ENDIF
    //oDlg1:forceStable()
   //oDlg1:refreshAll()
     //oDlgs:destroy()
     // slikk = cFile
      Entrgg1(oDlg1)
    //sleslika()
RETURN

//FUNCTION sleslika()
//msgbox(cFile,"slikk")
   //   oDlgs:destroy()
    //  slikk = cFile
     // Entrgg1(oDlg1)
   // oDlg1:refreshall()

//RETURN

// **************************************
// Write text buffer of the MLE to file
//
//PROCEDURE WriteFile( cFile, oSLE )
 //  IF ! Empty( cFile )
 //     oSLE:cargo := cFile
 //     MemoWrit( cFile, oSLE:getData() )
 //     SetAppWindow():setTitle( cFile )
 //  ENDIF
//RETURN*/