Vim设置
=======
**很重要的一点：我的vim-latexsuite和vim-supertab是我用pacman安装的（我用arch），如果你的源里没有这两个插件请自行在vimrc里添加相对应的Bundle：**    
```
Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'    
Bundle 'vim-scripts/SuperTab'
```

安装pip   
-------
arch：```pacman -S python-pip```   
ubuntu：```apt-get install pip```    
然后```sudo pip install dbgp pep8 flake8 pyflakes```    

安装 ctags git 和 vim/gvim
--------------------------
ubuntu：```apt-get install gvim exuberant-ctags git```   
arch：```pacman -S gvim git ctags```   
启动vim，如果你没有~/.vim文件夹，那么一切会自动运行。   

关于powerline插件，由于它的更新，使安装过程麻烦了一些，按照官方的介绍它成了python的一个模块，配置起来也不一样了，而且字体问题现在还比较麻烦。所以我设置了一个powerlinelegacy，可以直接用Bunlde，这点我已经配置好了。   

PS它的新版各位也可以去看看，貌似修改为Python以后bash也可以用powerline风格的prompt，支持更广，设置也更麻烦～   

[Powerline Git，各位可以去看看](https://github.com/Lokaltog/powerline)

Ctags设置
---------
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
