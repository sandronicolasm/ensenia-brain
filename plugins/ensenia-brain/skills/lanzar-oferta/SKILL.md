---
name: lanzar-oferta
description: Lanza una oferta completa en una tienda de EnsenIA, de la idea a los anuncios — brief, producto, entregables, landing, order bump, oferta post-venta y datos para Meta. Usala cuando el dueño quiera lanzar o relanzar un producto («quiero vender un ebook de…», «armemos el curso», «retomemos el lanzamiento»).
---

# Lanzar una oferta

Objetivo: que la oferta quede **vendiendo**, no sólo cargada. Listo = producto publicado con entrega, landing auditada, cobro funcionando, order bump y post-venta configurados, y la primera campaña con su link y su píxel.

Si en esta conversación no corrió `brain-arranque`, corrélo primero.

## Recorrido

Seguí el estado de `iniciar`: te dice qué está hecho, qué sigue y quién lo hace (`ia` = vos con herramientas; `dueño` = vos le das los pasos y el link, y esperás que confirme). Avanzá de a un paso; al cerrar cada uno, una línea: qué quedó listo y qué sigue.

### 1. Brief (antes de producir nada)
1. `metodologia` → `investigacion`, después `avatar`, después `oferta` (con `mercado`: `argentina`, `latam` o `ingles`).
2. Con lo que salga, armá el brief con las secciones de `brain-arranque` y guardalo con `guardar_brief`. Si el producto todavía no existe, guardalo sin producto y asocialo cuando lo crees (mismo `documento_id`).
3. Mostrá al dueño la promesa, el precio y los bonus. No sigas sin su «sí».

### 2. Producto y entregables
- Formato con el dueño: ebook/material (`crear_pdf` + Drive), vivo (fecha y link) o grabado (videos + `armar_programa`).
- `crear_pdf` por entregable (el principal y cada bonus aparte). Contenido concreto y accionable; un ebook de entrada, 25 a 60 páginas.
- `crear_producto` con precios en USD y ARS (si vende en Argentina). Después `actualizar_producto` para la entrega.
- `configurar_marca` si la tienda todavía tiene la marca de fábrica.

### 3. Landing
Usá la skill `landing-que-convierte`. Antes de escribir, sí o sí:
- **Público objetivo:** la landing se arma para quien va a comprar. Avatar del brief o de `listar_documentos`; si no hay, `metodologia` → `avatar` primero. Contale al dueño a quién le vas a hablar.
- **Preguntale (de a una, con tu recomendación):** con qué bloques la arma (todo de EnsenIA, mixta —recomendada— o todo HTML, este último desde Impulso), qué extensión le da a cada texto, y si tiene testimonios o chats de WhatsApp reales para replicar en el bloque de testimonios de WhatsApp (con su confirmación de que son verídicos).
No publiques la oferta sin `analizar_landing` limpio.

### 4. Ticket promedio
- **Oferta post-compra** (upsell, downsell, lo que sigue): usá la skill `embudo-post-compra`. Se arma y se guarda desde acá con `guardar_oferta_post_compra`.
- **Order bump:** `ver_order_bump` para ver cómo está; `bumps_del_producto` para elegir qué se ofrece en el checkout de este producto (en orden); `guardar_order_bump` para el descuento, los textos y el diseño (incluida la casilla para sumar todas). Proponé un complemento de **20 a 40 % del precio principal** que acelere el resultado (plantillas, checklist, bonus en video), con 15 a 30 % de descuento, y guardalo con el «sí» del dueño. Anotalo en el brief.
- **Compraron también, cupones y promociones:** si el conector los tiene (`configurar_compraron_tambien`, `guardar_cupon`, `guardar_promocion`), proponé y guardá con el «sí» del dueño.
- Los textos en todos los idiomas activos: sección *Idiomas* de cada editor, con «Traducir con IA».

### 5. Cobro, legales y publicación
Lo marca `iniciar` y lo hace el dueño desde el panel. Verificá con `analizar_tienda` que no quede ningún bloqueo de cobro o entrega antes de anunciar.

### 6. Anuncios
1. `datos_para_anuncios` → URL con UTMs, checkout directo, píxel, imágenes y guía de Meta.
2. Si falta el píxel: `configurar_pixel` (sólo el ID; el token de la API de conversiones se carga en el panel).
3. Creativos: skill `creativos`.
4. Estructura de campaña: `metodologia` → `campanias_meta`. Si el dueño tiene conectado el conector oficial de Meta Ads, armala desde ahí con su confirmación; si no, dale los pasos.

## Al cerrar
- Actualizá el brief con lo que quedó decidido (precio final, bonus, bump, post-venta, ángulos elegidos).
- Resumí en 5 líneas qué quedó publicado, con los links, y qué falta del lado del dueño.
- Proponé correr `cierre-diario` mañana para ver los primeros números.
