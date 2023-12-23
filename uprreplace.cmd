:: Replace Utility

@echo off

replaceText gruntfile.js %2 %1
replaceText package.json %2 %1
replaceText %1.sublime-project %2 %1
replaceText package.json %4 %3
