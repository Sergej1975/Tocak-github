
FUNCTION Izvestaj()
LOCAL nEvent, oDlgI ,oXbp, aEditControls := {}
PUBLIC  drawingArea1, mizbor, mizborI, gol_lst , zbirVK, zbirRA, zbirSF , zbirDK , zbirT26 , zbirT700




    mizbor = SPACE(20)
    mizborI = SPACE(20)
    zbirVK = 0   //vkupno V brake kocnici
    zbirRA = 0   //vkupno aluminiumska ramka
    zbirSF = 0   //vkupno celicni ramki, hi ten plus cro mo
    zbirDK = 0   //vkupno disk kocnici, hidrailicni plus mehanicki
    zbirT26 = 0  //vkupno so trkala 26'
    zbirT700 = 0 //vkupno so trkala 700C

    oDlgI :=XbpDialog():new(oDlg,,{5,4},{1035,703} )
    oDlgI:taskList := .T.
    oDlgI:title := "IZVESTAJ"
    oDlgI:icon := 203
    //oDlg1:close := {|| oDlgI:destroy() }
    oDlgI:create()

    drawingArea1 := oDlgI:drawingArea
    drawingArea1:setFontCompoundName( "9.Arial Cyr" )


    oXbp := XbpStatic():new( drawingArea1, , {50,600}, {120,24} )
    oXbp:caption := "����堎 ���ᨦ:"
   *oXbp:setFontCompoundName( "11.Courier New Cyr" )
    oXbp:clipSiblings := .T.
   // oXbp:options := XBPSTATIC_TEXT_VCENTER+XBPSTATIC_TEXT_RIGHT
    oXbp:create()

    oXbp := XbpSLE():new( drawingArea1, , {155, 603},{ 120,24})
    oXbp:clipSiblings := .T.
    oXbp:tabStop      := .T.
    oXbp:editable     := .F.
    oXbp:setFontCompoundName( "11.Courier New Cyr" )
   // oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
   //                      SetAppFocus(oXbp), NIL ) }
    oXbp:Datalink      := { |x| IIF( PCOUNT()==0, mizbor, mizbor:=x )}
    oXbp:setInputFocus := { |u1,u2,o| o:getdata(), mizbor :=Lat2Kir(mizbor,o),o:setData()}
    oXbp:create()
    AAdd( getList, oXbp )

    oXbp := XbpSLE():new( drawingArea1, , {325, 603},{ 120,24})
    oXbp:clipSiblings := .T.
    oXbp:tabStop      := .T.
    oXbp:editable     := .F.
    oXbp:setFontCompoundName( "11.Courier New Cyr" )
   // oXbp:keyboard     := {| nKey,x,obj | IIf( nKey == xbeK_RETURN, ;
   //                      SetAppFocus(oXbp), NIL ) }
    oXbp:Datalink      := { |x| IIF( PCOUNT()==0, mizborI, mizborI:=x )}
    oXbp:setInputFocus := { |u1,u2,o| o:getdata(), mizborI :=Lat2Kir(mizborI,o),o:setData()}
    oXbp:create()
    AAdd( getList, oXbp )

    oXbp := XbpPushbutton():new(drawingArea1, , {280, 603}, {24,24})
    oXbp:caption := 210
    oXbp:activate := {|| Izbor() }
    oXbp:create()

    //oXbp := XbpPushbutton():new(drawingArea1, , {450, 603}, {24,24})
    //oXbp:caption := 210
    //oXbp:activate := {|| RamkaI() }
   // oXbp:create()


    oXbp := XbpPushbutton():new(drawingArea1, , {785, 603}, {155,24})
    oXbp:caption := "��Ơ� ���ب� ����堎"
    oXbp:activate:= {|| BarajI() }
    oXbp:create()

    oXbp := XbpPushbutton():new(drawingArea1, , {455, 603}, {155,24})
    oXbp:caption := "����堎 ���ᨦ ����"
    oXbp:activate:= {|| BarajII() }
    oXbp:create()

    oXbp := XbpPushbutton():new(drawingArea1, , {785, 553}, {155,24})
    oXbp:caption := "ա��� ��� өո"
    oXbp:activate:= {|| oDlgI:destroy() }
    oXbp:create()

    oXbp := XbpPushbutton():new(drawingArea1, , {785, 503}, {155,24})
    oXbp:caption := "��ѩ�"
    oXbp:activate:= {|| Zatvor(), oDlg:destroy()}
    oXbp:create()

RETURN
////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
FUNCTION Izbor(x1,y1,x2,y2,poz)
LOCAL i, sele, oBrowaI

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   sele = SELECT()

   SELECT 40
   Otvori("izbor",.T.)

   SELECT 40
   GOTO TOP

   oBrowaI := XbpBrowse():new( drawingArea1,,{155, 490}, {120,105},, .F. ):create()
   oBrowaI :hScroll:=.F.
   oBrowaI:setFontCompoundName("12.Courier New Cyr")
   oBrowaI:KillInputFocus := {|u1,u2,o| DbSelectArea(40) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->izbor,FIELD->izbor:=x) }" )
   oBrowaI:addColumn( bBlock,30,"�����",,4)

   // navigation codeblocks for the browser
   oBrowaI:skipBlock     := {|n| DbSkipper(n) }
   oBrowaI:goTopBlock    := {| | DbGoTop()    }
   oBrowaI:goBottomBlock := {| | DbGoBottom() }
   oBrowaI:phyPosBlock   := {| | Recno()      }

   oBrowaI:posBlock      := {| | OrdKeyNo()     }
   oBrowaI:lastPosBlock  := {| | LASTREC()    }
   oBrowaI:firstPosBlock := {| | 1            }
   oBrowaI:itemSelected  := {| | EnterPodI(oBrowaI,sele,poz)  }
   oBrowaI:cursorMode    := 3
   oBrowaI:forceStable()
   oBrowaI:show()

  // SetAppWindow( oBrowaI )
   SetAppFocus( oBrowaI )

  // oBrowaI:forceStable()
  // oBrowaI:refreshAll()

RETURN nil

FUNCTION EnterPodI(oBrowaI,sele,poz)
LOCAL i

   mizbor = izbor->izbor

   FOR i = 1 TO LEN(getList)
       getList[i]:setData()
   NEXT

   oBrowaI:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

   IzborIR()

RETURN nil
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
FUNCTION Prikazi(o,lista,yy,prazni)
LOCAL cText, oMle

   cText = ""
   SELECT 55
   Otvori("nodlst",.T.)        // nodlst  ==> za listi
   GOTO TOP
   DO WHILE !EOF()
      cText = cText + SPACE(prazni) + (lista)->txt + CHR(13) + CHR(10)
      SKIP
   ENDDO

   oMLE          := XbpMLE():new( o, , {6,6}, {1000,yy})
   oMLE:wordWrap :=.F.
   oMLE:setFontCompoundName( "11.Courier New Cyr" )
   oMLE:dataLink := {|x| IIf( x==NIL, cText, cText := x ) }
//   oMLE:editable := .F.
   oMLE:create()
   oMLE:setData()
   setAppFocus(o)


RETURN nil
/////////////////////////////////////////////////////////////
///////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////

****************************************************

*****************************************************
FUNCTION BarajI()

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   SELECT 300
   Otvori("tocak",.F.)


   SELECT 400
   Otvori("tocakW",.T.)
   ZAP


   SELECT 300
   DO WHILE !EOF()


         SELECT 400
         APPEND BLANK

            REPLACE tocakw->proizvodit WITH tocak->proizvodit,;
                    tocakw->model      WITH tocak->model, ;
                    tocakw->zabeleska  WITH tocak->zabeleska,;
                    tocakw->kocnici    WITH tocak->kocnici,;
                    tocakw->ramka      WITH tocak->ramka,;
                    tocakw->trkala     WITH tocak->trkala,;
                    tocakw->amortzad   WITH tocak->amortzad,;
                    tocakw->amortpred  WITH tocak->amortpred,;
                    tocakw->dodopr     WITH tocak->dodopr,;
                    tocakw->menpred    WITH tocak->menpred,;
                    tocakw->menzad     WITH tocak->menzad,;
                    tocakw->zappred    WITH tocak->zappred,;
                    tocakw->zapzad     WITH tocak->zapzad,;
                    tocakw->slika      WITH tocak->slika,;
                    tocakw->broj       WITH tocak->broj

      IF tocak->kocnici = "V-brake"
         zbirVK = zbirVK + 1
      ENDIF
      IF tocak->ramka = "Aluminium"
         zbirRA = zbirRA + 1
      ENDIF
      IF tocak->ramka = "CroMo steel"
         zbirSF = zbirSF + 1
      ENDIF
      IF tocak->ramka = "Hi-ten steel"
         zbirSF = zbirSF + 1
      ENDIF
      IF tocak->kocnici = "Disk-mechanic"
         zbirDK = zbirDK + 1
      ENDIF
      IF tocak->kocnici = "Disk-hidraulic"
         zbirDK = zbirDK + 1
      ENDIF
      IF tocak->trkala = "26'"
         zbirT26 = zbirT26 + 1
      ENDIF
      IF tocak->trkala = "700C"
         zbirT700 = zbirT700 + 1
      ENDIF


      SELECT 300
      SKIP
   ENDDO

   CLOSE 300
   SELECT 400

   ListaI()
   Prikazi(drawingArea1,"nodlst",420,0)

RETURN nil

**********************************************
*** PRAVI LISTA  - PECATENJE               ***
**********************************************
FUNCTION ListaI()
LOCAL xrbr
   SELECT 55
   Otvori("nodlst",.T.)
   ZAP
//msgbox("8")
   SET SOFTSEEK OFF
   gol_lst = 132
   mstra    = 1
   odstrana = 1
   dostrana = 0
   mbred    = 0



   ZaglI()
   xrbr = 0
   //cStatus = "������ա"
   SELECT 400
   GOTO TOP            // reden broj
//msgbox("9")
     DO WHILE !EOF()


      xrbr = xrbr + 1           // reden broj
      SELECT 55
      APPEND BLANK
      nodlst->esc  = "(70X"
      nodlst->txt = STR(xrbr,1) +"   |  "+ tocakw->broj +" "+ tocakw->proizvodit + tocakw->model +tocakw->ramka+;
                   tocakw->trkala  + "" + tocakw->kocnici + "" + tocakw->amortpred + ""+ tocakw->amortzad +;
                    tocakw->menpred +""+tocakw->menzad+""+tocakw->zappred+""+tocakw->zapzad+""+tocakw->dodopr+""+tocakw->zabeleska+"*"

      mbred = mbred + 1
      IF mbred > 45
         SELECT 55
         APPEND BLANK
         nodlst->esc = ""
         ZaglI()
      ENDIF
      SELECT 400
      SKIP
   ENDDO
   SELECT 55
   APPEND BLANK
  // APPEND BLANK
  // nodlst->esc  = "(70X"
  // nodlst->txt = "���ب� ��֎ Ԡ ������: "+ STR(xrbr,1)
  // APPEND BLANK
   nodlst->esc  = "(70X"
   nodlst->txt = REPLICATE("=",276)
//msgbox("11")
//   mbred = mbred + 1
   IF mbred > 35
      APPEND BLANK
      nodlst->esc = ""
      dostrana = dostrana + 1

   ENDIF
   SELECT 55

   APPEND BLANK
   nodlst->txt  = "���ب� ��֎ Ԡ ������:"+ STR(xrbr,2)
   APPEND BLANK
  // APPEND BLANK
   nodlst->txt  = "��֎ Ԡ ������ �� ���� ���Է��:" + STR(zbirDK,2)
   APPEND BLANK
  // APPEND BLANK
   nodlst->txt  = "��֎ Ԡ ������ �� V-brake ���Է��:" + STR(zbirVK,2)
   APPEND BLANK
  // APPEND BLANK
   nodlst->txt  = "��֎ Ԡ ������ �� ���ҷԷ���Ơ ��Ơ:" + STR(zbirRA,2)
   APPEND BLANK
  // APPEND BLANK
   nodlst->txt  = "��֎ Ԡ ������ �� ��з�Ԡ ��Ơ:" + STR(zbirSF,2)
   APPEND BLANK
  // APPEND BLANK
   nodlst->txt  = "��֎ Ԡ ������ �� ��ШҷԠ Ԡ ��ƠР 26':" + STR(zbirT26,2)
   APPEND BLANK
  // APPEND BLANK
   nodlst->txt  = "��֎ Ԡ ������ �� ��ШҷԠ Ԡ ��ƠР 700C:" + STR(zbirT700,2)




   nodlst->esc = "%-12345X"
   GOTO TOP
RETURN nil
****************
*** ZAGLAVIE ***
****************
FUNCTION ZaglI()

   dostrana = dostrana + 1
   SELECT 55
   //APPEND BLANK
  // nodlst->esc  = "(71X"
   //nodlst->txt = mizbor + SPACE(98) + "����桏"
  // APPEND BLANK
  // nodlst->txt = mizbor + SPACE(98) + "���." + STR(mstra,2)
   APPEND BLANK
   nodlst->txt = "��������"
   APPEND BLANK
   APPEND BLANK
   nodlst->esc  = "(71X"
   nodlst->txt = SPACE(55) + "�⩭ѩ� ա ���ݩ� ��׏ ������"
   APPEND BLANK
   //nodlst->txt = SPACE(51) + "צ: " + mizbor + "  ��: "+ mizbor
   APPEND BLANK
   APPEND BLANK
// nodlst->esc  = "////(70X"
   nodlst->txt  = REPLICATE("*",276)
   APPEND BLANK

   nodlst->txt  = "�.��"+"|  ��  ��׸��ק���"+SPACE(14)+"�ק��" +SPACE(18)+ " ��ǡ" +SPACE(13)+  "��ǡѡ"+SPACE(8)+;
                  "���ո��" +SPACE(7)+ "�������� �⩧��"+SPACE(3)+"�������� �����"+SPACE(7)+"ө���� �⩧��";
                  +SPACE(8)+"ө���� �����"+SPACE(6)+"�����ո� �⩧��"+SPACE(5)+"�����ո� �����"+SPACE(6)+"�ק.���ӡ"+SPACE(12)+"����ѩ�ǡ"

   APPEND BLANK
   nodlst->txt = REPLICATE("*",276)
   mbred = 10
   mstra = mstra + 1
   SELECT 400
RETURN nil
////////////////////////////////////////////////////
////////////////////////////////////////////////////
FUNCTION Isspp(Lista)      //bobi
LOCAL ui, sod

            MSGBOX("GET_LIST:"+valtype(Lista),"len:"+str(len(Lista),5))
            for ui=1 to len(Lista)
               sod = (Lista)[ui]:getData()
               if valtype(sod) = "C"
                  MSGBOX("i:"+str(ui,2),">"+sod+"<")
               endif
               if valtype(sod) = "N"
                  MSGBOX("i:"+str(ui,2),">"+str(sod,12,2)+"<")
               endif
               if valtype(sod) = "D"
                  MSGBOX("i:"+str(ui,2),">"+dtoc(sod)+"<")
               endif
            next

RETURN nil
/////////////////////////////////////////
FUNCTION RamkaI(x1,y1,x2,y2,poz)
LOCAL i, sele, oBrowa

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   sele = SELECT()

   SELECT 10
   Otvori("ramka",.T.)

   SELECT 10
   GOTO TOP

   oBrowa := XbpBrowse():new( drawingArea1,,{325,430}, {120,170},, .F. ):create()
   oBrowa :hScroll:=.F.
   oBrowa:setFontCompoundName("12.Courier New Cyr")
   oBrowa:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->ramka,FIELD->ramka:=x) }" )
   oBrowa:addColumn( bBlock,30,"��ǡ",,4)

   // navigation codeblocks for the browser
   oBrowa:skipBlock     := {|n| DbSkipper(n) }
   oBrowa:goTopBlock    := {| | DbGoTop()    }
   oBrowa:goBottomBlock := {| | DbGoBottom() }
   oBrowa:phyPosBlock   := {| | Recno()      }

   oBrowa:posBlock      := {| | OrdKeyNo()     }
   oBrowa:lastPosBlock  := {| | LASTREC()    }
   oBrowa:firstPosBlock := {| | 1            }
   oBrowa:itemSelected  := {| | EnterPodRI(oBrowa,sele,poz)  }
   oBrowa:cursorMode    := 3
   oBrowa:show()
   SetAppFocus( oBrowa )

RETURN nil

//////////////////////////////////////////////////////////////////
FUNCTION EnterPodRI(oBrowaI,sele,poz)
LOCAL i

   mizborI = ramka->ramka

   FOR i = 1 TO LEN(getList)
       getList[i]:setData()
   NEXT

   oBrowaI:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

   //IzborIR()

RETURN nil

////////////////////////////////////////////////////////////////////
FUNCTION IzborIR()

    IF mizbor = "��Ơ"
       RamkaI()
    ENDIF
    IF mizbor = "���Է��"
       KocniciI()
    ENDIF
    IF mizbor = "��ƠР"
       TrkalaI()
    ENDIF

RETURN
//////////////////////////////////////////////////////////////////////////
FUNCTION TrkalaI(x1,y1,x2,y2,poz)
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

   oBrowa := XbpBrowse():new( drawingArea1,,{325,430}, {120,170},, .F. ):create()
   oBrowa :hScroll:=.F.
   oBrowa:setFontCompoundName("12.Courier New Cyr")
   oBrowa:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->trkala,FIELD->trkala:=x) }" )
   oBrowa:addColumn( bBlock,30,"��ǡѡ",,4)

   // navigation codeblocks for the browser
   oBrowa:skipBlock     := {|n| DbSkipper(n) }
   oBrowa:goTopBlock    := {| | DbGoTop()    }
   oBrowa:goBottomBlock := {| | DbGoBottom() }
   oBrowa:phyPosBlock   := {| | Recno()      }

   oBrowa:posBlock      := {| | OrdKeyNo()     }
   oBrowa:lastPosBlock  := {| | LASTREC()    }
   oBrowa:firstPosBlock := {| | 1            }
   oBrowa:itemSelected  := {| | EnterPodTI(oBrowa,sele,poz)  }
   oBrowa:cursorMode    := 3
   oBrowa:show()
   SetAppFocus( oBrowa )


RETURN nil

FUNCTION EnterPodTI(oBrowaI,sele,poz)
LOCAL i

   mizborI = trkala->trkala

   FOR i = 1 TO LEN(getList)
       getList[i]:setData()
   NEXT

   oBrowaI:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

   //IzborIR()

RETURN nil

////////////////////////////////////////////

FUNCTION KocniciI(x1,y1,x2,y2,poz)
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

   oBrowa := XbpBrowse():new( drawingArea1,,{325,430}, {120,170},, .F. ):create()
   oBrowa :hScroll:=.F.
   oBrowa:setFontCompoundName("12.Courier New Cyr")
   oBrowa:KillInputFocus := {|u1,u2,o| DbSelectArea(100) }


   bBlock := &( "{|x| IIf(x==NIL,FIELD->kocnici,FIELD->kocnici:=x) }" )
   oBrowa:addColumn( bBlock,30,"���ո��",,4)

   // navigation codeblocks for the browser
   oBrowa:skipBlock     := {|n| DbSkipper(n) }
   oBrowa:goTopBlock    := {| | DbGoTop()    }
   oBrowa:goBottomBlock := {| | DbGoBottom() }
   oBrowa:phyPosBlock   := {| | Recno()      }

   oBrowa:posBlock      := {| | OrdKeyNo()     }
   oBrowa:lastPosBlock  := {| | LASTREC()    }
   oBrowa:firstPosBlock := {| | 1            }
   oBrowa:itemSelected  := {| | EnterPodKI(oBrowa,sele,poz)  }
   oBrowa:cursorMode    := 3
   oBrowa:show()
   SetAppFocus( oBrowa )


RETURN nil

FUNCTION EnterPodKI(oBrowaI,sele,poz)
LOCAL i

   mizborI = kocnici->kocnici

   FOR i = 1 TO LEN(getList)
       getList[i]:setData()
   NEXT

   oBrowaI:destroy()

   SELECT(sele)

   SetAppFocus( getList[1] )

   //IzborIR()

RETURN nil




FUNCTION Fred(rrr,gol)
IF gol = 80
   RETURN 2800 - (rrr-1) * 40
ENDIF
RETURN 1900 - (rrr-1) * 40

FUNCTION Fkol(kkk)
RETURN 100 + (kkk-1) * 70