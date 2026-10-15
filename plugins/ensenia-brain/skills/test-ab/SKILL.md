---
name: test-ab
description: Arma, mide y cierra tests A/B de la landing de un producto en EnsenIA — elige qué testear, arma la landing B con un solo cambio, la reparte, lee el resultado con la significancia que calcula EnsenIA y cierra con la ganadora. Usala cuando el dueño quiera probar otro título, otra oferta u otro orden de bloques, o para revisar un test en curso.
---

# Test A/B de una landing

Desde el plan Impulso. Si en esta conversación no corrió `brain-arranque`, leé al menos `ver_brief` del producto y `listar_lecciones` con `area: landing`.

## 1. Qué testear
- **Una sola cosa por test**: el hero (promesa), la oferta (qué incluye, bonus, garantía), la prueba social o el orden de los bloques. Si cambian dos, no se sabe qué ganó.
- Elegí lo que más plata mueve: con `embudo_del_producto` mirá dónde se cae la gente (landing → checkout bajo: el problema es la página; checkout → pago bajo: no es la landing, es el checkout o el precio).
- Una idea que contradice una lección activa se puede testear, pero decilo.
- Hace falta tráfico: con menos de ~100 visitas por día a la landing, un test tarda semanas; avisalo antes.

## 2. Armar la B
1. `resultado_test_ab` → si ya hay un test en curso, no arranques otro sobre el mismo producto.
2. `ver_landing` para conocer los bloques y sus ids.
3. Mostrale al dueño el cambio exacto (antes y después) y esperá el «sí».
4. `crear_variante_b` con las operaciones (parte de una copia de la A), `activar: true` y el reparto (50 % por defecto; 20–30 % si la B es arriesgada).

Si la página está publicada en el CDN, el test no se puede activar: el dueño la despublica desde el producto.

## 3. Medir
`resultado_test_ab` trae visitas, ventas y conversión por variante, la diferencia con su intervalo del 95 % y la decisión que calcula EnsenIA:
- **seguir**: faltan datos (al menos 100 visitas por variante y 10 ventas) o la diferencia todavía puede ser casualidad. No cierres antes por más que «se vea» una ganadora.
- **gana-a / gana-b**: hay ganadora con 95 % de confianza.

Contáselo al dueño en una línea: «B convierte 4,5 % contra 2,0 % de A (+2,5 puntos, entre +1,1 y +3,9), con 99 % de confianza».

## 4. Cerrar
- Con ganadora: `proponer_accion` tipo `cerrar_test_ab` (`producto_id`, `ganadora`). Si la tienda le dio autonomía a ese tipo, se cierra sola porque el resultado lo respalda; si no, el dueño lo aprueba en Brain → Por aprobar. En el plan sin aprobaciones, `cerrar_test_ab` con el «sí» del dueño.
- Cerrar contra el resultado o sin datos suficientes sólo con el pedido explícito del dueño (`forzar: true`).
- La perdedora queda en Versiones.
- Con n ≥ 30 ventas detrás, registrá lo aprendido con `registrar_leccion` (área `landing`, la evidencia del test, fuente `test-ab`).
