:<<!
this 
is 
one 
test
!
echo "this is one test"
echo "\"this is one test\""
read name
echo "$name it is ready"
echo -e "ok\n"
echo "chang line test"
echo -e "ok\c"
echo "change line test again"
echo `date`
echo `time`
printf "%-10s,%-8s,%-4s\n" name sex height
printf "%-10s,%-s,%-4s\n" wangwy girl 65
num1=100
num2=100
if test $[num1] -eq $[num2]
then
	echo num1 is same num2
else
	echo num1 is not same unm2
fi
a=5
b=6
result=$[a+b]
echo "result is ${result}"
str1="i love yo"
str2="i love you?"
if test $str1 = $str2
then 
	echo str1 is same str2
else
	echo str1 is not same str2
fi
if test -e ./day2.sh
then
	echo day2.sh is exist
else
	echo day2.sh is not exist
fi

a=10
b=20
if (($a == $b))
then
	echo "a == b"
elif (($a > $b))
then
	echo "a > b"
elif (($a < $b))
then 
	echo "a < b"
else
	echo "i don't know a and b relation"
fi

num1=$[2*3]
num2=$[5+1]
if test $[num1] -eq $[num2]
then
	echo "num1 is same num2"
else
	echo "num1 is not same num2"
fi

for loop 
do
	echo "the value is: $loop"
done

for loop in this is one test, do you know ?
do
	echo $loop
done

int=1
while (($int <= 5))
do
	echo $int
	let int++
done

while :
do
	echo "input number which is from 1 to 5"
	read aNum
	case $aNum in
		1|2|3|4|5)
			echo "you input number is $aNum"
			;;
		*)
			echo "you input error number,and game will be over"
			break
			echo "can you see this sentence"
			;;
	esac	
done

demofunwithpara()
{
	echo "is it a function"
	echo "input number 1"
	read num1
	echo "input number 2"
	read num2
	echo "num1 is $num1 and num2 is $num2"
	echo "para 1 is $1"
	echo "para 2 is $2"
	echo "para 11 is ${11}"
	return $(($num1+$num2))
}
echo "start to test one function"
demofunwithpara 1 3 2 5 11 22 33 44 55 66 77 88 99 100
echo "stop to test one function,function result is $?"


