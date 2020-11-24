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

;; Cannot reliably test randomized inequalities, since they may collide even
;; though state is fresh.  Using nil as the 'fresh' values, we can at least
;; check the form of the results

(deftest day
  (testing "day"
    (let ((day (day nil)))
      (ok (every #'integerp day))
      (ok (= (length day) 2))
      (ok (equal (day nil) day)))))

(deftest month
  (testing "month"
    (let ((month (month nil)))
      (ok (every #'integerp month))
      (ok (= (length month) 2))
      (ok (equal (month nil) month)))))

(deftest year
  (testing "year"
    (let ((year (year nil)))
      (ok (every #'integerp year))
      (ok (= (length year) 2))
      (ok (equal (year nil) year)))))

(deftest birth
  (testing "birth date"
    (let ((date (birth-date nil)))
      (ok (every #'integerp date))
      (ok (= (length date) 6))
      (ok (equal (birth-date nil) date)))))

(deftest individual-numbers
  (testing "individual numbers"
    (let ((indi (individual-numbers nil)))
      (ok (every #'integerp indi))
      (ok (= (length indi) 3))
      (ok (equal (individual-numbers nil) indi)))))

(deftest nnin
  (testing "nnin"
    (let ((nnin (nnin)))
      (ok (stringp nnin))
      (ok (= (length nnin) 11)))))
