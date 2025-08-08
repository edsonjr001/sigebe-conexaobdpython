def main(): 
    from db_config import conectar
    from crud import categoria
    conexao = conectar()
    if conexao:
        try:
            cursor = conexao.cursor() 
            cursor.execuce("SELECT * FROM livros;") #Exemplo de consulta simples
            
            resultados = cursor. fetclhall()

            print("\nLivros cadastrados:")
            for linha in resultados:
                print(linha)

        except Exception as e:
            print(f"Erro na execução: {e}")
        finally:
            conexao.close()
            print("\nConexão encerrada.")

if __name__=="__main__":
    main()                    

def menu():
    while True:
        print("\n== MENU SGB ===")
        print("1. Criar Categoria")
        print("2. Listar Categorias")
        print("3. Atualizar Categoria")
        print("4. Deletar Categoria")
        print("0. Sair")
        opcao = input("Escolha uma opção: ")

        if opcao == "1":
            none = input("Nome da categoria: ")
            descricao = input ("Descrição: ")
            categoria.criar_categoria()