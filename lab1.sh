#!/bin/bash

# Значения по-умолчанию
path=$(pwd)
dir_name="directory"
file_name="file"
file_quantity=20
dir_quantity_1=5
dir_quantity_2=10 

clear
x=0
# меню
while [ $x = 0 ]
do

echo "Путь: $path"
echo "Шаблон имени директорий: $dir_name"
echo "Шаблон имени файлов: $file_name"
echo "Кол-во директорий 1-го уровня: $dir_quantity_1"
echo "Кол-во директорий 2-го уровня: $dir_quantity_2"
echo "Кол-во файлов: $file_quantity"
echo
echo "МЕНЮ"
echo "1) Выполнить"
echo "2) Задать путь"
echo "3) Задать шаблон имени директорий"
echo "4) Задать шаблон имени файлов"
echo "5) Задать кол-во директорий 1-го уровня"
echo "6) Задать кол-во директорий 2-го уровня"
echo "7) Задать кол-во файлов"
echo "0) Выход"

read option
clear

case $option in
1) break ;;
2) echo -en "Путь: "
read path ;;
3) echo -en "Шаблон имени директорий: "
read dir_name ;;
4) echo -en "Шаблон имени файла: "
read file_name ;;
5) echo -en "Кол-во директорий 1-го уровня: "
read dir_quantity_1 ;;
6) echo -en "Кол-во директорий 2-го уровня: "
read dir_quantity_2 ;;
7) echo -en "Кол-во файлов: "
read file_quantity ;;
0) exit ;;
*) clear
echo "Выберите один из пунктов меню\n" ;; 
esac
clear
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

echo "Скрипт выполнен"
