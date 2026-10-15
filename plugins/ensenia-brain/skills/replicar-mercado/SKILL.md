---
name: replicar-mercado
description: Lleva una oferta que ya vende en una tienda de EnsenIA a otro país o idioma — crea el mercado (idioma, países, moneda, cuenta publicitaria, zona horaria), traduce la tienda por bloques adaptando al mercado, completa el checklist hasta que esté lista para vender y la sale a testear con métricas separadas. Usala para abrir México, Brasil, Estados Unidos o cualquier mercado nuevo, o para poner al día las traducciones de uno existente.
---

# Replicar en otro mercado

Replicar es copiar lo que ya funciona, no relanzar. Si en esta conversación no corrió `brain-arranque`, corrélo primero.

## 1. ¿Está para replicar?
1. `metodologia` → `replicar_mercado`: qué se hereda, qué se adapta y cómo se decide.
2. `listar_mercados` (30 días) y `rendimiento_de_creativos`: la oferta tiene que vender sostenido en su mercado de origen con CPA dentro del objetivo. Si no, decilo y proponé arreglarla donde está.
3. `listar_mercados` → `puedeCrear`: mercados es del plan Pro. Si no lo es, explicá qué suma Pro y pará.

## 2. Crear el mercado
Proponé al dueño, en una tabla:

| Código | Nombre | Idioma | Países | Moneda | Zona | Cuenta publicitaria |
|---|---|---|---|---|---|---|

- ARS sólo para Argentina; el resto, USD.
- Cuenta publicitaria: la de `cuentasPublicitarias` en `listar_mercados`. Si quiere una por mercado y no está conectada, se agrega en el panel (Campañas → Meta Ads → Agregar cuenta); el token nunca pasa por el chat.

Con su «sí», `crear_mercado` en estado `borrador`. Activa el idioma en la tienda solo.

## 3. Traducir por bloques
1. `exportar_para_traducir` con el idioma del mercado. Si `sinSeguimiento` > 0, hay traducciones hechas desde el panel: preguntá si las revisás (`todo: true`) o las dejás.
2. Traducí **adaptando**: vocabulario y modismos del mercado, ejemplos y nombres locales, objeciones de ese público. Nunca escribas precios en los textos.
3. Cada bloque vuelve entero: mismo `id`, mismo `type`, misma estructura, mismas URLs y números. Sólo cambian los textos.
4. `importar_traduccion` en tandas de hasta 60 piezas, con el `tipo`, `ref`, `id` y `hash` que trajo la exportación. Si devuelve `errores`, corregí esas piezas y reenvialas.
5. Repetí hasta que `exportar_para_traducir` no traiga nada.

Mostrale al dueño, antes de importar, 2 o 3 piezas clave (el hero de la landing principal, el título de la oferta post-compra) para que apruebe el tono. El resto va sin pedir permiso pieza por pieza.

## 4. Checklist
`estado_de_replicacion` con el código del mercado. Resolvé en orden: bloqueantes, importantes, opcionales.
- Lo que se arregla por el conector (traducciones, píxel con `configurar_pixel`, asignar la cuenta con `actualizar_mercado`), hacelo con su «sí».
- Lo que va por el panel (cobros, legales, cuenta publicitaria nueva, entrega traducida), decí exactamente dónde.

Seguí hasta `listo: true`.

## 5. Salir a testear
1. `actualizar_mercado` → `testeando`.
2. Creativos con la skill `creativos`: partí de los ganadores del origen, traducidos y adaptados, cada uno con su código nuevo. Los perdedores no se replican.
3. Dejá anotado en `Brief · <producto>` el mercado nuevo, la fecha y el CPA objetivo.

## 6. Decidir
A los 7 días, con `listar_mercados` y `tablero_del_dia` (cada mercado en su zona horaria):
- CPA dentro del objetivo con al menos 30 ventas → proponé `escalando`.
- CPA el doble del objetivo sin mejorar → proponé `pausado`, con el porqué en una línea.
- Convierte peor que el origen con el mismo tráfico: revisá primero la traducción y el precio de la landing, después los anuncios.

Cambios de estado y presupuesto, siempre con el «sí» del dueño. Si el patrón se repite (n ≥ 30), registralo como lección.
