---
output:  
  pdf_document: default  
  html_document: default  
---
# **Tareas a calificar por los compañeros: Getting and Cleaning Data Course Project**   
*Esto una presentación de **Francisco M. Sánchez Sosa** para el proyecto del curso 'Getting and Cleaning Data Course'.*   
Tiene las instrucciones sobre cómo ejecutar el análisis del conjunto de datos aportados para el ejercicio.
   
     
## Conjunto de datos  
Nace en la actividad de Sangsung dirigida al reconocimiento de la actividad humana usando teléfonos inteligentes.  
Los experimentos se han llevado a cabo con un grupo de 30 voluntarios de entre 19 y 48 años de edad. Cada persona realizó seis actividades (CAMINAR, CAMINAR_SUBIR ESCALERAS, CAMINAR_BORDAR ESCALERAS, SENTARSE, PARARSE, COLOCARSE) llevando un smartphone (Samsung Galaxy S II) en la cintura. Usando su acelerómetro y giroscopio integrados, capturamos la aceleración lineal triaxial y la velocidad angular triaxial a una velocidad constante de 50Hz. Los experimentos han sido grabados en vídeo para etiquetar los datos manualmente. El conjunto de datos obtenidos se ha dividido aleatoriamente en dos conjuntos, donde el 70% de los voluntarios fue seleccionado para generar los datos de entrenamiento y el 30% los datos de prueba.  
   
Las señales de los sensores (acelerómetro y giroscopio) se preprocesaron aplicando filtros de ruido y luego se muestrearon en ventanas deslizantes de ancho fijo de 2,56 seg. y con un solapamiento del 50% (128 lecturas/ventana). La señal de aceleración del sensor, que tiene componentes gravitatorios y de movimiento corporal, se separó utilizando un filtro de paso bajo Butterworth en la aceleración corporal y la gravedad. Se supone que la fuerza gravitatoria sólo tiene componentes de baja frecuencia, por lo que se utilizó un filtro con una frecuencia de corte de 0,3 Hz. De cada ventana se obtuvo un vector de características calculando variables del dominio del tiempo y la frecuencia.    
    
La licencia de estos datos corresponde a:   
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.    

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.   
   
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.   
   
   
## Archivos
*'CodeBook.md'* un libro de códigos que describe las variables, los datos, y cualquier transformación o trabajo que se ha realizado para preparar los datos.   

*'run_analysis.R'* script que realiza la preparación de los datos y luego sigue los 5 pasos requeridos como se describe en la definición del proyecto de curso:  
* Fusiona dos datos de los test y los trainings para crear un conjunto de datos.  
* Extrae sólo las mediciones de la media y la desviación estándar de cada medición.  
* Utiliza nombres descriptivos de las actividades para nombrar las actividades del conjunto de datos.  
* Etiqueta adecuadamente el conjunto de datos con nombres descriptivos de las variables.  
* A partir del conjunto de datos del paso 4, crea un segundo conjunto de datos ordenado e independiente con el promedio de cada variable para cada actividad y cada sujeto.  
  
*'ResultadoMedias.txt'* es el dato final exportado después de pasar por todas los puntos descritos.
