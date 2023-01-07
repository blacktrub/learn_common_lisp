(+ 1 2)
(+ 4 2)
(+ 4 2)
(+ 4 3)

(defun has-cycle (head)
  (let ((slow head) (fast head))
    (loop while fast do
      (setf slow (cdr slow)
            fast (cddr fast))
      (if (eql slow fast)
          (return-from has-cycle t)))))



(defun helloworld () 
  (format t "Hello twitch"))

(helloworld)

(defun fib (n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))


(fib 12)

(defun bestfib (n) 
  (let ((a 0) (b 1))
    (loop repeat n do
          (let ((c a))
            (setf a b b (+ a c))))
    a))
            
(bestfib 1222111)

(cons 1 (cons 2 (cons 3 nil)))
(list 1 2 3)

(defun valid-parentheses (s)
  (let ((stack (make-array 0 :adjustable t :fill-pointer 0)))
    (loop for ch across s
      do (case ch 
           ((#\( #\[ #\{) (vector-push-extend ch stack))
           (#\) (let ((last (ignore-errors (vector-pop stack))))
                  (if (not (eql last #\()) 
                    (return-from valid-parentheses nil))))
           (#\] (let ((last (ignore-errors (vector-pop stack))))
                  (if (not (eql last #\[)) 
                    (return-from valid-parentheses nil))))
           (#\} (let ((last (ignore-errors (vector-pop stack))))
                  (if (not (eql last #\{)) 
                    (return-from valid-parentheses nil)))))
        (= 0 (length stack)))))

