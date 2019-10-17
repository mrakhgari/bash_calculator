#!/bin/bash

# a script for calculate sum and sub and multy and dividion.
# $@ returns all of args
# shift n remove n of args from first

# created by _MuhmdrezA

# Functions 

usage(){
	echo "this script is a simple calcultor that calc sum(s), sub(S), multyply(m) and divid (d)"
	echo "for sum return sum of all args"
	echo "for sub holds the first input and subtracs the other inputs from it"
	echo "for multply return multiply all of args"
	echo "for devide return args[1]/args[2]"
}

display(){ # show message.
	first=$1
	shift 1
	echo "$first is $@"
}

sum(){ # shows the sum of args.
	local sum=0
	for i do
		sum=$((sum+$i))
	done
	display "sum" $sum
}

sub(){ # Holds the first input and subtracts the other inputs from it
	local first=$1
	shift 1
	for i do
		first=$((first -i))
	done
	display "sub" $first	 
}

multply(){ # shows the result the multiplication of inputs
	local res=1
	for i do 
		res=$((res*i))
	done
	display "multply" $res
}

divide(){ # divides the first input into the second input
	display "divid" $(($1/$2))
}


############################################################################################

# handler of args

# check for --help
if [ $# -gt 0 ] && [ $1 == "--help" ] ; then
	usage
	exit 1
fi

# check size
if [ $# -lt 3 ]; then 
	echo "args is invalid, lentgh is lower than 3";exit 1
fi

re='^[0-9]+$' # check command enterd.
if  [[ $1 =~ $re ]] ; then
   echo "enter command " >&2; exit 1
fi


com=$1
shift 1 #remove command

#for i; do
#	if [ $i == "s" ] ; then
#		$cansum="true"
#	elif [ $i == "S" ];then 
#		cansub="true"
#	elif [ $i == "m" ]; then
#		canmol="true"
#	elif [ $i == "d" ]; then 
#		candiv="true"
#	elif [[ $i =~ $re ]]; then
#		break
#	else 
#		usage
#		exit 1
#	fi
#done

#while getopts "$com" opt; do 
#	case $opt in
#		s) echo :1 ;sum $@;;
#		S) echo :2 ;sub $@ ;;
#		m) echo :3 ;multply $@;;
#		d) echo :4 ;divide $@;;
#	esac
#done
#echo $cansum is 
#if [ $cansum == "true" ]; then
#	sub $@
#fi
case $com in
	s) sum $@;;
	S) sub $@;;
	m) multply $@;;
	d) divide $@;;
	*) usage ; exit 1;;
esac
