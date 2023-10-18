#edit input signal

paste data_f_offset.txt > .txt 
sed -i '1,5d' .txt
awk '{print $3}' .txt > .txt

rm .txt
#rm data_input_1.txt
