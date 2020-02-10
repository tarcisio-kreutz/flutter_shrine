# flutter_shrine
Flutter shrine example decoupled from the gallery and then changed for my own learning.  

This project comes from:  
git clone --single-branch -b master https://github.com/flutter/flutter.git flutter_shrine/lib  
cd flutter_shrine/lib  
git filter-branch --subdirectory-filter examples/flutter_gallery/lib/demo/shrine HEAD  
cd ../../flutter_shrine  
 git init  
 {edit/bring in .gitignore, LICENSE, README.md}  
 git add .gitignore LICENSE README.md  
 git add lib/\*  
git commit -m "https://github.com/flutter/flutter.git : examples/flutter_gallery/lib/demo/shrine"  
git remote add origin https://github.com/tarcisio-kreutz/flutter_shrine.git  
git remote -v  
git push -u origin master  







