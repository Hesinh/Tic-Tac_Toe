class Game
  @@grid = [[".", ".", "."],[".", ".", "."],[".", ".", "."]]
  @@counter = 0
  @@turn = 0

  def initialize(form)
    @form = form.upcase
  end

  private
  def printer
    @@grid.each_with_index do |row, i|
      print "\t"
    print row.join("\t")
    puts
    end
  end

  private
  def check_condition
    #This is to kept the vertical lines
    if @@grid[0] == [@form, @form, @form] || @@grid[1] == [@form, @form, @form] || @@grid[2] == [@form, @form, @form] || 
      #This is to kept the vertical lines
      @@grid[0][0] == @form && @@grid[1][0] == @form && @@grid[2][0] == @form ||
      @@grid[0][1] == @form && @@grid[1][1] == @form && @@grid[2][1] == @form ||
      @@grid[0][2] == @form && @@grid[1][2] == @form && @@grid[2][2] == @form ||
      #This is for diagonal lines
      @@grid[0][0] == @form && @@grid[1][1] == @form && @@grid[2][2] == @form ||
      @@grid[0][2] == @form && @@grid[1][1] == @form && @@grid[2][0] == @form
      
      puts "you re winner trophy.jpg"
      @@counter += 1
    elsif @@grid[0] == [@form2, @form2, @form2] || @@grid[1] == [@form2, @form2, @form2] || @@grid[2] == [@form2, @form2, @form2] || 
      #This is to kept the vertical lines
      @@grid[0][0] == @form2 && @@grid[1][0] == @form2 && @@grid[2][0] == @form2 ||
      @@grid[0][1] == @form2 && @@grid[1][1] == @form2 && @@grid[2][1] == @form2 ||
      @@grid[0][2] == @form2 && @@grid[1][2] == @form2 && @@grid[2][2] == @form2 ||
      #This is for diagonal lines
      @@grid[0][0] == @form2 && @@grid[1][1] == @form2 && @@grid[2][2] == @form2 ||
      @@grid[0][2] == @form2 && @@grid[1][1] == @form2 && @@grid[2][0] == @form2
      puts "You lose"
      @@counter += 1
    elsif @@turn == 9
      puts "DRAW , nobody wins"
      @@counter += 1
    end
  end
  
  private
  def modifier
    puts "put a number for the column index"
    num1 = gets
    while num1.to_i >= 3
      puts "please, select a number , but nothing greater than 2"
      num1 = gets
    end
    puts "put a number for the row index"
    num2 = gets
    while num2.to_i >= 3
      puts "please, select a number , but nothing greater than 2"
      num2 = gets
    end
    @@grid[num1.to_i][num2.to_i]= @form
    printer
    @@turn +=1
  end
  
  private
  def computer
    @form2
    if @form == "X"
      @form2 = "O"
    elsif @form == "O"
      @form2 = "X"
    end
    number = 0
    while number < 1
      num1 = rand(3)
      num2 = rand(3)
      if @@grid[num1][num2] != @form
        if @@grid[num1][num2] != @form2
          @@grid[num1][num2]=@form2
          puts "CPU IS MOVING AT #{num1} AND #{num2}"
          number += 1
          @@turn +=1
        end
      end
    end
    printer
  end

  public
  def game
    puts "your form is #{@form}"
    while @@counter < 1
      puts "TURN:#{@@turn}"
      modifier
      check_condition
      
      if @@counter < 1
        puts "TURN:#{@@turn}"
        computer
        check_condition
      end
    end
  end
end
holder = Game.new("x")
holder.game
