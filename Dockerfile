#Imagen base
FROM python:3.7-alpine

#crear carpeta /code
RUN mkdir /code

#Establecer directorio de trabajo /code
WORKDIR /code

#Establecer las dos variables de entorno con ENV
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

#Instalar dependencias
RUN apk add --no-cache gcc musl-dev linux-headers

#Copia el fichero requirements.txt dentro de /code
COPY requirements.txt /code/

#Instalar mas dependencias
RUN pip install -r requirements.txt

# Expone el puerto 5000
EXPOSE 5000

#Copia el fichero app.py dentro de /code.
COPY app.py /code/

#Comando de arranque
CMD ["flask","run"]




