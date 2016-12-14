; sentence
(defnet S	(sequencez (parse NP) (parse VP)))
; noun phrase
(defnet np				
    either (sequencez (category PROPER-NOUN))
           (sequencez (category NOUN))
           (sequencez (category DET) (category MNOUN)))
; verb phrase
(defnet VP				
    either (sequencez (category VERB))
           (sequencez (category VERB) (parse NP) (optional (parse PP))))
;prepositional phrase
(defnet PP				
    (category PREP)
    (parse NP))

; These should all parse
(defconstant t1 '(John did his homework))                    	
(defconstant t2 '(John drove home))                			
(defconstant t3 '(John ate some food))    
(defconstant t4 '(John cleaned alot-of plates))    
   

(defword john PROPER-NOUN)

(defword the DET)
(defword a DET)
(defword his DET) ; should be okay since my only proper noun is john. lets me do things like "his clock" or "his homework"

(defword did VERB)

(defwork home NOUN)

(defword wood MNOUN)
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
(defword plate CNOUN)
(defword cup CNOUN)
(defword microphone CNOUN)
(defword mouse CNOUN) ;;; As in for a keyboard
(defword screwdriver CNOUN)
