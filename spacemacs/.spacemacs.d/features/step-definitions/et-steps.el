(Then "^et-curr-color should be \"\\(.+\\)\"$"
      (lambda (color)
        (assert (equal et-curr-color color))))
