# Titanium SDK Dockerfile

> Inspired by the repos of https://github.com/HazemKhaled/Titanium-Docker and https://github.com/MartinDevillers/ti.build

## How to run

* download Dockerfile
* `docker build --tag 'titanium-test' .`
* `docker run -t -v ~/localFiles:/root/files -i titanium-test bash` (change `localFiles` to your app folder.)

It will open a terminal where you can run the Titanum CLI and build Android apps. You can now go into your app folder and run `ti build -p android -b`

#### Run build command in docker exec
* keep that running and open a second console
* run `docker container list` and get the ID
* run `docker exec -i 1234567890ab ti build -p android` (change `1234567890ab` to your ID)




## Todo

* Make it more useful :)
