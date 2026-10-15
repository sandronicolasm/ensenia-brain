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

## Qué trae (v0.5)

| Skill | Comando | Para qué |
|---|---|---|
| `brain-arranque` | `/estado` | Estado de la tienda, memoria y qué conviene hacer hoy. Corre antes que las demás. |
| `lanzar-oferta` | `/lanzar` | De la idea a los anuncios: brief, producto, entregables, landing, order bump, post-venta y Meta. |
| `landing-que-convierte` | `/landing` | Landing por bloques desde el brief, auditada, en cualquier idioma activo. |
| `creativos` | `/creativos` (la skill misma) | Ángulos, guiones, anuncios de imagen, códigos `CR-0001` y veredicto de ganadores. |
| `embudo-post-compra` | `/embudo` | Upsell, downsell y lo que sigue después de pagar: arma el flujo, lo guarda en la tienda y mide la tasa de cada paso. |
| `replicar-mercado` | `/replicar` | Lleva una oferta validada a otro país o idioma: crea el mercado, traduce la tienda por bloques, completa el checklist y la sale a testear con métricas separadas (plan Pro). |
| `cierre-diario` | `/cierre` | Números del día, alertas con reglas fijas y hasta 3 acciones propuestas. |

El método de marketing (investigación, avatar, oferta, landing, campañas…) vive en el servidor de EnsenIA y se pide con la herramienta `metodologia`: se actualiza sin reinstalar el plugin.

## Memoria

Los creativos, el embudo y los mercados ya viven en EnsenIA (`registrar_creativo`, `rendimiento_de_creativos`, `embudo_del_producto`, `tablero_del_dia`, `alertas`, `listar_mercados`, `estado_de_replicacion`).

Hasta que EnsenIA tenga tablas propias para el Brain, la memoria vive en los **documentos de estrategia** de la tienda (se ven en el panel):

- `Brief · <producto>` (tipo `oferta`): la fuente de verdad de cada oferta.
- `Brain · Lecciones` (tipo `otro`): lo aprendido con números (n ≥ 30), máximo 30.

## Reglas

- Nada inventado: ni testimonios, ni cifras, ni resultados.
- Todo cambio en la tienda se muestra y se confirma antes.
- Cobros, tarjeta y credenciales: nunca desde el chat.
- Precios en las páginas siempre con variables (`{{precio}}`): cada comprador ve su moneda.

## Hoja de ruta

Ver `docs/SPEC_ENSENIA_BRAIN.md` en el repo de EnsenIA. Esta es la Fase 0 (plugin sobre las herramientas que ya existen). Las siguientes suman datos y herramientas en EnsenIA: embudo post-compra de varios pasos, contadores del embudo, mercados, memoria estructurada con aprobación de acciones, varias tiendas por conexión y benchmarks de plataforma.

## Validar

```bash
claude plugin validate .
claude plugin validate plugins/ensenia-brain
```
