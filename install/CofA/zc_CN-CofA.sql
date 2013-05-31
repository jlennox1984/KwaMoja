DROP DATABASE IF EXISTS chartcreate;
CREATE DATABASE chartcreate;

use chartcreate;
SET CHARACTER SET utf8;
SET NAMES 'utf8';

CREATE TABLE 0_chart_class (
  cid int(11) NOT NULL default '0',
  class_name varchar(60) NOT NULL default '',
  balance_sheet tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (cid)
) DEFAULT CHARSET=utf8;

CREATE TABLE 0_chart_types (
  id int(11) NOT NULL auto_increment,
  name varchar(60) NOT NULL default '',
  class_id tinyint(1) NOT NULL default '0',
  parent int(11) NOT NULL default '-1',
  PRIMARY KEY  (id),
  KEY name (name)
) DEFAULT CHARSET=utf8;

CREATE TABLE 0_chart_master (
  account_code varchar(11) NOT NULL default '',
  account_code2 varchar(11) default '',
  account_name varchar(60) NOT NULL default '',
  account_type int(11) NOT NULL default '0',
  tax_code int(11) NOT NULL default '0',
  PRIMARY KEY  (account_code),
  KEY account_code (account_code),
  KEY account_name (account_name)
) DEFAULT CHARSET=utf8;


INSERT INTO `0_chart_class` VALUES(1, 'Assets', 1);
INSERT INTO `0_chart_class` VALUES(2, 'Liabilities', 1);
INSERT INTO `0_chart_class` VALUES(3, 'Income', 0);
INSERT INTO `0_chart_class` VALUES(4, 'Costs', 0);

--
-- Dumping data for table `0_chart_master`
--
INSERT INTO `0_chart_types` VALUES ('1', 'Immaterielle eiendeler', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1000', '', 'Forskning og utvikling', '1', '0');
INSERT INTO `0_chart_master` VALUES ('1030', '', 'Patenter', '1', '0');
INSERT INTO `0_chart_master` VALUES ('1040', '', 'Lisenser', '1', '0');
INSERT INTO `0_chart_master` VALUES ('1050', '', 'Varemerker', '1', '0');
INSERT INTO `0_chart_master` VALUES ('1060', '', 'Andre rettigheter', '1', '0');
INSERT INTO `0_chart_master` VALUES ('1070', '', 'Utsatt skattefordel', '1', '0');
INSERT INTO `0_chart_master` VALUES ('1080', '', 'Goodwill', '1', '0');
INSERT INTO `0_chart_types` VALUES ('2', 'Varige driftsmidler', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1100', '', 'Bygninger', '2', '0');
INSERT INTO `0_chart_master` VALUES ('1120', '', 'Bygningsmessige anlegg', '2', '0');
INSERT INTO `0_chart_master` VALUES ('1140', '', 'Jord- og skogbrukseiendommer', '2', '0');
INSERT INTO `0_chart_master` VALUES ('1150', '', 'Tomter og andre grunnarealer', '2', '0');
INSERT INTO `0_chart_types` VALUES ('3', 'Transportmidler, inventar, maskiner o.l.', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1200', '', 'Maskiner og anlegg', '3', '0');
INSERT INTO `0_chart_master` VALUES ('1210', '', 'Maskiner og anlegg under utførelse', '3', '0');
INSERT INTO `0_chart_master` VALUES ('1230', '', 'Biler', '3', '0');
INSERT INTO `0_chart_master` VALUES ('1240', '', 'Andre transportmidler', '3', '0');
INSERT INTO `0_chart_master` VALUES ('1250', '', 'Inventar', '3', '0');
INSERT INTO `0_chart_master` VALUES ('1260', '', 'Fast bygningsinventar med annen avskrivning', '3', '0');
INSERT INTO `0_chart_master` VALUES ('1270', '', 'Verktøy mv.', '3', '0');
INSERT INTO `0_chart_master` VALUES ('1280', '', 'Kontormaskiner', '3', '0');
INSERT INTO `0_chart_types` VALUES ('4', 'Finansielle anleggsmidler', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1300', '', 'Investeringer i datterselskaper', '4', '0');
INSERT INTO `0_chart_master` VALUES ('1350', '', 'Investeringer i aksjer og andeler', '4', '0');
INSERT INTO `0_chart_master` VALUES ('1360', '', 'Obligasjoner', '4', '0');
INSERT INTO `0_chart_master` VALUES ('1370', '', 'Fordringer på eiere, styremedlemmer mv.', '4', '0');
INSERT INTO `0_chart_master` VALUES ('1380', '', 'Fordringer på ansatte', '4', '0');
INSERT INTO `0_chart_master` VALUES ('1390', '', 'Andre langsiktige fordringer', '4', '0');
INSERT INTO `0_chart_types` VALUES ('5', 'Varer', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1400', '', 'Råvarer og innkjøpte halvfabrikata', '5', '0');
INSERT INTO `0_chart_master` VALUES ('1420', '', 'Varer under tilvirkning', '5', '0');
INSERT INTO `0_chart_master` VALUES ('1440', '', 'Ferdige egentilvirkede varer', '5', '0');
INSERT INTO `0_chart_master` VALUES ('1460', '', 'Innkjøpte varer for videresalg', '5', '0');
INSERT INTO `0_chart_master` VALUES ('1480', '', 'Forskuddsbetaling til leverandører', '5', '0');
INSERT INTO `0_chart_types` VALUES ('6', 'Fordringer', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1500', '', 'Kundefordringer', '6', '0');
INSERT INTO `0_chart_master` VALUES ('1520', '', 'Andre kortsiktige fordringer', '6', '0');
INSERT INTO `0_chart_master` VALUES ('1530', '', 'Opptjente, ikke fakturerte driftsinntekter', '6', '0');
INSERT INTO `0_chart_master` VALUES ('1570', '', 'Andre kortsiktige fordringer', '6', '0');
INSERT INTO `0_chart_master` VALUES ('1580', '', 'Avsetning tap på fordringer', '6', '0');
INSERT INTO `0_chart_types` VALUES ('7', 'Andre fordringer', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1700', '', 'Forskuddsbetalt leie', '7', '0');
INSERT INTO `0_chart_master` VALUES ('1710', '', 'Forskuddsbetalt rente', '7', '0');
INSERT INTO `0_chart_master` VALUES ('1720', '', 'Forskuddsbetalt lønn', '7', '0');
INSERT INTO `0_chart_master` VALUES ('1750', '', 'Påløpte leieinntekter', '7', '0');
INSERT INTO `0_chart_master` VALUES ('1760', '', 'Påløpte renteinntekter', '7', '0');
INSERT INTO `0_chart_master` VALUES ('1780', '', 'Krav på innbetaling av selskapskapital', '7', '0');
INSERT INTO `0_chart_types` VALUES ('8', 'Investeringer', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1800', '', 'Aksjer & andeler i foretak i samme kons.', '8', '0');
INSERT INTO `0_chart_master` VALUES ('1810', '', 'Markesdbaserte aksjer', '8', '0');
INSERT INTO `0_chart_master` VALUES ('1820', '', 'Andre aksjer', '8', '0');
INSERT INTO `0_chart_master` VALUES ('1830', '', 'Markedsbaserte obligasjoner', '8', '0');
INSERT INTO `0_chart_master` VALUES ('1840', '', 'Andre obligasjoner', '8', '0');
INSERT INTO `0_chart_master` VALUES ('1850', '', 'Markedsbaserte sertifikater', '8', '0');
INSERT INTO `0_chart_master` VALUES ('1860', '', 'Andre sertifikater', '8', '0');
INSERT INTO `0_chart_master` VALUES ('1880', '', 'Andre finansielle instrumenter', '8', '0');
INSERT INTO `0_chart_types` VALUES ('9', 'Bankinnskudd, kontanter o.l.', '1', '-1');
INSERT INTO `0_chart_master` VALUES ('1900', '', 'Kontanter', '9', '0');
INSERT INTO `0_chart_master` VALUES ('1910', '', 'Kasse', '9', '0');
INSERT INTO `0_chart_master` VALUES ('1920', '', 'Bankinnskudd', '9', '0');
INSERT INTO `0_chart_master` VALUES ('1950', '', 'Bankinnskudd for skattetrekk', '9', '0');
INSERT INTO `0_chart_types` VALUES ('10', 'Egenkapital', '2', '-1');
INSERT INTO `0_chart_master` VALUES ('2000', '', 'Aksjekapital', '10', '0');
INSERT INTO `0_chart_master` VALUES ('2010', '', 'Egne aksjer', '10', '0');
INSERT INTO `0_chart_master` VALUES ('2020', '', 'Overkursfond', '10', '0');
INSERT INTO `0_chart_master` VALUES ('2040', '', 'Fond for vurderingsforskjeller', '10', '0');
INSERT INTO `0_chart_master` VALUES ('2050', '', 'Annen egenkapital', '10', '0');
INSERT INTO `0_chart_master` VALUES ('2080', '', 'Udisponert overskudd', '10', '0');
INSERT INTO `0_chart_master` VALUES ('2090', '', 'Udekket tap', '10', '0');
INSERT INTO `0_chart_types` VALUES ('11', 'Avsetninger for forpliktelser', '2', '-1');
INSERT INTO `0_chart_master` VALUES ('2100', '', 'Pensjonsforpliktelser', '11', '0');
INSERT INTO `0_chart_master` VALUES ('2120', '', 'Utsatt skatt', '11', '0');
INSERT INTO `0_chart_master` VALUES ('2140', '', 'Avsetn. for garanti- & serviceforpl.', '11', '0');
INSERT INTO `0_chart_master` VALUES ('2180', '', 'Andre avsetninger for forpiktelser', '11', '0');
INSERT INTO `0_chart_types` VALUES ('12', 'Annen langsiktig gjeld', '2', '-1');
INSERT INTO `0_chart_master` VALUES ('2200', '', 'Konvertible lån', '12', '0');
INSERT INTO `0_chart_master` VALUES ('2210', '', 'Obligsjonslån', '12', '0');
INSERT INTO `0_chart_master` VALUES ('2220', '', 'Gjeld til kredittinstitusjoner', '12', '0');
INSERT INTO `0_chart_master` VALUES ('2240', '', 'Pantelån', '12', '0');
INSERT INTO `0_chart_master` VALUES ('2260', '', 'Gjeld til selskap i samme konsern', '12', '0');
INSERT INTO `0_chart_master` VALUES ('2270', '', 'Andre valutalån', '12', '0');
INSERT INTO `0_chart_types` VALUES ('13', 'Kortsiktig gjeld', '2', '-1');
INSERT INTO `0_chart_master` VALUES ('2300', '', 'Konvertible lån', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2320', '', 'Sertifikatlån', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2340', '', 'Andre valutalån', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2360', '', 'Byggelån', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2380', '', 'Kassakreditt', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2400', '', 'Leverandørgjeld', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2500', '', 'Avsatt betalbar skatt', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2510', '', 'Skattebetaling', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2600', '', 'Skattetrekk', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2620', '', 'Påleggstrekk', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2630', '', 'Bidragstrekk', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2640', '', 'Trygdetrekk', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2650', '', 'Forsikringstrekk', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2660', '', 'Fagforeningstrekk', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2690', '', 'Andre trekk', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2710', '', 'Utgående 24% mva', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2715', '', 'Utgående 12% mva', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2717', '', 'Beregnet avgift utlandet', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2720', '', 'Inngående 24% mva', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2725', '', 'Inngående 12% mva', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2745', '', 'Grunnlag 1 tjenester utlandet', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2746', '', 'Grunnlag 2 tjenester utlandet', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2750', '', 'Oppgjørskonto merverdiavgift', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2770', '', 'Påløpt arbeidsgiveravgift', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2780', '', 'Skyldig arbeidsgiveravgift', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2781', '', 'Arb.giv.avg. pål. feriep.', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2800', '', 'Avsatt utbytte', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2900', '', 'Forskudd fra kunder', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2910', '', 'Skyldig lønn', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2920', '', 'Skyldig feriepenger', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2930', '', 'Gjeld til ansatte og aksjonærer', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2950', '', 'Påløpte renter', '13', '0');
INSERT INTO `0_chart_master` VALUES ('2960', '', 'Påløpte kostn. og forskuddsbet. inskudd', '13', '0');
INSERT INTO `0_chart_types` VALUES ('14', 'Salgs- og driftsinntekter', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('3010', '', 'Salgsinntekter, 24% mva', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3019', '', 'Frakt', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3020', '', 'Salgsinntekter, 12% mva', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3060', '', 'Uttak av varer', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3080', '', 'Rabatter og andre salgsinntektsreduksjon', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3099', '', 'Miljøavgift', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3110', '', 'Salgsinntekter, avgiftsfrie', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3160', '', 'Uttak av varer', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3180', '', 'Rabatter og andre salgsinntektsreduksjon', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3300', '', 'Spes. offent. avg. tilvirk./solgte varer', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3400', '', 'Spes. offent. avg. tilvirk./solgte varer', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3440', '', 'Spes. offentlige tilskudd for tjenester', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3500', '', 'Uopptjente inntekter garanti', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3510', '', 'Uopptjente inntekter service', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3600', '', 'Leieinntekter fast eiendom', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3610', '', 'Leieinntekter andre varige driftsmidler', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3620', '', 'Andre leieinntekter', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3700', '', 'Provisjonsinntekter', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3800', '', 'Gevinst ved avgang av anleggsmidler', '14', '0');
INSERT INTO `0_chart_master` VALUES ('3900', '', 'Andre driftsrelaterte inntekter', '14', '0');
INSERT INTO `0_chart_types` VALUES ('15', 'Varekostnad', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('4010', '', 'Innkjøp varer, avgiftspliktig 24% mva', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4020', '', 'Innkjøp varer, avgiftspliktig 12% mva', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4060', '', 'Innkjøpsprisreduksjoner', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4070', '', 'Frakt, toll og spedisjon', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4090', '', 'Beholdningsendring', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4110', '', 'Innkjøp varer, avgiftsfritt', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4160', '', 'Frakt, toll og spedisjon', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4170', '', 'Frakt, toll og spedisjon, avgiftsfritt', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4180', '', 'Innkjøpsprisreduksjoner', '15', '0');
INSERT INTO `0_chart_master` VALUES ('4190', '', 'Beholdningsendring', '15', '0');
INSERT INTO `0_chart_types` VALUES ('16', 'Varer for videresalg', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('4310', '', 'Innkjøp av varer for videresalg, 24% mva', '16', '0');
INSERT INTO `0_chart_master` VALUES ('4320', '', 'Innkjøp av varer for videresalg, 12% mva', '16', '0');
INSERT INTO `0_chart_master` VALUES ('4360', '', 'Frakt, toll m.m. vedr. innkjøp av varer for videresalg', '16', '0');
INSERT INTO `0_chart_master` VALUES ('4370', '', 'Rabatter m.m. vedr. innkjøp av varer for videresalg', '16', '0');
INSERT INTO `0_chart_master` VALUES ('4380', '', 'Varekostnad', '16', '0');
INSERT INTO `0_chart_master` VALUES ('4390', '', 'Beholdningsendring varer for videresalg', '16', '0');
INSERT INTO `0_chart_types` VALUES ('17', 'Lønnskostnader', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('5010', '', 'Faste lønninger', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5090', '', 'Periodiseringskonto lønn', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5190', '', 'Påløpne feriepenger', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5210', '', 'Fri bil', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5220', '', 'Fri telefon', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5230', '', 'Fri avis', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5240', '', 'Fri losji og bolig', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5250', '', 'Rentefordel', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5260', '', 'Smusstillegg', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5280', '', 'Andre fordeler i arbeidsforhold', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5291', '', 'Motkonto for gruppe 52', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5330', '', 'Godtgj. til styre- og bedriftsforsamling', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5410', '', 'Arbeidsgiveravgift', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5411', '', 'Arb.giv.avg. pål. feriep.', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5420', '', 'Innberetningspliktige pensjonskostnader', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5430', '', 'Premie pensjonsordning', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5500', '', 'Andre kostnadsgodtgjørelser', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5510', '', 'Overtidsmat etter regning', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5520', '', 'Kantinekostnader', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5800', '', 'Refusjon av sykepenger', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5820', '', 'Refusjon av arbeidsgiveravgift', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5920', '', 'Yrkesskadeforsikring', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5930', '', 'Andre ikke arb.giv.avg.pliktige forsikr.', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5950', '', 'Personalforsikring', '17', '0');
INSERT INTO `0_chart_master` VALUES ('5960', '', 'Gaver til ansatte', '17', '0');
INSERT INTO `0_chart_types` VALUES ('18', 'Andre driftskostnader, av- og nedskrivninger', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('6000', '', 'Avskrivning på bygn. & annen fast eiend.', '18', '0');
INSERT INTO `0_chart_master` VALUES ('6010', '', 'Avskrivning på transportmidler, maskiner', '18', '0');
INSERT INTO `0_chart_master` VALUES ('6020', '', 'Avskrivning på immaterielle eiendeler', '18', '0');
INSERT INTO `0_chart_master` VALUES ('6050', '', 'Nedskr. varige driftsmidl. & imat. eiend', '18', '0');
INSERT INTO `0_chart_master` VALUES ('6100', '', 'Frakter, transportkostnader og forsikring', '18', '0');
INSERT INTO `0_chart_master` VALUES ('6110', '', 'Toll og spedisjonskostnader ved forsend', '18', '0');
INSERT INTO `0_chart_types` VALUES ('19', 'Energi, brensel o.l. vedr. produksjon', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('6200', '', 'Elektrisitet', '19', '0');
INSERT INTO `0_chart_master` VALUES ('6260', '', 'Vann', '19', '0');
INSERT INTO `0_chart_types` VALUES ('20', 'Kostnader. vedr. lokaler', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('6300', '', 'Leie lokaler', '20', '0');
INSERT INTO `0_chart_master` VALUES ('6320', '', 'Renovasjon, vann, avløp mv.', '20', '0');
INSERT INTO `0_chart_master` VALUES ('6340', '', 'Lys, varme', '20', '0');
INSERT INTO `0_chart_master` VALUES ('6360', '', 'Renhold', '20', '0');
INSERT INTO `0_chart_types` VALUES ('21', 'Leie av maskiner, inventar o.l.', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('6400', '', 'Leie av driftsmidler', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6430', '', 'Leie andre kontormaskiner', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6540', '', 'Inventar', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6550', '', 'Driftsmaterialer', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6560', '', 'Rekvisita', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6570', '', 'Arbeidsklær og verneutstyr', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6600', '', 'Reparasjoner og vedlikehold bygninger', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6620', '', 'Reparasjoner og vedlikehold utstyr', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6700', '', 'Revisjonshonorar', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6720', '', 'Honorar for økonomisk & juridisk bistand', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6750', '', 'Honorar regnskapsfører', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6800', '', 'Kontorrekvisita', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6820', '', 'Trykksaker', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6840', '', 'Aviser, tidsskrifter, bøker mv.', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6860', '', 'Møter, kurs, oppdatering mv.', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6900', '', 'Telefon', '21', '0');
INSERT INTO `0_chart_master` VALUES ('6940', '', 'Porto', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7000', '', 'Drivstoff', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7020', '', 'Vedlikehold', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7040', '', 'Forsikringer', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7100', '', 'Bilgodtgjørelse, oppgavepliktig', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7105', '', 'Øreavrunding', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7130', '', 'Reisekostnader, oppgavepliktige', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7140', '', 'Reisekostnader, ikke oppgavepliktig', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7150', '', 'Diettkostnader, oppgaveplikig', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7160', '', 'Diettkostnader, ikke oppgavepliktig', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7200', '', 'Provisjonskostnader, oppgavepliktige', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7210', '', 'Provisjonskostnader, ikke oppgavepliktig', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7300', '', 'Salgskostnader', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7320', '', 'Reklamekostnader', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7350', '', 'Representasjon, fradragsberettiget', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7360', '', 'Representasjon, ikke fradragsberettiget', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7400', '', 'Kontingenter og gaver', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7500', '', 'Forsikringspremier', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7550', '', 'Garanti- og servicekostnader', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7600', '', 'Lisenesavgifter og royalties', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7700', '', 'Styre- og bedriftsforsamlingsmøter', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7710', '', 'Generalforsamling', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7730', '', 'Kostnader ved egne aksjer', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7750', '', 'Eiendoms- og festeavgift', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7770', '', 'Bank og kortgebyrer', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7800', '', 'Tap ved avgang anleggsmidler', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7820', '', 'Innkommet på tidligere nedskrevne fordri', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7830', '', 'Tap på fordringer', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7850', '', 'Tap pga. brannskade', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7860', '', 'Tap på kontrakter', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7900', '', 'Beholdningsendring anlegg under utførels', '21', '0');
INSERT INTO `0_chart_master` VALUES ('7990', '', 'Andre driftskostnader', '21', '0');
INSERT INTO `0_chart_types` VALUES ('22', 'Finansinntekter og -kostnader, skatter, m.m.', '3', '-1');
INSERT INTO `0_chart_master` VALUES ('8000', '', 'Inntekter på investeringer i datterselskap', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8040', '', 'Renteinntekter, skattefrie', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8050', '', 'Annen renteinntekt', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8060', '', 'Purregebyr, kunder', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8070', '', 'Renteinntekter, kunder', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8080', '', 'Agio gevinst', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8090', '', 'Andre finansinntekter', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8100', '', 'Verdired. av markedsbas.finans. omløps.', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8110', '', 'Nedskrivn. av andre finansielle omløps.', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8120', '', 'Nedskrivning av finansielle anleggsmidl.', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8140', '', 'Rentekostnader, ikke fradragsberettigede', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8150', '', 'Annen rentekostnad', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8160', '', 'Purregebyr. leverandør', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8180', '', 'Agio tap', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8300', '', 'Betalbar skatt', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8320', '', 'Utsatt skatt', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8350', '', 'Skattekostnad', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8600', '', 'Betalbar skatt', '22', '0');
INSERT INTO `0_chart_master` VALUES ('8620', '', 'Utsatt skatt', '22', '0');
INSERT INTO `0_chart_types` VALUES ('23', 'Fond for vurderingsforskjeller', '4', '-1');
INSERT INTO `0_chart_master` VALUES ('8800', '', 'Årsresultat', '23', '0');
INSERT INTO `0_chart_master` VALUES ('8900', '', 'Overføringer fond for vurderingsforskjel', '23', '0');
INSERT INTO `0_chart_types` VALUES ('24', 'Utbytte', '4', '-1');
INSERT INTO `0_chart_master` VALUES ('8920', '', 'Avsatt utbytte/renter på grunnfondsbevis', '24', '0');
INSERT INTO `0_chart_types` VALUES ('25', 'Konsernbidrag', '4', '-1');
INSERT INTO `0_chart_master` VALUES ('8930', '', 'Konsernbidrag', '25', '0');
INSERT INTO `0_chart_types` VALUES ('26', 'Annen egenkapital', '4', '-1');
INSERT INTO `0_chart_master` VALUES ('8910', '', 'Overføringer felleseid andelskapital for', '26', '0');
INSERT INTO `0_chart_master` VALUES ('8940', '', 'Aksjonærbidrag', '26', '0');
INSERT INTO `0_chart_master` VALUES ('8950', '', 'Fondsemisjon', '26', '0');
INSERT INTO `0_chart_master` VALUES ('8960', '', 'Overføringer annen egenkapital', '26', '0');
INSERT INTO `0_chart_master` VALUES ('8980', '', 'Avsatt til fri egenkapital', '26', '0');
INSERT INTO `0_chart_master` VALUES ('8990', '', 'Udekket tap', '26', '0');

CREATE TABLE accountsection (
  sectionid int(11) NOT NULL DEFAULT '0',
  sectionname text NOT NULL,
  PRIMARY KEY (sectionid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE accountgroups (
  groupname char(30) NOT NULL DEFAULT '',
  sectioninaccounts int(11) NOT NULL DEFAULT '0',
  pandl tinyint(4) NOT NULL DEFAULT '1',
  sequenceintb smallint(6) NOT NULL DEFAULT '0',
  parentgroupname varchar(30) NOT NULL,
  PRIMARY KEY (groupname),
  KEY SequenceInTB (sequenceintb),
  KEY sectioninaccounts (sectioninaccounts),
  KEY parentgroupname (parentgroupname),
  CONSTRAINT accountgroups_ibfk_1 FOREIGN KEY (sectioninaccounts) REFERENCES accountsection (sectionid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chartmaster (
  accountcode varchar(20) NOT NULL DEFAULT '0',
  accountname char(50) NOT NULL DEFAULT '',
  group_ char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (accountcode),
  KEY AccountName (accountname),
  KEY Group_ (group_),
  CONSTRAINT chartmaster_ibfk_1 FOREIGN KEY (group_) REFERENCES accountgroups (groupname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO accountsection (SELECT cid, class_name FROM 0_chart_class);
INSERT INTO accountgroups (SELECT name, class_id, (SELECT balance_sheet FROM 0_chart_class WHERE 0_chart_class.cid=0_chart_types.class_id), id, parent FROM 0_chart_types);
UPDATE accountgroups SET parentgroupname='' WHERE parentgroupname=-1;

INSERT INTO chartmaster (SELECT account_code, account_name, (SELECT groupname FROM accountgroups WHERE accountgroups.sequenceintb=0_chart_master.account_type) FROM 0_chart_master);

DROP TABLE 0_chart_class;
DROP TABLE 0_chart_types;
DROP TABLE 0_chart_master;
