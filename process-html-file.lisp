

(defun load-html-file (filepath)
  (with-open-file (fstream filepath :direction :input)
    (loop for line = (read-line fstream nil 'eof)
	 until (eq line 'eof) collect line)))
