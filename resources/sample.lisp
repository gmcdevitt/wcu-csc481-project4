;;;-------------------------------------------------------------------------
;;; EXAMPLE
;;;
;;; GRAMMAR -- to be loaded

(defnet S				; sentence
    either (sequencez (parse NP) 
		      (parse VP))
           (sequencez (parse VP) 
		      (parse NP)))

(defnet np				; noun phrase
    either (sequencez (category PROPER-NOUN))
           (sequencez (category NOUN))
           (sequencez (category DET)
		      (category NOUN)))

(defnet VP				; verb phrase
    either (sequencez (category VERB))
           (sequencez (category VERB)
		      (parse NP)
		      (optional (parse PP))))

(defnet PP				;prepositional phrase
    (category PREP)
    (parse NP))


;;;-------------------------------------------------------------------------
;;; SAMPLE SENTENCES  -- to be loaded

(defconstant t1 '(The boy runs))                    ; parses
(defconstant t2 '(John built a box))                ; parses
(defconstant t3 '(The sun shines in the winter))    ; does not parse
(defconstant t4 '(John saw a dog in the garden))    ; parses

;;;--------------------------------------------------------------------------
;;; LEXICON  -- to be loaded

(defword a DET)
(defword boy NOUN)
(defword time NOUN VERB)
(defword flies NOUN VERB)
(defword box NOUN VERB)
(defword built VERB)
(defword dog NOUN)
(defword garden NOUN)
(defword girl NOUN)
(defword in PREP)
(defword john PROPER-NOUN)
(defword runs VERB)
(defword saw NOUN VERB)
(defword sees VERB)
(defword shines VERB)
(defword sun NOUN)
(defword smiles VERB)
(defword the DET)
(defword winter NOUN)

(defword vv2 VERB)
(defword vv1 VERB)
(defword nn1 NOUN)
(defword nn1 NOUN)

;;;-------------------------------------------------------------------------
;;;  TEST RUNS USING THE ABOVE SAMPLE SENTENCES
;;;
;;;  CL-USER> t1 
;;;  (THE BOY RUNS)
 
;;;  CL-USER> (parsesentence t1) 
;;;  ((S (NP (THE DET) (BOY NOUN)) (VP (RUNS VERB)))) 

;;;  CL-USER> t2 
;;;  (JOHN BUILT A BOX) 

;;;  CL-USER> (parsesentence t2) 
;;;  ((S (NP (JOHN PROPER-NOUN)) (VP (BUILT VERB) (NP (A DET) (BOX NOUN))))) 

;;;  CL-USER> t3 
;;;  (THE SUN SHINES IN THE WINTER) 

;;;  CL-USER> (parsesentence t3) 
;;;  NIL 

;;;  CL-USER> t4 
;;;  (JOHN SAW A DOG IN THE GARDEN) 

;;;  CL-USER> (parsesentence t4) 
;;;  ((S (NP (JOHN PROPER-NOUN)) 
;;;      (VP (SAW VERB) (NP (A DET) (DOG NOUN)) 
;;;     (PP (IN PREP) (NP (THE DET) (GARDEN NOUN)))))) 
;;;  
;;; END
