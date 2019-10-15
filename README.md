Hello correcteur, bienvenu dans mon repo !

Normalement tout fonctionne, tu n'as plus qu'à faire mumuse :)
/!\ Attention : je travaille avec ruby 2.6.3, donc si tu n'es pas sur le même, il faut juste modifier mon Gemfile avec la version de ruby que tu utilises

les programmes : 

app.rb : 
    Ce programme simule un combat à mort entre José et Josiane
    En l'exécutant, tu verras apparaître les différentes parties, un recap de qui en est où et des attques lancées et subies, jusqu'à ce que l'un des deux meurt

app_2.rb : 
    Ce programme simule un combat d'un joueur humain, que l'utilisateur peut nommer et va piloter, contre deux bots (on retrouve les fameux José et Josiane)

    A chaque tour, le programme demande à l'utilisateur de choisir entre :
    - changer d'arme
    - remonter ses points de vie
    - attaquer José ou Josiane
    Après chaque action du joueur les ennemis encore en vie ripostent


    Le jeu continue jusqu'à ce que soit les deux ennemis soient vaincus, soit le joueur humain soit vaincu, mais il y a peu de chances... ce dernier part quand même avec 10 fois plus de points de vie !

app_3.rb : 
    Ce programme est bien plus amusant et intéractif, il fait s'affronter un joueur humain, toujours nommé par l'utilisateur contre un nombre d'ennemis que l'utilisateur peut choisir en début de partie (pour toi correcteur... je te conseille d'entrer plutôt 2 ou 3 histoire de pas y passer la journée, tu peux aussi essayer "brigitte" ou 120000, tu verras bien ce que ça fait ;) ).

    Chaque partie se déroule comme suit : 
    - le programme demande à l'utilisateur de nommer son joueur
    - le programme demande à l'utilisateur de choisir combien d'ennemis il veut affronter
    _ le programme lance des rounds de combat, et à chaque round :
        - le programme simule l'arrivée "en vue" d'ennemis (0, 1 ou 2)
        - le programme fait un recap de l'état de tous les joueurs
        - le programme demande au joueur humain ce qu'il souhaite faire et l'execute
        - le programme lance une contre-attaque de tous les ennemis en vue
        - Tant que tous les ennemis ne sont pas tous morts ou que le joueur principal n'est pas mort, on passe au round suivant.


