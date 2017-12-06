.LC0:
  .string "%s"
main:
  lea ecx, [esp+4]
  and esp, -16
  push DWORD PTR [ecx-4]
  push ebp
  mov ebp, esp
  push ebx
  push ecx
  sub esp, 16
  mov ebx, ecx
  mov eax, DWORD PTR [ebx+4]
  add eax, 4
  mov eax, DWORD PTR [eax]
  sub esp, 12
  push eax
  call atoi
  add esp, 16
  mov DWORD PTR [ebp-12], eax
  mov eax, DWORD PTR [ebp-12]
  add eax, 1
  lea edx, [0+eax*4]
  mov eax, DWORD PTR [ebx+4]
  add eax, edx
  mov eax, DWORD PTR [eax]
  sub esp, 8
  push eax
  push OFFSET FLAT:.LC0
  call printf
  add esp, 16
  mov eax, 0
  lea esp, [ebp-8]
  pop ecx
  pop ebx
  pop ebp
  lea esp, [ecx-4]
  ret
