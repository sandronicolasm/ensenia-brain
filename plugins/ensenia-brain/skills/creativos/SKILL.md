---
name: creativos
description: Produce y registra creativos para anunciar un producto de EnsenIA en Meta — banco de ángulos y hooks, guiones de video, anuncios de imagen, códigos de seguimiento y veredicto de ganadores y perdedores. Usala para armar una tanda de anuncios nueva, refrescar creativos cansados o decidir qué anuncio gana.
---

# Creativos

Si en esta conversación no corrió `brain-arranque`, corrélo primero. Sin brief del producto no hay creativos: armalo antes.

## 1. Ángulos antes que piezas
1. `metodologia` → `angulos_y_voz` (con el `mercado`).
2. Del brief y del registro de creativos (abajo), armá el banco de ángulos: dolor, deseo, objeción, mecanismo, prueba, identidad. Para cada uno, 2 o 3 hooks en el lenguaje literal del mercado.
3. Revisá `listar_lecciones` con `area: creativos` y `rendimiento_de_creativos` (qué ya ganó o perdió). No repitas un ángulo perdedor sin cambiarle algo y decirlo.
4. Proponé al dueño **3 a 5 ángulos** para esta tanda, con el porqué. Esperá el «sí».

## 2. Producir
- Video: `metodologia` → `guiones_video`. Guion con hook en los primeros 3 segundos, cuerpo y llamado a la acción; formato vertical.
- Imagen: `metodologia` → `anuncios_imagen`. Si el dueño tiene Canva, Figma u otro servicio de imágenes conectado, generalas ahí; si no, entregá el brief visual (texto en imagen, composición, referencias).
- Las imágenes terminadas se suben con `subir_imagen` (URL pública https) o `link_para_subir_imagen` (archivo local) para tenerlas en la tienda.
- Prueba social: sólo lo que devuelve `listar_opiniones`. Nada de testimonios ni resultados inventados.

## 3. Registrar con código
Cada pieza se registra en la tienda con `registrar_creativo` (formato, ángulo, hook, producto, asset o guion): devuelve su código (`CR-0001`, `CR-0002`…) y el nombre del anuncio, que va así en Meta: `CR-0007 | <ángulo> | <formato>`.

Con el código al principio del nombre:
- la sincronización de Meta vincula sola el anuncio al creativo (gasto, impresiones, clics) y lo pasa a «al aire»;
- las ventas llegan solas: los parámetros de `datos_para_anuncios` mandan el nombre del anuncio en `utm_content`.

Estados: `producido` → `auditado` (revisado contra el brief y las reglas) → `al_aire` → `ganador` / `perdedor` → `archivado`. Se cambian con `actualizar_creativo`.

## 4. Diagnóstico de cada pieza
`rendimiento_de_creativos` trae, por creativo, las métricas del anuncio y su punto de mejora. Se leen en orden y se arregla el primero que falla:
- **Video:** gancho (3 s / impresiones, 25 % o más) → retención (ThruPlay / impresiones, 10 % o más) → CTR único (1,5 % o más) → calidad de clics (visitas a la landing / clics, 80 % o más) → CPM (2 a 10 USD).
- **Imagen:** CTR único → calidad de clics → CPM.
- Gancho flojo: se rehace el arranque (los primeros 3 segundos), no el video entero. Retención floja: se acorta y se adelanta el beneficio. CTR único flojo: propuesta de valor y llamado a la acción. Calidad de clics floja: casi siempre es técnico (página lenta, caída o link roto): avisá al dueño antes de tocar el anuncio.
- Con menos de 1.000 impresiones o 30 clics no hay conclusión.
- La variante que corrige un punto de mejora es un creativo nuevo (`registrar_creativo`, con el ángulo y qué cambió).

## 5. Veredicto
Con `rendimiento_de_creativos` (al menos 7 días al aire; gasto de Meta contra ventas reales de la tienda):
- **Ganador**: CPA por debajo del objetivo y con ventas suficientes para no ser casualidad.
- **Perdedor**: gastó 1,5 veces el CPA objetivo sin ventas, o CPA el doble del objetivo con al menos 3 días al aire.
- Guardalo con `actualizar_creativo` (estado y veredicto en una línea, con los números), con el «sí» del dueño. Si un patrón se repite (por ejemplo, el ángulo de objeción gana siempre en México) y hay n ≥ 30 ventas detrás, registralo como lección (formato en `brain-arranque`).

No pauses ni cambies presupuestos sin el «sí» del dueño. Si tiene el conector oficial de Meta Ads, ejecutalo ahí después de la confirmación.
