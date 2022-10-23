#Отчет.
Студент Спиидонов Дмитрий Вячеславович
Группа БПИ-214
Вариант 23
Условие задачи:
    Сформировать массив B из элементов массива A уменьшением всех элементов до первого положительного на 5.
Задание выполнено с расчетом на оценку 8

На 4 балла:
    * В файле 4.2.c хранится программа на языке C.
    * Получена ассемблерную программу(4.2.s) откомпилированная при помощи команды в командной строке
        gcc -S -nasm=intel 4.2.c
      Добавлены комментарии , поясняющие эквивалентное предстваление переменных в программе на C
        int n        - -108[rbp]
        int a[]      - -80[rbp]
        int b[]      - -64[rbp]
        i из цикла 1 - -100[rbp]
        i из цикла 2 - -96[rbp]
        i из цикла 3 - -92[rbp]
        int flag     - -104[rbp]
    * В полученном ассемблерном коде не использовались макросы, поэтому удалять было нечего.
    * Итоговая ассемблерная программа откоплилирована и скомпонована командой
        gcc 4.s -o s
      Программа на языке C откоплилирована и скомпонована командой
        gcc 4.c -o c
    * Полное тестовое покрытие(так же представлено в файле tests.txt):
        0
        
        1
        0
        
        1
        1
        
        3
        0 -1 -2
        
        3
        1 1 1
        
        3
        0 0 0
        
        5
        0 0 -1 3 0
        
        4
        -1 -1 -3 5
        
        4
        4 0 0 0
    * Результат тестовых прогонов программы на C и Ассемблере хранится в фотографиях в папке /4
        
        
На 5 баллов:
    * Реализована программа(5.c) с использованием функции с передачей данных через параметры
    * В функции aToB используются локальные переменные:
        int flag
        size_t i
      В функции main используются локальные переменные:
        unsigned int n
        int a[n]
        int b[n]
        unsigned int i
    * Получена ассемблерная программа(5.s), откомпилированная при помощи команды в командной строке
        gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none 5.c -o 5.1.s
    * В полученную ассемблерную программу добавлены комментарии, описывающие передачу фактических парметров, перенос возвращаемого результата. Описана связь между параметрами языка C и регистрами
    

На 6 баллов:
    * В функции aToB(файл 6.c) минимизировано количество обращений к памяти путем максимального использования регистров процессора, добавлены комментарии:
        const int *a    - rdi
        size_t size     - rsi
        int *result     - r14
        int flag        - r13
        size_t i        - r12
    * На тестовом покрытии измененная программа показала те же результаты, что и прошлые программы. Результат тестовых прогонов программы хранится в фотографии в папке /6
        


На 7 баллов:
    * Отдельно хранится функция aToB(файл 7.1f.s), полученная после рефакторинга программы 6.c
    * Реализовано задание текстовых файлов для ввода и вывода
    * В ходе проверок на тестовом покрытии показано, что изменений в корректности работы программы не произошло
    * Изначально программа, написанная на Си, используюет функцию, хранящуюся в файле func7.c, однако после компиляции файла в ассемблерный код(7.s) участок кода с функцией удален, вместо этого в первую строчку добавлен импорт функции из файла 7.1f.s(.extern aToB)
    * Си файл преобразован в ассемблерный код командой
        gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none 7.c
    * Исполняемый файл получен командой
        gcc 7.s 7.1f.s -o res
    * Запуск программы происходит из командой строки командой
        ./res <имя файла 1> <имя файла 2>
    * Примечание: на моей системе не работал fopen без указание полного пути до файла


На 8 баллов:
    * В программе(файл main.c) реализовано 4 возможных вида задания массива А:
        1) Через консоль(как в программе на 4 балла) - передача без аргументов
        2) Через файлы - первым аргументом идет флаг -f(или --file), вторым и третьим аргументами идут имена файлов, с которым будет работать программа(читать данные из первого файла и возвращать результат во второй)
        3) Через аргументы переданные в командную стркоу - для этого достаточно вместо флагов сразу передать элементы массива А
        4) Через генератор случайных наборов данных - для этого первым аргументом идет флаг -r(или --random), вторым аргументом идет размер массива А
    * Также добавлен ключ -h(или --help), который выдает список аргументов, которые может обрабатывать командная строка
    * Для реализации пункта 3 создана отдельная папка secondPart. Дальнейшая работа проходит в этой папке
    * Из файла main.c получен ассемблерный код(файл main.s) командой 
        gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c
    * В полученном файле был добавлен импорт функции aToB(функция из пункта на 6) и последнее использование функции aToBNO заменено на функцию aToB
    * Полученная программа была скомпилирована в исполняемый файл и запущена. Результат работы представлен на фотографии, которая хранится в данной папке
