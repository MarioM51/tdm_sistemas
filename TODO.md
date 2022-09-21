# Todo

- requeriments
  - avoid load old javascript scripts when these are updated.
  - send an email to the persons with the rol od order when the order is made, and one email to the client when its accepted .
  - show feedback message when the user info is updated.
  - admin comments
  - create a way to comunicate in case the can't send an email or do a phone call
  - upload source to git repository
  - validate inputs in api side
  - add https
  - add comments admin
  - strategy for backup and restore the database using dist folder
  - add key words to blog
  - .
  - .
  - .
  - _____________ In progres
    - .
    - .
    - .
  - _____________ Finished _____________
    - home page
    - link to admin
    - .
    - .
    - .

- frontend
  - When is select the same image that was just deleted, not do anything
  - add a delete and update request for every item in the collection of UIHelper, because
    currently i use only one, and when I delete one of them, all the delete buttons of all
    items show the deleting animation, making it seem (it doesn't really happend) that
    all the items are going to be deleted.
  - See the way to use only a model by comments, on products, blogs and the UI-comments,
    because I have two models BlogComment and UI-Comment, that causes that I have to
    convert between these which is pretty dirty

- backend
  - Hay algo **raro** al colsultar todos los productos, al parecer la libreria GORM regresa
    las fechas nulas con el valor del producto anterior, por ejemplo, si el primer producto
    tiene fecha y el segundo tiene fecha nula, entonces le asigna la misma fecha del primer
    producto, se creo **cleanRepitedOnHomeScreen()** en **src\product\02_data\ProductApiDAO.ts**
    para parchar de rapido el error.
