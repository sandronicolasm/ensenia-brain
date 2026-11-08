---
name: redes-desde-cero
description: Arma las redes y las cuentas de Meta de una tienda de EnsenIA en el Chrome del dueño — portfolio comercial, página de Facebook, Instagram, cuentas publicitarias principal y secundaria, píxel con API de conversiones, dominio verificado, TikTok, ícono, portada, biografías y los primeros posts. Usala cuando el dueño no tenga redes o cuentas de Meta, diga «armá mis redes», «creá la página de Facebook», «necesito la cuenta publicitaria», «poné el píxel» o quiera retomar ese recorrido.
---

# Redes desde cero

Objetivo: que la tienda quede lista para anunciar y con una presencia viva — página e Instagram vinculados con su ícono, portada, biografía y 4 posts; cuenta publicitaria con tarjeta (y una secundaria de respaldo); píxel y API de conversiones midiendo; TikTok con su perfil.

Vos hacés el trabajo en el navegador del dueño con **Claude in Chrome**; el dueño sólo inicia sesión, pone los códigos, la tarjeta y lo que se hace desde el celular. El paso a paso vive en el servidor de EnsenIA (las pantallas de Meta cambian): seguilo siempre desde ahí.

## Antes de arrancar

1. `presencia_estado`: trae cómo guiar, los requisitos, qué está hecho y el instructivo del próximo paso. Leé `comoGuiar` entero y respetalo.
2. Requisitos:
   - **Claude in Chrome** activo (planes pagos de Claude). Si no está, explicale cómo instalarlo; si no puede, seguí igual dándole cada paso con los textos listos para copiar.
   - **Conector oficial de Meta Ads** (recomendado): con él verificás cada paso por API.
3. Contale el plan en 3 líneas: 3 días, como mucho dos cuentas nuevas por día, qué le va a tocar a él.

## Cada paso

1. Pedí el instructivo con `presencia_paso` si no vino en `proximoPaso`.
2. Decí qué vas a hacer y con qué datos. Para lo que crea algo (página, cuenta, píxel), esperá su «dale».
3. Hacelo en el navegador. Cuando aparezca un inicio de sesión, un código, un captcha, la tarjeta o aceptar condiciones: **frená** y decile «te toca a vos: …». Nunca le pidas contraseñas ni códigos por el chat.
4. Si la pantalla no coincide con el instructivo, describí lo que ves y preguntá. No improvises.
5. Verificá (conector de Meta Ads o la pantalla de configuración) y registralo con `presencia_guardar` con sus números. Una línea al dueño: qué quedó listo y qué sigue.
6. Si `presencia_estado` dice que hoy ya está completo, cortá ahí y decile qué sigue y cuándo.

## Lo que no se negocia

- El perfil personal del dueño no se toca y nunca se crean cuentas a nombre de otra persona.
- La tarjeta la carga el dueño; vos sólo abrís la pantalla.
- El token de la API de conversiones va del Administrador de eventos al panel de EnsenIA, en otra pestaña. Nunca al chat, a la memoria ni a un archivo.
- Textos (biografías, posts) con lo que la tienda vende de verdad: sin promesas de resultado, sin opiniones inventadas. Mostralos antes de publicar.
- Los posts se **programan** (no «publicar ahora») y se cuentan en el Planificador recargado.

## Al terminar

- Si Brain está activo: `actualizar_estado` con lo creado y los números.
- Recordale conectar la cuenta publicitaria en EnsenIA (Campañas) para medir el costo por venta.
- Ofrecé seguir con `/lanzar` o con la primera campaña (`datos_para_anuncios`).
