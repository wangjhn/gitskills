:<<!
ddddd
xxxxx
yyyyy
ccccc
wwwww
ppppp
zzzzz
!

your_name="wang peng yu"
echo ${your_name}
your_name="wang wen yue"
echo ${your_name}
your_name="chen shu fen"
echo ${your_name}
test="i know your name is "${your_name}"!"
echo ${test}
echo ${your_name} ${test}
echo test length is ${#test}
echo ${test:1:4}
echo `expr index "$test" k`
array_num=(xx yy zz aaaaaaaaa bb cc dd ee 11 22)
echo ${array_num[1]}
echo ${array_num[@]}
echo ${#array_num[@]}
echo ${#array_num[3]}
echo "paramter demo $0"
echo "total paramter is $#"
echo "1 parater is $1"
echo "2 parater is $2"
echo "parmeter list is $*"
file1="/mnt/d/ubuntu/test.sh"
if [-r $file1]
then
     echo "test.sh can be read"
else
     echo "test.sh can't be read"

