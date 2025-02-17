(require 'ert)
(require 'refine)

(ert-deftest refine-format-symbol ()
  (should (equal (refine--pretty-format 'x) "'x")))

(ert-deftest refine-format-builtin-symbol ()
  (should (equal (refine--pretty-format nil) "nil"))
  (should (equal (refine--pretty-format t) "t")))

(ert-deftest refine-format-value-empty-list ()
  "We should show a sensible value for an empty list."
  (should (equal (refine--format-value nil) "nil")))

(ert-deftest refine-format-string ()
  (should (equal (refine--pretty-format "abc\"def") "\"abc\\\"def\"")))

(ert-deftest refine-format-dotted-list ()
  (should (equal (refine--pretty-format (cons 1 2)) "'(1 . 2)")))

(ert-deftest refine-describe-dotted-list ()
  (should (equal (refine--describe 'x (cons 1 2))
                 "x is a global variable. Its current value is a pair")))

(ert-deftest refine-describe-nil ()
  (should (equal (refine--describe 'x nil)
                 "x is a global variable. Its current value is nil")))

(ert-deftest refine-describe-single-element-list ()
  (should
   (equal (refine--describe 'x (list 'foo))
          "x is a global variable. Its current value is a list\ncontaining 1 value")))
