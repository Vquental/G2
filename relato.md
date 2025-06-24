


RELATÓRIO DO PROJETO DE ESTRUTURA DESCRETA
Projeto Prático de Programação Lógica: "Meu Filme Ideal" 



Lista dos integrantes do grupo:

1-Bruno José Francisco 
2- Filismino Pinhão Viana Jorge 
3- Jório da Rosa 
4- Valdemiro dos Santos Quental



Grupo nº 3





Luanda,2025
Sistema de Recomendação de Filmes

Introdução

Este projeto foi desenvolvido como parte de uma atividade do Grupo 3, com o objetivo de criar um sistema de recomendação de filmes utilizando a linguagem de programação Prolog. A proposta consiste em recomendar filmes com base nas preferências de cada utilizador, levando em consideração o gênero, diretores e atores favoritos, além da idade e do histórico de filmes já assistidos.

Objetivo

Construir uma base de conhecimento capaz de sugerir filmes personalizados para cada utilizador, respeitando critérios como a classificação etária e o nível de similaridade entre os gostos do utilizador e as características dos filmes.

Estrutura do Projeto

O projeto é composto por três partes principais:

1. Base de Conhecimento de Filmes  
   A base contém informações detalhadas sobre diversos filmes africanos, incluindo:
   - Título
   - Gêneros
   - Ano
   - Diretor
   - Atores principais
   - Avaliação (de 1 a 10)
   - Classificação etária

2. Dados dos Utilizadores 
   Cada utilizador possui um perfil que inclui:
   - Nome
   - Idade
   - Gêneros favoritos
   - Diretores e atores favoritos
   - Lista de filmes já assistidos

3. Sistema de Recomendação
   O sistema usa regras lógicas para recomendar filmes, considerando:
   - Se o utilizador tem idade suficiente para assistir ao filme
   - Se o filme tem uma nota mínima de qualidade (>= 7)
   - Se o filme ainda não foi assistido
   - Se o filme tem pelo menos dois elementos que combinam com os gostos do utilizador (gênero, diretor ou ator)

Funcionamento

Para testar o sistema, basta fazer uma consulta como esta:
prolog
?- recomendar_todos('Zainab', Filmes).








Consultas possíveis na Base de Dados

1. Consultar um único filme recomendado
Essa consulta retorna um filme de cada vez para o utilizador:
prolog
?- recomendar_filme('Zainab', Filme).
2. Listar todos os filmes recomendados para alguém
Usa o predicado recomendar_todos:
prolog
?- recomendar_todos('Zainab', Lista).
Resultado esperado:
prolog
Lista = ['Matrix', 'Pantera Negra', 'Vingadores: Ultimato'].
🧪 3. Testar partes isoladas da base
prolog
?- utilizador('Zainab', Idade, Generos, Diretores, Atores, Historico).

prolog
?- filme('Inception', G, Ano, D, Atores, Nota, Censura).
4. Consultas alternativas com findall
prolog
?- findall(F, recomendar_filme('Zainab', F), Resultado).
Mesmo efeito do recomendar_todos, mas útil quando estiver testando regras novas.
5. Explorar outras perguntas lógicas
Quer saber todos os filmes dirigidos por Christopher Nolan?
prolog
?- filme(Titulo, _, _, 'Christopher Nolan', _, _, _).
Ou todos os filmes que Leonardo DiCaprio participou?
prolog
?- filme(Titulo, _, _, _, Atores, _, _), member('Leonardo DiCaprio', Atores).
 6. Testar regras novas ou versões alternativas
Se você criar, por exemplo, uma regra chamada recomendar_flexivel/2, pode testá-la com:
prolog
?- recomendar_flexivel('Zainab', Filme).

O sistema retornará uma lista de filmes recomendados com base no perfil da utilizadora "Zainab".
Exemplos de Regras
Algumas das regras definidas no código incluem:
•	idade_ok/2: Verifica se o utilizador tem idade suficiente.
•	criterio_genero/2, criterio_diretor/2, criterio_ator/2: Verificam se o filme combina com os gostos.
•	recomendar_filme/2: Regra principal para verificar se um filme deve ser recomendado.
•	recomendar_todos/2: Lista todos os filmes recomendados para um determinado utilizador.









Conclusão
O projeto mostrou como a lógica declarativa do Prolog pode ser utilizada para resolver problemas de recomendação com critérios múltiplos. A estrutura baseada em fatos e regras permitiu desenvolver um sistema simples, mas eficaz, capaz de oferecer sugestões personalizadas.
Além do aprendizado técnico com Prolog, o projeto também reforçou a importância de representar bem os dados e pensar nas regras de forma lógica e coerente.
