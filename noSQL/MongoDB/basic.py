"""documentación oficial: https://www.mongodb.com/docs/manual/core/document/ 
operaciones de CRUD en MongoDB: https://www.mongodb.com/docs/manual/crud/

Qué es MongoDB?
➢ sistema de Base de datos no relacional (NoSQL)
➢ Utiliza el paradigma de bases de datos basado en documentos
➢ Estructura de datos dinámica
➢ Escalamiento: Horizontal y vertical

Server -> Databases -> Collection -> Document

json:  Se parece a un dict en python, contiene los valores NULL y True - False
{
    "glosary": {
    
    }
}
 """
# ----------------------------------------------------------------#

"""INSTALACION 

-Instalar mongo db community server en tu computadora recomendada la version estable (current release): https://www.mongodb.com/try/download/community 
-Instalar el cliente de robo 3t: https://robomongo.org/ #editor similar a dbeaber para mongo
Usando el cliente de robo 3t conectate a la base de datos local:                                  Connection String URI Format — MongoDB Manual
#Conexion: new connection -> url: mongodb://localhost
Crea una base de datos llamada ejercicio1
Crea dentro de la base de datos una colección llamada usuarios con click derecho sobre collections
Crea dentro de la colección usuarios 3 documentos de ejemplo:
Un usuario con nombre y edad.
Un usuario con nombre, apellido y edad.
Un usuario con solo nombre.
 """

#----------------------------------------------------------------#

""" {"_comentario":"// /*js*/ //add database -> name_database -> add new collection -> producto -> add new document"} """

{
    "nombre": "papitas",
    "fabricante": "lays",
    "precio": 10
}

{
    "nombre": "pepsi",
    "fabricante": "pepsico",
    "precio": 8,
    "cantidad": "2L"
}

#----------------------------------------------------------------#

""" ¿Qué es mongo DB?
R//sistema de gestión de bases de datos no relacional (NoSQL), orientado a documentos

¿En cuál formato se almacena la información en MongoDB?
R//BSON

Dentro de una base de datos de mongoDB las agrupaciones de información más grandes se conocen como: COLECCIONES

Cada registro dentro de una base de datos de MongoDB es un: DOCUMENTO

Para insertar un único registro dentro de MongoDB se debe usar:
R// db.collection.insertOne()

Para actualizar varios registros dentro de MongoDB debemos utilizar:
R// db.collection.updateMany()

La versión gratuita de MongoDB para descargar e instalar de forma local en tu ordenador se llama:
R// MongoDB Community Server

 """

 #----------------------------------------------------------------#
"""  ¿Qué es un clúster?: https://www.ibm.com/docs/es/was-zos/9.0.5?topic=servers-introduction-clusters

Los clústeres son grupos de servidores que se gestionan juntos y participan en la gestión de carga de trabajo. Un clúster puede contener nodos o servidores de aplicaciones individuales. Un nodo suele ser un sistema físico con una dirección IP de host distinta que ejecuta uno o varios servidores de aplicaciones. Los clústeres se pueden agrupar bajo la configuración de una célula, que asocia lógicamente muchos servidores y clústeres con distintas configuraciones y aplicaciones entre sí en función de la discreción del administrador y de lo que tenga sentido en sus entornos organizativos.
son responsables de equilibrar la carga de trabajo entre los servidores, Los servidores que forman parte de un clúster se denominan miembrosdel clúster. Cuando instala una aplicación en un clúster, la aplicación se instala automáticamente en cada miembro del clúster. Puede configurar un clúster para proporcionar equilibrio de carga de trabajo con integración de servicios o con beans controlados por mensajes en el servidor de aplicaciones. """