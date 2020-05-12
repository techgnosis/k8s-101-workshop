# Creating a Container Image

[cloud native buildpacks](https://buildpacks.io/)
[paketo buildpacks](https://paketo.io/)

### Clone the code repo

```
git clone https://github.com/warroyo/Containerized.git
```

### login to harbor with the docker cli

```
docker login <harbor url>
```

### Build and publish the image

```
cd Containerized
pack build <harbor url>/workshop/kuber<number>-app:1.0.0 --builder gcr.io/paketo-buildpacks/builder:base --publish
```

### run the image locally

```
docker run -it --rm -p 8000:8080 -e "PORT=8080" <harbor url>/workshop/kuber<number>-app:1.0.0

```
navigate to localhost:8000


### inspect metadata on the image

```
pack inspect-image <harbor url>/workshop/kuber<number>-app:1.0.0
```


### rebase the image

```
pack rebase <harbor url>/workshop/kuber<number>-app:1.0.0
```

### view the images in harbor

navigate to `<harbor url>` in your browser and login. go to the `workshop` project explore the tabs etc.