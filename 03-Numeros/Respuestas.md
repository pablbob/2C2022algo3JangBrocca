## Cuestionario

1. **En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?**

    El primer llamado aporta la informacion de cómo es la operación aritmetica, cúal es la operación y el orden de los operandos. La segunda llamada en el DD brinda la información del tipo de Numero del operando receptor (Entero o Fraccion), respetando el orden de la operacion. Y le manda ese mensaje al colaborador externo que lo sabe responder.

---

2. **Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?**

    Nos parece mejor instanciar un objeto en la superclase ya que desde ahi podemos iterar por todas las subclases y elegir la correspondiente para inicializarla. Si se crea ese objeto desde diferentes lugares y de diferentes formas podemos, desde la superclase, elegir a qué subclase debe pertenecer el objeto y mandarle un mensaje polimorfico para inicializarlo. La implementacion de ese mensaje en la superclase seria self subclassResponsability y en las subclases estaria cada una con su diferente implementacion para inicializarlo.

---

3. **Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?**

    Hay métodos cuyas categorías son más generales, como la creación de instancias, inicialización o acceso a colaboradores internos. En estos casos es fácil ubicar cada método en una de esas categorías, que por lo general Smalltalk tiene precargadas como sugerencias. Para el contexto más específico, si el método que queremos categorizar no puede ir en ninguna de las categorías existentes, creamos una nueva con un nombre lo suficientemente abarcativo como para que los siguientes métodos con características similares que creemos puedan estar en ella, pero cuidando que no sea demasiado genérico.

---

4. **Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?**

    Por cómo funciona la jerarquía de clases, es importante que la superclase tenga definido el método (sea abstracto o no) que las subclases van a redefinir. Aunque no tenga la implementación, la superclase es la que indica qué mensajes van a saber responder las subclases, y el mensaje #subclassResponsibility sirve para atajar el error MessageNotUnderstood en caso de que se quisiera llamar al método desde la superclase. Si quisiéramos agregar comentarios que describen el comportamiento polimórfico del mensaje (que será independiente de las implementaciones individuales) el método abstracto en la superclase es también el lugar para hacerlo, ya que contiene la versión generalizada de lo que cada subclase va a definir en sus detalles de implementación.

---

5. **¿Por qué está mal/qué problemas trae romper encapsulamiento?**

    Romper el encapsulamiento esta mal porque al dejar que un objeto se comunique directamente con colaboradores internos refleja un mal modelo de la realidad y complejiza el diseño ya que al agregar nuevos objetos, las relaciones entre ellos aumenta exponencialmente y por lo tanto su complejidad. En cambio, hay que hacer que los objetos se comuniquen con los menos posibles para reducir la complejidad y que cada uno se encargue de modificar sus propios colaboradores.
