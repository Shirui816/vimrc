Please install pip first:
sudo apt-get pip or search pip in your software center .
Then sudo pip install dbgp pep8 flake8 pyflakes 
Install gvim, ctags and git, you may search them in your software center .
Launch vim, press <ESC> then type :BundleInstall .
Add this in your ~/.ctags file :


--langdef=latex
--langmap=latex:.tex
--regex-latex=/^\\tableofcontents/TABLE OF CONTENTS/s,toc/
--regex-latex=/^\\frontmatter/FRONTMATTER/s,frontmatter/
--regex-latex=/^\\mainmatter/MAINMATTER/s,mainmatter/
--regex-latex=/^\\backmatter/BACKMATTER/s,backmatter/
--regex-latex=/^\\bibliography\{/BIBLIOGRAPHY/s,bibliography/
--regex-latex=/^\\part[[:space:]]*(\[[^]]*\])?[[:space:]]*\{([^}]+)\}/PART \2/s,part/
--regex-latex=/^\\part[[:space:]]*\*[[:space:]]*\{([^}]+)\}/PART \1/s,part/
--regex-latex=/^\\chapter[[:space:]]*(\[[^]]*\])?[[:space:]]*\{([^}]+)\}/CHAP \2/s,chapter/
--regex-latex=/^\\chapter[[:space:]]*\*[[:space:]]*\{([^}]+)\}/CHAP \1/s,chapter/
--regex-latex=/^\\section[[:space:]]*(\[[^]]*\])?[[:space:]]*\{([^}]+)\}/\. \2/s,section/
--regex-latex=/^\\section[[:space:]]*\*[[:space:]]*\{([^}]+)\}/\. \1/s,section/
--regex-latex=/^\\subsection[[:space:]]*(\[[^]]*\])?[[:space:]]*\{([^}]+)\}/\.\. \2/s,subsection/
--regex-latex=/^\\subsection[[:space:]]*\*[[:space:]]*\{([^}]+)\}/\.\. \1/s,subsection/
--regex-latex=/^\\subsubsection[[:space:]]*(\[[^]]*\])?[[:space:]]*\{([^}]+)\}/\.\.\. \2/s,subsubsection/
--regex-latex=/^\\subsubsection[[:space:]]*\*[[:space:]]*\{([^}]+)\}/\.\.\. \1/s,subsubsection/
--regex-latex=/^\\includegraphics[[:space:]]*(\[[^]]*\])?[[:space:]]*(\[[^]]*\])?[[:space:]]*\{([^}]+)\}/\3/g,graphic+listing/
--regex-latex=/^\\lstinputlisting[[:space:]]*(\[[^]]*\])?[[:space:]]*(\[[^]]*\])?[[:space:]]*\{([^}]+)\}/\3/g,graphic+listing/
--regex-latex=/\\label[[:space:]]*\{([^}]+)\}/\1/l,label/
--regex-latex=/\\ref[[:space:]]*\{([^}]+)\}/\1/r,ref/
--regex-latex=/\\pageref[[:space:]]*\{([^}]+)\}/\1/p,pageref/
