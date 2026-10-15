# Rutinas del Brain

Tareas programadas que corren en tu Claude (Claude Code: `/schedule` o tareas programadas de la app; claude.ai: Routines) con este plugin y el conector de EnsenIA. EnsenIA sólo responde: los números salen de sus tablas, que ya sincronizan Meta con frenos, así que ninguna rutina golpea la API de Meta en cada pasada.

Si una herramienta devuelve un error de límite, la rutina corta y sigue en la próxima: nunca reintenta en bucle.

| Rutina | Cuándo | Qué pegar como tarea |
|---|---|---|
| Cierre diario | 1 vez por día, a la hora en que cierra tu mercado principal (ej. 23:30) | `Usá la skill cierre-diario con la tienda de EnsenIA. Proponé las acciones con proponer_accion; no ejecutes nada que no esté aprobado.` |
| Cazador de ceros | Cada 4 horas | `Con el conector de EnsenIA: alertas con el CPA objetivo del brief. Por cada anuncio que gastó 1,5 veces el CPA objetivo sin ventas hoy y que no tenga ya una acción pendiente, proponer_accion tipo pausar_anuncio con los números. Si queda aprobada, pausalo con el conector de Meta Ads y registrá el resultado. Si no hay ninguno, terminá sin mensaje.` |
| Escalador | 1 vez por día, a la mañana | `Usá la skill escalar-campanas con la tienda de EnsenIA.` |
| Auditoría nocturna | 1 vez por noche (ej. 3:00) | `Usá la skill auditoria-nocturna con la tienda de EnsenIA.` |
| Guardián de cobro | Cada hora | `Con el conector de EnsenIA: alertas. Si hay alguna urgente de cobro, entrega o dominio, avisame con qué pasa y qué hacer. Si no, terminá sin mensaje.` |

Las acciones que proponen las rutinas le llegan al dueño para aprobar en el panel de EnsenIA (**Brain → Por aprobar**), con aviso al celular si son de riesgo medio o alto. En **Brain → Autonomía** se elige qué puede hacer el Brain solo y con qué topes.
