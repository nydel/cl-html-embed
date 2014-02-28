cl-html-embed
=============

make lisp code easily-embeddable in html &amp; html-ish file

01. load up process-html-file.lisp
02. run the function #'htcl-to-html on index.htcl
03. see the generated file, index.htcl.html (unless otherwise specified)


----------------------------------------

basic example of how to embed lisp in your htcl files:

----------------------------------------

&lt;div user="&lt;((sb-posix::getenv "user"))&gt;"&gt;
 &lt;pre id="timestamp"&gt;
  &lt;(
   (get-universal-time)
  )&gt;
 &lt;/pre&gt;
&lt;/div&gt;

----------------------------------------

these things, for now, must be made into html/cl files first
and then converted into pure html, but that can easily be
done on the fly soon.