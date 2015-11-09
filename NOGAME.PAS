program numberGame;

uses crt;

var number,computer,test,playerChoice:integer;
input:string;
playerLost,hardMode:boolean;

begin

    clrscr;
    TextColor(White);
    
    writeln('Welcome, would you like to play on hard mode?');
    writeln('Hard mode makes the computer more inteligent with its selections.');
    writeln('Type "yes" or to enable or any key to continue in easy mode...');
    writeln;
    readln(input);
    writeln;
    if input = 'yes' then
    begin
        hardMode := true;
        writeln('Hard mode enabled!');
        writeln;
    end;
    
    writeln('Welcome! Choose a number between 20 and 30 to start...');
    writeln;
    
    repeat
        readln(input);
        test := 0;
        number := 0;
        val(input, number, test); {If non integer, test returns '1' to detect invalid input.}
        if (number > 30) xor (number < 20) then
        begin
             writeln;
             writeln('Invalid value! Try again...');
        end;
        writeln;
     until (number in [20..30]) and (test = 0); {Stops iterating when an integer value between 20 and 30 is detected.}
     
     writeln('Your starting number: ', number);
     writeln;
     writeln('Press any key for next move...');
     writeln;
     readln;
     
     repeat
        clrscr;
        writeln('Enter a number between 1 and 3 to take off the number...');
        writeln;
        readln(playerChoice);
        
        number := number - playerChoice;
        
        if number <= 0 then
        begin
            playerLost := true;
            break;
        end;
        
        writeln;
        writeln('You removed: ', playerChoice);
        writeln;
        writeln('Current value: ', number);
        writeln;
        writeln('Press any key for next move...');
        writeln;
        readln;
        
        clrscr;
        
        Randomize;
        
        computer := Random(3) + 1;
        
        number := number - computer;
        
        writeln('Computer removed: ', computer);
        writeln;
        writeln('Current value: ', number);
        writeln;
        writeln('Press any key for next move...');
        writeln;
        readln;
    until (number <= 0);
    
    if playerLost = true then
    begin
        writeln;
        writeln('Sorry you lost!');
    end
    else
        writeln('You won!');

    readln;
end.