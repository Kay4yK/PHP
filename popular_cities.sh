#!/usr/bin/env bash
awk -F"\t" 'NR > 1 {print $3}' users.txt | sort | uniq -c | sort -r | awk '{print $2}' | head -n3;


#   -F          — позволяет указать символ-разделитель для полей в записи.
#   NR > 1      — выпоняем принт только начиная со 2ой строки,
#                 тк 1ая содержит описание полей
#   uniq -с     — выводит перед строкой количество раз,
#                 сколько строка повторяется в файле
#   sort -r     — сортировать в обратном порядке

# логика:
# указываем разделитель
# пропускаем 1ую строку с заголовком из входных данных
# указываем файл откуда читать данные
# вывод awk передаем на вход команде sort, поулчаем отсортированные названия городов
# вывод sort передаем на вход команде uniq, тем самым поулчаем уникальные вхождения городов с их частотой
# вывод uniq передаем на вход команде sort, чтобы получить сверху списка самые частые города
# вывод sort передаем на вход команде awk и выводим первые 3 строки

# сохраняем файл и утанавливаем права
# chmod 755 popular_cities.sh
