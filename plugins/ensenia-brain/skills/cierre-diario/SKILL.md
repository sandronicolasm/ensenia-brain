---
name: cierre-diario
description: Cierre del día de una tienda de EnsenIA — ventas, ingresos, gasto, ROAS, CPA y ticket promedio contra los días anteriores, alertas determinísticas y hasta 3 acciones propuestas con sus números. Usala una vez por día (a mano o como tarea programada), o cuando el dueño pregunte «¿cómo nos fue hoy/ayer?».
---

# Cierre diario

Si en esta conversación no corrió `brain-arranque`, alcanza con leer `ver_tienda` y el documento `Brain · Lecciones`.

## 1. Números
1. `tablero_del_dia` → hoy contra el promedio diario de 7 días: ventas, ingresos, ticket, gasto, ROAS, CPA, ganancia, visitas, conversión, order bump y oferta post-compra. `parteDelDia` dice cuánto del día pasó: si el cierre corre antes de que termine, comparalo con esa proporción y decilo. Las ventas en otra moneda vienen aparte (`ventasHoyEnOtrasMonedas`).
2. Si el dueño tiene el conector oficial de Meta Ads, sumá de ahí lo que haga falta por anuncio; si no, alcanza con lo que trae EnsenIA (`rendimiento_de_creativos` por creativo, `estadisticas` → campañas).

CPA objetivo: el del brief de cada producto (sección oferta). Si no está, el de la herramienta (40 % del ticket de 30 días) y anotalo como «a definir con el dueño».

## 2. Alertas
`alertas` (con `cpa_objetivo` si el brief lo tiene) devuelve las reglas fijas ya evaluadas, de lo más urgente a lo menos: lo que impide vender, anuncios que gastaron 1,5 veces el CPA objetivo sin ventas, caídas de conversión o de ventas (ajustadas a la hora), Meta sin sincronizar, reclamos, dominio, order bumps flojos y lo que conviene escalar. Sin alertas, se dice «sin alertas» y no se inventan problemas.

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
- Si un creativo cambió de estado, actualizalo con `actualizar_creativo` (skill `creativos`).
- Si no hay nada con evidencia suficiente, no se registra nada.
