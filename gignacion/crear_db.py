import sqlite3
import os

db_path = 'base_de_datos.db'
sql_path = 'consulta.sql'

if os.path.exists(db_path):
    os.remove(db_path)

try:
    with open(sql_path, 'r', encoding='utf-8') as f:
        sql_script = f.read()

    # SQLite doesn't support multiple commands in one execute() unless using executescript()
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.executescript(sql_script)
    conn.commit()
    conn.close()
    print("Base de datos creada exitosamente.")
except Exception as e:
    print(f"Error al crear la base de datos: {e}")
