**********************************************************
* Kirilica / Latinica za CP855 & Kodiranje / Dekodiranje *
**********************************************************
********************************************
* Pretvoranje MALI (cp855) bukvi vo GOLEMI *
********************************************
FUNCTION GolBuk855(ppp)
LOCAL abvg[255],i,aaa,rrr,sss
FOR i = 1 TO 255
   abvg[i] = i
NEXT
abvg[ 91] = 123
abvg[ 92] = 124
abvg[ 93] = 125
abvg[ 96] =  64
abvg[126] =  94

abvg[130] = 131
abvg[136] = 137
abvg[142] = 143
abvg[144] = 145
abvg[146] = 147
abvg[150] = 151
abvg[154] = 155
abvg[160] = 161
abvg[162] = 163
abvg[164] = 165
abvg[166] = 167
abvg[168] = 169
abvg[170] = 171
abvg[172] = 173
abvg[181] = 182
abvg[183] = 184
abvg[198] = 199
abvg[208] = 209
abvg[210] = 211
abvg[212] = 213
abvg[214] = 215
abvg[216] = 221   // OVA NE E GRESKA!
abvg[225] = 226
abvg[227] = 228
abvg[229] = 230
abvg[231] = 232
abvg[233] = 234
abvg[235] = 236
abvg[243] = 244
abvg[245] = 246
abvg[251] = 252
rrr = ""
FOR i = 1 TO LEN(ppp)
   aaa = SUBSTR(ppp,i,1)
   sss = ASC(aaa)
   rrr = rrr + CHR(abvg[sss])
NEXT
RETURN UPPER(rrr)
*******************
FUNCTION KirLat855(ppp)
LOCAL abvg[255],i,aaa,rrr,sss
FOR i = 1 TO 255
   abvg[i] = i
NEXT
abvg[130] = ASC("\")
abvg[131] = ASC("|")
abvg[136] = ASC("y")
abvg[137] = ASC("Y")
abvg[142] = ASC("j")
abvg[143] = ASC("J")
abvg[150] = ASC("]")
abvg[151] = ASC("}")
abvg[160] = ASC("a")
abvg[161] = ASC("A")
abvg[162] = ASC("b")
abvg[163] = ASC("B")
abvg[164] = ASC("c")
abvg[165] = ASC("C")
abvg[166] = ASC("d")
abvg[167] = ASC("D")
abvg[168] = ASC("e")
abvg[169] = ASC("E")
abvg[170] = ASC("f")
abvg[171] = ASC("F")
abvg[172] = ASC("g")
abvg[173] = ASC("G")
abvg[181] = ASC("h")
abvg[182] = ASC("H")
abvg[183] = ASC("i")
abvg[184] = ASC("I")
abvg[198] = ASC("k")
abvg[199] = ASC("K")
abvg[208] = ASC("l")
abvg[209] = ASC("L")
abvg[210] = ASC("m")
abvg[211] = ASC("M")
abvg[212] = ASC("n")
abvg[213] = ASC("N")
abvg[214] = ASC("o")
abvg[215] = ASC("O")
abvg[216] = ASC("p")   // OVA NE E GRESKA!
abvg[221] = ASC("P")   // OVA NE E GRESKA!
abvg[225] = ASC("r")
abvg[226] = ASC("R")
abvg[227] = ASC("s")
abvg[228] = ASC("S")
abvg[229] = ASC("t")
abvg[230] = ASC("T")
abvg[231] = ASC("u")
abvg[232] = ASC("U")
abvg[233] = ASC("`")
abvg[234] = ASC("@")
abvg[235] = ASC("v")
abvg[236] = ASC("V")
abvg[243] = ASC("z")
abvg[244] = ASC("Z")
abvg[245] = ASC("[")
abvg[246] = ASC("{")
abvg[251] = ASC("~")
abvg[252] = ASC("^")
rrr = ""
FOR i = 1 TO LEN(ppp)
   aaa = SUBSTR(ppp,i,1)
   sss = ASC(aaa)
   IF abvg[sss] <> 144 .AND. abvg[sss] <> 145 .AND. abvg[sss] <> 146 .AND. ;
      abvg[sss] <> 147 .AND. abvg[sss] <> 154 .AND. abvg[sss] <> 155
      rrr = rrr + CHR(abvg[sss])
   ENDIF
   IF abvg[sss] = 144
///// rrr = rrr + "lj"
      rrr = rrr + "q"
   ENDIF
   IF abvg[sss] = 145
///// rrr = rrr + "LJ"
      rrr = rrr + "Q"
   ENDIF
   IF abvg[sss] = 146
///// rrr = rrr + "nj"
      rrr = rrr + "w"
   ENDIF
   IF abvg[sss] = 147
///// rrr = rrr + "NJ"
      rrr = rrr + "W"
   ENDIF
   IF abvg[sss] = 154
///// rrr = rrr + "d`"
      rrr = rrr + "x"
   ENDIF
   IF abvg[sss] = 155
///// rrr = rrr + "D@"
      rrr = rrr + "X"
   ENDIF
/////  Ova e koregirano bidejki se kuca namesto: lj - q, nj - w .... */
NEXT
RETURN rrr
*******************
FUNCTION LatKir855(ppp)
LOCAL abcd[255],i,aaa,rrr,sss
FOR i = 1 TO 255
   abcd[i] = i
NEXT
abcd[ 65] = ASC("�")
abcd[ 66] = ASC("�")
abcd[ 86] = ASC("�")
abcd[ 71] = ASC("�")
abcd[ 68] = ASC("�")
abcd[124] = ASC("�")
abcd[ 69] = ASC("�")
abcd[ 64] = ASC("�")
abcd[ 90] = ASC("�")
abcd[ 89] = ASC("�")
abcd[ 73] = ASC("�")
abcd[ 74] = ASC("�")
abcd[ 75] = ASC("�")
abcd[ 76] = ASC("�")
abcd[ 81] = ASC("�") ///////////////
abcd[ 77] = ASC("�")
abcd[ 78] = ASC("�")
abcd[ 87] = ASC("�") ///////////////
abcd[ 79] = ASC("�")
abcd[ 80] = ASC("�")
abcd[ 82] = ASC("�")
abcd[ 83] = ASC("�")
abcd[ 84] = ASC("�")
abcd[125] = ASC("�")
abcd[ 85] = ASC("�")
abcd[ 70] = ASC("�")
abcd[ 72] = ASC("�")
abcd[ 67] = ASC("�")
abcd[ 94] = ASC("�")
abcd[ 88] = ASC("�") //////////////
abcd[123] = ASC("�")
abcd[ 97] = ASC("�")
abcd[ 98] = ASC("�")
abcd[118] = ASC("�")
abcd[103] = ASC("�")
abcd[100] = ASC("�")
abcd[ 92] = ASC("�")
abcd[101] = ASC("�")
abcd[ 96] = ASC("�")
abcd[122] = ASC("�")
abcd[121] = ASC("�")
abcd[105] = ASC("�")
abcd[106] = ASC("�")
abcd[107] = ASC("�")
abcd[108] = ASC("�")
abcd[113] = ASC("�") ///////////
abcd[109] = ASC("�")
abcd[110] = ASC("�")
abcd[119] = ASC("�") ////////////
abcd[111] = ASC("�")
abcd[112] = ASC("�")
abcd[114] = ASC("�")
abcd[115] = ASC("�")
abcd[116] = ASC("�")
abcd[ 93] = ASC("�")
abcd[117] = ASC("�")
abcd[102] = ASC("�")
abcd[104] = ASC("�")
abcd[ 99] = ASC("�")
abcd[126] = ASC("�")
abcd[120] = ASC("�") ///////
abcd[ 91] = ASC("�")
rrr = ""
FOR i = 1 TO LEN(ppp)
   aaa = SUBSTR(ppp,i,1)
   sss = ASC(aaa)
   IF sss > 0
      rrr = rrr + CHR(abcd[sss])
   ENDIF
NEXT
RETURN rrr
***************************
* Kodiranje / Dekodiranje *
***************************
***************
** Kodiranje **
***************
FUNCTION Kodiraj(ppp)
LOCAL i,rrr,brl,brs
sifra="ABRAKADABRA"
rrr = ""
FOR i = 1 TO LEN(ppp)
   brl = ASC(SUBSTR(ppp,i,1))
   brs = ASC(SUBSTR(sifra,i,1))
   rrr = rrr + CHR(brl+brs)
NEXT
RETURN rrr
*****************
** Dekodiranje **
*****************
FUNCTION Dekodiraj(ppp)
LOCAL i,j,rrr,brl,brs
sifra="ABRAKADABRA"
rrr = ""
FOR i = 1 TO LEN(ppp)
   brl = ASC(SUBSTR(ppp,i,1))
   brs = ASC(SUBSTR(sifra,i,1))
   rrr = rrr + CHR(brl-brs)
NEXT
RETURN rrr
