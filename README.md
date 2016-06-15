
#Benemérita Universidad Autónoma de Puebla
##Facultad de Ciencias Físico Matemáticas
###Licenciatura en Actuaria
####Programación Actuarial III
####Caso: Reconocimiento de Actividad Humana con Celulares

La base de datos hace lo siguiente:

 *  Une los datos de test con los de training, para crear un solo conjunto de datos. 

#####Primero cargamos los datos de training y test.

     training <- read.table(paste(a,"train/X_train.txt",sep = "/"),quote ="\"")
 
     test <- read.table(paste(a,"test/X_test.txt",sep = "/"),quote ="\"")
 
#####Después, juntamos los datos en un solo conjunto. 
 
     datos <- rbind(training,test)
 
 * Extrae únicamente las medidas de media y desviación estándar de cada medición. 
 
#####Primero agregamos al archivo features.txt para obtener los encabezados de "datos".
 
     f <- read.table(paste(a,"features.txt",sep = "/"),quote ="\"")[,2]
    
     colnames(datos) <- f
 
#####Ahora usamos "grep" se encarga de buscar coincidencias respecto a un argumento, ya que queremos extraer solamente Media y Desviación estándar. Y agregamos las medidas a la base "datos".

     Medidas <- grep('-(mean|std)\\(',f)
    
     datos <- subset(datos,select=Medidas)

 * Coloca etiquetas apropiadas en la base de datos con nombres de variables que las describan.

#####Ahora usamos la función "sub" para reenombrar las variables.
 
     colnames(datos) <- sub("mean", "Mean", colnames(datos))
 
     colnames(datos) <- sub("std", "Std", colnames(datos))
 
     colnames(datos) <- sub("t", "Time", colnames(datos))
 
     colnames(datos) <- sub("f", "Frequency", colnames(datos))
 
     colnames(datos) <- sub("BodyBody", "Body", colnames(datos))
 
     colnames(datos) <- sub("^", "MeanOf", colnames(datos))
 
     colnames(datos) <- sub("-", "", colnames(datos))

 * Usa nombres de actividad para describir los nombres de las actividades en la base de datos.
 
#####Primero cargamos los datos de training y test, y los combinamos por filas.
 
     Atrain <- read.table(paste(a,"train/y_train.txt",sep = "/"),quote ="\"")
 
     Atest <- read.table(paste(a,"test/y_test.txt",sep = "/"),quote ="\"")
 
     Actividad <- rbind(Atrain,Atest)[,1]
     
#####Ahora usamos las 6 actividades vistas en el experimento para describir los nombres en la base.
 
     labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
            "SITTING", "STANDING", "LAYING")
 
     Actividad <- labels[Actividad]
 
     datos <- cbind(Actividad ,datos)
 
 * Con los datos del paso anterior, crea una segunda base de datos independiente con el promedio de cada variable para cada actividad y cada sujeto. 
 
#####Primero cargamos los datos de los voluntarios, y los combinamos por filas, y después actualizamos "datos" para que aparezcan los voluntarios como columna.
 
    vtrain <- read.table(paste(a,"train/subject_train.txt",sep = "/"),quote ="\"")

    vtest <- read.table(paste(a,"test/subject_test.txt",sep = "/"),quote ="\"")
    
    Voluntario <- rbind(vtrain,vtest)[,1]
    
    datos <- cbind(Voluntario,datos) 
 
#####Por último creamos nuestra segunda base de datos donde vendrán los promedios de cada variable para cada actividad y cada voluntario, y creamos un archivo donde aparece la base de datos ordenada con los promedios de cada variable. 
 
    promedio <- datos %>% group_by(Voluntario,Actividad) %>% summarise_each(funs(mean))
    write.table(promedio, row.names= F,file = "final.txt") 
 
 