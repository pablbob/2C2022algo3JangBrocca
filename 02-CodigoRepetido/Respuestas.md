## Cuestionario

1. **En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?**

    Si bien no la creamos sino que utilizamos un método ya provisto por la clase TestCase de Smalltalk, lo que vendría a representar la extracción que realizamos es un cronómetro o contador de tiempo que calcula cuánto tarda en ejecutarse un Closure en milisegundos.

---

2. **¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?**

    Particularmente en Cuis se pueden utilizar Denotative Objects o instancias de clases del Class Browser, los primeros siendo extensiones limitadas de clases. Las clases representan conceptos o ideas generales, que al instanciarse se pueden usar para representar entes más específicos que entran dentro de esas categorías.

---

3. **¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?**

    La reducción de código repetido puede relacionarse con el tercer punto que menciona Naur cuando enumera las áreas en las que el conocimiento del programador supera la documentación. En él dice que el programador puede incorporar constructivamente cualquier modificación del programa que se le solicite. Según Naur, al momento de modificar el código, las abstracciones que eliminan posible código repetido son esenciales y mejoran la calidad del diseño pero son costosas de implementar pues se está modificando el modelo en sí, y no se trata de simplemente editar texto.