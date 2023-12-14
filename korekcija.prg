/*FUNCTION Korekcija()
LOCAL i , oXbp, oDlg2

SELECT 300
*Otvori("tocak",.T.)

   proiz = tocak->proizvodit

   FOR i = 1 TO LEN(getList)
      getList[i]:setData()
   NEXT                                           




   oXbp := XbpPushButton():new( oDlg2, , {470,16}, {130,40} )
   oXbp:caption := "ÇÖá¨Æ¤·Ž "
   oXbp:setFontCompoundName( "9.Arial Cyr" )
   oXbp:tabStop := .T.
   oXbp:create()
   oXbp:activate := {|| Azugg() }


RETURN     */