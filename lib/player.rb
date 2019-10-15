class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end 

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end 

    def gets_damage(damage)
        if damage >= @life_points
            @life_points = 0
            puts "#{@name} est mort(e) --- RIP :-( "
        else 
            @life_points -= damage
        end
    end 

    def compute_damage
        return rand(1..6)
    end

    def attacks(player)
        puts "\n#{@name} attaque #{player.name} :"
        if player.life_points == 0 
            puts "#{player.name} est déjà mort, pas la peine de s'acharner !"
        else 
            damage = compute_damage
            puts "#{player.name} se voit infliger #{damage} points de dommages"
            player.gets_damage(damage)
        end 
    end       

end 

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @weapon_level = 1
    
        super(name)
        @life_points = 100  
    end
      
    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end   

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_level}"
        if new_level > @weapon_level
            puts "Enorme ! l'arme que tu viens de trouver est meilleure que ton arme actuelle, on la garde !"
            @weapon_level = new_level
        else 
            puts "Un peu de la merde cette arme ... ça va pas beaucoup nous aider"
        end 
    end 

    def search_health_pack 
        puts "Partons à la recherche d'un pack de points de vie !"
        dice = rand(1..6)
        if dice == 1
            puts "Tu n'as rien trouvé... tiens le coup !"
        elsif dice < 6
            puts "Bravo ! tu as trouvé un pack de +5O points de vie !" 
            @life_points = [100, @life_points + 50].min
            puts "Voilà ton nouvel état : "
            show_state
        else 
            puts "Bravo ! tu as trouvé un pack de +8O points de vie !" 
            @life_points = [100, @life_points + 80].min
            puts "Voilà ton nouvel état : "
            show_state
        end 
    end 

end 