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
playerGuess DWORD ?
roundsLeft DWORD 20

.code
main PROC

	call Clrscr
	call Randomize

	mov dh, 2
	mov dl, 30
	call Gotoxy
	mov edx, OFFSET titleMsg
	call WriteString

	mov dh, 4
	mov dl, 22
	call Gotoxy
	mov edx, OFFSET ruleMsg
	call WriteString

	mov eax, 2500
	call Delay
	call Clrscr

gameLoop:
	mov eax, 9
	call RandomRange

	cmp eax, 0
	je showChicken
	cmp eax, 1
	je showChuck
	cmp eax, 2
	je showChick
	cmp eax, 3
	je showDhicken
	cmp eax, 4
	je showKitchen
	cmp eax, 5
	je showChikcen
	cmp eax, 6
	je showChickenn
	cmp eax, 7
	je showChicago
	jmp showChonken

showChicken:
	mov esi, OFFSET word1
	inc correctCount
	jmp showRandomWord
	
showChuck:
	mov esi, OFFSET word2
	jmp showRandomWord

showChick:
	mov esi, OFFSET word3
	jmp showRandomWord

showDhicken:
	mov esi, OFFSET word4
	jmp showRandomWord

showKitchen:
	mov esi, OFFSET word5
	jmp showRandomWord

showChikcen:
	mov esi, OFFSET word6
	jmp showRandomWord

showChickenn:
	mov esi, OFFSET word7
	jmp showRandomWord

showChicago:
	mov esi, OFFSET word8
	jmp showRandomWord

showChonken:
	mov esi, OFFSET word9

showRandomWord:
	;Generate random row from 5 to 19
	mov eax, 15
	call RandomRange
	add eax, 5
	mov dh, al

	;Generate random column from 5 to 64
	mov eax, 60
	call RandomRange
	add eax, 5
	mov dl, al

	call Gotoxy

	mov edx, esi
	call WriteString

pauseWord:
	;Pauses the word for a brief moment before clearing it
	mov eax, 500
	call Delay
	call Clrscr

	dec roundsLeft
	cmp roundsLeft, 0
	jne gameLoop

	mov dh, 10
	mov dl, 24
	call Gotoxy
	mov edx, OFFSET askMsg
	call WriteString
	call ReadInt
	cmp playerGuess, eax

	mov eax, playerGuess
	cmp eax, correctCount
	je correctAnswer

wrongAnswer:
	mov dh, 12
	mov dl, 24
	call Gotoxy
	mov edx, OFFSET loseMsg
	call WriteString 

	mov eax, correctCount
	call WriteDec
	call Crlf
	jmp done

correctAnswer:
	mov dh, 12
	mov dl, 22
	call Gotoxy
	mov edx, OFFSET winMsg
	call WriteString
	call Crlf

done:
	exit

main ENDP
END main