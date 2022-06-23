import boto3

def detect_palabras(photo, bucket):

    client=boto3.client('rekognition','us-east-1')
    # Buscamos en nuestro bucket de AWS la imagen y que nos devuelva las cosas que encuentra
    response = client.detect_labels(Image={'S3Object':{'Bucket':bucket,'Name':photo}})
  
    # Hacemos un for para recorrer todo lo que nos ha devuelto
    for label in response['Labels']:
        # En este if le decimos que solo queremos aquellas respuestas que tenga una coincidencia del 95%
        if label['Confidence'] >= 95:
            return # este return es muy importante para que no siga buscando si ya hemos encontrado lo que queremos
     
    # en caso de que no sea np haya ninguna imagen con mas del 95% de coincidencia ponemos esto en el log
    print("En la imagen " + photo + " no hay ni un perro ni un gato" )

def main():
    bucket="rekognition-marc"
    print("Buscando...")
    # Añadimos el nombre de imagen que queramos, que estén en nuestro AWS
    imagenes = ["image"]
    # Hacemos un for para recorrer la imagen
    for imagen in imagenes:
        # llamamos a la función que nos dirá si es un perro, gato o ninguno
        detect_palabras(imagen, bucket)


if __name__ == "__main__":
    main()  