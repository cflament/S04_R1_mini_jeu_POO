require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def welcome
    puts "\n"
    message_1 = " Bienvenue sur ILS VEULENT TOUS MA POO "
    message_2 = " Essaie de rester en vie et d'éliminer tous tes adversaires  "
    l = [message_1.length,message_2.length].max
    line = " " + "-" * l
    puts line
    puts "|" + " "*((l - message_1.length )/2) + message_1 + " "*((l - message_1.length )/2) + "|"
    puts "|" + " "*((l - message_2.length )/2) + message_2 + " "*((l - message_2.length )/2) + "|"
    puts line 
end

def user_player_name
    puts "Quel sera ton nom de player ?"
    name = gets.chomp.to_s
    return name
end 

def new_round(x)
    line = "-" * 100
    puts line
    puts "GO pour le round #{x}"
    puts line
end 

def play
    #afficher l'en-tête
    welcome
    #donner un nom au joueur humain
    name = user_player_name
    #créer ma nouvelle partie
    my_game = Game.new(name)
    count = 0 
    #on lance la boucle de toutes les parties
    while my_game.is_still_ongoing?
        count += 1 
        line = "\n" + "-" * 100 + "\n"
        #afficher un en-tête de partie
        new_round(count)
        #ajouter des adversaires
        my_game.new_players_in_sight
        #afficher le statut des joueurs
        puts "\n#{my_game.show_players}"
        puts line
        gets.chomp
        #faire jouer le human player
        my_game.menu_choice(my_game.menu)
        puts line 
        #faire riposter l'ennemi
        if my_game.enemies_in_sight.length != 0
            puts "\nATTENTION !! Les ennemis lancent une attaque : "
            gets.chomp
            my_game.enemies_attack
        end 
        gets.chomp
    end 
    my_game.end
end 

play 



