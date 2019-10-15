require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

def battle(player1,player2)
    puts "Voici l'état de chaque joueur : "
    player1.show_state
    player2.show_state
    puts "Passons à la phase d'attaque : "
    player1.attacks(player2)
    if player2.life_points > 0 
        puts "Attention, contre attaque !! "
        player2.attacks(player1)
    end 
end

def fight_until_death(player1,player2)
    count = 0
    while player1.life_points > 0 && player2.life_points > 0
        count += 1
        puts "\n C'est parti pour la partie #{count}"
        puts "--------------------------------------"
        battle(player2,player1)
    end 
    if player1.life_points == 0
        loser = player1.name
    else 
        loser = player2.name
    end 

    puts "\n Après #{count} combats, j'ai le regret de t'annoncer que #{loser} est mort."
end 

fight_until_death(player1,player2)
