# 2019-chess-games-analitycs
Analisis Partidas y Jugadores de Ajedrez [Grupo 11: Luis Pinochet, Felipen Manen , José Miguel Cordero]
# Overview
Con estas Bases generamos consultas inspiradas en la intución ,es decir , se buscó que ideas están implantadas en el colectivo y ver si que tan cierto es

# Data

Se ocuparon dos bases:
* Base de Partidas de ajedrez descargadas desde https://www.kingbase-chess.net/ que es una base de partidas de ajedrez jugadas por toda clase de jugadores cuyo objetivo es que sean estudiadas.
El tamaño es cercano a 1.5 GB con alrededor de 2.2 millones de filas-
Los campos mas importantes de la base de datos es 
  * Evento del torneo 
  * Lugar del torneo
  * Día del juego 
  * Ronda 
  * Jugador de Blancas 
  * Jugador de Negras 
  * Resultado
  * ELO Blancas
  * ELO Negras 
  * Código de Apertura 
  * Día del Evento
*  Base de Jugadores de Ajedrez :
 Esta base fue descargada desde https://ratings.fide.com/download.phtml  esta contiene la información relevante de un jugador de ajedrez que suele ocuparse para organizar torneos abiertos o cerrados.
El tamaño es de 50mb y alrededor 880000 filas
 Los campos mas relevantes que contiene :
    * ID del Jugador
    * Nombre del Jugador
    * Federacion ( Es el País por el Juegan)
    * Sexo
    * Titulo 
    * ELO (El ElO es un medidor de fuerza de cada jugador , mientras  mejor es el jugador 
    * Año Nacimiento 
 
   

# Methods

Este proyecto tuvo 3 etapas:
  * Una etapa de investigación dónde se investigó a travéz del conocimiento empírico de ajedrecistas
  * Una etapa de parser , ya que los datos tenían defectos en su orden y valores , para esto se programó los parser en python
  * Una etapa de consulta , dónde se programó em pig ocupando los métodos Map/Reduce  de Hadoop que ofrece
  Los problemas pricipales fueron con las bases en si , habían demasiados problemas con valores nulos o incompletos
  
# Results

Los resultados tienen bastante lógica en general y serán explicados y mostrados a continuación
Las consultas fueron:
* Cantidad de Partidas Ganadas por Blancas , empates y Ganadas por Negras

| Blancas  |      Empates  | Negras|
|---------:|:-------------:|------:|
| 799210   |  606812       | 779309|
| 37%      |    28%        |   35% |

Ya que las blancas parten el juego estas tienen ventaja , esto queda reflejado en este resultado.
* Aperturas mas comunes 

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

Vemos Aperturas semi-cerradas muy populares a niveles medios y altos, debido a las poco teoría y oportunidades de ataque 
para ambos bandos.
Terminando está la apertura de Peón Dama y Bogo-India Sistemas cerrados que son jugados de manera ocacional en la élite del ajedrez.

* Jugadores que mas veces han ganado a jugadores de mayor ELO 
Para esta consulta la dividimos en tres
  * Diferencia de 100 o más  de elo 
  
  
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
    
    
  * Diferencia de 200 o más  de elo 
       
 
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
  
  
  * Diferencia de 100 o más de ELO :

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
       
       
       
     Ganarle a un jugador de mas fuerte (que es lo que intenta representar el ELO ) , es general difícil .
     Sobre todo si la brecha es de mayor de 100 donde las diferencias se comienzan a notar.
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
  * 
     ¿Quién es el jugador que más ha ganado?
    
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
    
   * ¿Quienes son los jugadores con mas ELO?
   
      | Jugador  |      ELO  | 
      |---------:|:-------------:|
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
   
    
    
    
    
    

# Conclusion

Summarise main lessons learnt. What was easy? What was difficult? What could have been done better or more efficiently?

# Appendix

You can use this for key code snippets that you don't want to clutter the main text.
