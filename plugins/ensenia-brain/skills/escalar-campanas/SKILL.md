---
name: escalar-campanas
description: Decide qué campañas o conjuntos de Meta escalar, sostener o recortar en una tienda de EnsenIA, con reglas fijas sobre ROAS y CPA reales (ventas de la tienda, no las de Meta), y deja cada cambio de presupuesto como acción para aprobar o, si el dueño dio autonomía, dentro de sus topes. Usala una vez por día o cuando el dueño pregunte «¿subo el presupuesto?».
---

# Escalar campañas

Si en esta conversación no corrió `brain-arranque`, leé `ver_brief` (CPA objetivo) y `listar_lecciones` con `area: campanas`.

## 1. Datos
- `diagnostico_de_campanas` → si la cuenta no es rentable, **no se escala nada**: primero se arregla el cuello de botella que marca (CPM, landing, tráfico o pago). Tampoco se escala un anuncio con la calidad de clics por debajo del 80 % (la plata se va en clics que no llegan a la página).
- `estadisticas` con `dias: 3` y `dias: 7` → campañas y conjuntos con gasto, ventas reales, ROAS y CPA (ventas de EnsenIA atribuidas por UTM, no las que reporta Meta).
- `listar_mercados`: cada mercado con su cuenta publicitaria y su CPA.
- `acciones_pendientes` → la autonomía de `ajustar_presupuesto` (nivel y tope de % por vez) y lo que ya se cambió en los últimos días.
- Si tiene el conector oficial de Meta Ads, de ahí sale el presupuesto diario actual de cada campaña o conjunto. Si no, pedíselo al dueño.

## 2. Reglas (en este orden)
| Situación | Qué hacer |
|---|---|
| ROAS ≥ objetivo 3 días seguidos y al menos 10 ventas en esos días | Escalar: +15 a +20 % del presupuesto diario |
| CPA dentro del objetivo pero menos de 10 ventas | Sostener: no hay volumen para decidir |
| CPA entre 1 y 1,5× el objetivo 3 días | Sostener y revisar creativos (skill `creativos`) |
| CPA > 1,5× el objetivo 3 días, o gasto ≥ 2× CPA sin ventas | Recortar −20 % o pausar el conjunto |
| Cambió el presupuesto en las últimas 48 h | No tocar: Meta todavía está aprendiendo |

- El ROAS objetivo sale del brief (precio y CPA objetivo); si no hay, 2 y avisá que es provisorio.
- Nunca más de ±20 % por día en un mismo conjunto, aunque la autonomía permita más.
- Una lección activa del área `campanas` manda sobre estas reglas: citala.

## 3. Proponer
Por cada cambio, `proponer_accion` con `tipo: ajustar_presupuesto` y payload `{ objeto, id, nombre, presupuesto_actual, presupuesto_nuevo, moneda }`, y el motivo con los números de los 3 días. Si queda aprobada (sola o por el dueño), ejecutala con el conector de Meta Ads y registrá el resultado con `registrar_resultado_accion`. Si queda pendiente, decile al dueño que la apruebe en Brain → Por aprobar.

## 4. Contar
```
**Escalado <fecha>**
Escalar: <conjunto> <$ actual → $ nuevo> (ROAS <x> 3 días, <n> ventas)
Sostener: …
Recortar: …
```
