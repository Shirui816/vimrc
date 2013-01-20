先安装pip   
arch：pacman -S python-pip   
ubuntu：apt-get install pip    
然后   
sudo pip install dbgp pep8 flake8 pyflakes    

安装 ctags git 和 vim/gvim .
ubuntu：apt-get install gvim exuberant-ctags git   
arch：pacman -S gvim git ctags   
启动vim，如果你没有~/.vim文件夹，那么一切会自动运行   
把下面东西加入到~/.ctags   

关于powerline插件：由于更新，新版本符号显示是乱码，而且配置、安装都很麻烦，所以暂时用老版本：   
arch用户可以直接yaourt -S vim-powerline这个就是老版本；   
如果用vundle，我已经加在vimrc里了，需要你自己手动下载过去的版本然后解压到~/.vim/bundle，如果已有的插件，安装会跳过的。   
PS我增加了一个powerlinelegacy，应该没啥问题了～～直接用vimrc就行。   

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
