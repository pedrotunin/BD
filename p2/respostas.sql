Respostas da Prova 2
Nome do(a) aluno(a): Pedro de Souza Tunin
RA: 11201811959

1 
select Titulo, NomeEditora from livro group by Titulo, NomeEditora;

2
select Nome, Fone from usuario group by Nome, Fone;

3
select NomeAutor, Titulo from AUTORES_LIVRO A join LIVRO L on (A.IdLivro = L.IdLivro) group by NomeAutor, Titulo;

4
select Nome from usuario u1 where Nome not in (
	select Nome from usuario u2 join livros_emprestados le on (u2.NoCartao = le.NoCartao)
);

5
select fb.IdFilial, NomeFilial, COUNT(*) as qtd_livros 
from filial_biblioteca fb, livros_emprestados le where fb.IdFilial = le.IdFilial
group by fb.IdFilial, NomeFilial;

6
select Nome, Endereco, count(*) as qtd_livros
from usuario u, livros_emprestados le where u.NoCartao = le.NoCartao
group by Nome, Endereco
having count(*) > 5;

7
select Nome, Endereco from (
	select r2.NoCartao from (
		select NoCartao, count(le.IdLivro) as cont from (
			select distinct l.IdLivro from livro l join autores_livro al on (l.IdLivro = al.IdLivro)
			where al.NomeAutor = 'Paulo Coelho'
		) r1 join livros_emprestados le on (r1.IdLivro = le.IdLivro) group by le.NoCartao 
	) r2 join (select count(distinct l.IdLivro) as cont from livro l join autores_livro al on (l.IdLivro = al.IdLivro) where al.NomeAutor = 'Paulo Coelho') r3 on (r2.cont = r3.cont)
) r4 join usuario u on (r4.NoCartao = u.NoCartao);

8
select al.NomeAutor, l.Titulo, cl.No_De_Copias from livro l, autores_livro al, copias_livro cl, filial_biblioteca fb
where (al.NomeAutor = 'Stephen King' and al.IdLivro = l.IdLivro and l.IdLivro = cl.IdLivro and cl.IdFilial = fb.IdFilial and fb.NomeFilial = 'Santo André');

9
select t1.No_De_Copias from
(select IdLivro, No_De_Copias as no_de_copias from copias_livro cl join filial_biblioteca fb on (cl.IdFilial = fb.IdFilial)
where NomeFilial = 'São Bernardo do Campo') t1 join livro t2 on (t1.IdLivro = t2.IdLivro) where t2.Titulo = 'Sistemas de Bancos de Dados';

10
select r2.Titulo, Nome, Endereco from (
	select Titulo, r1.NoCartao from (
		select IdLivro, NoCartao from livros_emprestados le join filial_biblioteca fb on (le.IdFilial = fb.IdFilial) 
		where NomeFilial = 'São Bernardo do Campo' and DataDevolucao = '30/10/2019'
	) r1 join livro l on (r1.IdLivro = l.IdLivro)
) r2 join usuario u2 on (r2.NoCartao = u2.NoCartao);

11
select e.Nome, e.Endereco from editora e, livros_emprestados le, usuario u, livro l
where (l.NomeEditora = e.Nome and u.Nome = 'Joaquim Antonio Barbosa' and le.IdLivro = l.IdLivro and le.NoCartao = u.NoCartao);