(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

(define member?
  (lambda (a lat) ;; define a procedure, taking 'a' and 'lat' as arguments
    (cond ;; asks questions
      ((null? lat) #f) ;; is lat null? if yes, return false
      (else (or (eq? (car lat) a) ;; in any other case, is the car of lat equal to a? if yes, return true. OR:
                (member? a (cdr lat))))))) ;; is 'a' a member of the cdr of 'lat'? which puts the cdr of lat into the argument of the same function and does all these checks again.

(define rember
  (lambda (a lat)
    (cond 
      ((null? lat) '()) ;; 1st cmdmnt, always ask if null first
      (else (cond ;; in any other case, ask these sets of questions
              ((eq? (car lat) a) (cdr lat)) ;; is car lat equal to a? if true, return the cdr of lat
              (else (rember a ;; if that fails, let's find out if 'a' exists anywhere else in the list. 
                            (cdr lat)))))))) ;; we recur with new arguments to rember and do it all over again

(define rember-b
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else (cons (car lat) ;; construct a list with the first element being the car of lat
                  (rember a ;; the second element being 
                          (cdr lat)))))))

(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons (car (car l)) (firsts (cdr l))))
