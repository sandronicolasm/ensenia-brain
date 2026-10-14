---
name: cierre-diario
description: Cierre del día de una tienda de EnsenIA — ventas, ingresos, gasto, ROAS, CPA y ticket promedio contra los días anteriores, alertas determinísticas y hasta 3 acciones propuestas con sus números. Usala una vez por día (a mano o como tarea programada), o cuando el dueño pregunte «¿cómo nos fue hoy/ayer?».
---

# Cierre diario

Si en esta conversación no corrió `brain-arranque`, alcanza con leer `ver_tienda` y el documento `Brain · Lecciones`.

## 1. Números
1. `estadisticas` con `dias: 1` (hoy, en la zona horaria de la tienda) y con `dias: 7` (los últimos 7 días, hoy incluido).
2. Promedio diario = total de 7 días / 7. Compará hoy contra ese promedio. El cierre está pensado para el final del día: si se corre antes, hoy está incompleto; decilo y compará la hora contra la proporción del día que pasó.
3. Calculá y mostrá: ventas, ingresos, ticket promedio (ingresos / ventas), conversión, gasto, ROAS (ingresos / gasto) y CPA (gasto / ventas). Si la tienda no conectó su cuenta publicitaria, no hay gasto: decilo y seguí sin ROAS ni CPA.
4. Si el dueño tiene el conector oficial de Meta Ads, sumá de ahí el gasto y los resultados por anuncio del día; si no, usá lo que trae `estadisticas` → campañas.

CPA objetivo: el del brief de cada producto (sección oferta). Si no está, tomá como referencia el 40 % del precio del producto y anotalo como «a definir con el dueño».

## 2. Alertas (reglas fijas, en este orden)
| Alerta | Regla |
|---|---|
| 🔴 No se puede vender | `analizar_tienda` marca un bloqueo de cobro, entrega o publicación |
| 🔴 Anuncio que quema plata | gasto del día ≥ 1,5 × CPA objetivo y 0 ventas atribuidas |
| 🟠 Caída de conversión | conversión de hoy < 70 % del promedio de 7 días, con ≥ 100 visitas hoy |
| 🟠 Caída de ventas | ventas de hoy < 50 % del promedio diario de 7 días, con promedio ≥ 4 |
| 🟢 Para escalar | ROAS ≥ objetivo 3 días seguidos (mirá `dias: 3` si hace falta) |

Sin alertas, se dice «sin alertas» y no se inventan problemas.

## 3. Acciones
Hasta **3**, ordenadas por plata. Cada una con: qué hacer · por qué (con los números de arriba) · riesgo (bajo, medio, alto) · quién la ejecuta.

- Pausar un anuncio: riesgo bajo. Cambiar presupuesto: medio (nunca más de ±20 % por día). Cambiar precios: alto.
- **Nada se ejecuta sin el «sí» del dueño.** Lo de Meta se hace con su conector de Meta Ads después de la confirmación; lo de la tienda, con las herramientas de EnsenIA o con los pasos y el link del panel.
- Antes de proponer, revisá las lecciones: si una aplica, citala; si tu propuesta va en contra de una, decilo.

## 4. Formato

```
**Cierre <fecha>** · <tienda>
Ventas <n> (<±x %> vs. promedio) · Ingresos <$> · Ticket <$> · Conversión <x %>
Gasto <$> · ROAS <x> · CPA <$> (objetivo <$>)

Alertas
- …

Para mañana
1. …
```

## 5. Aprender
- Si hoy cerró una prueba o un cambio con n ≥ 30 ventas o conversiones detrás y un resultado claro, registralo como lección en `Brain · Lecciones` (formato en `brain-arranque`), con la evidencia.
- Si un creativo cambió de estado, actualizá su registro (skill `creativos`).
- Si no hay nada con evidencia suficiente, no se registra nada.
