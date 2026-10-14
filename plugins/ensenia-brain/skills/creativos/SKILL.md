---
name: creativos
description: Produce y registra creativos para anunciar un producto de EnsenIA en Meta — banco de ángulos y hooks, guiones de video, anuncios de imagen, códigos de seguimiento y veredicto de ganadores y perdedores. Usala para armar una tanda de anuncios nueva, refrescar creativos cansados o decidir qué anuncio gana.
---

# Creativos

Si en esta conversación no corrió `brain-arranque`, corrélo primero. Sin brief del producto no hay creativos: armalo antes.

## 1. Ángulos antes que piezas
1. `metodologia` → `angulos_y_voz` (con el `mercado`).
2. Del brief y del registro de creativos (abajo), armá el banco de ángulos: dolor, deseo, objeción, mecanismo, prueba, identidad. Para cada uno, 2 o 3 hooks en el lenguaje literal del mercado.
3. Revisá las lecciones del área `creativos` y lo que ya ganó o perdió en el registro. No repitas un ángulo perdedor sin cambiarle algo y decirlo.
4. Proponé al dueño **3 a 5 ángulos** para esta tanda, con el porqué. Esperá el «sí».

## 2. Producir
- Video: `metodologia` → `guiones_video`. Guion con hook en los primeros 3 segundos, cuerpo y llamado a la acción; formato vertical.
- Imagen: `metodologia` → `anuncios_imagen`. Si el dueño tiene Canva, Figma u otro servicio de imágenes conectado, generalas ahí; si no, entregá el brief visual (texto en imagen, composición, referencias).
- Las imágenes terminadas se suben con `subir_imagen` (URL pública https) o `link_para_subir_imagen` (archivo local) para tenerlas en la tienda.
- Prueba social: sólo lo que devuelve `listar_opiniones`. Nada de testimonios ni resultados inventados.

## 3. Registrar con código
Cada pieza lleva un código `CR-0001`, `CR-0002`… correlativo por tienda (seguí el número del registro). El código va al principio del **nombre del anuncio** en Meta: `CR-0007 | <ángulo> | <formato>`.

Los parámetros de URL de `datos_para_anuncios` ya mandan el nombre del anuncio en `utm_content`, así que cada venta queda atada a su código sin tocar el link. En `estadisticas` → campañas aparecen las ventas por anuncio (y el gasto, si la tienda conectó su cuenta publicitaria).

Registro: documento `Creativos · <producto>` (`guardar_documento`, `tipo: brief_creativo`, con el `producto_id`; si ya existe, actualizalo con su `documento_id`). Una tabla:

| Código | Formato | Ángulo | Hook | Asset / guion | Estado | Alta | Veredicto |

Estados: `producido` → `auditado` (revisado contra el brief y las reglas) → `al aire` → `ganador` / `perdedor` → `archivado`.

## 4. Veredicto
Con datos de al menos 7 días al aire (de `estadisticas` → campañas, y del conector de Meta Ads si está):
- **Ganador**: CPA por debajo del objetivo y con ventas suficientes para no ser casualidad.
- **Perdedor**: gastó 1,5 veces el CPA objetivo sin ventas, o CPA el doble del objetivo con al menos 3 días al aire.
- Escribí el porqué en una línea en «Veredicto». Si un patrón se repite (por ejemplo, el ángulo de objeción gana siempre en México) y hay n ≥ 30 ventas detrás, registralo como lección (formato en `brain-arranque`).

No pauses ni cambies presupuestos sin el «sí» del dueño. Si tiene el conector oficial de Meta Ads, ejecutalo ahí después de la confirmación.
