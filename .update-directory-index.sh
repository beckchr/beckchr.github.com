#!/bin/bash

for DIR in $(find $* -type d); do
  (
    echo -e "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">\n<html>"
    echo -e "<head>\n<title>Index of /${DIR}/</title>\n</head>"
    echo -e "<body>\n<h2>Index of /${DIR}/</h2>\n<hr/>\n<pre>"
    echo -e "<a href=\"../\">../</a>"
    ls -1p "${DIR}" | grep -v "index.html" | awk '{ printf "<a href=\"%s\">%s</a>\n",$1,$1 }' 
    echo -e "</pre>\n</body>\n</html>"
  ) > "${DIR}/index.html"
done
