# db_config.py

import mysql.connector
from mysql.connector import Error

def conectar():
    try:
        conexao = mysql.connector.connect(
            host='localhost',  # ou '127.0.0.1'
            user='root', 
            password='eec123456@#$', 
            database='sgb'
        )
        if conexao.is_connected():
            print("Conexão bem-sucedida com o banco de dados!")
            return conexao
    except Error as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return None
