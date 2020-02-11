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
 git add lib/\\*  
git commit -m "https://github.com/flutter/flutter.git : examples/flutter_gallery/lib/demo/shrine"  
git remote add origin https://github.com/tarcisio-kreutz/flutter_shrine.git  
git remote -v  
git push -u origin master  

===============  
== flutter_shrine edits to enable it for running alone  
flutter create .  
{update pubspec.yaml}  
{open flutter_shrine in Android Studio}  
{fix the broken package references}  
{create main.dart}
{fix model-related initializations}

===============  
== What about Web support?  
== https://stackoverflow.com/questions/56332913/is-it-possible-to-use-android-studio-to-build-a-website-in-flutter  
cd flutter_shrine  
flutter upgrade --force  
flutter channel beta  
flutter upgrade  
flutter config --enable-web  
flutter create .  
flutter devices  
flutter run -d chrome  

===============  



