require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def welcome
    message_1 = " Bienvenue sur ILS VEULENT TOUS MA POO "
    message_2 = " Essaie de rester en vie et d'éliminer tous tes adversaires  "
    l = [message_1.length,message_2.length].max
    line = " " + "-" * l
    puts line
    puts "|" + " "*((l - message_1.length )/2) + message_1 + " "*((l - message_1.length )/2) + "|"
    puts "|" + " "*((l - message_2.length )/2) + message_2 + " "*((l - message_2.length )/2) + "|"
    puts line 
end 

def user_player
    puts "Quel sera ton nom de player ?"
    name = gets.chomp.to_s
    player = HumanPlayer.new(name)
    return player
    binding.pry
end 

def user_action_input(player1, player2)
    input = ""
    while !["a","s","0","1"].include?(input)
        puts "On joue ! quelle action souhaites-tu effectuer ?"
        puts "\n"
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"
        puts "\n"
        puts "Attaquer un joueur en vue :"
        print "0 - "
        player1.show_state
        print "1 - "
        player2.show_state
        input = gets.chomp.to_s 
    end 
    return input
end 

def user_action(player, player1, player2, user_action)
    if user_action == "a"
        player.search_weapon
    elsif user_action == "s"
        player.search_health_pack
    elsif user_action == "0"
        player.attacks(player1)
    else
        player.attacks(player2)
    end 
end

def enemies_attack(player, enemies)
    enemies.each do |bot|
        if bot.life_points == 0
            puts "#{bot.name} est mort(e) et ne peut donc plus attaquer."
        else 
            bot.attacks(player)
        end
    end
end 

def fight_until_death(enemies)
    player1 = enemies[0]
    player2 = enemies[1]
    welcome
    player = user_player    
    count = 0
    #boucle d'enchaînement des parties
    while player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
        count += 1 
        #afficher un en-tête de partie
        line = "-" * 70
        puts line
        puts "GO pour la partie #{count}"
        puts line
        puts player.show_state
        #Tour du joueur : effectuer ce qu'il souhaite
        user_action(player, player1, player2, user_action_input(player1, player2))  
        #Tour des ennemis : ils attaquent s'ils ne sont pas morts
        gets.chomp
        #les ennemis ne peuvent attaquer que si au moins un tient encore debout
        if (player1.life_points > 0 || player2.life_points > 0)          
            puts "\nATTENTION !! Les ennemis lancent une attaque : "
            enemies_attack(player, enemies)
        end 
        puts "Fin du round"
        gets.chomp
    end 
    #annoncer le résultat de la fin du jeu
    puts line
    if player.life_points > 0 
        puts "BRAVO !!!! TU AS GAGNE EN #{count} ROUNDS"
    else 
        puts "LOSER !!!! TU AS PERDU"
    end 
end 

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1,player2]
fight_until_death(enemies)
