# Data-base
Base de dados inicial do projeto, referente ao arquivo 

Início do banco com 98.358	

1) Removendo os RT's a base de banco

Primeira contagem:
SELECT count(*) FROM `tweet` WHERE Text like "RT @%"  => Total de 47820

Deletar:
DELETE FROM `tweet` WHERE Text like "RT @%"

Após deletar, total de 49580.


Contar Tweets repetidos
		SELECT Text, Count(*) FROM tweet
		GROUP BY Text
		HAVING Count(*) > 1

		
   select MIN(id), COUNT(*), Text from tweet
   group by Text
   having Count(Text)>1

   
 DELETE from tweet
where Text in (SELECT Text FROM tweet GROUP BY Text	HAVING Count(Text) > 1) 
and not id in (SELECT MIN(id) from tweet group by Text having Count(Text)>1 )

DELETE FROM `tweet` WHERE Text in (SELECT Text FROM (select * from `tweet`) as tweet1 GROUP BY Text HAVING Count(Text) > 1) 
and id not in (SELECT MIN(id) from (select * from `tweet`) as tweet2 group by Text having Count(Text) > 1 )

Após deletar repetidos com texto 100% iguais:
49272

Ainda há a extração forçada que leva para 42289


2) Caracterização da base: 

(http://jsfiddle.net/gh/get/library/pure/highcharts/highcharts/tree/master/samples/highcharts/demo/area-basic/)

- Distribuição de postagens por usuário.

SELECT distinct id_tweet, count(Text) as Tweets, ProfileLocation FROM `tweet` group by id_tweet order by Tweets DESC

Usuarios com 1 postagem
38877 - 6124 = 32753
Usuarios com 2 postagem
6123 - 1879 = 4244
Usuarios com 3 postagem
1878 - 841 = 1037
Usuarios com 4 postagem
840 - 502 = 338
Usuarios com 5 postagem
501 - 344 =157
Usuarios com 6+20 postagem
343 - 77  = 266
- Distribuição de postagens criminais por usuário
76 - 48   = 28


3) Classificação 1000 tweets OK

-v n: n-fold cross validation mode

Treino de cada base 

Base linear 5-fold
.\svm-train.exe -t 0 -v 5 Treino80.txt
.\svm-train.exe -t 0 -v 5 Treino60.txt
.\svm-train.exe -t 0 -v 5 Treino40.txt
.\svm-train.exe -t 0 -v 5 Treino20.txt

F-score = 2*VP / (2*VP + FP + FN)


--------------80----------------
Número de features de cada classe
treino 800  teste 200
features 2848


Parametros defeaut
.\svm-scale -l -1 -u 1 -s range1 Treino80.txt > Treino80.txt.scale
.\svm-scale -r range1 Teste20.txt > Teste20.txt.scale
.\svm-train  -t 0 -v 5 Treino80.txt.scale
python grid.py Treino80.txt.scale

C = 8.0 Gama = 0.0078125 accuracy = 90.9887

.\svm-train -c 8.0 -g 0.0078125 Treino80.txt.scale


.\svm-predict Teste20.txt.scale Treino80.txt.scale.model output8020.txt

Verdadeiro Positivo: 19

Falso Positivo: 74

Verdadeiro Negativo: 3

Falso Negativo: 105

F-score = 2*19 / (2*19 + 179) =  0,18

-----------------60--------------------
treino 600  teste 400
features 2288


Parametros defeaut
.\svm-scale -l -1 -u 1 -s range1 Treino60.txt > Treino60.txt.scale
.\svm-scale -r range1 Teste40.txt > Teste40.txt.scale
Escolha	.\svm-train  -t 0 -v 5 Treino60.txt.scale
		python grid.py Treino60.txt.scale

C=512.0 G=0.0001220703125 accuracy = 90.1503

.\svm-train -c 512.0 -g 0.0001220703125 Treino60.txt.scale

.\svm-predict Teste40.txt.scale Treino60.txt.scale.model output6040.txt


Verdadeiro Positivo: 28

Falso Positivo: 103

Verdadeiro Negativo: 6

Falso Negativo: 264

F-score = 2*28 / (2*28 + 367)= 0,13

-----------------40-------------------
treino 400  teste 600
features 1605

Parametros defeaut
.\svm-scale -l -1 -u 1 -s range1 Treino40.txt > Treino40.txt.scale
.\svm-scale -r range1 Teste60.txt > Teste60.txt.scale
Escolha	.\svm-train  -t 0 -v 5 Treino40.txt.scale
		python grid.py Treino40.txt.scale

C=128.0 G=0.001953125 accuracy = 89.4737

.\svm-train -c 128.0 -g 0.001953125 Treino40.txt.scale

.\svm-predict Teste60.txt.scale Treino40.txt.scale.model output4060.txt


Verdadeiro Positivo: 31

Falso Positivo: 119

Verdadeiro Negativo: 13

Falso Negativo: 438

F-score = 2*31 / (2*31 + 557)= 0,10

-------------------20------------------
treino 200  teste 800
features 961

Parametros defeaut
.\svm-scale -l -1 -u 1 -s range1 Treino20.txt > Treino20.txt.scale
.\svm-scale -r range1 Teste80.txt > Teste80.txt.scale
Escolha	.\svm-train  -t 0 -v 5 Treino20.txt.scale
		python grid.py Treino20.txt.scale

C=32.0 G=0.0078125 accuracy = 84.9246
		
.\svm-train -c 32.0 -g 0.0078125 Treino20.txt.scale

.\svm-predict Teste80.txt.scale Treino20.txt.scale.model output2080.txt

Verdadeiro Positivo: 33

Falso Positivo: 127

Verdadeiro Negativo: 36

Falso Negativo: 605

F-score = 2*33 / (2*33 + 732) = 0,082
