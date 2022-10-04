## Cuestionario

1. **En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?**

    . 

---

2. **Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?**

    .

---

3. **Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?**

    Hay métodos cuyas categorías son más generales, como la creación de instancias, inicialización o acceso a colaboradores internos. En estos casos es fácil ubicar cada método en una de esas categorías, que por lo general Smalltalk tiene precargadas como sugerencias. Para el contexto más específico, si el método que queremos categorizar no puede ir en ninguna de las categorías existentes, creamos una nueva con un nombre lo suficientemente abarcativo como para que los siguientes métodos con características similares que creemos puedan estar en ella, pero cuidando que no sea demasiado genérico.

---

4. **Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?**

    Por cómo funciona la jerarquía de clases, es importante que la superclase tenga definido el método (sea abstracto o no) que las subclases van a redefinir. Aunque no tenga la implementación, la superclase es la que indica qué mensajes van a saber responder las subclases, y el mensaje #subclassResponsibility sirve para atajar el error MessageNotUnderstood en caso de que se quisiera llamar al método desde la superclase. Si quisiéramos agregar comentarios que describen el comportamiento polimórfico del mensaje (que será independiente de las implementaciones individuales) el método abstracto en la superclase es también el lugar para hacerlo, ya que contiene la versión generalizada de lo que cada subclase va a definir en sus detalles de implementación.

---

5. **¿Por qué está mal/qué problemas trae romper encapsulamiento?**

    .
