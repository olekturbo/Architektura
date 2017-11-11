.intel_syntax noprefix
.text
.globl main
 
main:
	push ebp
	mov ebp, esp
	mov ebx, [ebp + 12]
	cmp dword ptr [ebp + 8], 3
	jge parameters_ok
	push [ebx]
	push offset usage
	call printf
	add esp, 8
	mov eax, 1
	jmp exit
 
parameters_ok:
	push [ebx + 4]
	call atoi
	add esp, 4
	push eax
	push [ebx + 8]
	call atoi
	add esp, 4
	pop ecx
	xor edx, edx
	xor ebx, ebx
	push eax
	call function
	add esp, 4
	push edx
	push offset msg
	call printf
	add esp, 8
	mov eax, 0
	exit:
	mov esp, ebp
	pop ebp
	ret
 
function:
	mov edx,0
	push ebp
	mov ebp, esp
	push eax
	push ecx
	push ebx
	push edi
	push esi
	mov eax,[ebp+8]
	cmp ecx,0
	jne f1
	mov edx,eax
	add edx,1
	jmp final
 
f1:
	cmp ecx,1
	jne f2
	mov edx, eax
	jmp final
 
f2:
	cmp ecx, 2
	jne fnext
	mov edx, eax
	add edx,2
	jmp final
 
fnext:
	mov edi, ecx
	mov esi, eax
	xor ebx, ebx
	dec ecx
	push eax
	call function
	add esp, 4
	mov ebx, edx
	mov ecx, edi
	sub ecx, 2
	inc eax
	push eax
	call function
	add esp, 4
	sub ebx, edx
	sub ebx, edx
	mov ecx, edi
	mov eax, esi
	sub ecx, 3
	push eax
	call function
	add esp, 4
	sub ebx, edx
	mov edx, ebx
 
final:
	pop esi
	pop edi
	pop ebx
	pop ecx
	pop eax
	pop ebp
	ret
 
 
.data
msg:
  .asciz "Wynik = %d\n"
  .byte 0
usage:
  .asciz "Uzycie %s n m \n"
  .byte 0
