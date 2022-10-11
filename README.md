# Sistemas

- [Sistemas](#sistemas)
  - [Server App](#server-app)
    - [API](#api)
    - [Compilar server_app.exe](#compilar-server_appexe)
    - [Crear carpeta dist](#crear-carpeta-dist)
    - [Crear imagen para publiar](#crear-imagen-para-publiar)
    - [Pasos de la creacion y restauracion de respaldos](#pasos-de-la-creacion-y-restauracion-de-respaldos)

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

### Pasos de la creacion y restauracion de respaldos

create_backup.sh --name ejemplo_uno --dir_output ./backups
   1, Crea respaldo de la bd que contiene el schema y los datos y lo mete en dist/
   2, Crea un comprimido del dist/ en la carpeta indicada con el nombre dado y le agrega al inicio la fecha en formato ISO
   3, imprime el nombre del archivo creado con su ruta absoluta

restore_backup.sh --file some_backup.zip
  1, Confirma si existe el archivo indicado
  2, Correra el script de crear backup, y le pondra "pre_" mas el nombre del backup
  3, Imrpime nombre del backup creado
  3, sustitulle dist/
  4, recrea la BD usando el respando dentro de dist/
  5, por seguridad elimina el backup de BD dentro de dist/ (NO eliminar el del comprimido)
  6, imprime que se restauro el respaldo correctamente e instrucciones de como iniciarlo.
