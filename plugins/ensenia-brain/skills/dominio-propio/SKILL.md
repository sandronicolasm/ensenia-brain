---
name: dominio-propio
description: Elige, compra y deja funcionando el dominio propio de una tienda de EnsenIA — nombres cortos libres según la marca y el mercado, precio de alta y de renovación, compra en la cuenta de Hostinger del dueño con su conector oficial y sólo con un «sí» explícito, conexión en EnsenIA con y sin www, registros DNS validados y aplicados, y seguimiento hasta que la tienda abre en el dominio. Usala cuando el dueño diga «quiero mi dominio», «comprame un dominio», «conectá mi dominio», «el dominio no anda», o el lanzamiento llegue al paso del dominio. Si ya lo tiene en otro registrador, le da los registros para cargar a mano.
---

# Dominio propio

Objetivo: que la tienda abra en su dominio (`mimarca.com` y `www.mimarca.com`) con el candado, sin que el dueño toque un DNS. El paso a paso vive en el servidor de EnsenIA: seguilo siempre desde ahí.

## Antes de arrancar

1. `metodologia` con `tema: "dominio_propio"` (y el mercado, si lo sabés). Leela entera y seguila: trae el recorrido, los casos (ya lo tiene, otro registrador, `.ar`, sin plan) y las reglas de la compra.
2. `estado_del_dominio`: si el plan lo permite (desde Impulso) y si ya hay un dominio conectado.
3. **Conector de Hostinger.** Fijate si tenés sus herramientas (`search`, `execute`, `multi-execute`). Si no:
   - claude.ai: Configuración → Conectores → agregar con la URL `https://mcp.hostinger.com`.
   - Claude Code: `claude mcp add --transport http hostinger https://mcp.hostinger.com`.
   - Sin el conector igual se puede: el dueño compra con el link de `verificar_dominios` y vos seguís desde conectar.
4. **Chrome de trabajo.** Un par de pasos no salen por el conector y se hacen en hPanel (ver abajo). Fijate si tenés Claude in Chrome (en Claude Code: `/chrome`). Si no, esos pasos los toca el dueño con tus indicaciones.

## Lo que no se negocia

- **Comprar mueve plata en la cuenta del dueño.** Antes, en un solo mensaje: el dominio exacto, el precio de alta, el de renovación, el medio de pago y el perfil WHOIS. Comprás recién con un «sí» explícito a ese mensaje. Si algo cambia, se vuelve a preguntar.
- **Una sola compra, y después siempre el portafolio** (`domains_portfolio_list`), salga lo que salga. Un error no prueba que no se compró: Hostinger llegó a responder «500 Request failed» con el dominio ya registrado y cobrado. Si respondió 202 (pago en proceso), todavía no está registrado: esperá y, si figura sin terminar, `domains_portfolio_complete-setup` (no cobra). Nunca vuelvas a comprar a ciegas.
- **Renovación automática:** Hostinger la deja prendida. Preguntale al dueño si la quiere (si la tienda usa el dominio, sí). Para apagarla, `billing_subscriptions_disable-auto-renewal`; si la sesión la frena por tocar un cobro, va en el Chrome de trabajo.
- **No hay entorno de prueba:** cada llamada a Hostinger actúa sobre la cuenta real. Nada de barridos de cientos de nombres (límite: 90 pedidos por minuto).
- Tokens y contraseñas nunca por el chat; EnsenIA no guarda acceso a Hostinger.
- Antes de borrar registros DNS que chocan, mostrá cuáles y pedí el «sí». MX y los TXT del correo no se tocan.

## Recorrido corto

1. Proponé 5 a 10 nombres (`verificar_dominios` + disponibilidad de Hostinger) y que el dueño elija.
2. Cotizá desde el catálogo de Hostinger, revisá WHOIS y medio de pago, pedí el «sí» y comprá.
3. `conectar_dominio` con el dominio raíz.
4. Seguí `hostinger.pasos` de la respuesta: zona actual, **primero limpiar** lo que choca (todo dominio nuevo trae un A de estacionamiento en `@`), después validar y aplicar. Validar no ve los choques con lo que ya hay: aplicar los rechaza («ALIAS must not be used with A»). El conector no puede borrar registros sueltos: esa limpieza va en el Chrome de trabajo con `hostinger.plan.limpiar.enChrome`. Si Hostinger rechaza el tipo ALIAS en `@`, `hostinger.planB` (www principal y la raíz redirigida).
5. `estado_del_dominio` hasta `activo`; confirmá abriendo la tienda en el dominio y con `verificar_dominios` que ya figura registrado.
6. Qué sigue: verificar el dominio en Meta (`presencia_estado` / `presencia_guardar`) y, si aplica, los mails con su dominio.

## Chrome de trabajo

Para lo que el conector no puede (borrar un registro DNS suelto, un cambio de cobro que la sesión frena): en el Chrome del dueño con Claude in Chrome, en hPanel y con SU sesión.
- Nunca pidas contraseñas, códigos ni la tarjeta: si la pantalla los pide, «te toca a vos: …» y seguís cuando termine.
- Antes del botón final, decí qué cambia; si borra algo o toca un cobro, esperá su «sí».
- Si la pantalla no coincide con los pasos, describila o sacá una captura y preguntá antes de tocar.
- Al terminar, verificá con el conector (`dns_records_list`, `billing_subscriptions_list`).

Al terminar, una línea al dueño: en qué dirección abre la tienda, cuándo renueva el dominio y cuánto cuesta la renovación.
