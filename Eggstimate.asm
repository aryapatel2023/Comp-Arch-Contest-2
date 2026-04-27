INCLUDE Irvine32.inc

.data

titleMsg BYTE "COUNT DEM CHICKENS!", 0
ruleMsg BYTE "Count the instances of ONLY the word CHICKEN.", 0
askMsg BYTE "How many real CHICKENs did you see? ", 0

winMsg BYTE "Yippee! You are the CHICK CHAMP!", 0
loseMsg BYTE "Oh no! You are a CHICKEN! The real number was: ", 0

word1 BYTE "CHICKEN", 0
word2 BYTE "CHUCK", 0
word3 BYTE "CHICK", 0
word4 BYTE "DHICKEN", 0
word5 BYTE "KITCHEN", 0
word6 BYTE "CHIKCEN", 0
word7 BYTE "CHICKENN", 0
word8 BYTE "CHICAGO", 0
word9 BYTE "CHONKEN", 0

correctCount DWORD 0
playerGuess DWORD?
roundsLeft DWORD 20