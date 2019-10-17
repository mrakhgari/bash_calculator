#!/bin/bash

# a script for calculate sum and sub and multy and dividion.
# $@ returns all of args
# shift n remove n of args from first

# created by _MuhmdrezA

# Functions 


display(){ # show message.
	first=$1
	shift 1
	echo "$first is $@"
}

sum(){ # shows the sum of args.
	sum=0
	for i do
		sum=$((sum+$i))
	done
	display "sum" $sum
}

sub(){ # Holds the first input and subtracts the other inputs from it
	first=$1
	shift 1
	for i do
		first=$((first -i))
	done
	display "sub" $first	 
}

multply(){ # shows the result the multiplication of inputs
	res=1
	for i do 
		res=$((res*i))
	done
	display "multply" $res
}

divide(){ # divides the first input into the second input
	display "divid" $(($1/$2))
}

# handler of args

re='^[0-9]+$'
if  [[ $1 =~ $re ]] ; then
   echo "enter command " >&2; exit 1
fi

shift 1
echo $@
sub $@
sum  $@
multply $@
divide $@ 

