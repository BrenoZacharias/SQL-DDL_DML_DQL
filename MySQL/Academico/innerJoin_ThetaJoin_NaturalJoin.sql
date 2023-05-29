SELECT pf.codProf, pf.anosem FROM PROFTURMA pf
		INNER JOIN PROFESSOR p
		ON p.codProf=pf.codProf
		INNER JOIN TITULACAO t
		ON t.codTit=p.codTit
		WHERE pf.anoSem != '20191' AND t.nomeTit='Doutor';

-- natual join
select p.codprof, pt.anosem from professor p natural join titulacao t, profturma pt
where (t.nometit='Doutor') AND (pt.anoSem!='20191');

-- theta join
select p.codprof, pt.anosem from professor p, titulacao t, profturma pt
where (p.codtit=t.codtit) AND (t.nometit='Doutor') AND (pt.anoSem!='20191') AND (p.CodProf=pt.CodProf);
