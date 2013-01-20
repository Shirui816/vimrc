先安装pip \\
sudo apt-get pip \\
或在软件管理中心搜索pip
然后 sudo pip install dbgp pep8 flake8 pyflakes 
安装 ctags git 和 vim/gvim .
启动vim，如果你没有~/.vim文件夹，那么一切会自动运行
把下面东西加入到~/.ctags


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
