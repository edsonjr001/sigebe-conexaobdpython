# crud_livro.py
from db_config import conectar

def criar_livro(titulo, autor, isbn=None, sinopse=None, capa=None, quantidade=1, categoria_id=None):
    try:
        Conn = conectar()
        cursor = conn. cursor()
        cursor.execute(
            "INSERT INTO LIVRO (titulo,autor, isbn, sinopse, capa, quantidade, categoria_id) values (%S,%s,%s,%s,%s,%s,%s)",
            (titulo, author_or_nome(autor), isbn, sinopse,capa, quantidade, categoria_id)
        )
        conn.commit()
        return{"status":"sucesso","mensagem":"livro criado com sucesso." , "id": cursor }
