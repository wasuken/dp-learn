(defsystem "dp-learn"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "dp-learn/tests"))))

(defsystem "dp-learn/tests"
  :author ""
  :license ""
  :depends-on ("dp-learn"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for dp-learn"
  :perform (test-op (op c) (symbol-call :rove :run c)))
