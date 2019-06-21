# 2019-chess-games-analitycs
Análisis de partidas y jugadores de ajedrez (José Miguel Cordero, Felipe Manen, Luis Pinochet, Grupo 11).
# Overview
Se generan ciertas consultas relacionadas con el ajedrez, estudiando de manera concreta ciertas nociones e intuiciones respecto del circuito mundial de este deporte. Se hacen consultas de datos de partidas desde el año 1990 así como del registro de jugadores a nivel mundial.

# Data

Se hace uso de dos bases de datos:
* Base de partidas de ajedrez obtenida de https://www.kingbase-chess.net/. El conjunto de datos son desde el año 1990 hasta 2019.
El tamaño es cercano a 1.5 GB, con alrededor de 2.2 millones de filas.
Los campos más importantes de la base de datos es 
  * Evento del torneo 
  * Lugar del torneo
  * Día del juego 
  * Ronda 
  * Jugador de Blancas 
  * Jugador de Negras 
  * Resultado
  * ELO jugador de blancas
  * ELO jugador de negras
  * Código de Apertura 
  * Día del Evento
*  Base de Jugadores de Ajedrez :
 Esta base fue descargada desde https://ratings.fide.com/download.phtml y contiene la información relevante de un jugador de ajedrez. Suele ocuparse para organizar torneos abiertos o cerrados. Este registro es del mes de junio de 2019.
El tamaño es de 50 MB aproximadamente y alrededor 880000 filas.
 Los campos mas relevantes que contiene son:
    * ID del Jugador
    * Nombre del Jugador
    * Federacion ( Es el País por el Juegan)
    * Sexo
    * Titulo 
    * ELO (El ElO es un medidor de fuerza de cada jugador , mientras  mejor es el jugador 
    * Año Nacimiento 
 
   

# Methods

Este proyecto tuvo 2 etapas:
  * Parseo de datos: se generan archivos de datos en formato ".tsv" para poder hacer las consultas.
  * Consultas: se programa en Apache Pig para realizar las consultas que se detallan en las siguiente sección.
  
  
# Results

Los resultados tienen bastante lógica en general y serán explicados y mostrados a continuación.

Las consultas fueron:
* Cantidad de partidas ganadas por jugador con piezas blancas, empates y ganadas por jugador con piezas negras

| Blancas  |      Empates  | Negras|
|---------:|:-------------:|------:|
| 799210   |  606812       | 779309|
| 37%      |    28%        |   35% |

Ya que las blancas parten el juego, éstas tienen ventaja. Esto queda reflejado en este resultado.

* Aperturas más comunes

| Código   |      Nombre   | Cantidad|
|---------:|:-------------:|--------:|
| B22      |Defensa Siciliana , Variante Alapin               | 43864   |           
| B06      |Defensa Moderna               |29407         |           
| B07      |Defensa Pirc              |28414         |           
| B01      |Defensa Escandinava               |25776         |           
| B12      |Defensa Caro-Kann               |22327         |           
| B33      |Defensa Siciliana, Variante Pelikan               |22149         |        
| A45      |Apertura de Peón Dama               |21618         |           
| B23      |Defensa Siciliana Cerrada               | 21376        |           
| B90      |Defensa Siciliana Najdorf               |21322         |           
| E11      |Defensa Bogo-India               | 21009        |           

La apertura, en el ajedrez, corresponde a un conjunto de primeras jugadas que, en definitiva, definen qué clase de juego se va presenciar. En el estudio y las bases de datos del ajedrez, cada una de las salidas tiene un código.
Se pueden apreciar aperturas semi-cerradas muy populares a niveles medios y altos.
Terminando está la apertura de Peón Dama y Bogo-India, sistemas cerrados que son jugados de manera ocasional en la élite del ajedrez.

* Jugadores que más veces han ganado a jugadores de mayor ELO 
Para esta consulta la dividimos en tres
  * Alguna diferencia con su oponente en cuanto a ELO
  
  
    | Nombre | Cantidad de Juegos Ganados|
    |-------:|--------------------------:|
    |Nakamura, Hikaru |273 |
    |Van Wely, Loek |241 |
    |Grischuk, Alexander |228|
    |Karjakin, Sergey |225 |
    |Nepomniachtchi, Ian |210 |
    |Aronian, Levon |208 |
    |Ivanchuk, Vassily |203 |
    | Savchenko, Boris |198 |
    | Svidler, Peter |192 |
    |Gunina, Valentina |189 |
    
    
  * Diferencia de 200 o más de ELO 
       
 
       | Nombre | Cantidad de Juegos Ganados|
       |-------:|--------------------------:|   
       |Mamedjarova, Turkan |70|
       |Al-Sayed, Mohammed N |66 |
       |Mamedjarova, Zeinab |65 |
       |Yildiz, Betul Cemre| 58 |
       |Savchenko, Boris |56 |
       |Baghdasaryan, Vahe|56|
       |Antipov, Mikhail Al|54|
       |Tate, Alan|54|
       |Calzetta Ruiz, Monica|53|
       |Kulon, Klaudia|53|
  
  
  * Diferencia de 300 o más de ELO

      | Nombre | Cantidad de Juegos Ganados|
      |-------:|--------------------------:|
      |Choukri, Adel|11|
      |Kukk, Sander|9|
      |Haussernot, Cecile|9|
      |Bezgodova, Svetlana|9|
      |Gramlich, Sebastian|9|
      |Garifullina, Leya|9|
      |Sviridova, Vlada|9|
      |Dang, Hoang Son|8|
      |Schuls, Olev|8|
      |Rosenthal, Nicholas|8|
       
       
       
     En el mundo del ajedrez, el Elo corresponde al sistema de puntuación más utlizado para medir el nivel de habilidad de un jugador. En este sentido, tendría sentido que un jugador con menor Elo tenga menos posibilidades de vencer a un jugador de mayor Elo.
     Esto debiera darse con una mayor dificultad si la brecha es mayor a 100, donde las diferencias se comienzan a notar.
     En la primera sección se ven sólo grandes maestros que se encuentran entre los mejores del mundo , por lo que es natural que ellos 
     puedan obtener esa victoria.
     En cambio en las otras hay jugadores no reconocidos y además son menores en magnitud que la primera sección , esto demuestra lo          escaso que es. 
     


* Los Jugadores que le han Ganado al actual campeón del Mundo Magnus Carlsen

| Nombre | Cantidad de Juegos Ganados|ELO mas bajo con el que ganó|
|-------:|--------------------------:|----------------------------|
|Grischuk, Alexander|23|2709.0|
|Aronian, Levon|20|2645.0|
|Anand, Viswanathan|19|2779.0|
|Nakamura, Hikaru,|18|2699.0|
|Ivanchuk, Vassily|17|2726.0|
|Kramnik, Vladimir|12|2759.0|
|Karjakin, Sergey|11|2672.0|
|Caruana, Fabiano|11|2773.0|
|Morozevich, Alexander|8|2741.0|
|Radjabov, Teimour|8|2713.0|
|Vachier-Lagrave,Maxime|7|2703.0|

Actualmente, el jugador Magnus Carlsen es el jugador con mayor Elo en el ranking de ajedrez, por lo que 
una victoria sobre él corresponde a una gran hazaña.
Los jugadores que aparecen son extremadamente fuertes y es entendible que puedan ganarle algunas partidas.



* Los Jugadores que más veces se han enfrentado



| Jugador 1 | Jugador 2 |Victorias 1| Empates | Victorias 2|Cantidad Total| 
|-------:|-------------:|----------:|--------:|-----------:|--------------:|
|Anand, Viswanathan|Kramnik, Vladimir|30|148|30|208|
|Caruana, Fabiano|Nakamura, Hikaru|24|57|55|136|
|Anand, Viswanathan|Ivanchuk, Vassily|29|84|22|135|
|Anand, Viswanathan|Topalov, Veselin|39|77|17|133|
|Kasparov, Garry|Kramnik, Vladimir|25|86|22|133|
|Nakamura, Hikaru|Vachier-Lagrave, Maxime|44|60|26|130|
|Aronian, Levon|Nakamura, Hikaru|30|62|38|130|
|Carlsen, Magnus|Nakamura, Hikaru|52|55|18|125|
|Ivanchuk, Vassily|Kramnik, Vladimir|23|70|25|118|
|Kramnik, Vladimir|Leko, Peter|21|88|8|117|

Son jugadores que siempre se encuentran entre los mejores , por lo que encuentran siempre en gran cantidad de torneos oficiales como otros  no oficiales , sobre todo notar que los primeros fueron contendientes al título del mundo por lo que es natural que hayan jugado una gran cantidad de partidas


* Por último 2 consultas del tipo general 
    * ¿Quienes son los jugadores con mas ELO?

        | Jugador  |      ELO  | 
        |---------:|-------------:|
        |Carlsen, Magnus|2875|
        |Caruana, Fabiano|2819|
        |Kasparov, Garry|2812|
        |Ding, Liren|2805|
        |Vachier-Lagrave, Maxime|2779|
        |Giri, Anish|2779|
        |Nepomniachtchi, Ian|2775|
        |Grischuk, Alexander|2775|
        |Mamedyarov, Shakhriyar|2774|
        |Anand, Viswanathan|2767|
        
        
        
   * ¿Quién es el jugador que más ha ganado?

        | Jugador  |      Cantidad  | 
        |---------:|---------------:|
        |Shirov, Alexei|1556|
        |Van Wely, Loek|1523|
        |Korneev, Oleg|1509|
        |Ivanchuk, Vassily|1435|
        |Kozul, Zdenko|1333|
        |Tiviakov, Sergei,1312|
        |Hebden, Mark L|1310|
        |Epishin, Vladimir|1309|
        |Burmakin, Vladimir|1245|
        |Nakamura, Hikaru|1221|
   
    
    
    
    
    

# Conclusion
Como conclusión se pudo lograr obtener resultados bastantes interesantes con los cuales se pueden sacar algunas conclusiones, por ejemplo los jugadores élite son de ese nivel porque juegan mucho y siempre a una alta exigencia.
En cuanto al procedimiento  ya que se ocupó pig no fue tan extenuannte el proceso , pero en contra de eso se pagó el costo de tener consultas esperando unlargo tiempo y con lo que el proceso de debugger no era el óptimo.
Se podría hacer mejor ocupando Map/Reduce directamente con Hadoop


