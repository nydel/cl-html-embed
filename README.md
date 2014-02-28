cl-html-embed
=============

make lisp code easily-embeddable in html &amp; html-ish file

01. load up process-html-file.lisp
02. run the function #'htcl-to-html on index.htcl
03. see the generated file, index.htcl.html (unless otherwise specified)


----------------------------------------

basic example of how to embed lisp in your htcl files:

----------------------------------------
<![CDATA[

<div user="<((sb-posix::getenv "user"))>">
 <pre id="timestamp">
  <(
   (get-universal-time)
  )>
 </pre>
</div>

]]>

----------------------------------------

these things, for now, must be made into html/cl files first
and then converted into pure html, but that can easily be
done on the fly soon.