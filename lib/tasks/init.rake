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
    Game.delete_all
    @game = Game.create(:title => "Typing Passage",:description => "This is a unique typing game roughly based on our Typing Tutor. The idea is that you have to work your way through 26 levels, each representing the introduction of a new key. ")
    @game = Game.create(:title => "Typing Trek",:description => "In this typing game, you will be using the keyboard to navigate around the grid and collect the targets. The grid is made up of a series of squares each of which contain a letter. ")
    @game = Game.create(:title => "Keyflex",:description => "The object of this game is to react as quickly as possible by pressing the appropriate key. You will see a visual representation of the keyboard on your screen, and one by one, keys will light up. ")
    @game = Game.create(:title => "Keyboard Simon",:description => "If you have ever played the classic memory game called ‘Simon’, this typing game should be very familiar to you. The object is to remember a sequence of keystrokes and then reproduce them when the time")
    @game = Game.create(:title => "Typing Zone",:description => "This typing game rewards you more for accuracy than speed. The goal, aside from correctly typing the words, is to avoid typos and thereby build long streaks of correct keystrokes")
    @game = Game.create(:title => "Type Down",:description => "The object of this game is to prevent the rising column of words from reaching the top. In order to do so, you need to type the words as fast as you can. ")
    @game = Game.create(:title => "Speed Typing",:description => "The object of this game is to type the 12 words in each round as quickly as possible, without making any typos. You will be presented with words one by one. Type them as they appear.")
    @game = Game.create(:title => "Key Block",:description => "In this game you need to prevent the letters from making contact with the block. One by one, letters will fly in from the sides, towards the block in the center of the game board and you need to try to prevent")
    @game = Game.create(:title => "Keyball",:description => "In Keyball, the game board is drawn up into squares that represent keys on your keyboard. Red balls and blue balls float around the board. In order to win, catch the blue balls and avoid the red balls! ")
    @game = Game.create(:title => "Keyboarding",:description => "The object of this game is to type the simple words provided using a reassigned keyboard layout. That is, the keyboard will not type as you are accustomed to, but rather will adhere to the rules as defined by the game.")
    @game = Game.create(:title => "Typo II",:description => "This typing game consists of a series of ‘sentences’ containing words and punctuation. As the sentences appear, you need to type them as quickly as you can")
    @game = Game.create(:title => "Falling Words",:description => "The object of this game is to type as fast as humanly possible. There are words falling from the top of the screen, and you need to try to type them before they hit the bottom.")
    @game = Game.create(:title => "Keypad Keyball",:description => "Use your typing skills and your reflexes to catch the balls as they bounce around the keypad.")
    @game = Game.create(:title => "Focal Points",:description => "Use your typing skills and your concentration to catch the targets are they pass over different numbers.")
    @game = Game.create(:title => "Typo",:description => "The goal is to type the text shown to you exactly as it appears. Any discrepancies between your keystrokes and the expected characters will be counted as typos.")
    #@game = Game.create(:title => "Typing Streak",:description => "Type the passage as long as you can without making a typo")
    #@game = Game.create(:title => "Whackey",:description => "React quickly and press the key before it disappears")






    OtherGame.delete_all
    @game = OtherGame.create(:title => "Typing Tidepool",:image_url => 'Typing-Tidepool.jpg',:description => "This combines a race game and a typing game. You are a dolphin swimming across the sea and you need to type words quickly to make your dolphin swim. There are lots of different difficulty levels and you can choose the one you want from the main menu screen. Feel free to skip the intro animation if you just want to get straight to playing the game.", :file_name => "Typing-Tidepool.swf")
    @game = OtherGame.create(:title => "SpaceWords",:image_url => 'SpaceWords.jpg',:description => "To play, type the word associated with an enemy ship to shoot it down. Use the keyboard to type the words and press ENTER or SHOOT. Use a super attack with any key from 1 to 4. Use a slow mode with any key from 5 to 9",:file_name => "SpaceWords.swf")
    @game = OtherGame.create(:title => "Keypad Kaos",:image_url => 'Keypad-Kaos.png',:description => "This typing game is not terribly exciting or very involved, but it is a good way to exercise your command of the keypad. The goal is to hit the appropriate key on the number pad when the target appears on the corresponding number. It definitely requires you to act pretty fast even from the onset so this may not be great game for you unless you already have reasonable command of the keypad.",:file_name => "keypad_kaos.swf")
    @game = OtherGame.create(:title => "Lightning Typing",:image_url => 'Lightning_Typing.jpg',:description => "The objective of the lightning typing game is to strike down the approaching mice with lightning by typing the words they are carrying along with them. If you take too long to type the word, the mice will reach your stack of blocks and destroy them, one by one. And since you are standing on this stack of blocks, well game over when the mice have smashed them all. So the faster you type, the better you will perform in this game.",:file_name => "Lightning_Typing.swf")
    @game = OtherGame.create(:title => "Alburn's Typing Attack",:image_url => 'Albarns-Typing-Attack.jpg',:description => "This is a very simple typing game in which you need to type a series of letters or words in order to keep an approaching troll away from you. Each keystroke you type will send a boomerang towards him",:file_name => "Albarns-Typing-Attack.swf")
    @game = OtherGame.create(:title => "Arrow Dance",:image_url => 'Arrow-Dance-Typing.jpg',:description => "This typing game focuses specifically on the arrow keys. It’s a relatively simple concept, but with nice graphics and sound, it is enjoyable to play even if a little repetitive at times. But definitely",:file_name => "Arrow-Dance-Typing-Game.swf")
    @game = OtherGame.create(:title => "Assault Typing",:image_url => 'Assault-Typing.png',:description => "This is a typing game mixed with a side-shooter genre.. Type whatever word that appear on enemy plane to shoot them down. You can press Left CapsLock and Left Shift to move between five vertical position",:file_name => "Assault-Typing-Game.swf")
    @game = OtherGame.create(:title => "Fast Typer",:image_url => 'Fast-Typer-Game.jpg',:description => "This is a very quick and straight-forward little typing exercise in which you have 30 seconds to try and type as many words as you can. At the end you get a report on how many words you typed and your typing accuracy. Nice graphics and sound make this a catchy little typing game.",:file_name => "Fast-Typing.swf")
    @game = OtherGame.create(:title => "Gyroshi",:image_url => 'Gyroshi-Typing-Game.png',:description => "Gyroshi is as much a musical experience as a typing game. Type the right letters at the right time (when they get in the circles). The game will look bland at first but it gets very intense when you’re",:file_name => "Gyroshi-Typing-Game.swf")
    @game = OtherGame.create(:title => "Key Master 3",:image_url => 'Key-Master-Game.png',:description => "This is probably one of the more fun typing games around, and serves an excellent example of how games can make typing practice enjoyable. The object is to fend off the invading hordes by typing the words",:file_name => "Key-Master-Game.swf")
    @game = OtherGame.create(:title => "Keyboard Action Hero",:image_url => 'Keyboard-Action-Hero.jpg',:description => "This typing games features ActionHero, the superhero made of magical cleaning fluid in a tube. The goal is to clean dirty keyboards while learning keyboard-character placement. Face three vicious enemies",:file_name => "keyboard_action_game.swf")
    @game = OtherGame.create(:title => "Keyboard Simon",:image_url => 'Keyboard-Simon.png',:description => "",:file_name => "Keyboard-Simon-Game.swf")
    @game = OtherGame.create(:title => "Letter Launch",:image_url => 'Letter-Launch.jpg',:description => "This latest typing game is very simple to learn and play but actually pretty fun. The goal is to launch all your letters from their place at the bottom of the screen to the top, while avoiding the obstacles",:file_name => "letter-type-game.swf")
    @game = OtherGame.create(:title => "Sunrise Typer",:image_url => 'Sunrise-Typer.jpg',:description => "This is a simple yet compelling typing game. Basically, the object is to make the sun rise. You start off at night time and each successful keystroke you type elevates the sun and brings you closer to",:file_name => "Sunrise-Typer-Game.swf")
    @game = OtherGame.create(:title => "Super Typing",:image_url => 'Super-Typing.jpg',:description => "This is yet another game in the class of Falling Words and TyperShark in which you need to type the falling words before they hit the ground. In this case, it has a target practice theme so you are essentially",:file_name => "Super-Typing-Game.swf")
    @game = OtherGame.create(:title => "Finger Frenzy",:image_url => 'Typing-Frenzy-Game.jpg',:description => "This is a very basic typing game – hardly even a game actually, more of an exercise – where you need to type the letters of the alphabet in order as fast as you can. That’s it. Compete",:file_name => "letter-type-game.swf")
    @game = OtherGame.create(:title => "Type Master",:image_url => 'Type-Master.jpg',:description => "This is a simple little typing game / wpm typing test. You have a series of 10 phrases you need to type as quickly as possible after which it gives you a score and your WPM typing speed. The game has",:file_name => "Type-Master-Game.swf")
    @game = OtherGame.create(:title => "Typeroids",:image_url => 'Typeroids.png',:description => "This is a simple yet fun typing game in which you need to destroy the drifting asteroids by typing the letters contained therein. The asteroids come at you in waves and break apart into smaller pieces",:file_name => "Typeroids-Game.swf")
    @game = OtherGame.create(:title => "Typing Defense",:image_url => 'Typing-Defense-Game.jpg',:description => "Yet another game in the genre of Falling Words and Typer Shark where you need to quickly type to eliminate the moving words. In this particular game, you are trying to defend planet earth from attack by",:file_name => "typing-defense.swf")

    @game = OtherGame.create(:title => "Farm Defender",:image_url => 'Farm-Defender.jpg',:description => "",:file_name => "Farm_Defender_Game.swf")
    @game = OtherGame.create(:title => "Spider Typer",:image_url => 'Spider_Typer.jpg',:description => "",:file_name => "Spider_Typer.swf")
    @game = OtherGame.create(:title => "Alpha Drop",:image_url => 'Alpha-Drop.jpg',:description => "",:file_name => "AlphaDrop_Game.swf")
    @game = OtherGame.create(:title => "Dino Kids Trash Typer",:image_url => 'Dino-Trash-Typer.jpg',:description => "",:file_name => "Dino_Kids_Typing.swf")
    @game = OtherGame.create(:title => "Keyman",:image_url => 'keyman.png',:description => "",:file_name => "keyman.swf")
    @game = OtherGame.create(:title => "Typing Tone",:image_url => 'Typing-Tone.png',:description => "",:file_name => "Typing_Tone.swf")







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