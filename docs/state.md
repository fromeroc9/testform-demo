# Gestión de Estado (State)

Terratest necesita recordar qué archivos `.feature` de tu repositorio local corresponden a qué Issues en GitHub. Esta memoria se llama **State** (Estado), y se almacena en el archivo `terratest.state` en la raíz de tu proyecto.

## El Archivo de Estado (`terratest.state`)

Es un archivo JSON autogenerado que **nunca debes editar manualmente**. Terratest lo mantiene sincronizado cada vez que corres un comando `apply` o `refresh`.
Debes versionar (hacer commit) este archivo en tu control de versiones (Git), de la misma manera que compartes tu código.

## Identidad de los Recursos

Terratest asocia un recurso local con uno remoto utilizando una "Identidad". Esta identidad es permanente:
- **Testcase**: Se rastrea por el nombre del archivo y un ID interno generado. Ej: `login.case.feature::@[1]`
- **Testrun y Testplan**: Se rastrean puramente por el nombre del archivo. Ej: `sprint1.run.feature`

## Idempotencia y Actualizaciones

Cada vez que aplicas cambios, Terratest no recrea los Issues. 
Terratest calcula un hash criptográfico de tu código Gherkin local (`localHash`). 
Si modificas el texto de un escenario localmente, Terratest notará que el hash cambió y ejecutará una acción de **Modificación (Update)** en el API de GitHub en lugar de duplicar el Issue.
Si el hash no cambia, Terratest omite la actualización por completo, garantizando ejecuciones rápidas (Idempotencia).

## Desincronización (Drift)

¿Qué pasa si alguien cierra el Issue de GitHub desde el navegador web, pero tu archivo `.feature` aún existe?

Ocurre una "desincronización" o "drift". Tu entorno local está fuera de sincronía con la realidad.

**Solución:** 
Corre `terratest refresh`.
Este comando conectará con la API de GitHub, verificará todos los Issues rastreados en el `terratest.state` y, si encuentra que uno fue borrado remotamente, actualizará el archivo de estado local para que refleje la realidad. En tu próximo `terratest apply`, Terratest detectará que el recurso ya no existe y lo volverá a crear basándose en el `.feature`.

## Tainting (Marcar para Destrucción)

Si un recurso se corrompió, pero no quieres borrar tu archivo `.feature`, puedes forzar a Terratest a destruirlo y recrearlo:

```bash
terratest taint login.case.feature::@[1]
```
En el próximo `apply`, Terratest cerrará el Issue antiguo y creará uno completamente nuevo.

## Manipulación Quirúrgica del Estado

En casos excepcionales, puede que necesites que Terratest "olvide" que creó un Issue (por ejemplo, si cambiaste de repositorio y quieres abandonar los Issues anteriores sin borrarlos).

Puedes eliminar referencias puramente del estado (sin tocar la API de GitHub):
```bash
terratest state rm login.case.feature::@[1]
```

Para consultar qué recursos están siendo rastreados actualmente:
```bash
terratest state list
```
