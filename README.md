# dog_show

A flutter test project as an assignment for Deliveristo

# Instructions

https://github.com/andreaperinu/flutter-challenge

# Technology

Flutter has been used for developing the application

# PLatforms

1. Android (Over API 23)
2. iOS
3. Web (use this command to run on the web: flutter run -d chrome --web-browser-flag "--disable-web-security")

# Features

1. Internet check
2. Localization (Only English is available now)
3. Fetch Breed List
4. Preview network images
5. Cached images
6. Show masonry layout for listview images
7. Available on multiple platforms
8. Basic Unit test
9. CI/CD using GitHub action

# Architecture

I have used MVVM for the whole project. Didn't implement clean architecture cause the application is simple, implementing clean architecture seems over-engineering & will lead to complexity in maintaining. Though I tried to follow SOLID principles. 

# Scope of improvements

1. UI => UI can be more beautiful & user-friendly, but i have tried my best here
2. test cases => there are scope of improvement in testing

## Basic instructions on how to use

This project fetches data from online resources & shows based on

1. Breed
2. Sub-breeds

when the user opens the app it will show the breed list. from the breed list, the user can tap to go to other pages. Every item contains 3 Buttons

1. Show Random -> Show a random image from that breed
2. Show list by breed -> Show all images from that breed in masonry layout
3. show sub-breed list -> Show the sub-breeds list if available

Sub-breed list page will show the list of sub-breed's names. Every item will contain 2 buttons

1. Show Random -> Show a random image from that sub-breed
2. List by sub-breed -> Show all images from that sub-breed in masonry layout

Click on any images from the list to preview the Image section
