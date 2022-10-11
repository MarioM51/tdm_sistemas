# Todo

- requeriment
  - validate inputs in api side
  - add https
  - add key words to blog
  - .
  - .
  - .
  - _____________ In progres
    - upload source to git repository
    - send an email to the persons with the rol of order when the order is made, and one email to the client when its accepted .
    - .
    - .
  - _____________ Finished _____________
    - add response to comments and option to delete them to products
    - add response to comments and option to delete them to blogs
    - link to admin
    - avoid load old javascript scripts when these are updated.
    - show feedback message when the user info is updated.
    - strategy for backup and restore the database using dist folder
    - home page
    - Add contact info (street, map, phone number with whatsapp, email, )

..............................................................................
..............................................................................
..............................................................................

- frontend
  - See the way to use only a model by comments, on products, blogs and the UI-comments,
    because I have two models BlogComment and UI-Comment, that causes that I have to
    convert between these which is pretty dirty
  - _____________ PENDENT _____________
    - When is select the same image that was just deleted, not do anything
    - .

..............................................................................
..............................................................................
..............................................................................

- backend
  - Hay algo **raro** al colsultar todos los productos, al parecer la libreria GORM regresa
    las fechas nulas con el valor del producto anterior, por ejemplo, si el primer producto
    tiene fecha y el segundo tiene fecha nula, entonces le asigna la misma fecha del primer
    producto, se creo **cleanRepitedOnHomeScreen()** en **src\product\02_data\ProductApiDAO.ts**
    para parchar de rapido el error.
