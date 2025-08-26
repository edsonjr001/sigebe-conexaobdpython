from db_config import innit_app, db
from models import Aluno

app = innit_app()

with app.app_context():
    #Criar um aluno de teste
    alumo = Aluno(nome="João da Silva", email= "joao@email.com", senha="123456", serie="7° Ano")
    db.session.add(aluno)
    db.session.commit()

    #Buscar alunos
    alunos = Aluno.query.all()
    print("Alunos cadastrados:", [a.nome for a in alunos])
