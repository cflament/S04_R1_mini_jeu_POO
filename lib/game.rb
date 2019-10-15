require 'pry'

class Game
    #require_relative 'player'
    attr_accessor :human_player, :players_left, :enemies_in_sight

    def initialize(name)
        @players_left = 10
        @enemies_in_sight = []
        @human_player = HumanPlayer.new(name)
    end  

    def kill_player(player)
        @enemies_in_sight.delete(player)
        @players_left -= 1
    end 
    
    def is_still_ongoing?
        (@human_player.life_points > 0 && @players_left > 0)
    end 

    def new_players_in_sight
        puts "\nCA BOUGE DANS LE CAMP ENNEMI"
        if @enemies_in_sight.length == @players_left
            puts "Tous les ennemis sont déjà en vue."
        else 
            karma = rand(1..6)
            if karma == 1
                puts "Tu as de la chance, aucun nouvel ennemi en vue."
            elsif karma < 5
                i = @enemies_in_sight.length
                @enemies_in_sight << Player.new("NouveauGugus#{i}") 
                puts "Mauvaise Nouvelle... le camp adverse se renforce : #{@enemies_in_sight[-1].name} a rejoint l'ennemi"
            else
                i = @enemies_in_sight.length
                @enemies_in_sight << Player.new("NouveauGugus#{i}")
                @enemies_in_sight << Player.new("NouveauGugus#{i+1}")
                puts "Catastrophe ! ils arrivent !! #{@enemies_in_sight[-1].name} et #{@enemies_in_sight[-2].name} ont rejoint l'ennemi"
            end
        end 
    end  

    def show_players
        puts "\nRECAP DE l'ETAT DE LA PARTIE"
        print "Etat de #{@human_player.name} : "
        puts @human_player.show_state
        print "nombre de joueur(s) bot(s) en vue restant(s) : "
        puts "#{@enemies_in_sight.length}"
        print "nombre total de joueur(s) restant(s) : "
        puts "#{players_left}"
    end 

    def menu
        input = ""
        #l'input de l'utilisateur devra être l'une des valeurs de ce tableau:
        validation = ["a","s"] + [*0..@enemies_in_sight.length - 1].map {|x| x.to_s}
        #on boucle jusqu'à ce que l'input de l'utilisateur matche
        while !validation.include?(input)
            puts "On joue ! quelle action souhaites-tu effectuer ?"
            puts "\n"
            puts "a - chercher une meilleure arme"
            puts "s - chercher à se soigner"
            puts "\n"
            puts "Attaquer un joueur en vue :"
            @enemies_in_sight.each do |bot|
                print "#{@enemies_in_sight.index(bot)} - "
                bot.show_state
            end 
            input = gets.chomp
            #on envoie un message tendre pour réorienter l'utilisateur s'il entre un input qui ne matche pas
            if !validation.include?(input)
                puts "Hum, hum, fais pas ton malin avec ton <<#{input}>>, ça ne mènera nulle part"
                puts "Entre juste quelque chose de valide stp : a, s ou un chiffre entre 0 et #{@enemies.length - 1}"
                puts "Allez presse une touche pour retenter !"
                puts "\n"
            end 
        end 
        return input
    end

    def menu_choice(user_choice)
        if user_choice == "a"
            @human_player.search_weapon
        elsif user_choice == "s"
            @human_player.search_health_pack
        else 
            i = user_choice.to_i
            @human_player.attacks(@enemies_in_sight[i])
            if @enemies_in_sight[i].life_points == 0
                puts "Votre ennemi #{@enemies_in_sight[i].name} est KO, plus que #{@players_left - 1} !"
                kill_player(@enemies_in_sight[i])
            end 
        end 
    end 

    def enemies_attack
        @enemies_in_sight.each do |bot|
            bot.attacks(@human_player)
        end 
    end 

    def end 
        line = "-" * 100
        puts line 
        if @human_player.life_points > 0 
            puts "BRAVO !!!! TU AS GAGNE"
        else 
            puts "LOSER !!!! TU AS PERDU"
        end 
    end 

end 

