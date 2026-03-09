# Gestión de Ventas - Base de Datos SQLite

![Banner](https://img.shields.io/badge/Database-SQLite-blue?style=for-the-badge&logo=sqlite)
![GitHub](https://img.shields.io/badge/Repository-Private-orange?style=for-the-badge&logo=github)

Este repositorio contiene la solución completa a la tarea de modelado y creación de base de datos para un sistema de gestión de ventas.

## 📋 Actividades Realizadas
- [x] Identificación de entidades y atributos.
- [x] Identificación de relaciones y cardinalidad.
- [x] Elaboración del Diagrama Entidad-Relación (ER).
- [x] Transformación al modelo relacional (resolución N:M).
- [x] Scripts SQL para creación e inserción de datos.
- [x] Implementación en SQLite (`.db`).

## 🛠️ Herramientas
- **Modelado:** Draw.io
- **Motor:** SQLite 3
- **Lenguaje:** SQL / Python (para automatización)

## 🗄️ Estructura del Proyecto
- `consulta.sql`: Script principal con sentencias `CREATE` e `INSERT`.
- `base_de_datos.db`: Archivo de base de datos SQLite listo para usar.
- `crear_db.py`: Script de Python para automatizar la creación de la base de datos.
- `DOCUMENTACION.md`: Análisis detallado de entidades y relaciones.

## 🚀 Cómo usar
1. Clonar el repositorio.
2. Abrir `base_de_datos.db` con cualquier gestor de SQLite (ej. DB Browser for SQLite).
3. O ejecutar `python crear_db.py` para regenerar la base de datos desde el script SQL.

---
**Desarrollado por [Tu Nombre/Usuario]**
