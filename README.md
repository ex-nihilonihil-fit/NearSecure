# rf_block

An app to detect and block RF signals.

## Some Notes About Flutter

Flutter compiles code for both iOS and Android, so it's conventions are a little 
different than other apps. Some things to note:

- Most of the relevant code is in the "lib" folder. Trying to change code directly 
in the android or iOS folders will probably result in compile errors.

- The first page of the app is represented in the main.dart file. 

- The best way to add dependencies is to call "flutter install <dependency name>"
in the terminal, which will then allow you to call it for your methods and classes. 

- It's important to check the dependency documentation at pub.dev. Many dependencies 
require changes to the application manifest and .plist files to work.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
