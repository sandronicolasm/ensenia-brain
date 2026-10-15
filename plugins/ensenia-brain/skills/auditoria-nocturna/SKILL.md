---
name: auditoria-nocturna
description: Auditoría nocturna de una tienda de EnsenIA — compara los números de la semana contra el brief y las lecciones, da veredicto a los creativos, registra lo aprendido con evidencia, poda lo que ya no vale y deja propuestas con números para que el dueño apruebe a la mañana. Usala una vez por día (idealmente como tarea programada a la noche) o cuando el dueño pida «revisá cómo venimos y aprendé».
---

# Auditoría nocturna

Corre sin el dueño mirando: no le preguntes nada. Lo que necesite su decisión queda como acción propuesta (`proponer_accion`) o en el resumen final. Si en esta conversación no corrió `brain-arranque`, leé al menos `ver_tienda`, `ver_brief`, `listar_lecciones` y `acciones_pendientes`.

## 1. Datos (sólo de EnsenIA: no le pidas a Meta en cada pasada)
1. `tablero_del_dia` y `alertas` (con el CPA objetivo del brief, en la moneda de la tienda).
2. `estadisticas` con `dias: 7` y `dias: 30`; `listar_mercados` con `dias: 7` si hay mercados.
3. `embudo_del_producto` (7 y 30 días): conversión por paso y tasa de cada order bump.
4. `ver_ofertas_post_compra`: tasa de cada paso.
5. `rendimiento_de_creativos` con `dias: 7` y `dias: 14`.
6. `acciones_pendientes`: qué se ejecutó en la semana, qué falló y qué se rechazó.
7. `benchmarks`: dónde quedó la tienda contra su rubro. Una métrica que bajó de cuartil es un hallazgo; las metodologías traen los mismos percentiles en `benchmarksDelRubro`.

Si una herramienta devuelve un error de límite (demasiadas llamadas), cortá la auditoría y decilo en el resumen: se retoma en la próxima, nunca en bucle.

## 2. Contra la memoria
- Por cada lección activa usada en la semana: ¿los números la siguen confirmando? Si la contradicen con n ≥ 30, registrá la nueva con `contradice`. Si dejó de aplicar (el producto cambió, el mercado se pausó), `podar_lecciones` con el motivo.
- Por cada hipótesis del brief con datos nuevos: si llegó a n ≥ 30 y el resultado es claro, pasa a lección (`registrar_leccion`) y sale de `hipotesis` (`guardar_brief`). Si no llegó, sigue esperando.
- Nunca registres una lección sin evidencia con números de esta tienda.

## 3. Creativos
Con `rendimiento_de_creativos` y el CPA objetivo, aplicá el veredicto de la skill `creativos` (ganador, perdedor, sigue) y guardalo con `actualizar_creativo` (estado y una línea con los números). Un perdedor que sigue gastando es una acción `pausar_anuncio`.

## 4. Propuestas (hasta 5, ordenadas por plata)
Con `proponer_accion`, cada una con el motivo en números y la lección que la respalda si hay:
- `pausar_anuncio`: gastó ≥ 1,5× el CPA objetivo sin ventas en el período.
- `ajustar_presupuesto`: lo decide la skill `escalar-campanas`.
- `activar_flujo_post_compra`: una oferta pausada que convertía, o pausar un paso con tasa < 5 % y n ≥ 30 mostradas.
- `cambiar_precio`: sólo con evidencia fuerte (test o lección) y nunca más de una por noche.
No dupliques lo que ya espera en `acciones_pendientes` ni repitas lo rechazado sin un dato nuevo.

## 5. Resumen para el dueño (lo lee a la mañana)
```
**Auditoría <fecha>** · <tienda>
Semana: <ventas> ventas (<±x %>) · ROAS <x> · CPA <$> (objetivo <$>)
Aprendí: <lecciones nuevas o podadas, una línea cada una, o «nada con evidencia suficiente»>
Creativos: <ganadores / perdedores con su código>
Te dejé para aprobar: <n> acciones (Brain → Por aprobar)
```
