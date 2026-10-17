---
name: cierre-diario
description: Cierre del día de una tienda de EnsenIA — ventas, ingresos, gasto, ROAS, CPA y ticket promedio contra los días anteriores, alertas determinísticas y hasta 3 acciones propuestas con sus números. Usala una vez por día (a mano o como tarea programada), o cuando el dueño pregunte «¿cómo nos fue hoy/ayer?».
---

# Cierre diario

Si en esta conversación no corrió `brain-arranque`, alcanza con leer `ver_tienda`, `listar_lecciones` y `acciones_pendientes`.

## 1. Números
1. `tablero_del_dia` → hoy contra el promedio diario de 7 días: ventas, ingresos, ticket, gasto, ROAS, CPA, ganancia, visitas, conversión, order bump y oferta post-compra. `parteDelDia` dice cuánto del día pasó: si el cierre corre antes de que termine, comparalo con esa proporción y decilo. Las ventas en otra moneda vienen aparte (`ventasHoyEnOtrasMonedas`). Con mercados, `mercados` trae lo mismo por mercado (cada uno en su zona horaria y con el gasto de su cuenta): reportá cada uno en su línea y no mezcles un mercado que escala con uno que testea.
2. `diagnostico_de_campanas` (últimos 7 días completos) → ¿es rentable?, el primer cuello de botella (CPM, landing, tráfico o pago) y el punto de mejora de cada anuncio con gasto. Es lo que ordena las acciones: se trabaja el primer tramo que falla, no el que más se ve.
3. Si el dueño tiene el conector oficial de Meta Ads, sumá de ahí lo que haga falta por anuncio; si no, alcanza con lo que trae EnsenIA (`rendimiento_de_creativos` por creativo, `estadisticas` → campañas).

CPA objetivo: `oferta.cpaObjetivoUsd` del brief de cada producto (`ver_brief`). Si no está, el de la herramienta (40 % del ticket de 30 días) y anotalo como «a definir con el dueño».

## 2. Alertas
`alertas` (con `cpa_objetivo` si el brief lo tiene; va en la moneda de la tienda: si es ARS, convertí el de USD) devuelve las reglas fijas ya evaluadas, de lo más urgente a lo menos: lo que impide vender, anuncios que gastaron 1,5 veces el CPA objetivo sin ventas, caídas de conversión o de ventas (ajustadas a la hora), Meta sin sincronizar, reclamos, dominio, order bumps flojos y lo que conviene escalar. Sin alertas, se dice «sin alertas» y no se inventan problemas.

## 3. Acciones
Hasta **3**, ordenadas por plata. Cada una con: qué hacer · por qué (con los números de arriba) · riesgo (bajo, medio, alto) · quién la ejecuta.

- Pausar un anuncio: riesgo bajo. Cambiar presupuesto: medio (nunca más de ±20 % por día). Cambiar precios: alto.
- **Nada se ejecuta sin el «sí» del dueño.** Con el plan Pro, cada propuesta va con `proponer_accion` (le llega para aprobar en el panel; si el dueño le dio autonomía a ese tipo, dentro de los topes se aprueba sola). Lo de Meta lo ejecutás con su conector de Meta Ads **después** de aprobado y avisás con `registrar_resultado_accion`. En los otros planes, proponé en el chat y esperá el «sí».
- Antes de proponer, `acciones_pendientes`: no dupliques lo que ya espera y no repitas lo rechazado sin un dato nuevo.
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
- Si hoy cerró una prueba o un cambio con n ≥ 30 ventas o conversiones detrás y un resultado claro, registralo con `registrar_leccion` (con la evidencia: métrica, antes, después, n, período), con el «sí» del dueño.
- Si un creativo cambió de estado, actualizalo con `actualizar_creativo` (skill `creativos`).
- Si no hay nada con evidencia suficiente, no se registra nada.
