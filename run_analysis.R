# Getting and Cleaning Data Course Project
## file: run_analysis.R
## Author: Francisco M. Sánchez Sosa
## Date: 05/11/2020
##
### The purpose of this project is to demonstrate the ability to collect, work 
### with, and clean a dat.
### 
### One of the most exciting areas in all of data science right now is wearable 
### computing . Companies like Fitbit, Nike, and Jawbone Up are racing to develop
### the most advanced algorithms to attract new users. 
### The data linked to from the course website represent data collected from the
### accelerometers from the Samsung Galaxy S smartphone.  
### A full description is available at the site where the data was obtained:
### http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## carga de los paquetes di no esta instalado , lo instala
if(!require('dplyr')){
  install.packages('dlpyr')
  }
library(dplyr)


## Descargar los datos 
fichero<-'Proyecto_Curso3.zip'

## Compruebo si existe , para emplear tiempo en la descarga si es así.
if(!file.exists(fichero)){
  url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'  
  download.file(url,fichero,method='curl')
 }
##Compruebo si exste el directoria
directorio<-'UCI HAR Dataset'
if(!file.exists(directorio)){
  unzip(fichero)
  }


### Creo todos los dataframes
activities <-read.table(paste(directorio,'activity_labels.txt',sep = '/'))
features <-read.table(paste(directorio,'features.txt',sep = '/'))

subject_test <-read.table(paste(directorio,'test/subject_test.txt',sep = '/'))
x_test <-read.table(paste(directorio,'test/X_test.txt',sep = '/'))
y_test <-read.table(paste(directorio,'test/y_test.txt',sep = '/'))

subject_train <-read.table(paste(directorio,'train/subject_train.txt',sep = '/'))
x_train <-read.table(paste(directorio,'train/X_train.txt',sep = '/'))
y_train <-read.table(paste(directorio,'train/y_train.txt',sep = '/'))

### Pongo nombre a las columnas
names(activities)<-c('id_actividad','actividad')
names(features)<-c('id_funcion','funcion')

names(subject_test)<-'sujeto'
names(x_test)<-features$funcion
names(y_test)<-'id_actividad'

names(subject_train)<-'sujeto'
names(x_train)<-features$funcion
names(y_train)<-'id_actividad'


## Paso1: Fusiono los conjuntos de entrenamiento y prueba para crear un conjunto de datos.
datos_X<- rbind(x_train, x_test)
datos_Y<- rbind(y_train,y_test)
sujetos<-rbind(subject_train,subject_test)
datos<- cbind(sujetos, datos_X, datos_Y)


## Paso2: Extraigo sólo las medidas de la media y la desviación estandar de cada medida :datos2
datos2<- datos %>%
  select(sujeto,id_actividad,contains('mean'), contains('std')) 


## Paso 3: Usar nombres descriptivos para los nombres de las actividades en el data set "datos2".
datos2$id_actividad<-activities[datos2$id_actividad,2]


## Paso 4: Pongo nombres adecuados al conjunto de datos con nombres descriptivos.
names(datos2)[2] = 'actividad'
names(datos2)<-gsub('Acc','AceleracionLineal',names(datos2))
names(datos2)<-gsub('angle','Angulo',names(datos2))
names(datos2)<-gsub('tBody','Cuerpo',names(datos2))
names(datos2)<-gsub('Body','Cuerpo',names(datos2))
names(datos2)<-gsub('Gyro','Velocidadangular',names(datos2))
names(datos2)<-gsub('[Gg]ravity','Gravedad',names(datos2))
names(datos2)<-gsub('Mag','Normalizada',names(datos2))
names(datos2)<-gsub('^t','',names(datos2))
names(datos2)<-gsub('^f','TransformadadeFourier',names(datos2))
names(datos2)<-gsub('[Ff]req','Frecuencia',names(datos2))
names(datos2)<-gsub('[Mm]ean','Media',names(datos2))
names(datos2)<-gsub('[Ss]td','DesviacionStandar',names(datos2))
names(datos2)<-gsub('-','',names(datos2))

## Paso 5: A partir del conjunto de datos del paso 4, creo un segundo conjunto 
## de datos ordenado e independiente con el promedio de cada variable para cada 
## actividad y cada sujeto: datos3
datos3<-datos2 %>%
  group_by(sujeto, actividad) %>%
  summarize_all(mean)
## Escribo el resultado en el fichero Resultado.txt
write.table(datos3,'ResultadoMedias.txt', row.name=F)

## Comprobaciones
str(datos3)

