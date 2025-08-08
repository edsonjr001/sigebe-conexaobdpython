from db_config import conectar

def criar_categoria(nome, descricao):
    try:
            conn = conectar()
            cursor = conn.cursor()
            cursor.execute("INSERT INTO Categoria (nome , descricao) VALUES (% , %)", (nome, descricao))
            conn.commit()
    except Exception as e :    
            return{"status" : "sucesso" , "mensagem": str(e)}
    finally:    
         conn.close()
          

    def listar_categorias():
        try:
            conn = conectar()
            cursor = conn.cursor(dictionary=true)
            cursor.execute("SELET*FROM Categoria") 
            categorias = cursor.fetchall()
        except Exception as e:
            return("status":"erro","mensagem":str(e))    
            conn.close()
 

        def atualiza_categoria(id_categoria, novo_nome, nova_descricao):
        try:    
            conn = conectar() 
            cursor = conn.cursor()
            cursor.execute("UPDATE Categoria SET nome=%s, descricao=%s WHERE id=%s",
                        (novo_nome, nova_descricao, id_categoria) )
        conn.commit()
        if conn.rowcount == 0:
            return{"status":"aviso","mensagem":"Nenhum categoria encontrada para atualizar ."}
         return{"status":"sucesso","mensagem":"Categoria atualizada!"}
        except Exeption as e:
            return{"status":"erro","mensagem":str(e)}
        finally:                  
             conn.close()

        def deletar_categoria(id_categoria):
            conn = conectar()
            cursor = conn.cursor()
            cursor.execute("DELETE FROM Categoria WHERE id=%s", (id_categoria) )  
            conn.commit()
            comm.close()
            print("Categoria excluida")
    