/*
 ███████╗██████╗  █████╗  ██████╗████████╗ █████╗ ██╗     ███████╗███████╗
 ██╔════╝██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██║     ██╔════╝██╔════╝
 █████╗  ██████╔╝███████║██║        ██║   ███████║██║     █████╗  ███████╗
 ██╔══╝  ██╔══██╗██╔══██║██║        ██║   ██╔══██║██║     ██╔══╝  ╚════██║
 ██║     ██║  ██║██║  ██║╚██████╗   ██║   ██║  ██║███████╗███████╗███████║
 ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
______________________Estudiante: Angelo Ramírez Ortega____________________
______________________Grupo: Lenguajes de Programación____________________
______________________Carnet: 2017080055__________________________________
*********************** Análisis de resultados ***************************
Circulos: A, se puede parametrizar el radio y la cantidad de segmentos y
los dibuja correctamente(si se eligen 4, se haria un cuadrado,
5 un pentagono, etc).
Copo de nieve: A, Se realiza correctamente.
Corbatin: A, Se realiza correctamente.
Estrella: A, Se realiza correctamente.
Panal: A, Se realiza correctamente.
Tapete Externo: A, Se realiza correctamente.
Tapete Interno: A, Se realiza correctamente.
Aros: A, Se realiza correctamente.
Tonel: A, Se realiza correctamente.
Propios: A, se ingeniaron 3 fractales propios.
Secuencia de colores: A, Se generan todo los fractales con secuencias de
colores.
Colores aleatorios: A, se generan colores aleatorios.

************************** Manual de usuario *****************************

1) Instalación de la libreria PROLOGO:
		-Se va al siguiente link y se descarga:
				http://prologo.sourceforge.net/
		-Se descomprime y se coloca en la misma carpeta en la cual se tiene
		este programa.
		-Se corren los siguientes comandos.
			[logo].
			['Fractal-Ramirez-Angelo'].
		-Se puede proceder a correr cualquier fractal con los siguientes
		nombres:
				copoDeNieve
				estrella
				cortbatin
				panal
				tapeteExterno
				tapeteInterno
				aros
				tonel
				propio1
				propio2
				propio3 (se dejaron estos nombres por cuestiones de simplicidad)

		-Para correr con secuencia de colores se agrega el sufjo Colores
				Ej: copoDeNieveColores

		-Para correr aleatorios se agrega el sufijo Random
				Ej: copoDeNieveRandom

		-NOTA: Los fractales que requieren circulos reciben un parametro
		adicional, la cantidad de segmentos en las que se divide el circulo.
				Ej: aros(2,300,20). Se divide cada circulo en 20 segmentos.

		-Las relaciones se llaman de la siguiente manera->
			copoDeNieve(Nivel,Tamanho).
		Con circulos ->
			aros(Nivel,Tamanho,CantidadSegmentos).
************************************************************************

 */
/*Colores de Logo, para utilizar con los colores aleatorios*/
color(1,blue).
color(2,green).
color(3,cyan).
color(4,red).
color(5,magenta).
color(6,yellow).
color(7,white).

/*circulo*/
circulo(Radio,Segmentos):-
	get(@myturtle_class,x,X), %Obtiene la coordenada X en la que se encuentra la tortuga
	get(@myturtle_class,y,Y), %Obtiene la coordenada Y en la que se encuentra la tortuga
  penup,
  PedazoSize is 2*pi/Segmentos,
  Cord1 is X + Radio * cos(PedazoSize), %se posiciona el X inicial
  Cord2 is Y + Radio * sin(PedazoSize), %se posiciona el Y inicial
  setxy(Cord1,Cord2),
  pendown,
	circulo(Radio,X,Y,0,PedazoSize),
	penup,
	setxy(X,Y),
	pendown.

circulo(_,_,_,Angulo,_):-
	Angulo>2*pi,!. %condicion de parada, ya se hizo una vuelta completa de la funcion.

circulo(Radio,X,Y,Angulo,Pedazo):- %no se levanta el lapicero para que el circulo se dibuje completo
	Cord1 is X + Radio * cos(Angulo), %se rota la coordenada del nuevo punto con el angulo
	Cord2 is Y + Radio * sin(Angulo),
	setxy(Cord1,Cord2), %Se posiciona el punto
  AnguloNuevo is Angulo + Pedazo,
	circulo(Radio,X,Y,AnguloNuevo,Pedazo). % llamada recursiva rotando el angulo.

/*Copo de nieve*/
dragon(0,Size):- forward(Size).

dragon(Nivel,Size):-
  Trozo is Size/3,
  Nivel1 is Nivel-1,
  dragon(Nivel1,Trozo),
  left(60),
  dragon(Nivel1,Trozo),
  right(120),
  dragon(Nivel1,Trozo),
  left(60),
  dragon(Nivel1,Trozo).

copoDeNieve(Nivel,Size):-
	logo,
  penup,
  forward(60),
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	dragon(Nivel,Size),
	right(120),
	dragon(Nivel,Size),
	right(120),
	dragon(Nivel,Size),
  hideturtle.

/*Corbatin*/

corbatinRecursive(0,Size):- forward(Size).

corbatinRecursive(Nivel, Size):-
  Nivel1 is Nivel-1,
  Length is Size/3,
  left(60),
  corbatinRecursive(Nivel1,Length),
  right(120),
  corbatinRecursive(Nivel1, Length),
  corbatinRecursive(Nivel1, Length),
  left(120),
  corbatinRecursive(Nivel1,Length),
  right(60).

corbatin(Nivel, Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
  corbatinRecursive(Nivel,Size),
  right(90),
  corbatinRecursive(Nivel,Size),
  right(90),
  corbatinRecursive(Nivel,Size),
  right(90),
  corbatinRecursive(Nivel,Size),
  hideturtle.

/*Estrella*/

estrellaRecursive(0,Size):- forward(Size).

estrellaRecursive(Nivel, Size):-
  Nivel1 is Nivel-1,
  Length is Size/2,
  right(30),
  estrellaRecursive(Nivel1,Length),
  left(60),
  estrellaRecursive(Nivel1,Length),
  right(30).

estrella(Nivel, Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
  left(45),
  estrellaRecursive(Nivel,Size),
  right(90),
  estrellaRecursive(Nivel,Size),
  right(90),
  estrellaRecursive(Nivel,Size),
  right(90),
  estrellaRecursive(Nivel,Size),
  hideturtle.

/*Panal*/
panalRecursive(0,Tam):-
	forward(Tam).

panalRecursive(Nivel,Size):-
	Nivel1 is Nivel-1,
	Length is Size/3,
	penup,
	forward(Length),
	pendown,
	left(135),
	panalRecursive(Nivel1,Length),
	left(180),
	penup,
	forward(Length),
	pendown,
	right(90),
	panalRecursive(Nivel1,Length),
  left(180),
	penup,
	forward(Length),
	pendown,
	right(45),
	panalRecursive(Nivel1,Length),
	left(45),
	panalRecursive(Nivel1,Length),
  left(180),
	penup,
	forward(Length),
	pendown,
	left(90),
	panalRecursive(Nivel1,Length),
  left(180),
	penup,
	forward(Length),
	pendown,
	right(135),
	penup,
	forward(Length),
	pendown.

panal(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	panalRecursive(Nivel,Size),
	right(90),
	panalRecursive(Nivel,Size),
	right(90),
	panalRecursive(Nivel,Size),
	right(90),
	panalRecursive(Nivel,Size),
  hideturtle.

/*tapete externo*/

tapeteExternoRecursive(0,Size):- forward(Size).

tapeteExternoRecursive(Nivel,Size):-
  Length is Size/5,
  Nivel1 is Nivel-1,
  tapeteExternoRecursive(Nivel1,Length),
  left(90),
  tapeteExternoRecursive(Nivel1,Length),
  right(90),
  tapeteExternoRecursive(Nivel1,Length),
  right(90),
  tapeteExternoRecursive(Nivel1,Length),
  left(90),
  tapeteExternoRecursive(Nivel1,Length).

tapeteExterno(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	tapeteExternoRecursive(Nivel,Size),
	right(90),
	tapeteExternoRecursive(Nivel,Size),
	right(90),
	tapeteExternoRecursive(Nivel,Size),
	right(90),
	tapeteExternoRecursive(Nivel,Size),
  hideturtle.

/*tapete interno*/

tapeteInternoRecursive(0,Size):- forward(Size).

tapeteInternoRecursive(Nivel,Size):-
  Length is Size/5,
  Nivel1 is Nivel-1,
  tapeteInternoRecursive(Nivel1,Length),
  right(90),
  tapeteInternoRecursive(Nivel1,Length),
  left(90),
  tapeteInternoRecursive(Nivel1,Length),
  left(90),
  tapeteInternoRecursive(Nivel1,Length),
  right(90),
  tapeteInternoRecursive(Nivel1,Length).

tapeteInterno(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	tapeteInternoRecursive(Nivel,Size),
	right(90),
	tapeteInternoRecursive(Nivel,Size),
	right(90),
	tapeteInternoRecursive(Nivel,Size),
	right(90),
	tapeteInternoRecursive(Nivel,Size),
  hideturtle.

/*Aros*/

arosRecursive(0,Size,Segmentos):-
  circulo(Size,Segmentos).

arosRecursive(Nivel,Size,Segmentos):-
  Nivel1 is Nivel-1,
  Length is Size /3,
  arosRecursive(Nivel1,Length,Segmentos),
  penup,
  right(120),
  forward(Length),
  pendown,
  arosRecursive(Nivel1,Length,Segmentos),
  penup,
  right(120),
  forward(Length),
  pendown,
  arosRecursive(Nivel1,Length,Segmentos),
  right(120).

aros(Nivel,Size,Segmentos):-
  logo,
  setbgcolor(black),
  setpencolor(white),
  arosRecursive(Nivel,Size,Segmentos),
  hideturtle.

/*Tonel*/
tonelRecursive(0,Size,Segmentos):-
  circulo(Size,Segmentos).

tonelRecursive(Nivel,Size,Segmentos):-
  Nivel1 is Nivel-1,
  Length is Size/3,
  SmallCircle is Size*2/3,
	tonelRecursive(Nivel1,Size,Segmentos),
	penup,
	forward(SmallCircle),
	pendown,
	tonelRecursive(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
	right(120),
	forward(SmallCircle),
	pendown,
	tonelRecursive(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
	right(120),
	forward(SmallCircle),
	pendown,
	tonelRecursive(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
  pendown,
	right(120).

tonel(Nivel,Size,Segmentos):-
  logo,
  setbgcolor(black),
  setpencolor(white),
  tonelRecursive(Nivel,Size,Segmentos),
  penup,
  right(120),
  forward(Size*2),
  pendown,
  tonelRecursive(Nivel,Size,Segmentos),
  penup,
  right(120),
  forward(Size*2),
  pendown,
  tonelRecursive(Nivel,Size,Segmentos),
  right(120),
  hideturtle.

/*Propios*/
propio1Recursive(0,Size):- forward(Size). %Se hace un pequenho zig-zag
propio1Recursive(Nivel,Size):-
	Trozo is Size/4,
  Nivel1 is Nivel-1,
  propio1Recursive(Nivel1,Trozo),
  left(90),
  propio1Recursive(Nivel1,Trozo),
  right(90),
  propio1Recursive(Nivel1,Trozo),
  left(90),
  propio1Recursive(Nivel1,Trozo),
	left(90).


propio1(Nivel,Size):- %Se dibuja la base de forma \_/
logo,
setbgcolor(black),
setpencolor(white),
right(120),
propio1Recursive(Nivel,Size),
left(60),
propio1Recursive(Nivel,Size),
propio1Recursive(Nivel,Size),
left(60),
propio1Recursive(Nivel,Size)
,hideturtle.


propio2Recursive(0,Size):- dragon(1,Size), dragon(1,Size). % la linea base es -/\--/\-
propio2Recursive(Nivel,Size):- % se hace un hexagono
  Length is Size/3,
  Nivel1 is Nivel-1,
  propio2Recursive(Nivel1,Length),
  left(120),
  propio2Recursive(Nivel1,Length),
  right(60),
  propio2Recursive(Nivel1,Length),
  right(60),
  propio2Recursive(Nivel1,Length),
  right(60),
  propio2Recursive(Nivel1,Length),
  right(60),
  propio2Recursive(Nivel1,Length),
  right(60),
  propio2Recursive(Nivel1,Length),
  left(120),
  propio2Recursive(Nivel1,Length).

propio2(Nivel,Size):-
	logo,
  penup,
	setxy(0,-150),
  pendown,
  left(270),
  setbgcolor(black),
  setpencolor(white),
	propio2Recursive(Nivel,Size), %se monta sobre un cuadrado.
	right(90),
	propio2Recursive(Nivel,Size),
	right(90),
	propio2Recursive(Nivel,Size),
	right(90),
	propio2Recursive(Nivel,Size),
  hideturtle.

propio3Recursive(0,Size):- forward(Size). %linea recta base
propio3Recursive(Nivel,Size):- %Se hace un semi hexagono que abre otro similar a la curva de levy c
  Trozo is Size/4,
  Nivel1 is Nivel-1,
  propio3Recursive(Nivel1,Trozo),
	right(60),
	propio3Recursive(Nivel1,Trozo),
	right(60),
	propio3Recursive(Nivel1,Trozo),
	left(60),
	propio3Recursive(Nivel1,Trozo),
	left(60),
	propio3Recursive(Nivel1,Trozo),
	left(60),
	propio3Recursive(Nivel1,Trozo),
	right(60),
	propio3Recursive(Nivel1,Trozo).

propio3(Nivel,Size):-
  logo,
  setbgcolor(black),
  setpencolor(white),
	propio3Recursive(Nivel,Size),
	hideturtle.


/*
Versiones coloridas
*/

/*Copo de nieve*/
dragonColores(0,Size):- forward(Size).

dragonColores(Nivel,Size):-
  Trozo is Size/3,
  Nivel1 is Nivel-1,
  setpencolor(yellow),
  dragonColores(Nivel1,Trozo),
  left(60),
  setpencolor(blue),
  dragonColores(Nivel1,Trozo),
  right(120),
  setpencolor(red),
  dragonColores(Nivel1,Trozo),
  left(60),
  dragonColores(Nivel1,Trozo).

copoDeNieveColores(Nivel,Size):-
	logo,
  penup,
  forward(60),
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	dragonColores(Nivel,Size),
	right(120),
	dragonColores(Nivel,Size),
	right(120),
	dragonColores(Nivel,Size),
  hideturtle.

/*Corbatin*/

corbatinRecursiveColores(0,Size):- forward(Size).

corbatinRecursiveColores(Nivel, Size):-
  Nivel1 is Nivel-1,
  Length is Size/3,
  left(60),
  setpencolor(white),
  corbatinRecursive(Nivel1,Length),
  right(120),
  setpencolor(red),
  corbatinRecursive(Nivel1, Length),
  corbatinRecursive(Nivel1, Length),
  left(120),
  setpencolor(white),
  corbatinRecursive(Nivel1,Length),
  right(60).

corbatinColores(Nivel, Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
  corbatinRecursiveColores(Nivel,Size),
  right(90),
  corbatinRecursiveColores(Nivel,Size),
  right(90),
  corbatinRecursiveColores(Nivel,Size),
  right(90),
  corbatinRecursiveColores(Nivel,Size),
  hideturtle.

/*Estrella*/

estrellaRecursiveColores(0,Size):- forward(Size).

estrellaRecursiveColores(Nivel, Size):-
  Nivel1 is Nivel-1,
  Length is Size/2,
  right(30),
  setpencolor(magenta),
  estrellaRecursiveColores(Nivel1,Length),
  left(60),
  setpencolor(cyan),
  estrellaRecursiveColores(Nivel1,Length),
  right(30).

estrellaColores(Nivel, Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
  left(45),
  estrellaRecursiveColores(Nivel,Size),
  right(90),
  estrellaRecursiveColores(Nivel,Size),
  right(90),
  estrellaRecursiveColores(Nivel,Size),
  right(90),
  estrellaRecursiveColores(Nivel,Size),
  hideturtle.

/*Panal*/
panalRecursiveColores(0,Tam):-
	forward(Tam).

panalRecursiveColores(Nivel,Size):-
	Nivel1 is Nivel-1,
	Length is Size/3,
	penup,
	forward(Length),
	pendown,
  setpencolor(green),
	left(135),
	panalRecursiveColores(Nivel1,Length),
	left(180),
  forward(Length),
	right(90),
	panalRecursiveColores(Nivel1,Length),
  left(180),
  forward(Length),
	right(45),
  setpencolor(yellow),
	panalRecursiveColores(Nivel1,Length),
	left(45),
	panalRecursiveColores(Nivel1,Length),
  left(180),
  forward(Length),
	left(90),
	panalRecursiveColores(Nivel1,Length),
  left(180),
  forward(Length),
	right(135),
	penup,
	forward(Length),
	pendown.

panalColores(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	panalRecursiveColores(Nivel,Size),
	right(90),
	panalRecursiveColores(Nivel,Size),
	right(90),
	panalRecursiveColores(Nivel,Size),
	right(90),
	panalRecursiveColores(Nivel,Size),
  hideturtle.

/*tapete externo*/

tapeteExternoRecursiveColores(0,Size):- forward(Size).

tapeteExternoRecursiveColores(Nivel,Size):-
  Length is Size/5,
  Nivel1 is Nivel-1,
  tapeteExternoRecursiveColores(Nivel1,Length),
  setpencolor(magenta),
  left(90),
  tapeteExternoRecursiveColores(Nivel1,Length),
  setpencolor(white),
  right(90),
  tapeteExternoRecursiveColores(Nivel1,Length),
  setpencolor(red),
  right(90),
  tapeteExternoRecursiveColores(Nivel1,Length),
  setpencolor(cyan),
  left(90),
  tapeteExternoRecursiveColores(Nivel1,Length).

tapeteExternoColores(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	tapeteExternoRecursiveColores(Nivel,Size),
	right(90),
	tapeteExternoRecursiveColores(Nivel,Size),
	right(90),
	tapeteExternoRecursiveColores(Nivel,Size),
	right(90),
	tapeteExternoRecursiveColores(Nivel,Size),
  hideturtle.

/*tapete interno*/

tapeteInternoRecursiveColores(0,Size):- forward(Size).

tapeteInternoRecursiveColores(Nivel,Size):-
  Length is Size/5,
  Nivel1 is Nivel-1,
  setpencolor(blue),
  tapeteInternoRecursiveColores(Nivel1,Length),
  right(90),
  setpencolor(white),
  tapeteInternoRecursiveColores(Nivel1,Length),
  left(90),
  setpencolor(red),
  tapeteInternoRecursiveColores(Nivel1,Length),
  left(90),
  setpencolor(white),
  tapeteInternoRecursiveColores(Nivel1,Length),
  right(90),
  setpencolor(blue),
  tapeteInternoRecursiveColores(Nivel1,Length).

tapeteInternoColores(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	tapeteInternoRecursiveColores(Nivel,Size),
	right(90),
	tapeteInternoRecursiveColores(Nivel,Size),
	right(90),
	tapeteInternoRecursiveColores(Nivel,Size),
	right(90),
	tapeteInternoRecursiveColores(Nivel,Size),
  hideturtle.

/*Aros*/

arosRecursiveColores(0,Size,Segmentos):-
  circulo(Size,Segmentos).

arosRecursiveColores(Nivel,Size,Segmentos):-
  Nivel1 is Nivel-1,
  Length is Size /3,
  setpencolor(red),
  arosRecursiveColores(Nivel1,Length,Segmentos),
  penup,
  right(120),
  forward(Length),
  pendown,
  setpencolor(yellow),
  arosRecursiveColores(Nivel1,Length,Segmentos),
  penup,
  right(120),
  forward(Length),
  pendown,
  arosRecursiveColores(Nivel1,Length,Segmentos),
  right(120).

arosColores(Nivel,Size,Segmentos):-
  logo,
  setbgcolor(black),
  setpencolor(white),
  arosRecursiveColores(Nivel,Size,Segmentos),
  hideturtle.

/*Tonel*/
tonelRecursiveColores(0,Size,Segmentos):-
  circulo(Size,Segmentos).

tonelRecursiveColores(Nivel,Size,Segmentos):-
  Nivel1 is Nivel-1,
  Length is Size/3,
  SmallCircle is Size*2/3,
  setpencolor(yellow),
	tonelRecursiveColores(Nivel1,Size,Segmentos),
	penup,
	forward(SmallCircle),
	pendown,
  setpencolor(magenta),
	tonelRecursiveColores(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
	right(120),
	forward(SmallCircle),
	pendown,
  setpencolor(red),
	tonelRecursiveColores(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
	right(120),
	forward(SmallCircle),
	pendown,
  setpencolor(white),
	tonelRecursiveColores(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
  pendown,
	right(120).

tonelColores(Nivel,Size,Segmentos):-
  logo,
  setbgcolor(black),
  setpencolor(white),
  tonelRecursiveColores(Nivel,Size,Segmentos),
  penup,
  right(120),
  forward(Size*2),
  pendown,
  tonelRecursiveColores(Nivel,Size,Segmentos),
  penup,
  right(120),
  forward(Size*2),
  pendown,
  tonelRecursiveColores(Nivel,Size,Segmentos),
  right(120),
  hideturtle.

/*Propios*/
propio1RecursiveColores(0,Size):- forward(Size).
propio1RecursiveColores(Nivel,Size):-
	Trozo is Size/4,
  Nivel1 is Nivel-1,
	setpencolor(red),
  propio1RecursiveColores(Nivel1,Trozo),
  left(90),
	setpencolor(yellow),
  propio1RecursiveColores(Nivel1,Trozo),
  right(90),
  propio1RecursiveColores(Nivel1,Trozo),
  left(90),
	setpencolor(red),
  propio1RecursiveColores(Nivel1,Trozo),
	left(90).


propio1Colores(Nivel,Size):-
logo,
setbgcolor(black),
setpencolor(white),
right(120),
propio1RecursiveColores(Nivel,Size),
left(60),
propio1RecursiveColores(Nivel,Size),
propio1RecursiveColores(Nivel,Size),
left(60),
propio1RecursiveColores(Nivel,Size)
,hideturtle.


propio2RecursiveColores(0,Size):- dragon(1,Size), dragon(1,Size).
propio2RecursiveColores(Nivel,Size):-
  Length is Size/3,
  Nivel1 is Nivel-1,
  propio2RecursiveColores(Nivel1,Length),
  left(120),
  propio2RecursiveColores(Nivel1,Length),
  right(60),
  propio2RecursiveColores(Nivel1,Length),
  right(60),
  propio2RecursiveColores(Nivel1,Length),
  right(60),
  propio2RecursiveColores(Nivel1,Length),
  right(60),
  propio2RecursiveColores(Nivel1,Length),
  right(60),
  propio2RecursiveColores(Nivel1,Length),
  left(120),
  propio2RecursiveColores(Nivel1,Length).

propio2Colores(Nivel,Size):-
	logo,
  penup,
	setxy(0,-150),
  pendown,
  left(270),
  setbgcolor(black),
  setpencolor(white),
	setpencolor(green),
	propio2RecursiveColores(Nivel,Size),
	right(90),
	setpencolor(yellow),
	propio2RecursiveColores(Nivel,Size),
	right(90),
	propio2RecursiveColores(Nivel,Size),
	right(90),
	setpencolor(red),
	propio2RecursiveColores(Nivel,Size),
  hideturtle.

propio3RecursiveColores(0,Size):- forward(Size).
propio3RecursiveColores(Nivel,Size):-
  Trozo is Size/4,
  Nivel1 is Nivel-1,
	setpencolor(blue),
  propio3RecursiveColores(Nivel1,Trozo),
	right(60),
	setpencolor(red),
	propio3RecursiveColores(Nivel1,Trozo),
	right(60),
	setpencolor(white),
	propio3RecursiveColores(Nivel1,Trozo),
	left(60),
	setpencolor(white),
	propio3RecursiveColores(Nivel1,Trozo),
	left(60),
	setpencolor(white),
	propio3RecursiveColores(Nivel1,Trozo),
	left(60),
	setpencolor(red),
	propio3RecursiveColores(Nivel1,Trozo),
	right(60),
	setpencolor(blue),
	propio3RecursiveColores(Nivel1,Trozo).

propio3Colores(Nivel,Size):-
  logo,
  setbgcolor(black),
  setpencolor(white),
	propio3RecursiveColores(Nivel,Size),
	hideturtle.

/*
Versiones con Colores aleatorios
*/

/*Copo de nieve*/
dragonRandom(0,Size):- forward(Size).

dragonRandom(Nivel,Size):-
  Trozo is Size/3,
  Nivel1 is Nivel-1,
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
  dragonRandom(Nivel1,Trozo),
  left(60),
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
  dragonRandom(Nivel1,Trozo),
  right(120),
  random_between(1,7,Random2),
  color(Random2,RandColor2),
  setpencolor(RandColor2),
  dragonRandom(Nivel1,Trozo),
  left(60),
  dragonRandom(Nivel1,Trozo).

copoDeNieveRandom(Nivel,Size):-
	logo,
  penup,
  forward(60),
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
	dragonRandom(Nivel,Size),
	right(120),
	dragonRandom(Nivel,Size),
	right(120),
	dragonRandom(Nivel,Size),
  hideturtle.

/*Corbatin*/

corbatinRecursiveRandom(0,Size):- forward(Size).

corbatinRecursiveRandom(Nivel, Size):-
  Nivel1 is Nivel-1,
  Length is Size/3,
  left(60),
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
  corbatinRecursive(Nivel1,Length),
  right(120),
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
  corbatinRecursive(Nivel1, Length),
  corbatinRecursive(Nivel1, Length),
  left(120),
  random_between(1,7,Random2),
  color(Random2,RandColor2),
  setpencolor(RandColor2),
  corbatinRecursive(Nivel1,Length),
  right(60).

corbatinRandom(Nivel, Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
  corbatinRecursiveRandom(Nivel,Size),
  right(90),
  corbatinRecursiveRandom(Nivel,Size),
  right(90),
  corbatinRecursiveRandom(Nivel,Size),
  right(90),
  corbatinRecursiveRandom(Nivel,Size),
  hideturtle.

/*Estrella*/

estrellaRecursiveRandom(0,Size):- forward(Size).

estrellaRecursiveRandom(Nivel, Size):-
  Nivel1 is Nivel-1,
  Length is Size/2,
  right(30),
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
  estrellaRecursiveRandom(Nivel1,Length),
  left(60),
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
  estrellaRecursiveRandom(Nivel1,Length),
  right(30).

estrellaRandom(Nivel, Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
  left(45),
  estrellaRecursiveRandom(Nivel,Size),
  right(90),
  estrellaRecursiveRandom(Nivel,Size),
  right(90),
  estrellaRecursiveRandom(Nivel,Size),
  right(90),
  estrellaRecursiveRandom(Nivel,Size),
  hideturtle.

/*Panal*/
panalRecursiveRandom(0,Tam):-
	forward(Tam).

panalRecursiveRandom(Nivel,Size):-
	Nivel1 is Nivel-1,
	Length is Size/3,
	penup,
	forward(Length),
	pendown,
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
	left(135),
	panalRecursiveRandom(Nivel1,Length),
	left(180),
  forward(Length),
	right(90),
	panalRecursiveRandom(Nivel1,Length),
  left(180),
  forward(Length),
	right(45),
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
	panalRecursiveRandom(Nivel1,Length),
	left(45),
	panalRecursiveRandom(Nivel1,Length),
  left(180),
  forward(Length),
	left(90),
	panalRecursiveRandom(Nivel1,Length),
  left(180),
  forward(Length),
	right(135),
	penup,
	forward(Length),
	pendown.

panalRandom(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	panalRecursiveRandom(Nivel,Size),
	right(90),
	panalRecursiveRandom(Nivel,Size),
	right(90),
	panalRecursiveRandom(Nivel,Size),
	right(90),
	panalRecursiveRandom(Nivel,Size),
  hideturtle.

/*tapete externo*/

tapeteExternoRecursiveRandom(0,Size):- forward(Size).

tapeteExternoRecursiveRandom(Nivel,Size):-
  Length is Size/5,
  Nivel1 is Nivel-1,
  tapeteExternoRecursiveRandom(Nivel1,Length),
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
  left(90),
  tapeteExternoRecursiveRandom(Nivel1,Length),
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
  right(90),
  tapeteExternoRecursiveRandom(Nivel1,Length),
  random_between(1,7,Random2),
  color(Random2,RandColor2),
  setpencolor(RandColor2),
  right(90),
  tapeteExternoRecursiveRandom(Nivel1,Length),
  random_between(1,7,Random3),
  color(Random3,RandColor3),
  setpencolor(RandColor3),
  left(90),
  tapeteExternoRecursiveRandom(Nivel1,Length).

tapeteExternoRandom(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  random_between(1,7,Random5),
  color(Random5,RandColor5),
  setpencolor(RandColor5),
	tapeteExternoRecursiveRandom(Nivel,Size),
	right(90),
	tapeteExternoRecursiveRandom(Nivel,Size),
	right(90),
	tapeteExternoRecursiveRandom(Nivel,Size),
	right(90),
	tapeteExternoRecursiveRandom(Nivel,Size),
  hideturtle.

/*tapete interno*/

tapeteInternoRecursiveRandom(0,Size):- forward(Size).

tapeteInternoRecursiveRandom(Nivel,Size):-
  Length is Size/5,
  Nivel1 is Nivel-1,
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
  tapeteInternoRecursiveRandom(Nivel1,Length),
  right(90),
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
  tapeteInternoRecursiveRandom(Nivel1,Length),
  left(90),
  random_between(1,7,Random2),
  color(Random2,RandColor2),
  setpencolor(RandColor2),
  tapeteInternoRecursiveRandom(Nivel1,Length),
  left(90),
  random_between(1,7,Random3),
  color(Random3,RandColor3),
  setpencolor(RandColor3),
  tapeteInternoRecursiveRandom(Nivel1,Length),
  right(90),
  random_between(1,7,Random4),
  color(Random4,RandColor4),
  setpencolor(RandColor4),
  tapeteInternoRecursiveRandom(Nivel1,Length).

tapeteInternoRandom(Nivel,Size):-
  logo,
  penup,
  left(90),
  forward(100),
  pendown,
  left(180),
  setbgcolor(black),
  setpencolor(white),
	tapeteInternoRecursiveRandom(Nivel,Size),
	right(90),
	tapeteInternoRecursiveRandom(Nivel,Size),
	right(90),
	tapeteInternoRecursiveRandom(Nivel,Size),
	right(90),
	tapeteInternoRecursiveRandom(Nivel,Size),
  hideturtle.

/*Aros*/

arosRecursiveRandom(0,Size,Segmentos):-
  circulo(Size,Segmentos).

arosRecursiveRandom(Nivel,Size,Segmentos):-
  Nivel1 is Nivel-1,
  Length is Size /3,
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
  arosRecursiveRandom(Nivel1,Length,Segmentos),
  penup,
  right(120),
  forward(Length),
  pendown,
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
  arosRecursiveRandom(Nivel1,Length,Segmentos),
  penup,
  right(120),
  forward(Length),
  pendown,
  arosRecursiveRandom(Nivel1,Length,Segmentos),
  right(120).

arosRandom(Nivel,Size,Segmentos):-
  logo,
  setbgcolor(black),
  setpencolor(white),
  arosRecursiveRandom(Nivel,Size,Segmentos),
  hideturtle.

/*Tonel*/
tonelRecursiveRandom(0,Size,Segmentos):-
  circulo(Size,Segmentos).

tonelRecursiveRandom(Nivel,Size,Segmentos):-
  Nivel1 is Nivel-1,
  Length is Size/3,
  SmallCircle is Size*2/3,
  random_between(1,7,Random),
  color(Random,RandColor),
  setpencolor(RandColor),
	tonelRecursiveRandom(Nivel1,Size,Segmentos),
	penup,
	forward(SmallCircle),
	pendown,
  random_between(1,7,Random1),
  color(Random1,RandColor1),
  setpencolor(RandColor1),
	tonelRecursiveRandom(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
	right(120),
	forward(SmallCircle),
	pendown,
  random_between(1,7,Random2),
  color(Random2,RandColor2),
  setpencolor(RandColor2),
	tonelRecursiveRandom(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
	right(120),
	forward(SmallCircle),
	pendown,
  random_between(1,7,Random3),
  color(Random3,RandColor3),
  setpencolor(RandColor3),
	tonelRecursiveRandom(Nivel1,Length,Segmentos),
	penup,
	right(180),
  forward(SmallCircle),
  right(180),
  pendown,
	right(120).

tonelRandom(Nivel,Size,Segmentos):-
  logo,
  setbgcolor(black),
  setpencolor(white),
  tonelRecursiveRandom(Nivel,Size,Segmentos),
  penup,
  right(120),
  forward(Size*2),
  pendown,
  tonelRecursiveRandom(Nivel,Size,Segmentos),
  penup,
  right(120),
  forward(Size*2),
  pendown,
  tonelRecursiveRandom(Nivel,Size,Segmentos),
  right(120),
  hideturtle.

/*Propios*/
propio1RecursiveRandom(0,Size):- forward(Size).
propio1RecursiveRandom(Nivel,Size):-
	Trozo is Size/4,
  Nivel1 is Nivel-1,
	random_between(1,7,Random),
	color(Random,RandColor),
	setpencolor(RandColor),
  propio1RecursiveRandom(Nivel1,Trozo),
  left(90),
	random_between(1,7,Random2),
	color(Random2,RandColor2),
	setpencolor(RandColor2),
  propio1RecursiveRandom(Nivel1,Trozo),
  right(90),
  propio1RecursiveRandom(Nivel1,Trozo),
  left(90),
	random_between(1,7,Random3),
	color(Random3,RandColor3),
	setpencolor(RandColor3),
  propio1RecursiveRandom(Nivel1,Trozo),
	left(90).


propio1Random(Nivel,Size):-
logo,
setbgcolor(black),
setpencolor(white),
right(120),
propio1RecursiveRandom(Nivel,Size),
left(60),
propio1RecursiveRandom(Nivel,Size),
propio1RecursiveRandom(Nivel,Size),
left(60),
propio1RecursiveRandom(Nivel,Size)
,hideturtle.


propio2RecursiveRandom(0,Size):- dragon(1,Size), dragon(1,Size).
propio2RecursiveRandom(Nivel,Size):-
  Length is Size/3,
  Nivel1 is Nivel-1,
  propio2RecursiveRandom(Nivel1,Length),
  left(120),
  propio2RecursiveRandom(Nivel1,Length),
  right(60),
  propio2RecursiveRandom(Nivel1,Length),
  right(60),
  propio2RecursiveRandom(Nivel1,Length),
  right(60),
  propio2RecursiveRandom(Nivel1,Length),
  right(60),
  propio2RecursiveRandom(Nivel1,Length),
  right(60),
  propio2RecursiveRandom(Nivel1,Length),
  left(120),
  propio2RecursiveRandom(Nivel1,Length).

propio2Random(Nivel,Size):-
  logo,
  penup,
	setxy(0,-150),
  pendown,
  left(270),
  setbgcolor(black),
	random_between(1,7,Random),
	color(Random,RandColor),
	setpencolor(RandColor),
	propio2RecursiveRandom(Nivel,Size),
	right(90),
	random_between(1,7,Random2),
	color(Random2,RandColor2),
	setpencolor(RandColor2),
	propio2RecursiveRandom(Nivel,Size),
	right(90),
	propio2RecursiveRandom(Nivel,Size),
	right(90),
	random_between(1,7,Random3),
	color(Random3,RandColor3),
	setpencolor(RandColor3),
	propio2RecursiveRandom(Nivel,Size),
  hideturtle.

propio3RecursiveRandom(0,Size):- forward(Size).
propio3RecursiveRandom(Nivel,Size):-
  Trozo is Size/4,
  Nivel1 is Nivel-1,
	random_between(1,7,Random1),
	color(Random1,RandColor1),
	setpencolor(RandColor1),
  propio3RecursiveRandom(Nivel1,Trozo),
	right(60),
	random_between(1,7,Random2),
	color(Random2,RandColor2),
	setpencolor(RandColor2),
	propio3RecursiveRandom(Nivel1,Trozo),
	right(60),
	random_between(1,7,Random3),
	color(Random3,RandColor3),
	setpencolor(RandColor3),
	propio3RecursiveRandom(Nivel1,Trozo),
	left(60),
	random_between(1,7,Random4),
	color(Random4,RandColor4),
	setpencolor(RandColor4),
	propio3RecursiveRandom(Nivel1,Trozo),
	left(60),
	random_between(1,7,Random5),
	color(Random5,RandColor5),
	setpencolor(RandColor5),
	propio3RecursiveRandom(Nivel1,Trozo),
	left(60),
	random_between(1,7,Random6),
	color(Random6,RandColor6),
	setpencolor(RandColor6),
	propio3RecursiveRandom(Nivel1,Trozo),
	right(60),
	random_between(1,7,Random7),
	color(Random7,RandColor7),
	setpencolor(RandColor7),
	propio3RecursiveRandom(Nivel1,Trozo).

propio3Random(Nivel,Size):-
  logo,
  setbgcolor(black),
  setpencolor(white),
	propio3RecursiveRandom(Nivel,Size),
	hideturtle.
