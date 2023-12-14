CLASS MagicHelp FROM Thread

   HIDDEN:
   METHOD DisplayToolTip()
   METHOD PaintTheTip()

   EXPORTED:
   VAR producerID
   VAR oLastMotionXBP
   VAR oLastTipXBP
   VAR oBlockedXBP
   VAR nLastTipTime
   VAR aLastMotionPos
   VAR oTip
   VAR lTipIsShown
   VAR nTipSensitivity

   INLINE METHOD init()
     ::nTipSensitivity := 1
     ::thread:init()
     ::producerID := ThreadID()
   RETURN

   EXPORTED:
   METHOD execute()
   METHOD atStart()
   METHOD atEnd()
   METHOD showTip()
   METHOD hideTip()
ENDCLASS

METHOD MagicHelp:atStart()
   ::lTipIsShown       := .F.
   ::oLastMotionXBP    := NIL
   ::aLastMotionPos    := NIL
  /*
   * The Index expression is as followed:
   * INDEX ON Str(lang_id,4)+Str(help_id,4) TO MHELP
   */
         SELECT 179
         USE mhelp.dbf INDEX mhelp.ntx SHARED                  //BOBI

RETURN


METHOD MagicHelp:atEnd()
   DbCloseAll()
RETURN

METHOD MagicHelp:Execute()
   LOCAL nEvent, mp1:=0, mp2:=0, oXbp:=NIL
   LOCAL nLastMotionTime := 0

   DO WHILE .T.

     /*
      * Because our entire Event sniffer pools events, we have
      * to go sleep after each iteration otherwise we would
      * consume to much CPU resources for nothing!
      */
      Sleep( 10 )

     /*
      * here we go, using LastAppEvent to sniff into the event
      * queue of another thread
      */
      nEvent := LastAppEvent(@mp1,@mp2,@oXbp,::producerID)

     /*
      * Check if the addressee of the last event is
      * still valid
      */
      IF oXbp == NIL .OR. oXbp:status() != XBP_STAT_CREATE
         LOOP
      ENDIF

     /*
      * Because XbpIWindows are not in our interest in
      * terms of User-Related semantics we take the parent
      */
      IF(oXbp:isDerivedFrom("XbpIWindow"))
         oXbp := oXbp:setParent()
      ENDIF

     /*
      * blocked XBP have input focus and have to be left out
      * in the tip heuristics
      */
      IF(ValType(::oBlockedXBP)=="O" .AND.;
         oXbp == ::oBlockedXBP )
         LOOP
      ENDIF

     /*
      * Only motion events are relevant to detect situations at which
      * we have to post a tip.
      */
      IF(nEvent == xbeM_Motion)

     /*
      * Ok, a motion event has occured, and it was not over the
      * XBP which is blocked - means of input-focus - so we
      * remove the block
      */
         ::oBlockedXBP := NIL

     /*
      * We check here if the motion was again over the same XBP as the
      * last motion event was, then we validate for the same mouse pos.
      * If that's all the case we only have to ensure that the
      * ::nTipSensitivity timeframe was reached, if so we post the tip.
      */
      IF ( ValType( ::oLastMotionXBP) == "O" .AND. oXbp == ::oLastMotionXBP )

         IF( ::aLastMotionPos[1] == mp1[1] .AND. ;
             ::aLastMotionPos[2] == mp1[2] )

            IF((Seconds() - nLastMotionTime) > ::nTipSensitivity )
               ::showTip()
            ENDIF

         ELSE
            ::aLastMotionPos := AClone(mp1)
            nLastMotionTime := Seconds()
         ENDIF
     /*
      * Check if the current XBP we are over has the same parent
      * as the XBP for which we have posted the last TIP. In that
      * case we check out if the timeframe between these two actions
      * was under half a second. Are all prev. conditions fullfilled
      * we assume the user is interested in another tip for the XBP
      * in the neighborhood of its current - so it goes.
      */
      ELSEIF ( ValType(::oLastTipXBP) == "O" .AND. ;
         oXbp:setParent() == ::oLastTipXBP:setParent() .AND. ;
         oXbp != ::oLastTipXBP )

         ::hideTip()
         ::oLastMotionXBP  := oXbp
         ::aLastMotionPos  := AClone(mp1)
         nLastMotionTime := Seconds()

         IF( ::nLastTipTime>0 .AND. ;
           ( Seconds()-::nLastTipTime)<=0.5 )
            ::showTip()
         ENDIF

      /*
       * Ok, nothing special has occured, so we simply store the
       * event data related to the motion to be used in the next
       * pass.
       */
       ELSE
          ::oLastMotionXBP  := oXbp
          ::aLastMotionPos  := AClone(mp1)
          nLastMotionTime   := Seconds()
          ::hideTip()
       ENDIF

     /*
      * Any event except PaintEvent has to hide the Tip. In
      * addition, we mark the XBP as blocked - because
      * user-interaction via Keyboard or Mouse has taken
      * place - to avoid Tip postings while the user
      * interacts with the XbasePART
      */
      ELSEIF nEvent != xbeP_Paint
         IF(oXbp==::oLastTipXBP)
           ::oBlockedXBP    := oXbp
         ENDIF
         ::oLastMotionXBP := NIL
         ::hideTip()
      ENDIF
   ENDDO

RETURN

METHOD MagicHelp:showTip()
   IF(!::lTipIsShown)
      ::DisplayToolTip(::oLastMotionXBP)
      ::oTip:show()
      ::lTipIsShown  := .T.
      ::oLastTipXBP  := ::oLastMotionXBP
      ::oBlockedXBP := NIL
   ENDIF
RETURN

METHOD MagicHelp:hideTip()
   IF(::lTipIsShown)
      ::oTip:hide()
      ::oTip:destroy()
      ::lTipIsShown := .F.
      ::nLastTipTime := Seconds()
   ENDIF
RETURN

METHOD MagicHelp:DisplayToolTip(oXbpRequestingHint)
//   LOCAL cText := "(nil)"                                  //BOBI
   LOCAL cText := ""                                         //BOBI
   LOCAL cID   := ""
   LOCAL aPos

  /*
   * Calculate absolute position of motion event and adjust it
   * about the mouse pointer size
   */
   aPos  := calcAbsolutePosition(::aLastMotionPos,oXbpRequestingHint)
   aPos[1] += 6
   aPos[2] -= 30

  /*
   * Check if the XBP for which we have to post a hint has an
   * associated Helplabel, and if so, retrieve the ID and
   * hint message from the database. If there is no HelpLabel
   * object, check whether a tooltip text is stored in the
   * XBP's :toolTipText intance variable.
   */
   IF(ValType(oXbpRequestingHint:helpLink)=="O" .AND. ;
      oXbpRequestingHint:helpLink:isDerivedFrom("MagicHelpLabel"))

      cID := oXbpRequestingHint:helpLink:getID()
      IF(DbSeek(cID,.F.))
         cText := " "+AllTrim(FIELD->HINT)+" "
      ENDIF


   ELSEIF IsMemberVar(oXbpRequestingHint, "toolTipText") == .T. .AND.;
          ValType(oXbpRequestingHint:toolTiptext) == "C" .AND. ;
          Len(oXbpRequestingHint:toolTiptext)     > 0
      cText := oXbpRequestingHint:toolTiptext
   ENDIF

  /*
   * Ok, now lets paint the TIP
   */
   ::oTip := XbpStatic():new()
   ::oTip:options := XBPSTATIC_TEXT_BOTTOM
   ::oTip:create(AppDesktop(),AppDesktop(), aPos, { 0 , 0 })
if LEN(cText) > 4
   ::PaintTheTip(cText)
endif
RETURN(SELF)


METHOD MagicHelp:PaintTheTip(cText)
   LOCAL aAreaAttr, aStringAttr
   LOCAL oPS
   LOCAL aPoints
   LOCAL aSize := {0,0}

   oPS := ::oTip:lockPS()
   aPoints := GraQueryTextBox( oPS, cText)
   ::oTip:unlockPS()

   aSize[1] := (aPoints[3,1] - aPoints[1,1]) + 8
   aSize[2] := (aPoints[1,2] - aPoints[2,2]) + 4

   ::oTip:setSize(aSize,.F.)
   oPS := ::oTip:lockPS()

   aAreaAttr := Array( GRA_AA_COUNT )
   aAreaAttr [ GRA_AA_COLOR ] := XBPSYSCLR_INFOBACKGROUND
   GraSetAttrArea( oPS, aAreaAttr )
   GraBox( oPS, { 0, 0}, {aSize[1]-1, aSize[2]-1}, GRA_OUTLINEFILL)

   aStringAttr := Array( GRA_AS_COUNT )
   aStringAttr [ GRA_AS_COLOR ] := XBPSYSCLR_INFOTEXT
   GraSetAttrString( oPS, aStringAttr )
   GraStringAt( oPS, {4,4}, cText)

   ::oTip:unLockPS( oPS)
RETURN(SELF)


CLASS MagicHelpLabel FROM XbpHelpLabel
   CLASS VAR nLangID
   VAR nID

   INLINE CLASS METHOD initClass()
    ::nLangID := 1
   RETURN

   INLINE METHOD init(nID)
      ::nID := nID
   RETURN

   EXPORTED:
   INLINE CLASS METHOD setLanguage(nID)
      ::nLangID := nID
   RETURN

   INLINE METHOD getID()
   RETURN(Str(::nLangID,4)+Str(::nID,4))

ENDCLASS


/*
 * This function calculates the absolute position
 * from a given position relative to an XbasePART
 */
STATIC FUNCTION calcAbsolutePosition(aPos,oXbp)
   LOCAL aAbsPos := AClone(aPos)
   LOCAL oParent := oXbp
   LOCAL oDesktop := AppDesktop()

   DO WHILE oParent <> oDesktop
      aAbsPos[1] += oParent:currentPos()[1]
      aAbsPos[2] += oParent:currentPos()[2]
      oParent := oParent:setParent()
   ENDDO
RETURN(aAbsPos)