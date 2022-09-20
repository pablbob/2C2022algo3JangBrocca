## Cuestionario

1. **¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)**

    Creemos que, aunque parezca código innecesario, hacer `#estaHerido not` violaría el encapsulamiento del combatiente. No queremos pedirle la información y luego modificarla por fuera, es responsabilidad del combatiente responder que está herido y que no está herido.

---

2. **¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)?**

    En este caso se establecieron diferencias entre los combatientes, como los bonificadores de agilidad y fuerza, con lo cual pareciera tener sentido que sea necesario hacer distintos tests para cada uno. Sin embargo, de la manera en que lo modelamos nosotros (usando a Olgra como prototipo de los demás combatientes), hay tests que podrían haber sido omitidos porque refieren a los mismos métodos. Es el caso, por ejemplo, de los tests que prueban que un combatiente no puede hacer daño si está fuera de combate, entre otros.

---

3. **¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?**

    Modelamos para `OrquestadorDeCombates` los colaboradores internes rondaActual, bando1 y bando2, que representan respectivamente el número de ronda que se está luchando en el momento y las colecciones con los miembros de cada bando. Además del método `#desarrollarDuranteRondas:`, que realiza el desarrollo del combate en sí, hicimos el método `#desarrollarRonda`, que contiene todo lo que ocurre en una ronda dada. Primero consideramos que este método era el responsable de incrementar rondaActual pero luego nos dimos cuenta de que a la ronda sólo le importan los ataques en sí, así que dejamos esa responsabilidad en el ciclo de `#desarrollarDuranteRondas:`. Además en un momento nos pareció mejor separar la responsabilidad de determinar el ganador en el método `#verificarGanador`, que también se llama durante el ciclo, para que la lógica del combate esté mejor distribuida y no quede todo en un sólo método.
