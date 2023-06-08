ORG 0000H      
Mov A, #38H     // use 2 lines and 5*7 
ACALL com    
MOV A, #0EH   //cursor blinking off 
ACALL com    
MOV A, #80H   // force cursor to first line 
ACALL com  
MOV A, #01H     //clr screen
ACALL com   

MOV DPTR ,#STR
REV : MOV A,#00H   
MOVC A,@A+DPTR    
JZ FINISH      
ACALL L_D    
INC DPTR    
SJMP REV    
FINISH: SJMP FINISH    

com: ACALL DEL_ROUTINE  
MOV P1, A   
CLR P2.1   
SETB P2.2
CLR P2.2
RET    

L_D: ACALL DEL_ROUTINE  
MOV P1, A      
SETB P2.1     
SETB P2.2     
CLR P2.2     
RET       

DEL_ROUTINE: MOV R0, #0FFH  
L1: MOV R1, #0FFH   
L2: DJNZ R1, L2    
DJNZ R0, L1     
RET       
STR: DB'Hello Abhishek thia side',0   
END