---
name: quiz-de-venta
description: Arma, mejora y mide la landing en formato quiz de un producto de EnsenIA — preguntas cortas sobre la situación del visitante que terminan en un resultado que recomienda el producto (o el pack) con el botón de compra. Usala para crear un quiz desde el brief, cambiar preguntas o resultados, ver dónde abandona la gente, o probar página contra quiz con un test A/B.
---

# Quiz de venta

Desde el plan Impulso. Si en esta conversación no corrió `brain-arranque`, corrélo primero.

## Cuándo conviene
- Tráfico frío de anuncios que no conoce el producto: el quiz engancha antes de pedir atención para una página larga.
- Productos con más de un perfil de comprador (principiante / avanzado, poco tiempo / mucho tiempo) o con pack: el resultado elige la versión.
- No reemplaza a una landing que ya convierte bien: en ese caso probalo como B (paso 5).

## 1. Juntar la base
1. Brief del producto (`ver_brief`): avatar, dolores, objeciones, lo que quiere lograr. **Sin brief no se arma el quiz.**
2. `guia_del_quiz` → estructura, reparto de puntos, reglas y ejemplo.
3. `ver_producto` → si tiene pack (un resultado puede recomendarlo) y qué incluye cada versión.
4. Si ya existe: `ver_landing` (campo `quiz`) para conservar ids.
5. Lecciones del área `landing`.

## 2. Proponer antes de escribir
Mostrale al dueño: el título de la portada (2 opciones), las preguntas con sus opciones, los resultados (título y qué versión recomiendan) y cómo reparten los puntos. Preguntale si quiere pedir el email antes del resultado (por defecto no: suma contactos, pero algunos abandonan en ese paso). Esperá el «sí».

## 3. Escribir
- Preguntas sobre la situación del visitante, no sobre el tema. 3 a 6, con 3 o 4 opciones cada una, frases del brief tal cual.
- 2 o 3 resultados con nombre propio; cada uno explica por qué ESTE producto le sirve a ese perfil, con bullets sacados del producto real.
- Sin promesas de resultados, sin testimonios ni cifras inventadas, precios sólo con variables.

## 4. Guardar
`guardar_quiz` (con `publicar: true` lo deja como la página que se ve; la página de bloques no se borra y se vuelve con `formato_de_landing`). Pasale la URL al dueño para que lo haga en el celular. Si algo salió mal: `listar_versiones` + `restaurar_version`.

## 5. Medir y mejorar
- `resultados_quiz` (7, 30 o 90 días): visitas → empezaron → cada pregunta → email → resultado → compra.
  - Muchos no empiezan: el problema es la portada (título, promesa).
  - Se caen en una pregunta puntual: reescribila o sacala.
  - Se caen en el email: probá sin pedirlo.
  - Llegan al resultado y no compran: el resultado no conecta con la oferta (texto, bullets, versión recomendada).
  - Un resultado sale casi siempre: revisá el reparto de puntos.
- Página contra quiz: `guardar_quiz` con `variante: "B"` y después la skill `test-ab` para activarlo y cerrarlo con la decisión de EnsenIA.

## Al cerrar
Anotá en el brief qué portada y qué resultados quedaron publicados (fecha), y con n ≥ 30 ventas registrá lo aprendido (`registrar_leccion`, área `landing`).
