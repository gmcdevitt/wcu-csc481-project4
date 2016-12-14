;; Gerard McDevitt
;; CSC 481 - Artificial Intelligence Project 4
;; A simple english grammar and lexicon with test cases

; GRAMMAR ----------------------------------------------------------------------
; sentence
(defnet S	(sequencez (parse NP) (parse VP)))

; noun phrase
(defnet np				
    either (sequencez (category PROPER-NOUN))
           (sequencez (category NOUN))
		   (sequencez (category QUANT) (category MNOUN))
		   (sequencez (category NUM) (category CNOUN))
		   (sequencez (category DET) (category NOUN))
           (sequencez (category DET) (category MNOUN)))
		   
; verb phrase
(defnet VP				
    either (sequencez (category VERB))
		   (sequencez (category VERB) (optional (parse PP)))
           (sequencez (category VERB) (parse NP) (optional (parse PP))))
		   
;prepositional phrase
(defnet PP				
    (category PREP)
    (parse NP))
; ------------------------------------------------------------------------------


; TEST CASES -------------------------------------------------------------------
; These should all parse (p for pass)
(defconstant p1 '(John did his homework)) ;;Basic sentence                    	
(defconstant p2 '(John drove home))       ;;Another basic one         			
(defconstant p3 '(John ate some food in the garden))    ;;This one has a prepositional phrase, which is midly interesting
(defconstant p4 '(John went for a run))    
(defconstant p5 '(Some glass was broken))    
(defconstant p6 '(The recepie required some apple))    ;;introducing...the mass noun!
(defconstant p7 '(The cabinet had three cups))    ;;we can count cups

;;These should not work (f for fail)
(defconstant f1 '(The room needed some lights))    ;;should not work since lights is a count noun
(defconstant f2 '(The plate had three hair on it))    ;;hair is a mass noun and therefore cannot be counted (in my grammar anyway)
; ------------------------------------------------------------------------------


; LEXICON ----------------------------------------------------------------------
(defword john PROPER-NOUN) ; John is very lonley in my little world here

(defword for PREP)
(defword without PREP)
(defword in PREP)

(defword the DET)
(defword a DET)
(defword his DET) ; should be okay since my only proper noun is john. lets me do things like "his clock" or "his homework"

(defword some QUANT)
(defword more QUANT)

(defword three NUM)

(defword did VERB)
(defword ate VERB)
(defword went VERB)
(defword drove VERB)
(defword be VERB)
(defword required VERB)
(defword needed VERB)
(defword was VERB)
(defword had VERB)

(defword home NOUN)
(defword it NOUN) ;i know this is a pronoun, but i didn't want to complicate the grammar for one more word 
(defword garden NOUN)
(defword cabinet NOUN)
(defword recepie NOUN)
(defword run NOUN) ; to go for a 'run'
(defword broken NOUN) ; broken as in the state (the glass is broken)

(defword food MNOUN)
(defword wood MNOUN)
(defword apple MNOUN)
(defword ice MNOUN)
(defword cloth MNOUN)
(defword water MNOUN)
(defword steel MNOUN)
(defword metal MNOUN)
(defword aluminum MNOUN)
(defword glass MNOUN)
(defword leather MNOUN)
(defword hair MNOUN)
(defword air MNOUN)
(defword milk MNOUN)
(defword wine MNOUN)
(defword cake MNOUN)
(defword meat MNOUN)
(defword homework MNOUN)
(defword heat MNOUN)
(defword plastic MNOUN)
(defword cold MNOUN)
(defword wool MNOUN)

(defword desk CNOUN)
(defword chair CNOUN)
(defword flag CNOUN)
(defword clock CNOUN)
(defword computer CNOUN)
(defword keyboard CNOUN)
(defword projector CNOUN)
(defword book CNOUN)
(defword bookcase CNOUN)
(defword pen CNOUN)
(defword notebook CNOUN)
(defword bag CNOUN)
(defword lights CNOUN)
(defword student CNOUN)
(defword car CNOUN)
(defword plates CNOUN)
(defword cups CNOUN)
(defword microphone CNOUN)
(defword mouse CNOUN) ;;; As in for a keyboard
(defword screwdriver CNOUN)
; ------------------------------------------------------------------------------
