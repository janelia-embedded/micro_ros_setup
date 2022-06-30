;; guix time-machine -C .channels.scm -- shell --pure -f .guix.scm

(use-modules
 (guix packages)
 (guix git-download)
 (guix gexp)
 ((guix licenses) #:prefix license:)
 (guix build-system copy)
 (gnu packages base)
 (gnu packages embedded)
 )

(define %source-dir (dirname (current-filename)))

(define-public zephyr-dev-package
  (package
    (name "zephyr-dev-package")
    (version "dev")
    (source (local-file %source-dir
                        #:recursive? #t
                        #:select? (git-predicate %source-dir)))
    (build-system copy-build-system)
    (inputs (list west))
    (home-page "")
    (synopsis "")
    (description "")
    (license license:gpl3+)))

zephyr-dev-package
