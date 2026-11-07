---
name: landing-que-convierte
description: Arma, revisa o mejora la landing de venta de un producto de EnsenIA a partir de su brief — estructura por bloques, textos con el lenguaje del mercado, prueba social real, auditoría y publicación con versión anterior guardada. Usala para crear una landing, reescribirla, auditar una que no vende o hacer la versión en otro idioma.
---

# Landing que convierte

Si en esta conversación no corrió `brain-arranque`, corrélo primero.

## 1. Juntar la base
1. Brief del producto (`ver_brief`). **Sin brief no se escribe una landing**: si falta, armalo primero (secciones en `brain-arranque`).
2. `metodologia` → `landing` (con el `mercado` del idioma que vas a escribir).
3. `guia_de_bloques` → formato exacto de cada bloque, reglas de CTAs y links, variables de precio, kit de diseño.
4. `ver_producto` → precios y `botonesDeCompra` (si tiene pack, un botón por versión).
5. `listar_opiniones` con el `producto_id` → la ÚNICA prueba social que podés usar.
6. Si ya existe: `ver_landing` (y `analizar_landing`) para conservar ids y saber qué falla.
7. Lecciones del área `landing`: aplicalas y decí cuáles usaste.

## 2. Decidir con el dueño (antes del esqueleto)
1. **A quién le hablás:** resumí el avatar en 3 líneas (quién es, qué le duele, qué ya probó, nivel de conciencia) y esperá su OK. Sin avatar no hay landing: armalo con `metodologia` → `avatar`.
2. **Bloques:** todo con bloques de EnsenIA, mixta (recomendada: EnsenIA + 2 a 4 HTML de diseño) o todo HTML (desde Impulso; se edita con la IA, no desde los campos del panel).
3. **Extensión de los textos:** proponé una por sección según el nivel de conciencia y preguntá si la quiere más corta o más larga; respetala en todos los bloques.
4. **Testimonios:** opiniones de la tienda, o chats reales de WhatsApp para el bloque de testimonios de WhatsApp (textuales, con su confirmación de que son verídicos: `testimonios_reales` al guardar).
Guardá lo elegido (`actualizar_estado` o el brief) para no volver a preguntarlo.

## 3. Proponer antes de escribir
Mostrale al dueño el esqueleto: orden de bloques, titular (2 o 3 opciones con su ángulo), la promesa, la oferta (qué incluye y bonus) y qué prueba social hay. Esperá el «sí».

Orden que convierte: hero → problema → antes y después → beneficios → qué incluye → para quién es → testimonios (sólo si hay reales) → oferta con medios de pago y confianza → garantía → FAQ → cierre.

## 4. Escribir
- Frases del mercado tal cual aparecen en el brief; nada de jerga de agencia.
- Precios **sólo** con `{{precio}}`, `{{precio_lista}}`, `{{precio_antes}}`, `{{precio_pack}}`, `{{moneda}}`, `{{descuento}}`, `{{ahorro}}`. Nunca un monto escrito a mano.
- Botones de compra: en bloques nativos alcanza con el texto; en el HTML, `#comprar` (o `#comprar-simple` / `#comprar-pack`).
- Sin links para pagar fuera de EnsenIA.
- Sin testimonios, cifras ni calificaciones inventadas. Chats de WhatsApp sólo si son reales y el dueño lo confirma (`testimonios_reales`). Si no hay prueba social, se usa garantía, demostración del contenido y especificidad.

## 5. Guardar y auditar
1. `guardar_landing` (con `idioma` si no es el de la tienda). Queda la versión anterior en el historial.
2. `analizar_landing` → corregí todo lo que marque (con `editar_bloques_landing` para cambios puntuales) hasta que salga limpia.
3. Pasale al dueño la URL para que la mire en el celular.
4. Si algo salió mal: `listar_versiones` + `restaurar_version`.

## Formato quiz
Si el tráfico es frío o el producto tiene perfiles distintos, la landing puede ser un quiz (desde Impulso): usá la skill `quiz-de-venta`. Si `ver_landing` trae `format: "quiz"`, lo que ve el visitante es el quiz, no los bloques.

## Otro idioma
- Cada idioma activo tiene su landing (`idioma` en `ver_landing` / `guardar_landing`). No es una traducción literal: adaptá ejemplos, modismos y objeciones a ese mercado (`metodologia` con el `mercado` correspondiente).
- Si el idioma no está activo en la tienda, el dueño lo activa en Configuración → Preferencias → Idiomas.
- Los textos del producto en ese idioma (nombre y descripciones del catálogo y el checkout) todavía no se cargan por el conector: pasale al dueño la traducción lista para pegar en `/admin/products/<id>` → *Idiomas* (o que use «Traducir con IA» ahí).

## Al cerrar
Anotá en el brief qué titular y qué ángulo quedaron publicados (fecha), para poder medir contra la próxima versión.
