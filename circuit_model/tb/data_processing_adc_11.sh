################### merge 2 file data from xschem simulation 
paste data_out_0.txt data_out_1.txt data_out_2.txt data_out_3.txt > out_adc_data_1.txt

#delete line
sed -i '1,5d' out_adc_data_1.txt

#delete column
awk '{print $3 " " $4 " " $5 " " $8 " " $9 " " $10 " " $13 " " $14 " " $15 " " $18 " " $19 " " $20}' out_adc_data_1.txt > out_adc_data_2.txt

rm out_adc_data_1.txt

#process data according to CLK
#set change data from 1 to 0
#if clk 1->0 and out quantizer > 1.7 => out quantizer = 1
awk '{
	if($1=="1.800000e+00")
		$0="1"
	else
		$1="0"
	print $0}' out_adc_data_2.txt > data_out.txt
rm out_adc_data_2.txt

###################### processing port of system
#paste data_1.txt data_2.txt data_3.txt data_4.txt data_5.txt > data_pseudo.txt
#sed -i '1,5d' data_pseudo.txt

#awk '{print $3 " " $4 " " $5 " " $8 " " $9 " " $10 " " $13 " " $14 " " $15 " " $18 " " $19 " " $20 " " $23}' data_pseudo.txt > data_all.txt
#rm data_pseudo.txt

############# processing BPSK signal
#paste bpsk_signal.txt > bpsk_pseudo.txt
#sed -i '1,5d' bpsk_pseudo.txt
#awk '{print $3}' bpsk_pseudo.txt > bpsk_data.txt
