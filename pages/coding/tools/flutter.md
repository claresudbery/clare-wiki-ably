---
layout: page
location: pages/coding/tools/leaf
permalink: /pages/coding/tools/Flutter
---

# What is Flutter 

Flutter is an open-source software development kit which enables smooth and easy cross-platform mobile app development. You can build high quality natively compiled apps for iOS and Android quickly, without having to write the code for the two apps separately. All you need is one codebase for both platforms.

# Installing Flutter

- [Here](https://docs.flutter.dev/get-started/install/macos/web)
- Troubleshooting: 
    - Rosetta 2 is only needed if you have Apple Silicon. It's not needed for - and can't be installed on - a Mac with an Intel processor.
    - In order for flutter to work on command line, you have to add Flutter to your path, but you need to include `/bin` at the end of the path
        - I put this line into `~/.bashrc`: `export PATH=$PATH:[path-to-flutter]/flutter/bin`
            - (replace `[path-to-flutter]` with your flutter location)
        - Then run `source ~/.bashrc`