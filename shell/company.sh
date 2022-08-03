abc=192
echo "obase=2;$abc"|bc
echo "ibase=2;1111"|bc
def=11000000
echo "obase=10;ibase=2;$def"|bc
echo "10^5"|bc
echo "sqrt(64)"|bc
demo=$(echo "sqrt(64)"|bc)
echo $demo
cksum /mnt/d/ubuntu/vi.txt
cmp vi.txt vi1.txt

count=1
cat vi.txt | while read line
do
	echo "line $count:$line"
	count=$[$count + 1]
done
echo "finish"
exit 0
