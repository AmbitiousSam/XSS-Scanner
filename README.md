# XSS-Scanner

Cross-site scripting is a type of security vulnerability typically found in web applications. XSS attacks enable attackers to inject client-side scripts into web pages viewed by other users. A cross-site scripting vulnerability may be used by attackers to bypass access controls such as the same-origin policy.

This is a simple xss scanner which takes a wordlist of urls with parameters whose values have the <br>
payload :  ```<Svg OnLoad=(confirm)(1)>``` 

this can be done using [qsreplace](https://github.com/tomnomnom/qsreplace) tool built by @tomnomnom

## Command
 For running this script
 
Step 1 : ``` git clone https://github.com/AmbitiousSam/XSS-Scanner ```
Step 2 : ``` chmod +x xss.sh``` 
Step 3 : ``` ./xss.sh -w urls.txt ```

Then it will check every url and show the vulnverable urls.

