Sorry for czech comments, script are for czech students.
Needs list of text files with questions and answers: 
1.odpovedA.txt
1.odpovedB.txt
1.odpovedC.txt
1.odpovedD.txt
1.otazkaA.txt
1.otazkaB.txt
1.otazkaC.txt
1.otazkaD.txt
2.otazkaA.txt
2.otazkaB.txt
2.otazkaC.txt
2.otazkaD.txt
3.otazkaA.txt
3.otazkaB.txt
bonusova.otazka.txt


00_rmdir.sh : removes old results, old links

01_mkdir.sh : creates directory test in students' home directories. creates hard links for questions (4 variants of questions). creates softlinks for bonus answer.

02_zacatek_testu.sh : questions are readable

03_konec_testu.sh : answer are not writable. logs running processed (one question in test is about running and killing processes)

04_uklid_testu.sh : delete empty answers, copy everything to my directory, kill residual processes.

05_vyhodnoceni.sh : grade the test. all answers are checked automatically, I can change the grading if I want. Bonus questions must be checked manually.
