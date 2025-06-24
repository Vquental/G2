% Projeto: Sistema de recomenda��o de filmes
% Grupo 3

% Base de conhecimento de filmes
% filme(T�tulo, G�neros, Ano, Diretor, Atores, Avalia��o de 1 a 10, Classifica��o et�ria)

filme('Lionheart', ['drama', 'familia'], 2018, 'Genevieve Nnaji', ['Genevieve Nnaji'], 8, 10).
filme('The Boy Who Harnessed the Wind', ['drama', 'biografia'], 2019, 'Chiwetel Ejiofor', ['Maxwell Simba'], 9, 12).
filme('Atlantics', ['romance', 'fantasia'], 2019, 'Mati Diop', ['Mame Bineta Sane'], 7, 14).
filme('Rafiki', ['drama', 'romance'], 2018, 'Wanuri Kahiu', ['Samantha Mugatsia'], 8, 16).
filme('Aya of Yop City', ['animacao', 'comedia'], 2013, 'Marguerite Abouet', ['Aïssa Maïga'], 7, 6).
filme('Timbuktu', ['drama'], 2014, 'Abderrahmane Sissako', ['Ibrahim Ahmed'], 9, 14).
filme('Tsotsi', ['drama', 'crime'], 2005, 'Gavin Hood', ['Presley Chweneyagae'], 8, 16).
filme('Hotel Rwanda', ['drama', 'historia'], 2004, 'Terry George', ['Don Cheadle'], 9, 16).
filme('Queen of Katwe', ['biografia', 'drama'], 2016, 'Mira Nair', ['Madina Nalwanga'], 8, 10).
filme('Yeelen', ['drama', 'fantasia'], 1987, 'Souleymane Cissé', ['Issiaka Kane'], 8, 12).
filme('Félicité', ['drama', 'musica'], 2017, 'Alain Gomis', ['Véro Tshanda Beya'], 7, 14).
filme('Abouna', ['drama', 'familia'], 2002, 'Mahamat-Saleh Haroun', ['Ahidjo Mahamat'], 7, 12).
filme('Nollywood Babylon', ['documentario'], 2008, 'Ben Addelman', ['diversos'], 7, 10).
filme('Night of Truth', ['guerra', 'drama'], 2004, 'Fanta Régina Nacro', ['Fanta Diabaté'], 8, 16).
filme('Mandabi', ['drama', 'satira'], 1968, 'Ousmane Sembène', ['Makhouredia Gueye'], 9, 10).


% Dados dos utilizadores
% utilizador(Nome, Idade, Generos favoritos, Diretores favoritos, Atores favoritos, Filmes ja assistidos)

utilizador('Kwame', 24, ['drama', 'historia'], ['Abderrahmane Sissako'], ['Don Cheadle'], ['Timbuktu']).
utilizador('Zainab', 19, ['biografia', 'drama'], ['Mira Nair'], ['Madina Nalwanga'], []).
utilizador('Thabo', 16, ['fantasia', 'animacao'], ['Souleymane Cissé'], ['Issiaka Kane'], []).
utilizador('Aminata', 21, ['romance', 'familia'], ['Wanuri Kahiu'], ['Samantha Mugatsia'], ['Rafiki']).
utilizador('Ifeanyi', 28, ['drama', 'crime'], ['Gavin Hood'], ['Presley Chweneyagae'], []).
utilizador('Fatou', 14, ['musica', 'drama'], ['Alain Gomis'], ['Véro Tshanda Beya'], []).


% Verifica se a idade do utilizador � suficiente para ver o filme
idade_ok(Idade, ClassEtaria) :-
    Idade >= ClassEtaria.

% Recomenda��o de filmes com base nas prefer�ncias do utilizador
criterio_genero(GenerosFavoritos, GenerosDoFilme) :-
    member(G, GenerosDoFilme),
    member(G, GenerosFavoritos).

criterio_diretor(DiretoresFavoritos, DiretorDoFilme) :-
    member(DiretorDoFilme, DiretoresFavoritos).

criterio_ator(AtoresFavoritos, AtoresDoFilme) :-
    member(A, AtoresDoFilme),
    member(A, AtoresFavoritos).

recomendar_filme(NomeUtilizador, Filme) :-
    utilizador(NomeUtilizador, Idade, GenFavoritos, DirFavoritos, AtrFavoritos, Historico),
    filme(Filme, GenFilme, _, Diretor, Atores, Nota, Censura),
    Nota >= 7,
    idade_ok(Idade, Censura),
    \+ member(Filme, Historico),

    % Pontua se bater pelo menos dois critérios: gênero, diretor, ator
    findall(1,
        (
            criterio_genero(GenFavoritos, GenFilme);
            criterio_diretor(DirFavoritos, Diretor);
            criterio_ator(AtrFavoritos, Atores)
        ),
        Pontos),
    length(Pontos, Total),
    Total >= 2.


% Lista todos os filmes recomendados para um utilizador
recomendar_todos(NomeUser, Recomendados) :-
    findall(Filme, recomendar_filme(NomeUser, Filme), Recomendados).



