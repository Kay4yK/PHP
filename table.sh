#!/usr/bin/bash

# разбор таблицы, берём только название города
  awk '{ print $3}' table.txt |

# сортировка, чтобы одинаковые города стояли рядом
 sort  |

# кол-во повторений
 uniq -c  |

# сортировка строк по кол-ву повторений (ключ -c uniq) от большего к меньшему
 sort -r  |

# берём только первые 3 строки
 head -3  |

# вывод названий городов строками,
# $2 так как сейчас строки состоят из кол-во повторений и названия города
 awk '{ print $2 }'