(define (rld)
  (load "review.scm"))

(define (display+ . args)
  (define (helper things)
    (if (null? things)
	""
	(begin (display (car things)) (newline) (helper (cdr things)))))
  (helper args))

(define (recursion1 thing)
  (display+ thing)
  (if (> thing 10)
      (begin (display+ "Recursion complete!") 0)
      (+ 1 (recursion1 (+ thing 1)))))

(define (recursion2)
  (define (helper curr)
    (display+ curr)
    (if (> curr 10)
	(begin (display+ "Recursion complete!") 0)
	(+ 1 (helper (+ curr 1)))))
  (helper 0))

(define (iteration)
  (define (helper count)
    (display+ count)
    (if (> count 10)
	"Iteration complete!"
	(helper (+ count 1))))
  (helper 0))

(define (conditionals)
  (cond
   ((= 5 4) (display+ "MATH BROKE!!!"))
   ((> 3 9) (display+ "MATH IS STILL BROKEN!!!"))
   (else (display+ "Math is safe!  TO THE COMPUTER SCIENCEMOBILE!!!")))
  (if #f
      (display+ "Scheme is brokeded...")
      (display+ "Oh, so that's how if works!"))
  (if (and (= 4 2) (/ 2 0))
      (display+ "Now I've created a singularity!")
      (if (or (< 3 6) (/ 15 0))
	  (display+ "OR just needs one thing to be true!  It doesn't evaluate the second thing if the first is #t!  
AND on the other hand evaluates to #t only if everything is true, and #f when it finds something that evaluates #f!")
	  (display+ "More singularities...")))
  "This is going to be returned because despite everything that prints, this is the last thing Scheme will evaluate!"
  )

(define (procedures-as-data)
  (display+ "This is going to get complicated...")
  (define (add1)
    (lambda (x) (+ x 1)))
  (display+ ((add1) 6))
  (display+ "The add procedure returns a procedure which takes in one parameter and adds one to it!")
  (define add2
    (lambda (x) (+ x 1)))
  (display+ (add2 6))
  (display+ "This time it wasn't a procedure, but rather a variable defined as a lambda.  This is functionally the same as a regular procedure define!")
  (display+ "Fun fact: This is how Scheme processes every procedural define!")
  (define (add3 proc thing)
    (proc thing))
  (display+ (add3 add2 30))
  (display+ "add3 is a procedure that takes in a procedure and a value, and executes the procedure with the value as its parameter!")
  )

(define (filter predicate sequence)
  (cond ((null? sequence) ())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (map proc items)
  (if (null? items)
      ()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (list-processing)
  (display+ "GIVE ME A CONS!!!")
  (define test (cons 1 2))
  (display+ test "GIVE ME A CAR!!!" (car test) "GIVE ME A CDR!!!" (cdr test) "GIVE ME A RAISE!!!")
  (define motest (list 1 2 3 4))
  (display+ "GIVE ME A LIST!!!" motest "GIVE ME A CAR!!!" (car motest) "GIVE ME A CDR!!!" (cdr motest) "Wait, what?  The car of both dotted pairs and lists just gives back the first element." "The cdr on the other hand gives back the second element in a pair, or the rest of the list.  Be careful of situations like this:" (cddddr motest) "Taking the cdr of a list will only ever give you a list, empty or not.")
  (define tst1 '(1 3 4 5 6 8 9))
  (define tst2 '(4 2 5 90 85 43))
  (display+ 
   "(define tst1 '(1 3 4 5 6 8 9))"
   "(define tst2 '(4 2 5 90 85 43))"
   "I wanna do some stuff to lists!  What if I want to remove certain elements?  Is there a procedure for that?"
   "(filter even? tst1) (filter odd? tst2)"
   (filter even? tst1) (filter odd? tst2)
   "Hmmm, that WAS pretty sweet.  But I changed my mind!  Now I think I want to square every value!"
   " (map square tst1) (map square tst2)"
   (map square tst1) (map square tst2)
   "So map applies a function to every element in a list.  Mind == BLOWN!!!  Whoops, that's Python!  What if I wanted to add all of the items in a list together?"
   "(accumulate + 0 tst1) (accumulate + 0 tst2)"
   (accumulate + 0 tst1) (accumulate + 0 tst2)
   "So can I only use procedures I've defined with those functions?"
   "(filter (lambda (x) (> x 3)) tst1) (map (lambda (x) (* x 2)) tst2)"
   (filter (lambda (x) (> x 3)) tst1) (map (lambda (x) (* x 2)) tst2)
   "Lambdas again!  While obviously one of the greatest things EVER I'm a little confused...  How exactly do they work?"
   "  (lambda (parameters it's going to take in) (things it's going to do))  "
   "Does it have to take anything in at all?"
   "  ((lambda () (+ 2 2)))  "
   ((lambda () (+ 2 2)))
   "Wait, why are there extra parentheses?  Are you just making this up as you go?"
   "A lambda is an anonymous procedure.  Functionally identical to the procedures you know and love, it has no name and is therefore sad."
   "In order to tell Scheme you want to execute a lambda, you need extra parentheses.  This is how Scheme knows to execute something!"))

(define (list-algorithms)
  (define (reverse lst)
    (define (helper olst nlst)
      (if (null? olst)
	  nlst
	  (helper (cdr olst) (cons (car olst) nlst))))
    (helper lst '()))
  (define (reverse-rec lst)
    (if (null? lst)
	'()
	(cons (car lst) (reverse-rec (cdr lst)))))

  (define lst1 '(1 2 3 4 5 6 7 8 9 10))
  (define lst2 (filter even? lst1))
  (define lst3 (filter odd? lst1))
  (define a 5)
  (define b 10)
  (define c 15)
  (define d 20)
  (define lst4 (list a b c d))
  (define lst5 '(a b c d))
  (display+ 
   "Algorithms are fun!"
   "  (define lst1 '(1 2 3 4 5 6 7 8 9 10))
  (define lst2 (filter even? lst1))
  (define lst3 (filter odd? lst1))
  (define a 5)
  (define b 10)
  (define c 15)
  (define d 20)
  (define lst4 (list a b c d))
  (define lst5 '(a b c d))"
   "So how do they look when I display them?"
   lst1 lst2 lst3 lst4 lst5
   "Wait, why aren't 4 and 5 the same?  What does that strange little dash mean?"
   "This one uses the list syntax, which creates a list containing all of the things within the parentheses following it."
   lst4
   "On the other hand, the quote as it's called among us programmers tells Scheme not to evaluate the following, but to instead turn it into a list.  You see the problem."
   lst5
   "So if we've created a list, how do we move through it?  What kinds of things could we do with it?  Could we reverse it?"
   (reverse lst1)
   "AWWSOME!  How did it do that though?"
   "(define (reverse lst)
    (define (helper olst nlst)
      (if (null? olst)
	  nlst
	  (helper (cdr olst) (cons (car olst) nlst))))
    (helper lst '()))"
   "A few things worth mentioning:"
   "Every algorithm you create to operate on a list needs to have (null? lst) as your test for done.  Then we use car to access the first thing and do stuff, and pass
the cdr through to the next iteration.  We end by returning the new list we just created of backwards values!"
   "This is where recursion versus iteration can get screwy though...  What if I made my reverse function recursive instead?"
   "  (define (reverse-rec lst)
    (if (null? lst)
	'()
	(cons (car lst) (reverse-rec (cdr lst)))))"
   (reverse-rec lst1)
   "Why didn't that work?  Could it be because of the order recursive functions do things compared to iterative functions?  Better be careful about that..."))

(define (complexity)
  (define (member ele lst)
    (cond ((null? lst) #f)
	  ((equal? (car lst) ele) #t)
	  (else (member ele (cdr lst)))))
  
  (define (set-difference lsta lstb)
    (define (helper lst fnl)
      (cond ((null? lst) fnl)
	    ((member (car lst) lstb) (helper (cdr lst) fnl))
	    (else (helper (cdr lst) (cons (car lst) fnl)))))
    (cond ((null? lsta) '())
	  ((null? lstb) lsta)
	  (else (helper lsta '()))))

  (define (set-diff lsta lstb)
    (define (helper lst1 lst2 fnl)
      (cond ((null? lst1) fnl)
	    ((null? lst2) (cons lst1 fnl))
	    ((< (car lst1) (car lst2)) (helper (cdr lst1) lst2 (cons (car lst1) fnl)))
	    ((= (car lst1) (car lst2)) (helper (cdr lst1) (cdr lst2) fnl))
	    ((> (car lst1) (car lst2)) (helper lst1 (cdr lst2) fnl))
	    (else "Something, somewhere went turribly wrong...")))
    (cond ((null? lsta) '())
	  ((null? lstb) lst1)
	  (else (helper lsta lstb '()))))

  (define (add5)
    (+ 5 5))
  
  (display+ 
   "Everything I've been learning so far is so...complex!  Is there a quantitative measure of complexity I can use?"
   "                              ;;;;;                    "
   "                           ;;;;;;;;;;;                 "
   "                        ;;;;;;;   ;;;;;;;              "
   "                     ;;;;;;;         ;;;;;;;           "
   "                  ;;;;;;;               ;;;;;;;        "
   "               ;;;;;;;                     ;;;;;;;     "
   "             ;;;;;;;                         ;;;;;;;   "
   "            ;;;;;;;       ;            ;      ;;;;;;;  "
   "           ;;;;;;;       ;;;          ;;;      ;;;;;;; "
   "           ;;;;;;;       ;;;;;;;;;;;;;;;;      ;;;;;;; "
   "           ;;;;;;;       ;;;;;;;;;;;;;;;;      ;;;;;;; "
   "            ;;;;;;;      ;;;          ;;;     ;;;;;;;  "
   "             ;;;;;;;      ;            ;     ;;;;;;;   "
   "               ;;;;;;;                     ;;;;;;;     "
   "                  ;;;;;;;               ;;;;;;;        "
   "                     ;;;;;;;         ;;;;;;;           "
   "                        ;;;;;;;   ;;;;;;;              "
   "                           ;;;;;;;;;;;                 "
   "                              ;;;;;                    "
   "Lopsided Theta?  OHHHH, you mean Big O and Big Theta notation?  But what is it?  How do you calculate it?"
   "  (define (reverse lst)
    (define (helper olst nlst)
      (if (null? olst)
	  nlst
	  (helper (cdr olst) (cons (car olst) nlst))))
    (helper lst '()))"
   "Complexity is a worst case estimate of how long a function would take to run, given a data structure of size n.  The function above is O(n) because it touches each element once, and only once."
   "  (define (member ele lst)
    (cond ((null? lst) #f)
	  ((equal? (car lst) ele) #t)
	  (else (member ele (cdr lst)))))"
   "  (define (set-difference lsta lstb)
    (define (helper lst fnl)
      (cond ((null? lst) fnl)
	    ((member (car lst) lstb) (helper (cdr lst) fnl))
	    (else (helper (cdr lst) (cons (car lst) fnl)))))
    (cond ((null? lsta) '())
	  ((null? lstb) lsta)
	  (else (helper lsta '()))))"
   "Member also has a complexity of O(n), because it moves through lst and does a comparison on each element, but it only touches each element once."
   "Set-difference on the other hand is O(mn) because for each element in lsta, it calls member, which looks at every element in lstb."
   "In this example, m is the size of list a and n is the size of list b.  If we want to lower complexity, we have to make assumptions about the lists."
   "For instance, what if we assume the lists are already sorted?  Can we scale down it's complexity then?"
   "  (define (set-diff lsta lstb)
    (define (helper lst1 lst2 fnl)
      (cond ((null? lst1) fnl)
	    ((null? lst2) (cons lst1 fnl))
	    ((< (car lst1) (car lst2)) (helper (cdr lst1) lst2 (cons (car lst1) fnl)))
	    ((= (car lst1) (car lst2)) (helper (cdr lst1) (cdr lst2) fnl))
	    ((> (car lst1) (car lst2)) (helper lst1 (cdr lst2) fnl))
	    (else Something, somewhere went turribly wrong...)))
    (cond ((null? lsta) '())
	  ((null? lstb) lst1)
	  (else (helper lsta lstb '()))))"
   "Now we have a function that does the exact same thing, but in O(n) time.  Lower complexities exist, but you don't need to know which."))

(define (message-passing)
  (define (circle rad)
    (define (dispatch op)
      (define pi 3.141592653589793)
      (cond
       ((eq? op 'radius) rad)
       ((eq? op 'circumference) (* 2 pi rad))
       ((eq? op 'area) (* pi rad rad))
       (else "Unrecognized operation!")))
    dispatch)
  (define c1 (circle 10))
  (define c2 (circle 5))
  (display+
   "  (define (circle rad)
    (define (dispatch op)
      (define pi 3.141592653589793)
      (cond
       ((eq? op 'radius) rad)
       ((eq? op 'circumference) (* 2 pi rad))
       ((eq? op 'area) (* pi rad rad))
       (else Unrecognized operation!)))
    dispatch)
  (define c1 (circle 10))
  (define c2 (circle 5))"
   "Oh man.  If I see another bit of code like that, I might go postal!  What is that nonsense?"
   "The key to a message passing procedure is returning dispatch.  When I call (circle 10) for instance, that procedure returns a procedure (dispatch)."
   "If I wanted to execute an operation on the circles I just created, I have to call dispatch.  But how...?"
   (c1 'area)
   (c2 'circumference)
   "What did I just do?    (c1 'area)  (c2 'circumference)"
   "If (circle 10) returns a procedure, then I should be able to execute that procedure with a parameter.  Specifically, because (circle 10) returns dispatch, (c1 'anything) calls dispatch with 'anything as its op.  Why aren't the two circles conflicting though?"
   "Turns out, when you define a procedure that returns a procedure like we just did, you create an environment.  (circle) creates a magical world that keeps track of the radius it was given at creation, and allows you to do specific operations with that value.  We used it above to create two worlds.  Just be careful you don't go overboard and give yourself a god complex..."))

(define (local-state)
  (define flip
    (let
	((val 0))
      (lambda () 
	(if (= val 0)
	    (begin (set! val 1) val)
	    (begin (set! val 0) val)))))
  
  (define (flop)
    (let
	((val 0))
      (if (= val 0)
	  (begin (set! val 1) val)
	  (begin (set! val 0) val))))

  (define (make-flip-flop)
    (let
	((val 0))
      (lambda ()
	(if (= val 0)
	    (begin (set! val 1) val)
	    (begin (set! val 0) val)))))
  (define flap1 flip)
  (define flap2 flip)
  (define flap3 (flop))
  (define flap4 (flop))
  (define flap5 (make-flip-flop))
  (define flap6 (make-flip-flop))
  (define flap7 (make-flip-flop))
  (display+
   ""
   "I refuse to participate further in these shenanigans!"
   "(flap1)"
   (flap1)
   "(flap2)"
   (flap2)
   "flap3"
   flap3
   "flap4"
   flap4
   "flap5"
   flap5
   "(flap6)"
   (flap6)
   "(flap7)"
   (flap7)
   "(flap7)"
   (flap7)
   "(flap6)"
   (flap6)
   "What just happened...?"
   "flap1 and flap2 are both variables representing the same environment, so whenever one of them is called val changes, regardless of which is used."
   "flap3 and flap4 are variables housing static numbers.  This as because a call to (flop) returns a number, and since (flop) has no way of maintaining it's state, val is reset to 0 every time it's called, so it will always return 1."
   "flap5 returns some nonsense about a compound procedure because it is a lambda procedure, which has no name."
   "flap 6 and flap7 are executed and we find that they each have a seperate environment, and execute independant of each other.  This is because they were created with (make-flip-flop), a procedure which returns a procedure!"
   "To be more precise, when (make-flip-flop) executes it creates a local scope, as all procedures do.  This one however then returns a procedure that exists purely within that scope, so anything it does on local variables is both static (because we use set! within the environment) and independant of other functions (because this function exists within its own environment).  While flap6 and flap7 may look identical, (make-flip-flop) created two seperate and entirely different environments for them, and so they exist seperately and simultaneously!"
   ))

(define (more-state)
  (define (make-queue)
    (let
	((q (cons '() '())))
      (define (dispatch op)
	(define (empty?)
	  (if (null? (car q))
	      #t
	      #f))
	(define (push! item)
	  (define thing (cons item '()))
	  (if (empty?) 
	      (begin (set-car! q thing) (set-cdr! q thing) q)
	      (begin (set-cdr! (cdr q) (cons item '())) (set-cdr! q (cons item '())) q)))
	(define (pop!)
	  (define ret 0)
	  (if (empty?)
	      (display "QUEUE IS EMPTY!!!")
	      (begin (set! ret (caar q)) (set-car! q (cdar q)) ret)))
	(define (disply)
	  (define (helper queue)
	    (cond
	     ((equal? (car q) (cdr q)) (display (caar q)))
	     ((equal? (cadr q) (car queue)) (display+ (car queue)))
	     (else (begin (display+ (car queue)) (helper (cdr queue))))))
	  (if (empty?)
	      '()
	      (helper (car q))))

	(cond
	 ((eq? op 'pop!) pop!)
	 ((eq? op 'push!) push!)
	 ((eq? op 'empty?) (empty?))
	 ((eq? op 'display) (disply))
	 (else "Unknown operation!")))
      dispatch))
  (define q1 (make-queue))
  (define q2 (make-queue))
  ((q1 'push!) 5)
  ((q1 'push!) 10)
  ((q2 'push!) 2)
  ((q2 'push!) '(1 2 3 4))
  (display+
   "I wrote a queue!  You don't actually need to understand how to write your own, but it illustrates several concepts you DO need to understand rather well."
   "  (define (make-queue)
    (let
	((q (cons '() '())))
      (define (dispatch op)
	(define (empty?)
	  (if (null? (car q))
	      #t
	      #f))
	(define (push! item)
	  (define thing (cons item '()))
	  (if (empty?) 
	      (begin (set-car! q thing) (set-cdr! q thing) q)
	      (begin (set-cdr! (cdr q) (cons item '())) (set-cdr! q (cons item '())) q)))
	(define (pop!)
	  (define ret 0)
	  (if (empty?)
	      (display QUEUE IS EMPTY!!!)
	      (begin (set! ret (caar q)) (set-car! q (cdar q)) ret)))
	(define (disply)
	  (define (helper queue)
	    (cond
	     ((equal? (car q) (cdr q)) (display (caar q)))
	     ((equal? (cadr q) (car queue)) (display+ (car queue)))
	     (else (begin (display+ (car queue)) (helper (cdr queue))))))
	  (if (empty?)
	      '()
	      (helper (car q))))

	(cond
	 ((eq? op 'pop!) pop!)
	 ((eq? op 'push!) push!)
	 ((eq? op 'empty?) (empty?))
	 ((eq? op 'display) (disply))
	 (else Unknown operation!)))
      dispatch))
  (define q1 (make-queue))
  (define q2 (make-queue))
  ((q1 'push!) 5)
  ((q1 'push!) 10)
  ((q2 'push!) 2)
  ((q2 'push!) '(1 2 3 4))"
   "So what does all that mean?  A queue is a data structure, a concept you'll become much better aquainted with in 1902.  For our purposes you don't need to know how to write one, only the underlying theories.  Specifically, understanding mutable structures and local state with a queue as an example."
   "A local state/environment is created when (make-queue) is called, and dispatch is returned as we've seen before.  Because we've introduced mutators though, all bets are off.  Our ideas of sameness are fundamentally altered, largely because before we considered things the same if they had the same value."
   "(define a 5)  (define b 5)"
   "Are a and b the same?  In this case, yes in the sense that they both represent the same value.  They are interchangeable, for instance, when used in math functions like square.  They'll both return 25!  But with mutators, I can change the value of a to something else, and we're forced to see that a and b are not interchangeable with the value they represent.  Instead,  they have state, and by using set! we can change their state to anything we desire."
   "(set! a 10)"
   "Now squaring both doesn't give us the same value anymore!"
   "Going back to our queue, we see that we've written it in such a way that every queue we create using (make-queue) is a seperate environment, with it's own state variable!")
  (q1 'display)
  (q2 'display)
  (display+
   "As we see here, q1 and q2 are different queues, even though we used the same procedure to create both.  (make-queue) creates an environment and returns it, which we can give a name and access at will!"))

(define (tables)
  (define (make-table)
    (let ((local-table (list '*table*)))
      (define (lookup key-1 key-2)
	(let ((subtable (assoc key-1 (cdr local-table))))
	  (if subtable
	      (let ((record (assoc key-2 (cdr subtable))))
		(if record
		    (cdr record)
		    false))
	      false)))
      (define (insert! key-1 key-2 value)
	(let ((subtable (assoc key-1 (cdr local-table))))
	  (if subtable
	      (let ((record (assoc key-2 (cdr subtable))))
		(if record
		    (set-cdr! record value)
		    (set-cdr! subtable
			      (cons (cons key-2 value)
				    (cdr subtable)))))
	      (set-cdr! local-table
			(cons (list key-1
				    (cons key-2 value))
			      (cdr local-table)))))
	'ok)    
      (define (dispatch m)
	(cond ((eq? m 'lookup-proc) lookup)
	      ((eq? m 'insert-proc!) insert!)
	      (else (error "Unknown operation -- TABLE" m))))
      dispatch))
  (display+
   "(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error Unknown operation -- TABLE m))))
    dispatch))"
   "A better understanding of tables can gained now that we understand what 2d-put! and insert! are really doing.  But mutating the values at a specific location within the environment (make-table) creates for us, we can maintain as many tables as we desire, and each one is completely seperate from all of the others!"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (rvi)
  (newline)
  (display+ "This is a recursive function!") (newline)
  (display+ "(define (recursion1 thing)
  (display+ thing)
  (if (> thing 10)
      (begin (display+ Recursion complete!) 0)
      (+ 1 (recursion1 (+ thing 1)))))
") (newline)

(display+ (recursion1 0)) (newline)

(display+ "Curiously, so is this!") (newline)
(display+ "(define (recursion2)
  (define (helper curr)
    (display+ curr)
    (if (> curr 10)
	(begin (display+ Recursion complete!) 0)
	(+ 1 (helper (+ curr 1)))))
  (helper 0))
") (newline)

(display+ (recursion2)) (newline)

(display+ "This function is iterative!") (newline)
(display+ "(define (iteration)
  (define (helper count)
    (display+ count)
    (if (> count 10)
	Iteration complete!
	(helper (+ count 1))))
  (helper 0))") (newline)

(display+ (iteration)) (newline))


(define (cnd)
  (display+ "This function demonstrates the different conditional statements!") (newline)
  (display+ "(define (conditionals)
  (cond
   ((= 5 4) (display+ MATH BROKE!!!))
   ((> 3 9) (display+ MATH IS STILL BROKEN!!!))
   (else (display+ Math is safe!  TO THE COMPUTER SCIENCEMOBILE!!!)))
  (if #f
      (display+ Scheme is brokeded...)
      (display+ Oh, so that's how if works!))
  (if (and (= 4 2) (/ 2 0))
      (display+ Now I've created a singularity!)
      (if (or (< 3 6) (/ 15 0))
	  (display+ OR just needs one thing to be true!  It doesn't evaluate the second thing if the first is #t!  
AND on the other hand evaluates to #t only if everything is true, and #f when it finds something that evaluates #f!)
	  (display+ More singularities...)))
  This is going to be returned because despite everything that prints, this is the last thing Scheme will evaluate!
  )") (newline)
   (display+ (conditionals)) (newline))


(define (pad)
  (display+ "This function demonstrates the phenomenon of procedures as data.  Yeah, that means lambdas!  LAMBDAS HOMGAWF!!!") (newline)
  (display+ "(define (procedures-as-data)
  (display+ This is going to get complicated...)
  (define (add1)
    (lambda (x) (+ x 1)))
  (display+ ((add1) 6))
  (display+ The add procedure returns a procedure which takes in one parameter and adds one to it!)
  (define add2
    (lambda (x) (+ x 1)))
  (display+ (add2 6))
  (display+ This time it wasn't a procedure, but rather a variable defined as a lambda.  This is functionally the same as a regular procedure define!)
  (display+ Fun fact: This is how Scheme processes every procedural define!)
  (define (add3 proc thing)
    (proc thing))
  (display+ (add3 add2 30))
  (display+ add3 is a procedure that takes in a procedure and a value, and executes the procedure with the value as its parameter!)
  )") (newline)

   (display+ (procedures-as-data)) (newline))

(define (lstp)
  (list-processing))

(define (lsta)
  (list-algorithms))

(define (cmplx)
  (complexity))

(define (msg)
  (message-passing))

(define (stt)
  (local-state)
  (more-state))

(define (tbl)
  (tables))