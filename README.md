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
Powerline貌似官方又出了vim版本，可以直接bundle～    
[Powerline Git，各位可以去看看，这里有字体补丁～你可以使用自己喜欢的字体。](https://github.com/Lokaltog/powerline)


Ctags关于LaTeX的设置
--------------------
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

Patcher用法
-----------
```
fontpatcher.py font-name.ttf
```
然后将生成的字体移动到`~/.fonts/`里面，`fc-cache -fv`刷新缓存。
