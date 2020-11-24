(asdf:defsystem :cl-nnin
  :description "Norwegian national identity numbers"
  :author "Theodor Thornhill <theo@thornhill.no>"
  :licence "GPLv3"
  :version "0.0.1"
  :components ((:module "src"
                :components ((:file "package")
                             (:file "cl-nnin"))))
  :in-order-to ((test-op (test-op "cl-nnin/tests"))))


(asdf:defsystem :cl-nnin/tests
  :description "Tests for nnin"
  :author "Theodor Thornhill <theo@thornhill.no>"
  :license "GPLv3"
  :version "0.0.1"
  :depends-on (:rove
               :cl-nnin)
  :components ((:module "tests"
                :components ((:file "package")
                             (:file "cl-nnin-tests"))))
  :perform (test-op (o c) (symbol-call :rove '#:run :cl-nnin/tests)))
