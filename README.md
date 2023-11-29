# R - Cubed

A new Flutter project.

## Getting Started

## Versions
CURRENT BUILD VERSIONS:
Flutter (Channel stable, 3.3.4, on Microsoft Windows [Version 10.0.19045.2251], locale en-US)
Dart version 2.18.2

--HINT--: TO REVERT TO FLUTTER VERSION 3.3.4 OPEN TERMINAL AND NAVIGATE TO YOUR MACHINE'S FLUTTER INSTALL DIRECTORY
THEN INSIDE "C:/../flutter" run command "git checkout eb6d86e"
FOR OTHER VERSIONS SEE: https://flutter-ko.dev/development/tools/sdk/releases

## Steps to Build

Step 1.1: Set flutter version to 3.3.4 (see hints above for details)
Step 1.2: execute the build command: flutter build web --release --web-renderer auto --release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false
Step 2: AFTER BUILDING FOR WEB, ADD SCRIPT (LOCATED BELOW THIS LINE) TO: build/web/index.html inside <body>. Be sure to paste inside <body> before any other scripts.

<script>
  if(screen.availWidth < 600 || screen.availHeight < 600) window.flutterWebRenderer = "html";
  else{window.flutterWebRenderer = "canvaskit";}
</script>


Step 3 (for staging): update href inside build/web/index.html on line 17 to "/staged/" (assuming "staged" folder exists under /root) .. for production: set <base href="/">
Step 4: copy code from index.html and paste into 404.html. If 404.html does not exist inside build folder, then create it manually in same folder as index.html... 
ps. if in staged, manually typing url in url bar (eg. rcubedco/staged/contact) will result in 404 page not found.

Step 5: under project folder navigate to folder "icons" and copy all files EXCEPT for favicon.png, then paste and overwrite into build/web/icons. Then copy and overwrite favicon.png to build/web
Step 6: inside build/web/ replace favicon.png with favicon.png located in RCubed/icons.
Step 7: upload files under build/web/ to desired destination.
