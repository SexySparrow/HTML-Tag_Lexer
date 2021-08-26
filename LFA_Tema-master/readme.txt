Limbaje formale si automate - Tema - Varianta B
Brabete Adrian 334CC

Tema a fost realizata pe Windows folosind si WLS

Implementare:

IGNOR:
	Starea pentru ignorat valorile tag urilor care incep cu <! si <?

TAG:
	Calculeaza indentarea pentru fiecarui tag.
	Daca dupa tag nu urmeaza un element de inchidere > se trece in starea ATRIBUT

ATRIBUT
	Se afiseaza atributele si valorile folosind ca separator :: si : conform regulilor,
	in cazul mai multor atribute se foloseste ; pentru despartire.

INCHIDERE:
	Realizeaza despartirea cu ; intre mai multe atribute din acelasi TAG.

Rulare Temă:
	make build - compileaza tema si creeaza executabilul temaB
	make test1 - se ruleaza exemplul 1 (intrare-a.html)
	make test2 - se ruleaza exemplul 2 (intrare-b.html)
	make test3 - se ruleaza exemplul 3 (intrare-c.html)
	make test4 - se ruleaza exemplul 4 (intrare-d.html)
	make test5 - se ruleaza exemplul 5 (intrare-e.html)
	make clean - șterge fisierele generate la build