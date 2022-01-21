# Appcelerator Titanium Dockerfile

> Inspired by the repos of https://github.com/HazemKhaled/Titanium-Docker and https://github.com/MartinDevillers/ti.build

## How to run

* download Dockerfile
* docker build . -t titanium-test
* docker run -t -v ~/localFiles:/root/files -i titanium-test bash

Change `localFiles` to your app folder.

It will open a terminal where you can run the Titanum CLI and build Android apps. You can now go into your app folder and run `ti build -p android -b`


## Todo

* Make it more useful :)
