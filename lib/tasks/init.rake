namespace :init do

  task :games => :environment do
    Game.delete_all
    @game = Game.new(:title => "Lottery",:description => "Choose 5 numbers for your lottery ticket.  Score points depending on how many matches you make.", :expected_score => 1.033, :avg => 0, :plays=>0, :logo_url => "dummy.png")
    @game.save
    @game = Game.new(:title => "Next in Line",:description => "Wait until the perfect moment to take your place in line and get a score based on your position", :expected_score => 3, :avg => 0, :plays=>0, :logo_url => "spot-in-time.png")
    @game.save
    @game = Game.new(:title => "Card Flip",:description => "Choose 3 cards to flip over to reveal their point values (1-20).  Your score is the sum of the 3 cards.", :expected_score => 30, :avg => 0, :plays=>0, :logo_url => "card-flip.png")
    @game.save
    @game = Game.new(:title => "Press On",:description => "Press your luck on and on until you land on the wrong square.", :expected_score => 35, :avg => 0, :plays=>0, :logo_url => "dummy.png")
    @game.save
  end
  task :other_games => :environment do
    OtherGame.delete_all
    @game = OtherGame.create(:title => "Typing Tidepool",:description => "This combines a race game and a typing game. You are a dolphin swimming across the sea and you need to type words quickly to make your dolphin swim. There are lots of different difficulty levels and you can choose the one you want from the main menu screen. Feel free to skip the intro animation if you just want to get straight to playing the game.", :file_name => "Typing-Tidepool.swf")
    @game = OtherGame.create(:title => "SpaceWords",:description => "To play, type the word associated with an enemy ship to shoot it down. Use the keyboard to type the words and press ENTER or SHOOT. Use a super attack with any key from 1 to 4. Use a slow mode with any key from 5 to 9",:file_name => "SpaceWords.swf")
    @game = OtherGame.create(:title => "Keypad Kaos",:description => "This typing game is not terribly exciting or very involved, but it is a good way to exercise your command of the keypad. The goal is to hit the appropriate key on the number pad when the target appears on the corresponding number. It definitely requires you to act pretty fast even from the onset so this may not be great game for you unless you already have reasonable command of the keypad.",:file_name => "keypad_kaos.swf")
    @game = OtherGame.create(:title => "Lightning Typing",:description => "The objective of the lightning typing game is to strike down the approaching mice with lightning by typing the words they are carrying along with them. If you take too long to type the word, the mice will reach your stack of blocks and destroy them, one by one. And since you are standing on this stack of blocks, well game over when the mice have smashed them all. So the faster you type, the better you will perform in this game.",:file_name => "Lightning_Typing.swf")
    @game = OtherGame.create(:title => "Alburn's Typing Attack",:description => "This is a very simple typing game in which you need to type a series of letters or words in order to keep an approaching troll away from you. Each keystroke you type will send a boomerang towards him",:file_name => "Albarns-Typing-Attack.swf")
    @game = OtherGame.create(:title => "Arrow Dance",:description => "This typing game focuses specifically on the arrow keys. It’s a relatively simple concept, but with nice graphics and sound, it is enjoyable to play even if a little repetitive at times. But definitely",:file_name => "Arrow-Dance-Typing-Game.swf")
    @game = OtherGame.create(:title => "Assault Typing",:description => "This is a typing game mixed with a side-shooter genre.. Type whatever word that appear on enemy plane to shoot them down. You can press Left CapsLock and Left Shift to move between five vertical position",:file_name => "Assault-Typing-Game.swf")
    @game = OtherGame.create(:title => "Fast Typer",:description => "This is a very quick and straight-forward little typing exercise in which you have 30 seconds to try and type as many words as you can. At the end you get a report on how many words you typed and your typing accuracy. Nice graphics and sound make this a catchy little typing game.",:file_name => "Fast-Typing.swf")
    @game = OtherGame.create(:title => "Gyroshi",:description => "Gyroshi is as much a musical experience as a typing game. Type the right letters at the right time (when they get in the circles). The game will look bland at first but it gets very intense when you’re",:file_name => "Gyroshi-Typing-Game.swf")
    @game = OtherGame.create(:title => "Key Master 3",:description => "This is probably one of the more fun typing games around, and serves an excellent example of how games can make typing practice enjoyable. The object is to fend off the invading hordes by typing the words",:file_name => "Key-Master-Game.swf")
    @game = OtherGame.create(:title => "Keyboard Action Hero",:description => "This typing games features ActionHero, the superhero made of magical cleaning fluid in a tube. The goal is to clean dirty keyboards while learning keyboard-character placement. Face three vicious enemies",:file_name => "keyboard_action_game.swf")
    @game = OtherGame.create(:title => "",:description => "",:file_name => "Keyboard-Simon-Game.swf")
    @game = OtherGame.create(:title => "Letter Launch",:description => "This latest typing game is very simple to learn and play but actually pretty fun. The goal is to launch all your letters from their place at the bottom of the screen to the top, while avoiding the obstacles",:file_name => "letter-type-game.swf")
    @game = OtherGame.create(:title => "Sunrise Typer",:description => "This is a simple yet compelling typing game. Basically, the object is to make the sun rise. You start off at night time and each successful keystroke you type elevates the sun and brings you closer to",:file_name => "Sunrise-Typer-Game.swf")
    @game = OtherGame.create(:title => "Super Typing",:description => "This is yet another game in the class of Falling Words and TyperShark in which you need to type the falling words before they hit the ground. In this case, it has a target practice theme so you are essentially",:file_name => "Super-Typing-Game.swf")
    @game = OtherGame.create(:title => "Finger Frenzy",:description => "This is a very basic typing game – hardly even a game actually, more of an exercise – where you need to type the letters of the alphabet in order as fast as you can. That’s it. Compete",:file_name => "letter-type-game.swf")
    @game = OtherGame.create(:title => "Type Master",:description => "This is a simple little typing game / wpm typing test. You have a series of 10 phrases you need to type as quickly as possible after which it gives you a score and your WPM typing speed. The game has",:file_name => "Type-Master-Game.swf")
    @game = OtherGame.create(:title => "Typeroids",:description => "This is a simple yet fun typing game in which you need to destroy the drifting asteroids by typing the letters contained therein. The asteroids come at you in waves and break apart into smaller pieces",:file_name => "Typeroids-Game.swf")
    @game = OtherGame.create(:title => "Typing Defense",:description => "Yet another game in the genre of Falling Words and Typer Shark where you need to quickly type to eliminate the moving words. In this particular game, you are trying to defend planet earth from attack by",:file_name => "typing-defense.swf")

    @game = OtherGame.create(:title => "Farm Defender",:description => "",:file_name => "Farm_Defender_Game.swf")
    @game = OtherGame.create(:title => "Spider Typer",:description => "",:file_name => "Spider_Typer.swf")
    @game = OtherGame.create(:title => "Alpha Drop",:description => "",:file_name => "AlphaDrop_Game.swf")
    @game = OtherGame.create(:title => "Dino Kids Trash Typer",:description => "",:file_name => "Dino_Kids_Typing.swf")
    @game = OtherGame.create(:title => "Keyman",:description => "",:file_name => "keyman.swf")
    @game = OtherGame.create(:title => "Typing Tone",:description => "",:file_name => "Typing_Tone.swf")







    @game.save

  end

  task :set_friendly_ids => :environment do
    OtherGame.find_each(&:save)
    WpmTest.all.each do |tst|
      tst.slug = "wpm-test-#{tst.id}"
      tst.save
    end
  end
end