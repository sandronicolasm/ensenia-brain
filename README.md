# EnsenIA Brain

Plugin de Claude para operar tiendas de [EnsenIA](https://ensenia.online): lanzar ofertas, armar landings que convierten, producir creativos y cerrar el día con números.

El Brain **no es una IA nueva**: tu Claude piensa, EnsenIA guarda los datos y ejecuta por su conector (MCP). La IA la pagás con tu cuenta de Claude; EnsenIA no llama a ningún modelo.

## Instalar

En Claude Code:

```bash
claude plugin marketplace add sandronicolasm/ensenia-brain
claude plugin install ensenia-brain@ensenia
```

El plugin trae el conector de EnsenIA (`https://ensenia.online/mcp`). La primera vez te pide entrar a tu cuenta y elegir la tienda (OAuth). Marcá los tres permisos —leer, modificar páginas y configurar— para que el Brain pueda hacer todo el recorrido.

¿Preferís un token personal? En tu panel: Configuración → Conector de IA → Token personal, y:

```bash
claude mcp add --transport http ensenia https://ensenia.online/mcp --header "Authorization: Bearer ens_pat_…"
```

Si ya tenés conectado EnsenIA en claude.ai (Conectores), no hace falta conectarlo dos veces: las skills usan las mismas herramientas.

## Qué trae (v0.8)

| Skill | Comando | Para qué |
|---|---|---|
| `brain-arranque` | `/estado` | Estado de la tienda, memoria y qué conviene hacer hoy. Corre antes que las demás. |
| `lanzar-oferta` | `/lanzar` | De la idea a los anuncios: brief, producto, entregables, landing, order bump, post-venta y Meta. |
| `landing-que-convierte` | `/landing` | Landing por bloques desde el brief, auditada, en cualquier idioma activo. |
| `creativos` | `/creativos` (la skill misma) | Ángulos, guiones, anuncios de imagen, códigos `CR-0001` y veredicto de ganadores. |
| `embudo-post-compra` | `/embudo` | Upsell, downsell y lo que sigue después de pagar: arma el flujo, lo guarda en la tienda y mide la tasa de cada paso. |
| `replicar-mercado` | `/replicar` | Lleva una oferta validada a otro país o idioma: crea el mercado, traduce la tienda por bloques, completa el checklist y la sale a testear con métricas separadas (plan Pro). |
| `auditoria-nocturna` | `/auditoria` | Compara la semana con la memoria, da veredicto a los creativos, registra y poda lecciones y deja acciones para aprobar. |
| `escalar-campanas` | `/escalar` | Escalar, sostener o recortar campañas con reglas fijas sobre ROAS y CPA reales; cada cambio de presupuesto, como acción. |
| `test-ab` | `/testab` | Test A/B de una landing: un cambio por vez, reparto, resultado con la significancia que calcula EnsenIA y cierre con la ganadora. |
| `cierre-diario` | `/cierre` | Números del día, alertas con reglas fijas y hasta 3 acciones propuestas. |

El método de marketing (investigación, avatar, oferta, landing, campañas…) vive en el servidor de EnsenIA y se pide con la herramienta `metodologia`: se actualiza sin reinstalar el plugin.

## Memoria y aprobación

La memoria vive en EnsenIA y el dueño la ve en el panel (**Brain → Memoria**):

- **Brief** de cada oferta (`ver_brief`, `guardar_brief`): la fuente de verdad para landing, creativos y ofertas.
- **Lecciones** con evidencia (`listar_lecciones`, `registrar_leccion`, `podar_lecciones`): n ≥ 30, se podan solas a los 60 días sin uso.
- **Creativos** con código (`registrar_creativo`, `rendimiento_de_creativos`).

Lo que mueve plata o tráfico se propone con `proponer_accion` y el dueño lo aprueba en **Brain → Por aprobar** (con aviso al celular). En **Brain → Autonomía** elige qué puede hacer el Brain solo y con qué topes. Las acciones de Meta las ejecuta tu IA con el conector oficial de Meta Ads después de aprobadas (`registrar_resultado_accion`). Desde el plan Impulso.

Las tiendas que usaban la versión anterior tenían la memoria en documentos («Brief · …», «Brain · Lecciones»): el arranque los detecta y los pasa.

## Varias tiendas

Una sola conexión puede trabajar en varias tiendas: al conectar, tildá las otras en «También puede trabajar en» (o después, en el panel de la tienda principal: Configuración → Conector de IA → Tiendas). El Brain arranca con `listar_tiendas` y pasa `tienda` en cada herramienta. Las rutinas pueden recorrer todas: «hacé el cierre de cada tienda de listar_tiendas».

## Rutinas

Ver [RUTINAS.md](RUTINAS.md): cierre diario, cazador de ceros, escalador, auditoría nocturna y guardián de cobro como tareas programadas.

## Reglas

- Nada inventado: ni testimonios, ni cifras, ni resultados.
- Todo cambio en la tienda se muestra y se confirma antes.
- Cobros, tarjeta y credenciales: nunca desde el chat.
- Precios en las páginas siempre con variables (`{{precio}}`): cada comprador ve su moneda.

## Hoja de ruta

Ver `docs/SPEC_ENSENIA_BRAIN.md` en el repo de EnsenIA. Hechas: embudo post-compra de varios pasos, contadores del embudo y creativos, mercados, memoria estructurada con aprobación de acciones, varias tiendas por conexión, test A/B y benchmarks de plataforma por rubro (`benchmarks`, `guardar_rubro`).

## Validar

```bash
claude plugin validate .
claude plugin validate plugins/ensenia-brain
```
