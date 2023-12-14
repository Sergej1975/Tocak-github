FUNCTION BarajII()

   FOR i = 1 TO LEN(getList)
      getList[i]:getData()
   NEXT

   SELECT 300
   Otvori("tocak",.F.)  //glavna datoteka


   SELECT 400
   Otvori("tocakW",.T.)  //rabotna datoteka
   ZAP


   SELECT 300
   DO WHILE !EOF()

       IF mizborI = tocak->ramka .OR. mizborI = tocak->kocnici .OR. mizborI = tocak->trkala

          izborIII()

       ENDIF

      SELECT 300
      SKIP
   ENDDO

   CLOSE 300
   SELECT 400

   ListaII()
   Prikazi(drawingArea1,"nodlst",420,0)

RETURN nil

FUNCTION ListaII()
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



   ZaglII()
   xrbr = 0
   //cStatus = "ô¡ìâö©Õ¡"
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
         ZaglII()
      ENDIF
      SELECT 400
      SKIP
   ENDDO
   SELECT 55
   APPEND BLANK
  // APPEND BLANK
  // nodlst->esc  = "(70X"
  // nodlst->txt = "ìÆçØ¨Ô ¢áÖŽ Ô  åÖû ¤·: "+ STR(xrbr,1)
  // APPEND BLANK
   nodlst->esc  = "(70X"
   nodlst->txt = REPLICATE("=",276)
//msgbox("11")
//   mbred = mbred + 1
   IF mbred > 35
      APPEND BLANK
      nodlst->esc = ""
      dostrana = dostrana + 1
//      Zagl362()
   ENDIF
   SELECT 55

   APPEND BLANK
   APPEND BLANK
   nodlst->txt  = "ìÆçØ¨Ô ¢áÖŽ Ô  åÖû ¤· ãØÖá¨¦ ·ó¢Öá:   " + mizbor + mizborI + STR(xrbr)
       IF xrbr = 0
       msgbox("Õ¨Ò  ØÖ¦ åÖ¤· ãØÖá¨¦ ·ó¢á Ô·å¨ Ø á Ò¨åá·", "—×âæ×ü¡Ç")
       ENDIF

   APPEND BLANK
  // APPEND BLANK


   nodlst->esc = "%-12345X"
   GOTO TOP
RETURN nil

FUNCTION ZaglII()

   dostrana = dostrana + 1
   SELECT 55
   //APPEND BLANK
  // nodlst->esc  = "(71X"
   //nodlst->txt = mizbor + SPACE(98) + "¸ôì©öæ¡"
  // APPEND BLANK
  // nodlst->txt = mizbor + SPACE(98) + "äåá." + STR(mstra,2)
   APPEND BLANK
   nodlst->txt = "—×âæ×ü¡Ç"
   APPEND BLANK
   APPEND BLANK
   nodlst->esc  = "(71X"
   nodlst->txt = SPACE(55) + "Ýâ©­Ñ©§ Õ¡ æ×ü¡¥¸ äÝ×â©§ ¸ô£×â"
   APPEND BLANK
   //nodlst->txt = SPACE(51) + "×¦: " + mizbor + "  ¦Ö: "+ mizbor
   APPEND BLANK
   APPEND BLANK
// nodlst->esc  = "////(70X"
   nodlst->txt  = REPLICATE("*",276)
   APPEND BLANK

   nodlst->txt  = "â.£â"+"|  £á  Ýâ×¸ôì×§¸æ©Ñ"+SPACE(14)+"Ó×§©Ñ" +SPACE(18)+ " â¡ÓÇ¡" +SPACE(13)+  "æâÇ¡Ñ¡"+SPACE(8)+;
                  "Ç×üÕ¸¥¸" +SPACE(7)+ "¡Ó×âæ¸ô©â Ýâ©§©Õ"+SPACE(3)+"¡Ó×âæ¸ô©â ô¡§©Õ"+SPACE(7)+"Ó©Õèì¡ü Ýâ©§©Õ";
                  +SPACE(8)+"Ó©Õèì¡ü ô¡§©Õ"+SPACE(6)+"ô¡Ýü¡Õ¸Ç Ýâ©§©Õ"+SPACE(5)+"ô¡Ýü¡Õ¸Ç ô¡§©Õ"+SPACE(6)+"§×§.×Ýâ©Ó¡"+SPACE(12)+"ô¡£©Ñ©öÇ¡"

   APPEND BLANK
   nodlst->txt = REPLICATE("*",276)
   mbred = 10
   mstra = mstra + 1
   SELECT 400
RETURN nil

FUNCTION izborIII()

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
RETURN