---
output:
  pdf_document: default
  html_document: default
---
# Code Book
El script run_analysis.R realiza la descarga de los datos, su transformacion y continua con los requirimientos
del ejercicio tal y como se describe en este.


## Descargamos de datos
Se descarga el conjunto de datos y se extrae el contenido en la carpeta 'UCI HAR Dataset'.


## Asignamos cada conjunto de mediciones a un dataframe, nombrado tal como su fichero de origen
* features <- features.txt : 561 filas, 2 columnas  
Estas características provienen del acelerómetro y giroscopio, son señales brutas en tres dimemsiones(x,y,z) 'tAcc-XYZ' y 'tGyro-XYZ'.
* 'activities' <- 'activity_labels.txt' : 6 filas, 2 columnas  
Contiene las distintas actividades realizadas al tomar las medidas y sus códigos (etiquetas)
* 'subject_test' <- 'test/subject_test.txt' : 2947 filas, 1 columna  
Aquí se incluyen datos de 30 sujetos de prueba del test sobre los que se realiza la mediciones.
* 'x_test' <- 'test/X_test.txt' : 2947 filas, 561 columnas  
contiene datos de de características registradas del test.
* 'y_test' <- 'test/y_test.txt' : 2947 filas, 1 columna  
contiene datos de  etiquetas de códigos de actividades del test.
* 'subject_train' <- 'test/subject_train.txt' : 7352 filas, 1 columna  
contiene datos de 30 sujetos voluntarios del training que están siendo observados.
* 'x_train' <- 'test/X_train.txt' : 7352 filas, 561 columnas  
contiene datos de características registradas del training.
* 'y_train' <- 'test/y_train.txt' : 7352 filas, 1 columna  
contiene datos de las etiquetas de codigo de actividades del training.


## Cambiamos los nombre de las columnas para que sean más entendibles -ajustadas al Español-
* names(activities)<-c("id_actividad","actividad")  
* names(features)<-c("id_funcion","funcion")  
* names(subject_test)<-"sujeto"  
* 'names(x_test)<-features$funcion'  
* names(y_test)<-"id_actividad"  
* names(subject_train)<-"sujeto"  
* 'names(x_train)<-features$funcion'  
* names(y_train)<-"id_actividad"  

## Fusionamos los datos de trining con los de test, creando un nuevo conjunto de datos data_X , data_Y y subject
'X' (10299 filas, 561 columnas): se crea fusionando 'x_train' y 'x_test' usando la función *rbind()*.  
'Y' (10299 filas, 1 columna): se crea al fusionar 'y_train' y 'y_test' usando la función *rbind()*.  
'subject' (10299 filas, 1 columna): se crea fusionando 'subject_train' y 'subject_test' usando la función *rbind()*.  
'datos' (10299 filas, 563 columnas): se crea fusionando  'subjet', 'Y' y 'X' usando la función *cbind()*.  


## Extraemos sólo las medidas de la media y la desviación estándar de cada medida
'datos2' (10299 filas, 88 columnas): se crea mediante el subconjunto 'datos', seleccionando sólo las columnas: 'sujeto', 'id_actividad' y las mediciones sobre la media('mean') y la desviación estándar('std') de cada medición.  


## Pongemos nombres descriptivos de las actividades para nombrar las actividades del conjunto de datos
Los números enteros de la columna de códigos del 'datos2' se sustituyeron por la actividad correspondiente tomada de la segunda columna del conjunto de datos 'actividades'.  


## Etiquetamos adecuadamente el conjunto de datos con nombres descriptivos de las variables columna de códigos en TidyData renombrada en actividades
Se cambia el nombre de la segunda columna por 'Actividad'.  
Todos los 'Acc' en el nombre de la columna se cambian a 'AceleracionLineal'.  
Todos los '[Aa]ngel' en el nombre de la columna se cambian a 'Angulo'.    
Todos los '[Gg]yro' en el nombre de la columna se cambian a 'VelocidadAngular'.  
Todos los 'tBody' en el nombre de la columna se cambian a 'Cuerpo'.  
Todos los 'Body' en el nombre de la columna se cambian a 'Cuerpo'.  
Todos los 'Mag' en el nombre de la columna se cambian a 'Normalizada'.  
Todos los '[Gg]ravity' en el nombre de la columna se cambian a 'Gravedad'.  
Todos los '[Ff]req' en el nombre de la columna se cambian a 'Frecuencia'.  
Todos los '[Ss]td' en el nombre de la columna se cambian a 'DesviacionStandar'.  
Todos los '[Mm]ean' en el nombre de la columna se cambian a 'Media'.  
Todos los que comienzan con 't' o 'f' en el nombre de la columna se borra la 't' o 'f'.  
Todos los que tienen '-' en el nombre de la columna se borra '-'.  


## A partir del conjunto de datos del paso 4, crea un segundo conjunto de datos ordenado e independiente con el promedio de cada variable para cada actividad y cada sujeto
'datos3' (180 filas, 88 columnas): se crea sumando 'datos2' calculando las medias de cada variable para cada 'actividad' y cada 'sujeto', después de agrupar por 'sujeto' y 'actividad'.  
  
Exportamos  'datos3' al archivo 'ResultadoMedias.txt'.  

