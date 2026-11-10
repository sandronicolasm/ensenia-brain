---
name: replicar-mercado
description: Lleva una oferta que ya vende en una tienda de EnsenIA a otro país o idioma — crea el mercado (países con el buscador, uno o varios idiomas, moneda, cuenta publicitaria, zona horaria), traduce la tienda por bloques idioma por idioma adaptando al mercado (incluidos los mails al comprador), carga la entrega traducida, completa el checklist hasta que esté lista para vender y la sale a testear con métricas separadas. Usala para abrir México, Brasil, Estados Unidos, Suiza o Canadá (varios idiomas) o cualquier mercado nuevo, o para poner al día las traducciones de uno existente.
---

# Replicar en otro mercado

Replicar es copiar lo que ya funciona, no relanzar. Si en esta conversación no corrió `brain-arranque`, corrélo primero.

## 1. ¿Está para replicar?
1. `metodologia` → `replicar_mercado`: qué se hereda, qué se adapta y cómo se decide.
2. `listar_mercados` (30 días) y `rendimiento_de_creativos`: la oferta tiene que vender sostenido en su mercado de origen con CPA dentro del objetivo. Si no, decilo y proponé arreglarla donde está.
3. `listar_mercados` → `puedeCrear`: mercados es del plan Pro. Si no lo es, explicá qué suma Pro y pará.

## 2. Crear el mercado
1. `buscar_paises` con los países que nombró el dueño (varios separados por coma): trae el código, el prefijo, los idiomas que se hablan y la zona de cada uno. Nunca adivines códigos ni idiomas.
2. Proponé al dueño, en una tabla:

| Código | Nombre | Idiomas (principal primero) | Países | Moneda | Zona | Cuenta publicitaria |
|---|---|---|---|---|---|---|

- Idiomas: los que se hablan en esos países y valen la pena. Suiza puede llevar alemán, francés e italiano; Canadá, inglés y francés; Estados Unidos, inglés y español. Cada visitante ve el idioma del mercado que más se habla en su país.
- ARS sólo para Argentina; el resto, USD.
- Cuenta publicitaria: la de `cuentasPublicitarias` en `listar_mercados`. Si quiere una por mercado y no está conectada, se agrega en el panel (Campañas → Meta Ads → Agregar cuenta); el token nunca pasa por el chat.

Con su «sí», `crear_mercado` en estado `borrador` con `idiomas` (lista). Activa los idiomas en la tienda solo.

## 3. Traducir por bloques, idioma por idioma
Con varios idiomas, hacé el ciclo completo para cada uno (menos el idioma base de la tienda).
1. `exportar_para_traducir` con el idioma. Trae landings, inicio, textos, ofertas, order bump, el mensaje de compra de cada producto y el mail del carrito abandonado. Los mails fijos (confirmación, acceso, recordatorios) ya salen traducidos solos. Si `sinSeguimiento` > 0, hay traducciones hechas desde el panel: preguntá si las revisás (`todo: true`) o las dejás.
2. Traducí **adaptando**: vocabulario y modismos del mercado, ejemplos y nombres locales, objeciones de ese público. Nunca escribas precios en los textos.
3. Cada bloque vuelve entero: mismo `id`, mismo `type`, misma estructura, mismas URLs y números. Sólo cambian los textos.
4. `importar_traduccion` en tandas de hasta 60 piezas, con el `tipo`, `ref`, `id` y `hash` que trajo la exportación. Si devuelve `errores`, corregí esas piezas y reenvialas.
5. Repetí hasta que `exportar_para_traducir` no traiga nada.
6. Entrega: si el producto tiene su contenido en ese idioma (otra carpeta de Drive, videos doblados), `configurar_entrega_por_idioma`. Si no, se entrega el original.

Mostrale al dueño, antes de importar, 2 o 3 piezas clave (el hero de la landing principal, el título de la oferta post-compra) para que apruebe el tono. El resto va sin pedir permiso pieza por pieza.

## 4. Checklist
`estado_de_replicacion` con el código del mercado (con varios idiomas, los pasos vienen por idioma). Resolvé en orden: bloqueantes, importantes, opcionales.
- Lo que se arregla por el conector (traducciones, píxel con `configurar_pixel`, asignar la cuenta con `actualizar_mercado`), hacelo con su «sí».
- Lo que va por el panel (cobros, legales, cuenta publicitaria nueva), decí exactamente dónde.

Seguí hasta `listo: true`.

## 5. Salir a testear
1. `actualizar_mercado` → `testeando`.
2. Creativos con la skill `creativos`: partí de los ganadores del origen, traducidos y adaptados, cada uno con su código nuevo. Los perdedores no se replican.
3. Sumá el mercado nuevo a `mercados` del brief (`guardar_brief`) y, si cambia, el CPA objetivo.

## 6. Decidir
A los 7 días, con `listar_mercados` y `tablero_del_dia` (cada mercado en su zona horaria):
- CPA dentro del objetivo con al menos 30 ventas → proponé `escalando`.
- CPA el doble del objetivo sin mejorar → proponé `pausado`, con el porqué en una línea.
- Convierte peor que el origen con el mismo tráfico: revisá primero la traducción y el precio de la landing, después los anuncios.
- Con varios idiomas, `porIdioma` de `listar_mercados` dice cuál vende: un idioma que no vende con tráfico es traducción floja o idioma que no hacía falta.

Cambios de estado y presupuesto, siempre con el «sí» del dueño. Si el patrón se repite (n ≥ 30), registralo como lección.
