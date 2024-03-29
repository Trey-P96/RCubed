# R - Cubed Website

## Versions
CURRENT BUILD VERSIONS: <br>
Flutter (Channel stable, 3.3.4, on Microsoft Windows [Version 10.0.19045.2251], locale en-US) <br>
Dart version 2.18.2 <br><br>

## Helpful Tip
TO REVERT TO FLUTTER VERSION 3.3.4 OPEN TERMINAL AND NAVIGATE TO YOUR MACHINE'S FLUTTER INSTALL DIRECTORY
THEN INSIDE "C:/../flutter" run command "git checkout eb6d86e" <br>
FOR OTHER VERSIONS SEE: https://flutter-ko.dev/development/tools/sdk/releases

## Steps to Build

Step 1.1: Set flutter version to 3.3.4 (see Helpful Tip above for details) <br><br>
Step 1.2: execute the build command: flutter build web --release --web-renderer auto --release --dart-define=BROWSER_IMAGE_DECODING_ENABLED=false <br><br>
Step 2: AFTER BUILDING FOR WEB, ADD SCRIPT (LOCATED BELOW THIS LINE) TO: build/web/index.html inside <body>. Be sure to paste inside <body> before any other scripts. <br><br>
````{verbatim, lang="markdown"}
<script>
  if(screen.availWidth < 600 || screen.availHeight < 600) window.flutterWebRenderer = "html";
  else{window.flutterWebRenderer = "canvaskit";}
</script>
````
<br><br>
Step 3 (for staging): update href inside build/web/index.html on line 17 to "/staged/" (assuming "staged" folder exists under /root) .. for production: set <base href="/"> <br><br>
Step 3.1: inside build/web/index.html replace "A new Flutter project" inside <meta name="description" content="A new Flutter project."><br><br>
Step 4: copy code from index.html and paste into 404.html. If 404.html does not exist inside build folder, then create it manually in same folder as index.html... <br>
ps. if in staged, manually typing url in url bar (eg. rcubedco/staged/contact) will result in 404 page not found. <br><br>
Step 5: under project folder navigate to folder "icons" and copy all files EXCEPT for favicon.png, then paste and overwrite into build/web/icons. Then copy and overwrite favicon.png to build/web <br><br>
Step 6: inside build/web/ replace favicon.png with favicon.png located in RCubed/icons. <br><br>
Step 7: upload files under build/web/ to desired destination. 
