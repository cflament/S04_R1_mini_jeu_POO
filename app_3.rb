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

def user_enemies_number
    nb = 0
    while nb <= 0 || nb > 1000 || nb.class != Integer
        puts "Alors dis moi, combien d'ennemis tu veux essayer de dégommer ?"
        nb = gets.chomp.to_i 
        if nb > 1000
            puts "Essaie de pas monter au dessus de 1000 ennemis, sinon une vie ne te suffira pas pour finir mon jeu..."
        end 
        if nb == 0
            puts "Ca te paraît plus simple quand il n'y a pas d'ennemis ? Allez crois en toi tu vas y arriver !"
        end 
        if nb < 0
            puts "Trop de THP... ton cerveau a dû griller... on ne peut pas avoir un nombre d'ennemis négatif, enfin !"
        end
    end 
    return nb 
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
    #demander à l'utilisateur combien d'ennemis il veut combattre
    nb = user_enemies_number
    #créer ma nouvelle partie
    my_game = Game.new(name, nb)
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
        #faire riposter l'ennemi si certains sont encore en vie
        if my_game.enemies_in_sight.length != 0
            puts line 
            puts "\nATTENTION !! Les ennemis lancent une attaque : "
            gets.chomp
            my_game.enemies_attack
        end 
        gets.chomp
    end 
    my_game.end
end 

play 



