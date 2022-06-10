#!/bin/bash

clear

RED='\033[4;31m'
RED='\033[1;7;31m'
GREEN='\033[4;32m'
GREENB='\033[0;32m'
YELLOW='\033[1;7;33m'
ENDCOLOR='\033[0m'

printf "${GREENB}*********************************************************${ENDCOLOR} \n"
printf "${GREENB}*WELCOME TO FILLIT TESTER, CHOOSE NUMBER AND PRESS ENTER*${ENDCOLOR} \n"
printf "${GREENB}*********************************************************${ENDCOLOR} \n"
printf "\n"
printf "${GREENB}1. RUN TESTS${ENDCOLOR} \n"
printf "${GREENB}2. EXIT${ENDCOLOR} \n"

read operation

while [ $operation == "1" ]
do
	NUMBER='1'
	VALID_FILE='1'
	INVALID_FILE='1'
	VALID_ANSWER='1'
	PASSED='0'
	#
	#Makefile tests
	#
	clear
	printf "*****************\n"
	printf "*${YELLOW}MAKEFILE TESTS${ENDCOLOR}*\n"
	printf "*****************"
	printf "\n"
	printf "\n"
	printf "make \n"
	make -C ../
	
	printf "\n"
	printf "Press ENTER to continue \n"
	read
	clear
	printf "*****************\n"
	printf "*${YELLOW}MAKEFILE TESTS${ENDCOLOR}*\n"
	printf "*****************"
	printf "\n"
	printf "\n"
	printf "make again\n"
	make -C ../

	printf "\n"
	printf "Press ENTER to continue \n"
	read
	clear

	printf "*****************\n"
	printf "*${YELLOW}MAKEFILE TESTS${ENDCOLOR}*\n"
	printf "*****************"
	printf "\n"
	printf "\n"
	printf "make clean\n"
	make -C ../ clean

	printf "\n"
	printf "Press ENTER to continue \n"
	read
	clear

	printf "*****************\n"
	printf "*${YELLOW}MAKEFILE TESTS${ENDCOLOR}*\n"
	printf "*****************"
	printf "\n"
	printf "\n"
	printf "make re\n"
	make -C ../ re

	printf "\n"
	printf "Press ENTER to continue \n"
	read
	clear

	printf "*****************\n"
	printf "*${YELLOW}MAKEFILE TESTS${ENDCOLOR}*\n"
	printf "*****************"
	printf "\n"
	printf "\n"
	printf "make fclean\n"
	make -C ../ fclean

	printf "\n"
	printf "Press ENTER to continue \n"
	read
	clear

	printf "*****************\n"
	printf "*${YELLOW}MAKEFILE TESTS${ENDCOLOR}*\n"
	printf "*****************"
	printf "\n"
	printf "\n"
	printf "make all\n"
	make -C ../ all

	printf "\n"
	printf "Press ENTER to continue \n"
	read
	clear

	#
	# reading fillits results to output_invalid
	#

	printf "**************\n"
	printf "*${YELLOW}SOLVER TESTS${ENDCOLOR}*\n"
	printf "**************"
	printf "\n"
	printf "\n"
	while [ $INVALID_FILE -le 20 ]
	do
		.././fillit testfiles/invalid_files/$INVALID_FILE 2>&1 >results/output_invalid
		DIFF=$(diff results/output_invalid <( printf "error\n" ))
		if [ "$DIFF"  == "" ]
			then
				PASSED=$((PASSED + 1))
			else
				printf "${DIFF_INV}\n"

		fi
		INVALID_FILE=$((INVALID_FILE + 1))
	done

	if [ $PASSED == 20 ]
		then
			printf "${GREEN}PASSED INVALID TESTS${ENDCOLOR}		${GREEN}$PASSED/20${ENDCOLOR}\n"
		else
			printf "${RED}PASSED INVALID TESTS${ENDCOLOR}		${RED}$PASSED/20 ${ENDCOLOR}\n"
	fi

	sleep 2

	PASSED='0'

#
# reading fillits result to output_valid
#
	while [ $VALID_ANSWER -le 20 ]
	do
		.././fillit testfiles/valid_files/$VALID_FILE 2>&1 >results/output_valid
		DIFF=$(diff results/output_valid results/valid_answers/$VALID_ANSWER )
		if [ "$DIFF"  == "" ]
			then
				PASSED=$((PASSED + 1))
			else
				printf "${DIFF}\n"
		fi
		VALID_FILE=$((VALID_FILE + 1))
		VALID_ANSWER=$((VALID_ANSWER + 1))
	done

	if [ $PASSED == 20 ]
		then
			printf "${GREEN}PASSED VALID TESTS${ENDCOLOR}		${GREEN}$PASSED/20${ENDCOLOR}\n"
		else
			printf "${RED}PASSED VALID TESTS${ENDCOLOR}		${RED}$PASSED/20 ${ENDCOLOR}\n"
	fi

	sleep 2

	NORM=$(diff results/norminette results/norminette_answer)

	if [ "$NORM"  == "" ]
		then
			printf "${GREEN}PASSED NORM TESTS${ENDCOLOR}\n"
		else
			printf "${RED}FAILED NORM TESTS${ENDCOLOR}\n"
			cat results/norminette
	fi

	sleep 2

	clear

	printf "************\n"
	printf "*${YELLOW}USAGE TEST${ENDCOLOR}*\n"
	printf "************"
	printf "\n"
	printf "\n"
	printf "./fillit\n"
	printf "${YELLOW}YOUR PROGRAM OUTPUT${ENDCOLOR} "
	../fillit
	printf "\n"
	printf "./fillit 123 123\n"
	printf "${YELLOW}YOUR PROGRAM OUTPUT${ENDCOLOR} "
	../fillit 123 123
	printf "\n"
	printf "Press ENTER to continue \n"

	read key

	while [ $key != "" ]
	do
		if [ $key == "" ]
			then
				break
		else
			clear
			printf "Press ENTER to continue \n"
			read key
		fi
	done

	clear

	printf "*****************************\n"
	printf "*${YELLOW}EVALUATION FORM SPEEDTEST 1${ENDCOLOR}*\n"
	printf "*****************************\n"
	printf "\n"
	{ time .././fillit testfiles/valid_files/3; }

	printf "${YELLOW}SHOULD BE UNDER 1 SECOND${ENDCOLOR}\n"
	printf "\n"
	printf "Press ENTER to continue \n"

	read keys

	while [[ $keys != "" ]]
	do
		if [ $keys == "" ]
			then
				break
		else
			clear
			printf "Press ENTER to continue \n"
			read keys
		fi
	done

	clear

	printf "*****************************\n"
	printf "*${YELLOW}EVALUATION FORM SPEEDTEST 7${ENDCOLOR}*\n"
	printf "*****************************\n"
	printf "\n"
	{ time .././fillit testfiles/valid_files/16; }
	printf "${YELLOW}SHOULD BE UNDER 30 SECONDS${ENDCOLOR}\n"
	printf "\n"
	printf "Press ENTER to continue \n"

	read key

	while [[ $key != "" ]]
	do
		if [ $key == "" ]
			then
				break
		else
			clear
			printf "Press ENTER to continue \n"
			read key
		fi
	done

	printf "${RED}*********END OF TESTS*************${ENDCOLOR}\n"

	sleep 2

	clear

	printf "${GREENB}*********************************************************${ENDCOLOR} \n"
	printf "${GREENB}*WELCOME TO FILLIT TESTER, CHOOSE NUMBER AND PRESS ENTER*${ENDCOLOR} \n"
	printf "${GREENB}*********************************************************${ENDCOLOR} \n"
	printf "\n"
	printf "${GREENB}1. RUN TESTS${ENDCOLOR} \n"
	printf "${GREENB}2. EXIT${ENDCOLOR} \n"
	
	read operation

done

clear
