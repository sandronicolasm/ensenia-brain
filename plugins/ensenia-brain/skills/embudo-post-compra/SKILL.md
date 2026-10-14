---
name: embudo-post-compra
description: Arma, mide y mejora el embudo post-compra de una tienda de EnsenIA — las ofertas que ve el comprador justo después de pagar (upsell, downsell si rechaza, lo que sigue si acepta), con productos, precios en USD y ARS, textos y ramas. Usala para subir el ticket promedio, crear la primera oferta post-compra, revisar cómo le va a cada paso o rehacer una que no convierte.
---

# Embudo post-compra

Es la pieza que más sube el ticket: después de pagar el comprador ya confió, y con Stripe o Whop acepta en un clic. Si en esta conversación no corrió `brain-arranque`, corrélo primero.

## 1. Leer
1. `ver_ofertas_post_compra` → ofertas actuales, cada paso con producto, precios (normal y de oferta en USD y ARS), minutos, textos, ramas y **resultados** (mostradas, aceptadas, tasa). También qué permite el plan (`plan.variosPasos`) y si la tienda cobra en un clic (`cobroEnUnClic`).
2. `metodologia` → `ofertas_post_compra`: cómo se diseña cada paso, rangos de precio y tasas de referencia.
3. Brief del producto que dispara la oferta y lecciones del área `post-venta`.
4. `listar_productos` o la lista `productos` que trae `ver_ofertas_post_compra`: sólo se puede ofrecer lo que ya existe en la tienda. Si falta el producto ideal (un downsell más chico, un complemento), proponé crearlo con `lanzar-oferta` antes.

## 2. Diagnosticar (si ya hay ofertas)
Por cada paso con al menos 30 mostradas:
- Upsell con tasa < 10 % o downsell con tasa < 15 %: el problema suele ser el producto (no es el siguiente paso natural) o el precio. Cambiá **una** cosa.
- Sin downsell y con upsell que se rechaza mucho: es la mejora más rápida (si el plan es Pro).
- Con menos de 30 mostradas: no hay conclusión; decilo y seguí.

## 3. Proponer el flujo
Mostralo así antes de guardar:

```
Compra de <producto disparador>
└─ 1. Upsell · <producto> · US$ X (normal US$ Y) · $ X ARS · 15 min
   «<título>»
   ├─ si acepta → 3. <producto> … | termina
   └─ si rechaza → 2. Downsell · <producto> · …
```

- Paso 1: el siguiente paso natural de lo que compró. Downsell: la misma promesa más chica o más barata (nunca el mismo producto más barato). Si acepta: un complemento chico, o termina.
- Hasta 3 ofertas seguidas por camino. Sin plan Pro, una sola oferta: proponé el mejor upsell y contale al dueño qué sumaría el downsell en Pro.
- Precios en las dos monedas si la tienda vende en Argentina. Nunca escribas precios en los textos: la tarjeta los muestra en la moneda de cada comprador.
- Si la tienda no cobra en un clic (sólo MercadoPago), que los textos no prometan «un clic».

## 4. Guardar
Con el «sí» del dueño: `guardar_oferta_post_compra`.
- Para una oferta nueva, ids propios por paso (`p1`, `p2`…). Para editar, **los ids que devolvió `ver_ofertas_post_compra`**: así se conservan los resultados medidos. Un paso que no mandes se borra.
- Si no es momento de mostrarla, guardala con `activa: false` (no la borres: se pierden los datos).
- Pasale al dueño el link del panel (`/admin/upsell-post-venta`): ahí ve el flujo dibujado en el pizarrón y puede traducir cada paso con IA en la sección *Idiomas*.

## 5. Medir
En el `cierre-diario` o a la semana: volvé a `ver_ofertas_post_compra` y compará la tasa de cada paso con la de antes del cambio. Si un cambio se confirma con n ≥ 30, registralo como lección (área `post-venta`).
