(defun load-html-file (filepath)
  (with-open-file (fstream filepath :direction :input)
    (loop for line = (read-line fstream nil 'eof)
	 until (eq line 'eof) collect line)))

(defun string-list-to-string (string-list)
  (eval (append '(concatenate 'string) string-list)))

(defun process-a-string (string)
  (let ((lhs (search "<(" string))
	(rhs (search ")>" string)))
    (cond ((or (null lhs) (null rhs)) string)
	  (t
	   (let* ((mid  (subseq string (+ 2 lhs) rhs))
		  (mid2 (read-from-string mid))
		  (mid3 (eval mid2))
		  (mid4 (if (stringp mid3) mid3 (write-to-string mid3))))
	     (concatenate 'string
			  (subseq string 0 lhs)
			  mid4
			  (process-a-string
			   (subseq string (+ 2 rhs)))))))))

(defun process-html-file (filepath)
  (process-a-string
   (string-list-to-string
    (load-html-file filepath))))

(defun htcl-to-html (inpath &optional outpath)
  (let ((processed-data (process-html-file inpath))
	(outpath (if outpath outpath
		     (concatenate 'string inpath ".html"))))
    (with-open-file (fstream outpath :direction :output
			             :if-does-not-exist :create
				     :if-exists :rename)
      (format fstream "~a" processed-data))))
