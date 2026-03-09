# Documentación Técnica: Gimnasio "FitLife"

Este documento detalla el diseño y la implementación de la base de datos para el sistema de inscripciones del gimnasio "FitLife", cumpliendo con los estándares de modelado profesional y resolución de relaciones complejas.

## 1. Identificación de Entidades y Atributos

| Entidad | Descripción | Clave Primaria (PK) | Atributos Secundarios |
| :--- | :--- | :--- | :--- |
| **Miembro** | Registro de socios del gimnasio. | `cedula` | nombre_completo, telefono |
| **Clase** | Catálogo de actividades grupales. | `id_clase` | nombre_clase, dia_semana, horario |
| **Inscripción** | **Tabla Intermedia** que vincula miembros con clases. | `id_inscripcion` | cedula_miembro (FK), id_clase (FK), fecha_registro |

---

## 2. Relaciones y Cardinalidad

### Miembro - Clase (N:M)
El caso especifica que:
- "Un miembro puede inscribirse en varias clases".
- "Una clase puede tener varios miembros inscritos".

**Resolución:**
Se ha creado la entidad asociativa **Inscripciones**. Esta tabla transforma la relación Muchos a Muchos original en dos relaciones de Uno a Muchos (1:N), permitiendo un registro ordenado y sin redundancia.

---

## 3. Modelo Relacional (Implementado en Draw.io)

El diseño visual se encuentra en el archivo `diagrama_base_de_datos.drawio` con las siguientes características:
- Notación de **Crows Foot** (Pata de Gallo).
- Codificación de colores por entidad (Clientes: Azul, Clases: Rojo, Intermedia: Amarillo).
- Definición clara de Tipos de Datos (TEXT, INT, DATE).

---

## 4. Scripts SQL e Integridad
Se han implementado restricciones de integridad referencial para asegurar que no existan inscripciones huérfanas:
- `PRAGMA foreign_keys = ON;` habilitado.
- `ON DELETE CASCADE` en las claves foráneas de Miembros y Clases.
