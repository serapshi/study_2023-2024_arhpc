%include 'in_out.asm'
SECTION .data
msg1 db "Функция 12*x - 7", 0
msg2 db "Результат: ",0
newline db 10,0
SECTION .text
global _start
_start:
pop ecx ; Извлекаем из стека в ecx количество
pop edx ; Извлекаем из стека в edx имя программы
sub ecx,1 ; Уменьшаем ecx на 1 (количество аргументов без названия программы)
mov esi, 0 ; Устанавливаем начальное значение esi в 1 для хранения произведения
next:
cmp ecx, 0h ; проверяем, есть ли еще аргументы
jz _end ; если аргументов нет, выходим из цикла (переход на метку _end)
pop eax ; иначе извлекаем следующий аргумент из стека
call atoi ; преобразуем символ в число
call _calcul
add esi, eax;
loop next ; переход к обработке следующего аргумента
_end:
mov eax, msg1;
call sprint;
mov eax, newline
call sprint
mov eax, msg2 ; вывод сообщения "Результат: "
call sprint;
mov eax, esi ; записываем произведение в регистр eax
call iprintLF ; печать результата
call quit ; завершение программы
_calcul:
mov ebx, 12
mul ebx
add eax, -7
ret
