(defsystem "yubin"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("dexador"
               "jonathan")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "yubin/tests"))))

(defsystem "yubin/tests"
  :author ""
  :license ""
  :depends-on ("yubin"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for yubin"
  :perform (test-op (op c) (symbol-call :rove :run c)))
