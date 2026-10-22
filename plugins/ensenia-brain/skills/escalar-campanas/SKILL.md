---
name: escalar-campanas
description: Decide qué campañas o conjuntos de Meta escalar, sostener o recortar en una tienda de EnsenIA, con reglas fijas sobre ROAS y CPA reales (ventas de la tienda, no las de Meta), y deja cada cambio de presupuesto como acción para aprobar o, si el dueño dio autonomía, dentro de sus topes. Usala una vez por día o cuando el dueño pregunte «¿subo el presupuesto?».
---

# Escalar campañas

Si en esta conversación no corrió `brain-arranque`, leé `ver_brief` (CPA objetivo) y `listar_lecciones` con `area: campanas`.

## 1. Datos
- Si es la tarea programada: `ver_rutina` con `rutina: "escalador"` y seguí esos pasos (se actualizan solos).
- Primero, `acciones_pendientes`: ejecutá lo aprobado (si `verificacion` dice «NO ejecutar», registralo como fallido con ese motivo).
- `diagnostico_de_campanas` → si la cuenta no es rentable, **no se escala nada**: primero se arregla el cuello de botella que marca.
- `candidatos_escalador` → la decisión ya calculada para cada presupuesto activo (subir, bajar, mantener o no tocar) con los últimos 3 días completos, el presupuesto actual de Meta y el nuevo. **No la recalcules.**

## 2. Reglas (las aplica el servidor)
- Subir el % que permite la autonomía si el ROAS fue ≥ el mínimo de los objetivos los 3 días con 10 ventas o más.
- Bajar 20 % si el costo por venta superó 1,5 × el máximo los 3 días, en la tienda y según Meta.
- No tocar lo que cambió en Meta hace menos de 48 h. Ningún cambio de más de 50 % de una vez.
- Los objetivos (CPA y ROAS) salen de `ver_objetivos`; si no hay, son estimados: decilo.
- Una lección activa del área `campanas` manda: citala.

## 3. Proponer
Por cada «subir» o «bajar», `proponer_accion` con `tipo: ajustar_presupuesto` y payload `{ objeto, id, nombre, presupuesto_actual, presupuesto_nuevo, moneda }` tal cual los trae el candidato, y el motivo con los números de los 3 días. Si queda aprobada (sola o por el dueño), ejecutala con el conector de Meta Ads y registrá el resultado con `registrar_resultado_accion`. Si queda pendiente, decile al dueño que la apruebe en Brain → Por aprobar.

## 4. Contar y registrar
Al terminar, `registrar_corrida_rutina` con `rutina: "escalador"`.

```
**Escalado <fecha>**
Escalar: <conjunto> <$ actual → $ nuevo> (ROAS <x> 3 días, <n> ventas)
Sostener: …
Recortar: …
```
