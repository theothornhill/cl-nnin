(in-package :cl-nnin/tests)

;; Arbitrarily chosen random valid nnins
(defparameter nnin1 '(2 5 0 2 9 8 2 7 5 2 7))
(defparameter nnin2 '(2 3 1 0 8 5 3 1 7 3 8))

(deftest k1
  (testing "correct k1"
    (ok (= (apply #'k1 (subseq nnin1 0 9)) 2))
    (ok (= (apply #'k1 (subseq nnin2 0 9)) 3))
    (ok (= (k1 0 0 0 0 0 0 0 0 0) 0))
    (ok (/= (k1 0 0 0 0 0 0 0 0 0) 11))))

(deftest k2
  (testing "correct k1"
    (let ((k1 (apply #'k1 (subseq nnin1 0 9))))
      (ok (= (k2 2 5 0 2 9 8 2 7 5 k1) 7)))
    (let ((k1 (apply #'k1 (subseq nnin2 0 9))))
      (ok (= (k2 2 3 1 0 8 5 3 1 7 k1) 8)))
    (ok (= (k2 0 0 0 0 0 0 0 0 0 0) 0))
    (ok (/= (k2 0 0 0 0 0 0 0 0 0 0) 11))))

(deftest birth
  (testing "birth date"
    ;; Cannot test reliably inequalities, since they may collide even though
    ;; state is fresh.
    (let ((date (birth-date nil)))
      (ok (equal (birth-date nil) date)))))

(deftest individual-numbers
  (testing "individual numbers"
    ;; Cannot test reliably inequalities, since they may collide even though
    ;; state is fresh.
    (let ((indi (individual-numbers nil)))
      (ok (equal (individual-numbers nil) indi)))))
