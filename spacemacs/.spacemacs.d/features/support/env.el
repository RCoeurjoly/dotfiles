(require 'f)

(defvar test_ecukes-support-path
  (f-dirname load-file-name))

(defvar test_ecukes-features-path
  (f-parent test_ecukes-support-path))

(defvar test_ecukes-root-path
  (f-parent test_ecukes-features-path))

(add-to-list 'load-path test_ecukes-root-path)

;; Ensure that we don't load old byte-compiled versions
(let ((load-prefer-newer t))
  (require 'espuds)
  (require 'ert))

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
