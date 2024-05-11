# App Almacén de dragones

Un pequeño proyecto desarrollado en Flutter empleando POO, Provider para la gestion de estados y go_route para la navegación.
El proyecto esta enfocado en la plataforma movil con soporte a ambos SO (Android y iOS), el cual contienen un CRUD basado en el videojuego de antaño Dragon City.
El proyecto aun no cuenta con tests unitarios. 😅

# Tabla de contenidos
1. [Introducción](#introduction)
2. [Agradecimientos](#thanks)
3. [Requerimientos](#requeriments)
4. [Documentación](#doc)
5. [Librerias](#libraries)
6. [Equipo de trabajo](#team)
7. [Conclusiones](#end) 

## Introducción
El proyecto desarrollado para aplicaciones móviles Android e iOS trata sobre un CRUD el cual cuenta con 3 pantallas: Home Screen, Detail Screen ,Form Screen
Cuenta con funcionalidades interesantes como editar o eliminar los elementos de la lista deslizando de izquierda a derecha cada elemento.
A si mismo, el proyecto esta desarrollado aplicando principios de arquitectura limpia y junto a un intento de sistema de diseño Atomic Design.
El proyecto aun tiene muchas oportunidades de mejora, esta primera version esta enfocada en cumplir con los criterios minimos de aceptación definidos por el experto.

## Agradecimientos
Es indispensable agradecer a Alejandra Rodriguez Ruiz por su contribución en la solución a un bug dentro del proyecto 👏🏻.

## Requerimientos
Para descargar el repositorio se requiere VSCode, AndroidStudio o cualquier editor de codigo que les facilite la lectura, compresión y compilación del proyecto.
Para compilar para iOS se requiere contar con una Mac (o robarla como yo xd *es broma) junto a la ultima version de XCode.

## Documentación
A continuación se menciona las 3 pantallas de la aplicación:  
+ Home Screen(Pantalla principal):
 		En esta pantalla podremos observar un listado de tarjetas que inicialmente mostrará 2 elementos, podemos interacturar con estos elementos ya sea deslizandolos 
	 de izquierda a derecha para editar o eliminar el elemento, o haciendo tap en el 	elemento para poder ingresar a la siguiente vista llamada Detail Screen. 
	Si no se cuenta con algun elemento dentro del listado, la pantalla mostrará una vista referente. Adicionalmente podemos encontrar un boton flotante con un 
 icono de huevo, al interactuar con este widget podemos ingresar a otra vista llamada Form Screen en donde podremos encontrar un formulario para crear un nuevo elemento.
+ Detail Screen:
		En esta pantalla podremos encontrar información del elemento seleccionado previamente como la imagen del dragon, el nivel, una descripción, la información de elementos 
	vulnerables seguido de 3 botones: Ataque, Editar, Eliminar  
	1. Botón Ataque: Al interactuar con este, muestra un snack bar con el ataque del dragon dependiendo del elemento al cual pertenece.  
	2. Botón Editar: Al interactuar con este, redirige a la vista de Form Screen enviando los datos del dragon esperando una posible actualización de estos.  
	3. Botón Eliminar: Al interactuar con este, redirige a la vista anterior eliminando el elemento que estabamos observando del listado de la pantalla principal.   
+ Form Screen:
		En esta pantalla podremos encontrar un formulario con la información del elemento enviado desde las pantallas anteriores con la intención de editar, o por lo contrario un 
	formulario vació listo para crear un nuevo dragon  
	1. Formulario completado: Al tener este escenario se cuenta con todos los campos completados con la información recibida, y dos botones: botón Actualizar con un color azul 
	el cual retornara a la pantalla anterior una vez actualizados los datos, y el botón cancelar el cual retornara a la vista anterior sin realizar cambio alguno.  
	2. Formulario vació: Al tener este escenario observaremos un formulario listo para ingresar el nombre, descripción y nivel el cual brinda un teclado numerico esperando el 
	ingreso de solo números. Adicionalmente encontraremos dos botones: botón Guardar para añadir el nuevo elemento a la lista y retornar a la pantalla anterior (home screen) y 
 el botón Cancelar para retornar a la pantalla anterior sin añadir algun elemento.

 ## Librerias
 A continuación se comparte las librerias empleadas:  
	* [go_route](https://pub.dev/packages/go_router)  
 	* [provider](https://pub.dev/packages/provider)  
	*	[flutter_svg](https://pub.dev/packages/flutter_svg)  
 	* [flutter_slidable](https://pub.dev/packages/flutter_slidable)  

 ## Equipo de trabajo
 Su servidor Antony Raul Cristobal Zambrano desde Perú 🇵🇪

 ## Conclusiones
 Al desarrollar el presente proyecto se logro conocer los conceptos basicos de widgets, gestion de estado y navegación necesarios para enfrentar proyectos reales. Se logro adicionalmente poner en practica diferentes conocimientos obtenidos hasta la fecha para desarrollar este pequeño proyecto.
 Espero que este proyecto cumpla con sus expectativas y sirva como referencia para otros colegas que se adentran en el mundo de Flutter 🩵.
