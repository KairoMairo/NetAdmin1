#!/bin/bash

# Значения по-умолчанию
path=$(pwd)
dir_name="directory"
file_name="file"
file_quantity=20
dir_quantity_1=5
dir_quantity_2=10 

# Возможные ключи
while [ -n "$1" ]
do
case "$1" in
-d) path="$2"
shift ;;
-dn) dir_name="$2"
shift ;;
-fn) file_name="$2"
shift ;;
-fq) file_quantity=$2
shift ;;
-dq1) dir_quantity_1=$2
shift ;;
-dq2) dir_quantity_2=$2
shift ;;
--) shift
break ;;
*) echo "$1 is not an option" break ;; 
esac
shift
done


cd $path

for i in $(seq $dir_quantity_1)
do
new_dir_name=$dir_name"_"$i
mkdir $new_dir_name
cd $new_dir_name

for j in $(seq $dir_quantity_2)
do
new_dir_name=$dir_name"_"$j
mkdir $new_dir_name
cd $new_dir_name

for k in $(seq $file_quantity)
do
touch $file_name"_"$k".txt"
done

cd ".."
done

cd ".."
done

