:<<!
1 line note
2 line note
3 line note
!

echo "study and retest shell script"
for file in `ls`
do
	echo ${file}
done
myurl="https://www.sina.com.cn"
readonly myurl
myurl="https://www.lenovo.cn"
echo ${myurl}
unset myurl
echo ${myurl}

your_name="rose"
his_name="apple"
str1="hello,${your_name}"
str2="hello,${his_name}"
echo $str1 $str2
echo "str1 length is ${#str1}"
echo "substr1 is ${str1:1:4}"
echo `expr index "$str1" io`

array=(11 22 33 44 55 66)
echo ${array[@]}
echo "array length is ${#array[@]}"

echo "function paramter num is $#,param1 is $1,param str is $*"
echo "demo \$@ "
for param in "$@"
do
	echo ${param}
done
val=`expr 2 + 2`
echo "2 + 2: ${val}"

a=10
b=20
val=`expr $a + $b`
echo "a + b= $val"
val=`expr $a - $b`
echo "a -b= $val"
val=`expr $a \* $b`
echo "a * b= $val"
val=`expr $b / $a`
echo "b / a = $val"
if [ $a == $b ]
then
	echo "a == b"
fi
if [ $a != $b ]
then 
	echo "a != b"
fi

if (( $a == $b))
then
   	echo "method2: a == b"
fi
if (( $a != $b ))
then
   	echo "method2: a != b"
fi

if [ $a -eq $b ]
then 
	echo "$a -eq $b: a == b"
else
	echo "$a -eq $b: a != b"
fi
if [ $a -lt $b ]
then
	echo "$a -lt $b: a < b"
fi
if [ $a -le $b ]
then 
	echo "$a -le $b: a <= b"
fi

if [ $a -lt 100 -a $b -gt 15 ]
then 
	echo "$a < 100 and $b > 15 : return ture"
fi

if [ $a -gt 100 -o $b -gt 15 ]
then
	echo "$a > 100 or $b > 15 : return true"
fi

if [[ $a -lt 100 && $b -gt 100 ]]
then
	echo "$a < 100 && $b > 100: return true"
else
	echo "$a < 100 && $b > 100: return false"
fi

if [[ $a -lt 100 || $b -gt 100 ]]
then
        echo "$a < 100 || $b > 100: return true"
else
        echo "$a < 100 || $b > 100: return false"
fi

str1="abc"
str2="efg"
if [ $str1 = $str2 ]
then 
	echo "$str1 = $str2 : true"
else
	echo "$str1 = $str2 : false"
fi

if [ $str1 != $str2 ]
then
       	echo "$str1 != $str2 : true"
else
       	echo "$str1 != $str2 : false"
fi

if [ -z $str1 ]
then
       	echo "-z $str1 : str1 length is 0 = true"
else
       	echo "-z $str1 : str1 length is 0 = false"
fi

file="/mnt/d/ubuntu/retest.sh"
if [ -r $file ]
then
	echo "$file can read"
else
	echo "$file can't read"
fi
if [ -x $file ]
then
        echo "$file can execute"
else
        echo "$file can't execute"
fi
if [ -c $file ]
then
        echo "$file is char file"
else
        echo "$file is not char file"
fi
if [ -d $file ]
then
       	echo "$file is one directory"
else
        echo "$file is not one directory"
fi
echo -e "OK! \n\n\n"
echo "it is a test; 3 line"

printf "%-10s %-8s %-4.2f \n" rose girl 51.2378

for str in $*
do
	echo $str
done

while :
do
	echo -n "输入 1 到 5 之间的数字:"
	read aNum
	case $aNum in
 		1|2|3|4|5) 
		echo "你输入的数字为 $aNum!"
		;;
      		*) 
		echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
		break
		;;
   	esac
done


funWithParam()
{
	echo "第一个参数为 $1 !"
   	echo "第二个参数为 $2 !"
  	echo "第十个参数为 $10 !"
       	echo "第十个参数为 ${10} !"
   	echo "第十一个参数为 ${11} !"
 	echo "参数总数有 $# 个!"
   	echo "作为一个字符串输出所有参数 $* !"
}
funWithParam 1 2 3 4 5 6 7 8 9 34 73 99
echo "scale=4;3*8/7;5*8;9*9;last*5"|bc -l
var_bc=$(bc<<!
ibase=10;
obase=10；
scale=3;
5*8;
9*7;
m=3;
n=4;
m*n;
!
)
echo $var_bc

