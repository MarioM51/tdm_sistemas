# Sistemas

- [Sistemas](#sistemas)
  - [Server App](#server-app)
    - [API](#api)
    - [Compilar server_app.exe](#compilar-server_appexe)
    - [Crear carpeta dist](#crear-carpeta-dist)
    - [Crear imagen para publiar](#crear-imagen-para-publiar)

## Server App

### API

### Compilar server_app.exe

- Notas
  - El siguiente comando solo crea el .exe, tambien se necesitan los archivos como los templates,
    htmls, png, etc.
  - En windows ejecutar el comando en cmd, ya que el git bash da error por un tema de rutas.
  - La ruta es absoluta asi que fijarse que se tiene el proyecto en la misma ruta.

### Crear carpeta dist

```r
bash ./build_dist_folder.sh --env test
```

### Crear imagen para publiar

```r
docker build -f server_publish.dockerfile --tag mario51/carro_de_madera:0.0.3 .
```

Para correr la imagen

```r
docker run --name carro_de_madera_web_server -p 80:80 mario51/carro_de_madera:0.0.3
```

subir imagen

```r

```
