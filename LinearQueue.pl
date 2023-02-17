$MAX = int 10;
$front = int -1;
$rear = int -1;
@queue = int ();

sub queueFull{
    $temp = int ($rear + 1) % $MAX;
    if($temp eq $front || $rear eq 9 && $front eq -1){
        return true;
    }
    else{
        return false;
    }
}

sub queueEmpty{
    if($front eq $rear){
        return true
    }
    else{
        return false
    }
}

sub add{
    $value = int shift;
    if(queueFull() eq true){
        return false;
    }
    else{
        $rear = ($rear + 1) % $MAX;
        $queue[$rear] = $value;
        return true
    }
}

sub del{
    if(queueEmpty() eq true){
        return false;
    }
    else{
        $front = ($front + 1) % $MAX;
        return $queue[$front];
    }
}

sub see{
    print "queue : [ ";
    for($i = $front+1 ; $i <= $rear; $i++){
        print "$queue[$i] ";
    }
    print "]\n";
    print "front: $front\nrear: $rear\n";
}

sub title{
    print "[   Perl Queue Handle   ]\n\n";
}

sub commandList{
    print "-------------------------\n";
    print "|     Commands List     |\n";
    print "-------------------------\n";
    print "---[1]-----[2]-----[3]---\n";
    print "|  pop  |  del  |  see  |\n";
    print "-------------------------\n";
}

sub commandInput{
    print "Please enter the command number.\n> ";
    while(true){
        chomp ($num = int <STDIN>);
        if($num > 0 && $num < 4){
        return $num;
        }
        else{
        print "The command number you entered does not exist, so please enter it again.\n> ";
        }
    }
}

sub valueInput{
    print "Enter a value to be inserted into the queue.\n> ";
    chomp ($value = int <STDIN>);
    return $value;
}

sub end{
    print "\n\n---------------------------------------------\n\n\n";
}

sub error{
    $error = shift;
    print "------------";
    for($i = 0 ; $i < length($error); $i++){
        print "-";
    }
    print "\n";
    
    print "| Error | $error |\n";
    
    print "------------";
    for($i = 0 ; $i < length($error); $i++){
        print "-";
    }
    print "\n";
}

sub main{
    while(true){
        title();
        commandList();
        $command = commandInput();
        if($command eq 1){
        $value = valueInput();
        if(add($value) eq true){
            print "Successfully inserted $value into the queue.\n";
        }
        else{
            error("Queue is Full.");
        }
        }
        elsif($command eq 2){
        $value = del();
        if($value ne false){
            print "Successfully deleted $value into the queue.\n";
        }
        else{
            error("Queue is Empty.");
        }
        }
        elsif($command eq 3){
        see();
        }
        end();
    }
}
main()