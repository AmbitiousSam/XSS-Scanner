#!/bin/bash

	echo `clear`;
	echo "\033[0m"
	printf "  +=============================================+"'\n'
	printf "  |      Mass Vuln Web XSS Injection Scanner    |"'\n'
	printf "  +=============================================+"'\n''\n'


	function check {
		b="Using : -w [Your Mass Target]\nExample : basename -w target.txt\n  
	"
	echo -e $b
	exit 1
	}
	[ "$1" ] || check;

	while getopts w: OPT ; 
	do
		#statements
		case "$OPT" in
			"w") masstarget="${OPTARG}" ;;
		esac
	done

	[ $masstarget ] || check;

	printf '\n'"[*] Scanning target file => $masstarget"'\n''\n'

	for vuln in `cat $masstarget`
	 do

	 	echo -e "\033[1;34m[*]\033[0m Scanning => $vuln"
	 	page=$( curl --silent --path-as-is --insecure  "$vuln" )

		if [[ $page =~ "<Svg OnLoad=(confirm)(1)>" ]]; then
			echo -e "\e[31m[+] $vuln => Vulnerable to XSS Injection\033[0m\n"
			echo $vuln >> vuln.txt
		else
			echo -e "\e[32m[-] $vuln => Not Vulnerable"
			echo -e "\033[0m"
		fi
	done
	echo -e "\033[1;34m[!]Vulneraibility Web Success Saved in vuln.txt\n"
	echo -e "\033[0m"