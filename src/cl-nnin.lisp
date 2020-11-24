(in-package :cl-nnin)

(defparameter k1-nums '(3 7 6 1 8 9 4 5 2))
(defparameter k2-nums '(5 4 3 2 7 6 5 4 3 2))

(defun k1 (&rest args)
  ;; Returns NIL when the value is 10
  (let ((rest (mod (apply #'+ (mapcar #'* k1-nums args)) 11)))
    (unless (= rest 1)
      (if (zerop rest)
          0
          (- 11 rest)))))

(defun k2 (&rest args)
  ;; Returns NIL when the value is 10
  (let ((rest (mod (apply #'+ (mapcar #'* k2-nums args)) 11)))
    (unless (= rest 1)
      (if (zerop rest)
          0
          (- 11 rest)))))

(defun day (&optional (fresh t))
  (let ((random-state (make-random-state fresh)))
    (multiple-value-list (truncate (random 32 random-state) 10))))

(defun month (&optional (fresh t))
  (let ((random-state (make-random-state fresh)))
    (multiple-value-list (truncate (random 13 random-state) 10))))

(defun year (&optional (fresh t))
  (let ((random-state (make-random-state fresh)))
    (multiple-value-list (truncate (random 100 random-state) 10))))

(defun birth-date (&optional (fresh t))
  (append (day fresh) (month fresh) (year fresh)))

(defun individual-numbers (&optional (fresh t))
  (let ((number (random 500 (make-random-state fresh))))
    (list (truncate number 100)
          (mod (truncate number 10) 10)
          (mod number 10))))

(defmacro if-let ((var test-form) then-form &optional else-form)
  `(let ((,var ,test-form))
     (if ,var ,then-form ,else-form)))

(defun nnin ()
  "Generate a Norwegian National Identity Number, using randomized values.
Should be used only to mock up test data."
  (let ((nnin (append (birth-date) (individual-numbers))))
    (if-let (k1 (apply #'k1 nnin))
      (let ((x (append nnin (list k1))))
        (if-let (k2 (apply #'k2 x))
          (concatenate 'string (mapcar #'digit-char (append x (list k2))))
          (nnin)))
      (nnin))))


