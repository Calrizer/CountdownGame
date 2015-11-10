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
     write('Game start in 3,');
     Delay(1000);
     write(' 2, ');
     Delay(1000);
     write('1');
     writeln;
     Delay(1000);
     
     repeat
        clrscr;
        Randomize;
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
        write('Computers move in 3,');
        Delay(1000);
        write(' 2, ');
        Delay(1000);
        write('1');
        Delay(1000);
        
        clrscr;
        
        if hardMode =  true then
        begin
            case number of
                4: 
                begin
                    number := number - 3;
                    computer := 3;
                end;
                3:
                begin
                    number := number - 2;
                    computer :=  2;
                end;
                2:
                begin
                    number := number - 1;
                    computer := 1;
                end;
            else
            begin
                Randomize;
                computer := Random(3) + 1;
                number := number - computer;
            end;
            end;
        end
        else
        begin
            Randomize;
            computer := Random(3) + 1;
            number := number - computer;
        end;
        
        if number <= 0 then
        begin
            playerLost := false;
            break;
        end;
        
        writeln('Computer removed: ', computer);
        writeln;
        writeln('Current value: ', number);
        writeln;
        write('Your move in 3,');
        Delay(1000);
        write(' 2, ');
        Delay(1000);
        write('1');
        Delay(1000);

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
