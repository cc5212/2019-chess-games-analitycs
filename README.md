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
     En cambio en las otras hay jugadores no reconocidos
     





Detail the results of the project. Different projects will have different types of results; e.g., run-times or result sizes, evaluation of the methods you're comparing, the interface of the system you've built, and/or some of the results of the data analysis you conducted.

# Conclusion

Summarise main lessons learnt. What was easy? What was difficult? What could have been done better or more efficiently?

# Appendix

You can use this for key code snippets that you don't want to clutter the main text.
