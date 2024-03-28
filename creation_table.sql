create table utilisateur(
    nom         varchar(20),
    prenom      varchar(20),
    email       varchar(100) NOT NULL,
    pseudonyme  varchar(20),
    description_utilisateur  varchar(400),
    primary key (pseudonyme),
    constraint chk_email check (email like '%@%')
);

create table abonnement(
    pseudonyme  varchar(20),
    abonne_a    varchar(20),
    primary key (pseudonyme, abonne_a),
    foreign key (pseudonyme) references utilisateur(pseudonyme),
    foreign key (abonne_a) references utilisateur(pseudonyme)
);

create table recette(
    id      number(3),
    pseudonyme      varchar(20) not null,
    date_mise_en_ligne date not null,
    nom_recette     varchar(100) unique,
    chemin_photo    varchar(100),
    description     varchar(400),
    primary key (id),
    foreign key (pseudonyme) references utilisateur(pseudonyme)
);

create table ingredient(
    nom_ingredient  varchar(50),
    description     varchar(50),
    prix_kilo_ou_litre float,
    primary key (nom_ingredient),
    constraint chk_prix check (prix_kilo_ou_litre>=0)
);

create table faite_avec(
    nom_ingredient  varchar(50),
    nom_recette     varchar(100),
    numero_etape    number(3),
    quantite        number(3),
    unite           varchar(20),
    description_etape   varchar(600),
    primary key (nom_recette, numero_etape, description_etape),
    foreign key (nom_recette) references recette(nom_recette),
    constraint chk_quantite check (quantite>=0),
    constraint chk_etape check (numero_etape>0)
);

create table commentaire(
    pseudonyme  varchar(20),
    id_recette   number(3),
    date_mise_en_ligne  date,
    commentaire varchar(600),
    primary key (pseudonyme, id_recette, date_mise_en_ligne, commentaire),
    foreign key (pseudonyme) references utilisateur(pseudonyme),
    foreign key (id_recette) references recette(id)
);

create table aime(
    pseudonyme  varchar(20),
    id_recette  number(3),
    date_mise_en_ligne  date,
    primary key (pseudonyme, id_recette, date_mise_en_ligne),
    foreign key (pseudonyme) references utilisateur(pseudonyme),
    foreign key (id_recette) references recette(id)
);

insert into utilisateur values ('Dulin', 'Monique', 'moniquedulin@jourrapide.com', 'Aptir1980', '');
insert into utilisateur values ('Pomerleau', 'André', 'andrepomerleau@dayrep.com', 'Haverfice', '');
insert into utilisateur values ('Thiériauld', 'Leone', 'leonethiérauld@teleworm.us', 'Malactind', '');
insert into utilisateur values ('D''Avis', 'Théophile', 'theophiledavis@dayrep.com', 'Eveithe56', 'Théophile D''Avis, 24ans');
insert into utilisateur values ('Boulé', 'Zara', 'zaraboule@armyspy.com', 'Accoure', '');
insert into utilisateur values ('Léveillé', 'Landers', 'landerslevelle@rhyta.com', 'Owbet1963', 'Homme, couleur préféré: vert.');
insert into utilisateur values ('Godin', 'Holly', 'hollygodin@teleworm.us', 'Othoose56', '67ans, tropical zodiac: Aquarius');
insert into utilisateur values ('Maheu', 'Victorine', 'victorinemaheu@teleworm.us', 'Riotied', 'LeftChat.fr');
insert into utilisateur values ('Lagacé', 'Porter', 'porterlagace@jourrapide.com', 'Triated', 'Travail chez Nectars Matrix Design');
insert into utilisateur values ('Charlebois', 'Normand', 'normandcharlebois@rhyta.com', 'Wooduousted', 'Apple for ever');
insert into utilisateur values ('Boutot', 'Constance', 'constanceboutot@armyspy.com', 'Carmseepan', '');
insert into utilisateur values ('Casgrain', 'Aurore', 'aurorecasgrain@teleworm.us', 'Hene1991', 'Cuisinière par passion');
insert into utilisateur values ('Lachapelle', 'Matthieu', 'matthieulachapelle@jourrapide.com', 'Bullithein', '74 ans');
insert into utilisateur values ('Plante', 'Armina', 'arminaplante@rhyta.com', 'Wassible', '');
insert into utilisateur values ('Huppé', 'Normand', 'huppenormand@jourrapide.com', 'Formaded', '76');
insert into utilisateur values ('Sicard', 'Garland', 'garlandsicard@dayrep.com', 'Pround', 'Société: Tape World');
insert into utilisateur values ('Rivard', 'Octave', 'octaverivard@jourrapide.com', 'Uniscomen', 'StartupStores.fr');
insert into utilisateur values ('Sauriol', 'Harbin', 'harbinsauriol@dayrep.com', 'Sonarmiss', '');
insert into utilisateur values ('Édouard', 'Fifi', 'fifiedouard@rhyta.com', 'Moste1964', 'Flight service specialist');
insert into utilisateur values ('Goddu', 'Iven', 'ivengoddu@rhyta.com', 'Upoctin', 'Physical therapist');
insert into utilisateur values ('Carrière', 'Florus', 'floruscarriere@jourrapide.com', 'Bose1982', '');
insert into utilisateur values ('Beaulieu', 'Olympia', 'olympiabeaulieu@rhyta.com', 'Fincureplarl', 'ThemeTrip.fr');
insert into utilisateur values ('Chicoine', 'Joséphine', 'josephinechicoine@dayrep.com', 'Alky1995', '');
insert into utilisateur values ('Lereau', 'Margaux', 'margauxlereau@armyspy.com', 'Panytherry', '');
insert into utilisateur values ('Chauvin', 'Clémence', 'clemencechauvin@rhyta.com', 'Nabing', 'Femme');
insert into utilisateur values ('Fluet', 'Benjamin', 'benjaminfluet@jourrapide.com', 'Sweld1954', '');
insert into utilisateur values ('Dupuis', 'Faustin', 'dupuisfaustin@armyspy.com', 'Phrovis', '');
insert into utilisateur values ('Ayot', 'Isaac', 'isaacayot@dayrep.com', 'Stropeten', 'Homme, 20 ans');
insert into utilisateur values ('Baril', 'Paverell', 'pacerellbaril@teleworm.us', 'Thervin', 'GamingCounty.fr');
insert into utilisateur values ('Quiron', 'Pascaline', 'pascalinequiron@jourrapide.com', 'Eard1982', '12/11/82');
insert into utilisateur values ('Deniger', 'Avice', 'avidedeniger@jourrapide.com', 'Withild', 'DomainingBuzz.fr');
insert into utilisateur values ('Grenier', 'Faye', 'fayegrenier@armyspy.com', 'Allecomead', 'Scorpion');
insert into utilisateur values ('Cantin', 'Aimée', 'aimmecantin@armyspy.com', 'Brible', 'Alpha Beta Corp');
insert into utilisateur values ('Paimboeuf', 'Warrane', 'warranepaimboeuf@armyrspy.com', 'Witied', '');
insert into utilisateur values ('Poisson', 'Manville', 'manvillepoisson@rhyta.com', 'Uposurs45', 'J''adore le poisson!');
insert into utilisateur values ('Bussière', 'Musette', 'musettebussière@rhyta.com', 'Conore', '');
insert into utilisateur values ('Levasseur', 'Alexis', 'alexislevasseur@dayrep.com', 'Uplive', '');
insert into utilisateur values ('Courtois', 'Patricia', 'patriciacourtois@jourrapide.com', 'Therling', 'Compagnie : Realty Solution');
insert into utilisateur values ('Marois', 'Amélie', 'ameliemarois@rhyta.com', 'Sonsise', '28ans');

insert into abonnement values ('Aptir1980', 'Haverfice');
insert into abonnement values ('Aptir1980', 'Accoure');
insert into abonnement values ('Aptir1980', 'Owbet1963');
insert into abonnement values ('Aptir1980', 'Othoose56');
insert into abonnement values ('Aptir1980', 'Wooduousted');
insert into abonnement values ('Aptir1980', 'Hene1991');
insert into abonnement values ('Aptir1980', 'Bullithein');
insert into abonnement values ('Aptir1980', 'Sonarmiss');
insert into abonnement values ('Aptir1980', 'Nabing');
insert into abonnement values ('Aptir1980', 'Thervin');
insert into abonnement values ('Haverfice', 'Alky1995');
insert into abonnement values ('Haverfice', 'Withild');
insert into abonnement values ('Haverfice', 'Conore');
insert into abonnement values ('Haverfice', 'Uplive');
insert into abonnement values ('Malactind', 'Aptir1980');
insert into abonnement values ('Malactind', 'Haverfice');
insert into abonnement values ('Malactind', 'Accoure');
insert into abonnement values ('Malactind', 'Owbet1963');
insert into abonnement values ('Malactind', 'Othoose56');
insert into abonnement values ('Malactind', 'Riotied');
insert into abonnement values ('Malactind', 'Wooduousted');
insert into abonnement values ('Malactind', 'Carmseepan');
insert into abonnement values ('Eveithe56', 'Sonsise');
insert into abonnement values ('Eveithe56', 'Therling');
insert into abonnement values ('Eveithe56', 'Uplive');
insert into abonnement values ('Eveithe56', 'Uposurs45');
insert into abonnement values ('Eveithe56', 'Witied');
insert into abonnement values ('Eveithe56', 'Brible');
insert into abonnement values ('Eveithe56', 'Allecomead');
insert into abonnement values ('Eveithe56', 'Withild');
insert into abonnement values ('Eveithe56', 'Eard1982');
insert into abonnement values ('Eveithe56', 'Thervin');
insert into abonnement values ('Accoure', 'Stropeten');
insert into abonnement values ('Accoure', 'Sweld1954');
insert into abonnement values ('Accoure', 'Nabing');
insert into abonnement values ('Accoure', 'Alky1995');
insert into abonnement values ('Owbet1963', 'Hene1991');
insert into abonnement values ('Owbet1963', 'Carmseepan');
insert into abonnement values ('Owbet1963', 'Wassible');
insert into abonnement values ('Othoose56', 'Riotied');
insert into abonnement values ('Othoose56', 'Owbet1963');
insert into abonnement values ('Othoose56', 'Eveithe56');
insert into abonnement values ('Othoose56', 'Haverfice');
insert into abonnement values ('Othoose56', 'Stropeten');
insert into abonnement values ('Riotied', 'Accoure');
insert into abonnement values ('Riotied', 'Hene1991');
insert into abonnement values ('Triated', 'Hene1991');
insert into abonnement values ('Triated', 'Haverfice');
insert into abonnement values ('Triated', 'Bose1982');
insert into abonnement values ('Triated', 'Phrovis');
insert into abonnement values ('Triated', 'Withild');
insert into abonnement values ('Wooduousted', 'Formaded');
insert into abonnement values ('Carmseepan', 'Nabing');
insert into abonnement values ('Carmseepan', 'Stropeten');
insert into abonnement values ('Carmseepan', 'Allecomead');
insert into abonnement values ('Wassible', 'Fincureplarl');
insert into abonnement values ('Wassible', 'Brible');
insert into abonnement values ('Wassible', 'Sonsise');
insert into abonnement values ('Wassible', 'Uplive');
insert into abonnement values ('Wassible', 'Therling');
insert into abonnement values ('Wassible', 'Malactind');
insert into abonnement values ('Formaded', 'Pround');
insert into abonnement values ('Formaded', 'Uniscomen');
insert into abonnement values ('Pround', 'Wassible');
insert into abonnement values ('Uniscomen', 'Pround');
insert into abonnement values ('Uniscomen', 'Wassible');
insert into abonnement values ('Uniscomen', 'Sweld1954');
insert into abonnement values ('Uniscomen', 'Phrovis');
insert into abonnement values ('Uniscomen', 'Withild');
insert into abonnement values ('Uniscomen', 'Brible');
insert into abonnement values ('Sonarmiss', 'Uniscomen');
insert into abonnement values ('Sonarmiss', 'Panytherry');
insert into abonnement values ('Moste1964', 'Conore');
insert into abonnement values ('Moste1964', 'Therling');
insert into abonnement values ('Moste1964', 'Eard1982');
insert into abonnement values ('Upoctin', 'Moste1964');
insert into abonnement values ('Bose1982', 'Brible');
insert into abonnement values ('Bose1982', 'Witied');
insert into abonnement values ('Bose1982', 'Uposurs45');
insert into abonnement values ('Bose1982', 'Uplive');
insert into abonnement values ('Fincureplarl', 'Nabing');
insert into abonnement values ('Alky1995', 'Panytherry');
insert into abonnement values ('Alky1995', 'Owbet1963');
insert into abonnement values ('Alky1995', 'Phrovis');
insert into abonnement values ('Panytherry', 'Alky1995');
insert into abonnement values ('Nabing', 'Alky1995');
insert into abonnement values ('Nabing', 'Owbet1963');
insert into abonnement values ('Nabing', 'Nabing');
insert into abonnement values ('Nabing', 'Uplive');
insert into abonnement values ('Sweld1954', 'Uplive');
insert into abonnement values ('Phrovis', 'Fincureplarl');
insert into abonnement values ('Phrovis', 'Sonarmiss');
insert into abonnement values ('Stropeten', 'Sonarmiss');
insert into abonnement values ('Thervin', 'Moste1964');
insert into abonnement values ('Thervin', 'Uniscomen');
insert into abonnement values ('Thervin', 'Hene1991');
insert into abonnement values ('Thervin', 'Upoctin');
insert into abonnement values ('Withild', 'Allecomead');
insert into abonnement values ('Withild', 'Witied');
insert into abonnement values ('Allecomead', 'Uplive');
insert into abonnement values ('Brible', 'Withild');
insert into abonnement values ('Brible', 'Stropeten');
insert into abonnement values ('Brible', 'Phrovis');
insert into abonnement values ('Brible', 'Nabing');
insert into abonnement values ('Brible', 'Panytherry');
insert into abonnement values ('Brible', 'Alky1995');
insert into abonnement values ('Brible', 'Upoctin');
insert into abonnement values ('Brible', 'Moste1964');
insert into abonnement values ('Brible', 'Uniscomen');
insert into abonnement values ('Brible', 'Formaded');
insert into abonnement values ('Brible', 'Wassible');
insert into abonnement values ('Witied', 'Accoure');
insert into abonnement values ('Witied', 'Malactind');
insert into abonnement values ('Uposurs45', 'Conore');
insert into abonnement values ('Uposurs45', 'Uplive');
insert into abonnement values ('Uposurs45', 'Sonsise');
insert into abonnement values ('Conore', 'Uposurs45');
insert into abonnement values ('Uplive', 'Uposurs45');
insert into abonnement values ('Uplive', 'Conore');
insert into abonnement values ('Uplive', 'Witied');
insert into abonnement values ('Uplive', 'Accoure');
insert into abonnement values ('Uplive', 'Wassible');
insert into abonnement values ('Sonsise', 'Uplive');
insert into abonnement values ('Sonsise', 'Sweld1954');
insert into abonnement values ('Sonsise', 'Wooduousted');
insert into abonnement values ('Sonsise', 'Eveithe56');
insert into abonnement values ('Sonsise', 'Accoure');
insert into abonnement values ('Sonsise', 'Owbet1963');
insert into abonnement values ('Sonsise', 'Othoose56');
insert into abonnement values ('Sonsise', 'Malactind');
insert into abonnement values ('Sonsise', 'Moste1964');

insert into recette values (100, 'Aptir1980', to_date('2022-01-08', 'yyyy-mm-dd'), 'Soupe de potimarron', '/dossier/photo/100', 'La soupe de potimarron est une soupe généralement liée préparée à partir d''une purée de potimarron.');
insert into recette values (101, 'Malactind', to_date('2022-01-19', 'yyyy-mm-dd'), 'Financiers chocolat Nestlé Dessert caramel', '', 'Le financier est un biscuit moelleux qui se compose de blancs d''oeufs, de beurre noisette, de poudre d''amandes et de sucre. ');
insert into recette values (102, 'Accoure', to_date('2022-01-26', 'yyyy-mm-dd'), '', '/dossier/photo/102', '');
insert into recette values (103, 'Alky1995', to_date('2022-01-30', 'yyyy-mm-dd'), 'Fondue de camembert', '', 'La fondue de camembert est probablement la plus facile (et certainement l''une des recettes les plus savoureuses) de fondue au fromage.');
insert into recette values (104, 'Alky1995', to_date('2022-02-12', 'yyyy-mm-dd'), '', '/dossier/photo/104', '');
insert into recette values (105, 'Wooduousted', to_date('2022-02-16', 'yyyy-mm-dd'), '', '/dossier/photo/105', '');
insert into recette values (106, 'Triated', to_date('2022-03-01', 'yyyy-mm-dd'), '', '/dossier/photo/106', '');
insert into recette values (107, 'Alky1995', to_date('2022-03-15', 'yyyy-mm-dd'), 'Oeufs à la coque', '', 'Un œuf à la coque ou œuf mollet au Canada est un œuf entier cuit dans sa coquille, de telle sorte que le blanc soit peu coagulé encore souple et le jaune coulant.');
insert into recette values (108, 'Malactind', to_date('2022-03-22', 'yyyy-mm-dd'), '', '/dossier/photo/108', '');
insert into recette values (109, 'Panytherry', to_date('2022-03-29', 'yyyy-mm-dd'), '', '/dossier/photo/109', '');
insert into recette values (110, 'Wassible', to_date('2022-04-02', 'yyyy-mm-dd'), 'Poulet au four simple et savoureux', '', 'Le bon poulet du dimanche qu''on aime :-) Aujourd''hui, on vous montre comment on prépare notre poulet rôti au four. Une recette simple et surtout sans âge !');
insert into recette values (111, 'Pround', to_date('2022-04-12', 'yyyy-mm-dd'), 'Hachis Parmentier', '', 'Le hachis Parmentier, ou hachis parmentier, est un plat à base de purée de pommes de terre et de viande de bœuf hachée.');
insert into recette values (112, 'Triated', to_date('2022-04-25', 'yyyy-mm-dd'), 'Samoussa rapide au boeuf', '', 'Découvrez la recette de Samoussa au boeuf à faire en 15 minutes. Hacher finement les oignons et l''ail et les faire revenir dans un peu d''huile.');
insert into recette values (113, 'Bullithein', to_date('2022-04-26', 'yyyy-mm-dd'), '', '/dossier/photo/113', '');
insert into recette values (114, 'Panytherry', to_date('2022-05-03', 'yyyy-mm-dd'), '', '/dossier/photo/114', '');
insert into recette values (115, 'Upoctin', to_date('2022-05-05', 'yyyy-mm-dd'), '', '/dossier/photo/115', '');
insert into recette values (116, 'Wassible', to_date('2022-05-10', 'yyyy-mm-dd'), '', '/dossier/photo/116', '');
insert into recette values (117, 'Hene1991', to_date('2022-05-29', 'yyyy-mm-dd'), '', '/dossier/photo/117', '');
insert into recette values (118, 'Malactind', to_date('2022-06-05', 'yyyy-mm-dd'), '', '/dossier/photo/118', '');
insert into recette values (119, 'Moste1964', to_date('2022-06-09', 'yyyy-mm-dd'), '', '/dossier/photo/119', '');
insert into recette values (120, 'Nabing', to_date('2022-06-15', 'yyyy-mm-dd'), '', '/dossier/photo/120', '');
insert into recette values (121, 'Nabing', to_date('2022-06-19', 'yyyy-mm-dd'), '', '/dossier/photo/121', '');
insert into recette values (122, 'Panytherry', to_date('2022-07-18', 'yyyy-mm-dd'), '', '/dossier/photo/122', '');
insert into recette values (123, 'Sonarmiss', to_date('2022-07-19', 'yyyy-mm-dd'), '', '/dossier/photo/123', '');
insert into recette values (124, 'Wooduousted', to_date('2022-07-25', 'yyyy-mm-dd'), '', '/dossier/photo/124', '');
insert into recette values (125, 'Carmseepan', to_date('2022-07-30', 'yyyy-mm-dd'), '', '/dossier/photo/125', '');
insert into recette values (126, 'Hene1991', to_date('2022-08-07', 'yyyy-mm-dd'), '', '/dossier/photo/126', '');
insert into recette values (127, 'Uniscomen', to_date('2022-08-09', 'yyyy-mm-dd'), '', '/dossier/photo/127', '');
insert into recette values (128, 'Fincureplarl', to_date('2022-08-17', 'yyyy-mm-dd'), '', '/dossier/photo/128', '');
insert into recette values (129, 'Pround', to_date('2022-08-22', 'yyyy-mm-dd'), '', '/dossier/photo/129', '');

insert into ingredient values ('sel', 'Assaisonnement', 1.00);
insert into ingredient values ('potimarron', 'Légume', 3.65);
insert into ingredient values ('ail', 'Légume', 4.00);
insert into ingredient values ('eau', 'Liquide', 0.004);
insert into ingredient values ('beurre', 'Matière grasse', 7.55);
insert into ingredient values ('chocolat', 'Friandise', 12.00);
insert into ingredient values ('amande en poudre', 'Céréale', 12.00);
insert into ingredient values ('blanc d''oeuf', 'Protéine', 4.20);
insert into ingredient values ('sucre', 'Assaisonnement', 1.30);
insert into ingredient values ('camembert dans une boîte en bois', 'Fromage', 20.00);
insert into ingredient values ('oeuf', 'Protéine', 4.20);
insert into ingredient values ('vinaigre', 'Liquide', 0.80);
insert into ingredient values ('pain', 'Céréale', 3.60);
insert into ingredient values ('poivre', 'Assaisonnement', 14.50);
insert into ingredient values ('gros sel', 'Assaisonnement', 1.00);
insert into ingredient values ('feuille de laurier', 'Assaisonnement', 20.00);
insert into ingredient values ('tomate cerise', 'Fruit', 6.00);
insert into ingredient values ('oignon', 'Légume', 2.00);
insert into ingredient values ('poulet fermier', 'Protéine', 10.00);
insert into ingredient values ('jus de citron', 'Liquide', 5.50);
insert into ingredient values ('bouillon de volaille', 'Liquide', 20.00);
insert into ingredient values ('parmesan', 'Fromage', 28.00);
insert into ingredient values ('jaune d''oeuf', 'Protéine', 4.20);
insert into ingredient values ('herbes de Provence', 'Assaisonnement', 30.00);
insert into ingredient values ('viande hachée', 'Protéine', 18.90);
insert into ingredient values ('purée', 'Légume', 4.59);
insert into ingredient values ('farine', 'Céréale', 0.56);
insert into ingredient values ('fromage rapé', 'Fromage', 10.00);
insert into ingredient values ('tomate', 'Fruit', 4.99);
insert into ingredient values ('huile de friture', 'Matière grasse', 4.00);
insert into ingredient values ('huile d''olive', 'Matière grasse', 22.90);
insert into ingredient values ('gingembre en poudre', 'Assaisonnement', 12.90);
insert into ingredient values ('curry', 'Assaisonnement', 13.50);
insert into ingredient values ('carotte', 'Légume', 0.66);
insert into ingredient values ('feuille de brick', 'Autre', 9.17);
insert into ingredient values ('boeuf haché', 'Protéine', 16.48);
insert into ingredient values ('sauce soja', 'Sauce', 8.00);

insert into faite_avec values ('potimarron', 'Soupe de potimarron', 1, 1, 'Kg', 'Couper le potimarron en morceau après avoir enlevé les pépin, mais dans l''avoir éplucher.');
insert into faite_avec values ('potimarron', 'Soupe de potimarron', 2, 1, 'Kg', 'Le mettre dans une casserole.');
insert into faite_avec values ('eau', 'Soupe de potimarron', 3, 0, '', 'Recouvrer d''eau sans dépasser la hauteur du potimarron et faire cuire à basse température.');
insert into faite_avec values ('ail', 'Soupe de potimarron', 4, 2, 'Gousse', 'Écrasé l''ail et l''ajouter en fin de cuisson.');
insert into faite_avec values ('sel', 'Soupe de potimarron', 5, 0, '', 'Ajouter en fin de cuisson.');
insert into faite_avec values ('', 'Soupe de potimarron', 6, 0, '', 'Mixer le tout.');
insert into faite_avec values ('', 'Soupe de potimarron', 7, 0, '', 'Servir chaud.');
insert into faite_avec values ('', 'Financiers chocolat Nestlé Dessert caramel', 1, 0, '', 'Préchauffez votre four à 160°C en mode traditionnel.');
insert into faite_avec values ('chocolat', 'Financiers chocolat Nestlé Dessert caramel', 2, 1, 'Tablette', 'Mettre le chocolat dans un récipient.');
insert into faite_avec values ('beurre', 'Financiers chocolat Nestlé Dessert caramel', 3, 80, 'G', 'Faire fondre le beurre avec le chocolat.');
insert into faite_avec values ('sucre', 'Financiers chocolat Nestlé Dessert caramel', 4, 40, 'G', 'Ajouter le sucre.');
insert into faite_avec values ('amande en poudre', 'Financiers chocolat Nestlé Dessert caramel', 5, 100, 'G', 'Ajouter la poudre d''amande.');
insert into faite_avec values ('blancs d''oeuf', 'Financiers chocolat Nestlé Dessert caramel', 6, 3, '', 'Ajouter les blancs d''oeuf.');
insert into faite_avec values ('', 'Financiers chocolat Nestlé Dessert caramel', 7, 0, '', 'Faites cuire 15 minutes. Laissez bien refroidir avant de démouler.');
insert into faite_avec values ('camembert dans une boîte en bois', 'Fondue de camembert', 1, 1, '', 'Il vous suffit d''oter l''emballage du camembert et de remettre celui-ci dans sa boite en bois en otant le couvercle (côté étiquette).');
insert into faite_avec values ('camembert dans une boîte en bois', 'Fondue de camembert', 2, 1, '', 'En été : Deposer le tout sur votre grill de barbecue... (sans flammes).');
insert into faite_avec values ('camembert dans une boîte en bois', 'Fondue de camembert', 3, 1, '', 'En hiver : Le déposer sur une plaque électrique position MINIMUM (1)...');
insert into faite_avec values ('', 'Fondue de camembert', 4, 0, '', 'Tout doucement, regarder votre camembert gonfler jusqu''à ce qu''il vous semble pret à éclater.');
insert into faite_avec values ('', 'Fondue de camembert', 5, 0, '', 'A la pointe d''un couteau tailler sur le dessus une croix.');
insert into faite_avec values ('', 'Fondue de camembert', 6, 0, '', 'Ouvrez et trempez y des morceaux de pains ou de pommes de terre (cuites au préalable).');
insert into faite_avec values ('oeuf', 'Oeufs à la coque', 1, 0, '', 'Pour réussir vos oeufs à la coque, suivez les 5 conseils suivants : Choisissez des oeufs extra frais et de taille similaire pour une cuisson homogène Sortez-les du réfrigérateur 1 heure avant de les cuire pour qu''ils soient à température ambiante');
insert into faite_avec values ('eau ', 'Oeufs à la coque', 2, 0, '', 'Mettre de l''eau à chauffer.');
insert into faite_avec values ('oeuf', 'Oeufs à la coque', 3, 0, '', 'Lorsque l''eau bout, plonger les oeufs dedans avec une cuillère et compter 3 minutes de cuisson avant de les sortir de l''eau.');
insert into faite_avec values ('vinaigre', 'Oeufs à la coque', 4, 0, '', 'Ajoutez un filet de vinaigre ou de jus de citron dans l''eau de cuisson afin d''éviter que l''oeuf se dilue dans l''eau si d''aventure la coquille se fêle');
insert into faite_avec values ('', 'Oeufs à la coque', 5, 0, '', 'Si vous ne les dégustez pas immédiatement, conservez-les dans une eau à 60°C.');
insert into faite_avec values ('pain', 'Oeufs à la coque', 6, 0, '', 'Accompagnez de mouillettes de pain.');
insert into faite_avec values ('sel', 'Oeufs à la coque', 7, 0, '', 'Puis salez légèrement, succès garanti !');
insert into faite_avec values ('', 'Poulet au four simple et savoureux', 1, 0, '', 'Préchauffer le four à 200°C (thermostat 6).');
insert into faite_avec values ('poulet fermier', 'Poulet au four simple et savoureux', 2, 2, 'Kg', 'Prenez le poulet.');
insert into faite_avec values ('ail', 'Poulet au four simple et savoureux', 3, 2, 'Gousse', 'Placer les a l''intérieurs du poulet.');
insert into faite_avec values ('feuille de laurier', 'Poulet au four simple et savoureux', 4, 1, '', 'Placer les a l''intérieurs du poulet.');
insert into faite_avec values ('bouillon de volaille', 'Poulet au four simple et savoureux', 5, 1, '', 'Le mettre dans un récipient.');
insert into faite_avec values ('jus de citron', 'Poulet au four simple et savoureux', 6, 0, '', 'Mélanger le avec le bouillon.');
insert into faite_avec values ('poulet fermier', 'Poulet au four simple et savoureux', 7, 2, 'Kg', 'Arroser copieusement le poulet et verser le reste du jus dans le plat.');
insert into faite_avec values ('sel', 'Poulet au four simple et savoureux', 8, 0, '', 'Saupoudrer le gros sel sur le poulet.');
insert into faite_avec values ('poulet fermier', 'Poulet au four simple et savoureux', 9, 2, 'Kg', 'Placer le poulet dans le plat.');
insert into faite_avec values ('oignon', 'Poulet au four simple et savoureux', 10, 2, '', 'Ajouter les oignons couper en 4 dans le plat avec le poulet.');
insert into faite_avec values ('tomate cerise', 'Poulet au four simple et savoureux', 11, 1, 'Poignée ', 'Ajouter aussi les tomates cerises.');
insert into faite_avec values ('', 'Poulet au four simple et savoureux', 12, 0, '', 'Placer le poulet au four durant environ 1 heure 40 à 200°C. (Au bout de 20 min de cuisson, retourner le poulet et laisser cuire 20 min, puis le replacer à l''endroit pour la suite de la cuisson)');
insert into faite_avec values ('', 'Poulet au four simple et savoureux', 13, 0, '', 'Attention : Arroser le poulet avec son jus le plus souvent possible durant la cuisson (ajouter de l''eau si nécessaire). Le poulet n''en sera que plus moelleux !');
insert into faite_avec values ('', 'Poulet au four simple et savoureux', 14, 0, '', 'Récupérer le jus à la fin de la cuisson, avec les tomates et les oignons, dans un bol, et placer sur la table, avec une belle salade verte et une poêlée de pommes de terres nouvelles.');
insert into faite_avec values ('oignon', 'Hachis Parmentier', 1, 2, '', 'Hacher les oignons.');
insert into faite_avec values ('ail', 'Hachis Parmentier', 2, 2, 'Gousse', 'Hacher l''ail.');
insert into faite_avec values ('beurre', 'Hachis Parmentier', 3, 30, 'G', 'Les faire revenir dans le beurre jusqu''à ce qu''ils soient tendres.');
insert into faite_avec values ('tomate', 'Hachis Parmentier', 4, 2, '', 'Ajouter les tomates coupées en dés.');
insert into faite_avec values ('viande hachée', 'Hachis Parmentier', 5, 400, 'G', 'Ajouter la viande hachée.');
insert into faite_avec values ('farine', 'Hachis Parmentier', 6, 1, 'Cuillère à soupe', 'Ajouter la farine.');
insert into faite_avec values ('sel', 'Hachis Parmentier', 7, 0, '', 'Ajouter du sel.');
insert into faite_avec values ('poivre', 'Hachis Parmentier', 8, 0, '', 'Ajouter du poivre.');
insert into faite_avec values ('herbes de provence', 'Hachis Parmentier', 9, 1, 'Pincée', 'Ajouter les herbes de provence.');
insert into faite_avec values ('', 'Hachis Parmentier', 10, 0, '', 'Quand tout est cuit, couper le feu.');
insert into faite_avec values ('jaune d''oeuf', 'Hachis Parmentier', 11, 1, '', 'Ajouter le jaune d''oeuf.');
insert into faite_avec values ('parmesan', 'Hachis Parmentier', 12, 30, 'G', 'Ajouter un peu de parmesan.');
insert into faite_avec values ('', 'Hachis Parmentier', 13, 0, '', 'Bien mélanger.');
insert into faite_avec values ('', 'Hachis Parmentier', 14, 0, '', 'Préchauffer le four à 200°C (thermostat 6-7).');
insert into faite_avec values ('', 'Hachis Parmentier', 15, 0, '', 'Etaler au fond du plat à gratin.');
insert into faite_avec values ('purée', 'Hachis Parmentier', 16, 0, '', 'Préparer la purée. L''étaler au dessus de la viande.');
insert into faite_avec values ('fromage rapé', 'Hachis Parmentier', 17, 0, '', 'Saupoudrer de fromage râpé et faire gratiner.');
insert into faite_avec values ('huile d''olive', 'Samoussa rapide au boeuf', 1, 0, '', 'Faire chauffer l''huile d''olive dans une poêle à feu vif.');
insert into faite_avec values ('oignon', 'Samoussa rapide au boeuf', 2, 1, '', 'Faire revenir l''oignon.');
insert into faite_avec values ('ail', 'Samoussa rapide au boeuf', 3, 1, '', 'Faire revenir l''ail avec l''oignon.');
insert into faite_avec values ('carotte', 'Samoussa rapide au boeuf', 4, 1, '', 'Haché la carotte et la faire revenir avec l''oignon et l''ail.');
insert into faite_avec values ('boeuf haché', 'Samoussa rapide au boeuf', 5, 250, 'G', 'Ajouter la viande de bœuf et laisser dorer un peu.');
insert into faite_avec values ('curry', 'Samoussa rapide au boeuf', 6, 2, 'Cuillère à café', 'Ajouter le curry.');
insert into faite_avec values ('gingembre', 'Samoussa rapide au boeuf', 7, 1, 'Cuillère à café', 'Ajouter le gingembre.');
insert into faite_avec values ('sauce soja', 'Samoussa rapide au boeuf', 8, 5, 'Cuillère à soupe', 'Puis la sauce soja.');
insert into faite_avec values ('', 'Samoussa rapide au boeuf', 9, 0, '', 'Bien mélanger et laisser cuire à feu doux 2 à 3 min.');
insert into faite_avec values ('', 'Samoussa rapide au boeuf', 10, 0, '', 'Répartir la farce dans les feuilles de brick (2 samoussas par feuille) et procéder au pliage (souvent expliqué sur les paquets de feuilles de brick).');
insert into faite_avec values ('jaune d''oeuf', 'Samoussa rapide au boeuf', 11, 1, '', 'Coller le dernier revers avec un jaune d''œuf.');
insert into faite_avec values ('huile à friture', 'Samoussa rapide au boeuf', 12, 0, '', 'Faire cuire dans un fond d''huile de friture, 2 min de chaque côté.');
insert into faite_avec values ('', 'Samoussa rapide au boeuf', 13, 0, '', 'En fin de cuisson, déposer les samoussas sur une assiette avec du papier absorbant afin de retirer l''excès d''huile de cuisson. Bon appétit !');

insert into commentaire values ('Conore', 100, to_date('2022-01-08', 'yyyy-mm-dd'), 'Personnellement, j''ajoute 25% de patates et termine en liant avec crème fraîche et 4 ou 5 jaunes d''oeufs.');
insert into commentaire values ('Witied', 100, to_date('2022-01-10', 'yyyy-mm-dd'), 'Délicieuse ! La noix de muscade donne un parfum étonnant !');
insert into commentaire values ('Brible', 103, to_date('2022-01-31', 'yyyy-mm-dd'), 'Délicieux, je le présente avec une petite salade (avec des noix) et surtout des pommes (le fruit). Un ami m''a suggéré de piquer le fromage (avec une seringue) au calva. Nous sommes en Normandie !');
insert into commentaire values ('Stropeten', 103, to_date('2022-01-31', 'yyyy-mm-dd'), 'J''aime bien');
insert into commentaire values ('Thervin', 103, to_date('2022-02-01', 'yyyy-mm-dd'), 'Je saupoudre d''ail et quelques cuillères à café de vin blanc sec.');
insert into commentaire values ('Eard1982', 103, to_date('2022-02-02', 'yyyy-mm-dd'), 'Attention prendre un camembert au lait cru, pour éviter le goût de "platre". Emballer le fromage dans de l''alu, le remettre dans la boîte et mettre sur les braises pendant un petit 20 min...');
insert into commentaire values ('Withild', 103, to_date('2022-02-09', 'yyyy-mm-dd'), 'Un délice, pratique quand on a des invités de dernière minute ou tout simplement pas envie de cuisiner :) Moi je le mets directement au four (pour plus de rapidité) puissance maxi en 5-10 minutes c''est réglé, j''ai un superbe camembert prêt à exploser! On l''ouvre et hop trempinette ;) Hum....');
insert into commentaire values ('Allecomead', 103, to_date('2022-02-10', 'yyyy-mm-dd'), 'Très bon si on aime le camembert :)');
insert into commentaire values ('Phrovis', 103, to_date('2022-02-14', 'yyyy-mm-dd'), 'Bien s''assurer que le fond de la boîte est en peuplier et non pas en carton !!!!! Sinon fromage fondu rien de plus');
insert into commentaire values ('Riotied', 111, to_date('2022-04-15', 'yyyy-mm-dd'), 'Super bon et simple à réaliser ! Je recommande 100% la recette. A la place de la farine pour absorber le liquide de la viande, je fais un peu plus de pommes de terre et je mets une couche en dessous de ma viande, et une au dessus');
insert into commentaire values ('Triated', 111, to_date('2022-04-16', 'yyyy-mm-dd'), 'Vraiment superbe recette. Petit +, rajouter un peu de cumin dans la viande hachée, un peu de muscade dans la purée et un peu de chapelure pour le gratiné');
insert into commentaire values ('Wooduousted', 111, to_date('2022-04-20', 'yyyy-mm-dd'), 'Très bonne recette. Je n''ai pas mis de tomate et ai ajouté dans ma purée maison de la crème et de la noix de muscade. Je referai!');
insert into commentaire values ('Carmseepan', 111, to_date('2022-04-24', 'yyyy-mm-dd'), 'Bon, mais il s''agit plus d''une sauce bolo à la purée (pas de tomate dans le Hachis parmentier). Et 300g de purée de pommes de terre pour 4, ce n''est pas assez.');
insert into commentaire values ('Hene1991', 111, to_date('2022-04-24', 'yyyy-mm-dd'), 'Très moelleux, il faut juste à mon avis mettre plus de purée j''ai doublé la quantité');
insert into commentaire values ('Bullithein', 111, to_date('2022-04-26', 'yyyy-mm-dd'), 'Parfait, j''ai rajouté 2 merguez hachées pour parfumer la viande. Un délice.');
insert into commentaire values ('Wassible', 111, to_date('2022-04-27', 'yyyy-mm-dd'), 'Excellent, avec une purée maison, c''est encore mieux :)');
insert into commentaire values ('Formaded', 111, to_date('2022-04-29', 'yyyy-mm-dd'), 'Au lieu des tomates j''ai mis des carottes et c''est super bon');
insert into commentaire values ('Aptir1980', 111, to_date('2022-04-29', 'yyyy-mm-dd'), 'Excellente recette, facile à réaliser. J''ai simplement rajouté une échalote, de la ciboulette ainsi que de la muscade dans les pommes de terre. Puis, remplacé le beurre par de l''huile d''olive et le fromage râpé par de la chapelure. À refaire !');
insert into commentaire values ('Haverfice', 111, to_date('2022-04-30', 'yyyy-mm-dd'), 'C''est bon mais il faut au moins doubler la purée… ou même tripler!');
insert into commentaire values ('Malactind', 111, to_date('2022-05-01', 'yyyy-mm-dd'), 'Très bon mais pas assez de pommes de terre, 100 g par personne ça me paraît faible.');
insert into commentaire values ('Uposurs45', 107, to_date('2022-03-19', 'yyyy-mm-dd'), 'Petit conseil: faites bouillir de l''eau avec un peu de vinaigre. Plongez vos oeufs sortis du frigo une heure avant. A la reprise de l''ébullition, comptez 3 minutes, sortez vos oeufs et rincez-les à l''eau froide pour arrêter la cuisson.');
insert into commentaire values ('Conore', 107, to_date('2022-03-20', 'yyyy-mm-dd'), 'Il faut effectivement les retirer quand l''eau bout si on les a mis dans l''eau froide... 3 minutes c''est quand on les met dans l''eau bouillante.');
insert into commentaire values ('Uplive', 107, to_date('2022-03-23', 'yyyy-mm-dd'), 'Super... 25 ans que j''en avais plus mangé...');
insert into commentaire values ('Therling', 107, to_date('2022-03-25', 'yyyy-mm-dd'), 'Super');
insert into commentaire values ('Sonsise', 107, to_date('2022-03-26', 'yyyy-mm-dd'), 'Cool très cool très très cool');
insert into commentaire values ('Withild', 112, to_date('2022-05-02', 'yyyy-mm-dd'), 'Beaucoup trop salé, la proportion de sauce soja est délirante ! Je n''utilise pas de soja sucré, mais avec sauce soja normale, mettre 1 càs maximum, et ajouter si nécessaire. J''ai respecté la dose, c''était immangeable, beaucoup trop salé. Pour le reste, la recette est bonne, je réessaierai avec moins de soja.');
insert into commentaire values ('Allecomead', 112, to_date('2022-05-02', 'yyyy-mm-dd'), 'Je trouve la recette un peu trop sucrée à mon goût.');
insert into commentaire values ('Brible', 112, to_date('2022-05-05', 'yyyy-mm-dd'), 'Excellente recette. Moi je les fais cuire au four. C''est moins gras et aussi bon.');
insert into commentaire values ('Witied', 112, to_date('2022-05-08', 'yyyy-mm-dd'), 'Excellente recette, juste diminuer la sauce soja à 3 cuillères à soupe.');
insert into commentaire values ('Uposurs45', 112, to_date('2022-05-09', 'yyyy-mm-dd'), 'Attention diminuer le soja par 2 minimum');
insert into commentaire values ('Stropeten', 114, to_date('2022-05-03', 'yyyy-mm-dd'), 'Magnifique!');
insert into commentaire values ('Sweld1954', 119, to_date('2022-06-10', 'yyyy-mm-dd'), 'Ça a l''air excellent!');
insert into commentaire values ('Phrovis', 119, to_date('2022-06-12', 'yyyy-mm-dd'), 'Juste wow.');

insert into aime values ('Haverfice', 100, to_date('2022-01-08', 'yyyy-mm-dd'));
insert into aime values ('Malactind', 100, to_date('2022-01-08', 'yyyy-mm-dd'));
insert into aime values ('Eveithe56', 100, to_date('2022-01-08', 'yyyy-mm-dd'));
insert into aime values ('Accoure', 100, to_date('2022-01-08', 'yyyy-mm-dd'));
insert into aime values ('Owbet1963', 100, to_date('2022-01-09', 'yyyy-mm-dd'));
insert into aime values ('Othoose56', 100, to_date('2022-01-09', 'yyyy-mm-dd'));
insert into aime values ('Riotied', 100, to_date('2022-01-09', 'yyyy-mm-dd'));
insert into aime values ('Triated', 100, to_date('2022-01-11', 'yyyy-mm-dd'));
insert into aime values ('Wooduousted', 100, to_date('2022-01-12', 'yyyy-mm-dd'));
insert into aime values ('Carmseepan', 100, to_date('2022-01-12', 'yyyy-mm-dd'));
insert into aime values ('Hene1991', 100, to_date('2022-01-12', 'yyyy-mm-dd'));
insert into aime values ('Bullithein', 100, to_date('2022-01-13', 'yyyy-mm-dd'));
insert into aime values ('Eveithe56', 101, to_date('2022-01-19', 'yyyy-mm-dd'));
insert into aime values ('Accoure', 101, to_date('2022-01-20', 'yyyy-mm-dd'));
insert into aime values ('Owbet1963', 101, to_date('2022-01-21', 'yyyy-mm-dd'));
insert into aime values ('Othoose56', 101, to_date('2022-01-21', 'yyyy-mm-dd'));
insert into aime values ('Riotied', 101, to_date('2022-01-21', 'yyyy-mm-dd'));
insert into aime values ('Triated', 101, to_date('2022-01-21', 'yyyy-mm-dd'));
insert into aime values ('Wooduousted', 101, to_date('2022-01-22', 'yyyy-mm-dd'));
insert into aime values ('Carmseepan', 101, to_date('2022-01-22', 'yyyy-mm-dd'));
insert into aime values ('Hene1991', 101, to_date('2022-01-22', 'yyyy-mm-dd'));
insert into aime values ('Bullithein', 101, to_date('2022-01-23', 'yyyy-mm-dd'));
insert into aime values ('Aptir1980', 103, to_date('2022-01-30', 'yyyy-mm-dd'));
insert into aime values ('Haverfice', 103, to_date('2022-01-30', 'yyyy-mm-dd'));
insert into aime values ('Malactind', 103, to_date('2022-01-30', 'yyyy-mm-dd'));
insert into aime values ('Eveithe56', 103, to_date('2022-01-30', 'yyyy-mm-dd'));
insert into aime values ('Accoure', 103, to_date('2022-01-31', 'yyyy-mm-dd'));
insert into aime values ('Owbet1963', 103, to_date('2022-02-01', 'yyyy-mm-dd'));
insert into aime values ('Othoose56', 103, to_date('2022-02-01', 'yyyy-mm-dd'));
insert into aime values ('Riotied', 103, to_date('2022-02-01', 'yyyy-mm-dd'));
insert into aime values ('Triated', 103, to_date('2022-02-01', 'yyyy-mm-dd'));
insert into aime values ('Wooduousted', 103, to_date('2022-02-02', 'yyyy-mm-dd'));
insert into aime values ('Carmseepan', 103, to_date('2022-02-02', 'yyyy-mm-dd'));
insert into aime values ('Hene1991', 103, to_date('2022-02-03', 'yyyy-mm-dd'));
insert into aime values ('Bullithein', 103, to_date('2022-02-04', 'yyyy-mm-dd'));
insert into aime values ('Wassible', 103, to_date('2022-02-04', 'yyyy-mm-dd'));
insert into aime values ('Formaded', 103, to_date('2022-02-04', 'yyyy-mm-dd'));
insert into aime values ('Pround', 103, to_date('2022-02-04', 'yyyy-mm-dd'));
insert into aime values ('Uniscomen', 103, to_date('2022-02-04', 'yyyy-mm-dd'));
insert into aime values ('Panytherry', 104, to_date('2022-02-12', 'yyyy-mm-dd'));
insert into aime values ('Nabing', 104, to_date('2022-02-13', 'yyyy-mm-dd'));
insert into aime values ('Sweld1954', 104, to_date('2022-02-14', 'yyyy-mm-dd'));
insert into aime values ('Phrovis', 104, to_date('2022-02-15', 'yyyy-mm-dd'));
insert into aime values ('Stropeten', 104, to_date('2022-02-16', 'yyyy-mm-dd'));
insert into aime values ('Thervin', 104, to_date('2022-02-17', 'yyyy-mm-dd'));
insert into aime values ('Stropeten', 105, to_date('2022-02-16', 'yyyy-mm-dd'));
insert into aime values ('Panytherry', 106, to_date('2022-03-01', 'yyyy-mm-dd'));
insert into aime values ('Nabing', 106, to_date('2022-03-02', 'yyyy-mm-dd'));
insert into aime values ('Sweld1954', 106, to_date('2022-03-03', 'yyyy-mm-dd'));
insert into aime values ('Bullithein', 107, to_date('2022-03-15', 'yyyy-mm-dd'));
insert into aime values ('Wassible', 107, to_date('2022-03-15', 'yyyy-mm-dd'));
insert into aime values ('Formaded', 107, to_date('2022-03-15', 'yyyy-mm-dd'));
insert into aime values ('Pround', 107, to_date('2022-03-15', 'yyyy-mm-dd'));
insert into aime values ('Uniscomen', 107, to_date('2022-03-16', 'yyyy-mm-dd'));
insert into aime values ('Sonarmiss', 107, to_date('2022-03-17', 'yyyy-mm-dd'));
insert into aime values ('Moste1964', 107, to_date('2022-03-17', 'yyyy-mm-dd'));
insert into aime values ('Upoctin', 107, to_date('2022-03-17', 'yyyy-mm-dd'));
insert into aime values ('Bose1982', 107, to_date('2022-03-17', 'yyyy-mm-dd'));
insert into aime values ('Fincureplarl', 107, to_date('2022-03-17', 'yyyy-mm-dd'));
insert into aime values ('Alky1995', 107, to_date('2022-03-18', 'yyyy-mm-dd'));
insert into aime values ('Panytherry', 107, to_date('2022-03-18', 'yyyy-mm-dd'));
insert into aime values ('Nabing', 107, to_date('2022-03-18', 'yyyy-mm-dd'));
insert into aime values ('Sweld1954', 107, to_date('2022-03-18', 'yyyy-mm-dd'));
insert into aime values ('Phrovis', 110, to_date('2022-04-02', 'yyyy-mm-dd'));
insert into aime values ('Stropeten', 110, to_date('2022-04-03', 'yyyy-mm-dd'));
insert into aime values ('Thervin', 110, to_date('2022-04-04', 'yyyy-mm-dd'));
insert into aime values ('Eard1982', 110, to_date('2022-04-05', 'yyyy-mm-dd'));
insert into aime values ('Withild', 110, to_date('2022-04-06', 'yyyy-mm-dd'));
insert into aime values ('Allecomead', 110, to_date('2022-04-06', 'yyyy-mm-dd'));
insert into aime values ('Brible', 110, to_date('2022-04-06', 'yyyy-mm-dd'));
insert into aime values ('Witied', 110, to_date('2022-04-06', 'yyyy-mm-dd'));
insert into aime values ('Uposurs45', 110, to_date('2022-04-06', 'yyyy-mm-dd'));
insert into aime values ('Conore', 110, to_date('2022-04-07', 'yyyy-mm-dd'));
insert into aime values ('Uplive', 110, to_date('2022-04-08', 'yyyy-mm-dd'));
insert into aime values ('Therling', 110, to_date('2022-04-09', 'yyyy-mm-dd'));
insert into aime values ('Sonsise', 110, to_date('2022-04-10', 'yyyy-mm-dd'));
insert into aime values ('Alky1995', 110, to_date('2022-04-10', 'yyyy-mm-dd'));
insert into aime values ('Othoose56', 111, to_date('2022-04-12', 'yyyy-mm-dd'));
insert into aime values ('Riotied', 111, to_date('2022-04-13', 'yyyy-mm-dd'));
insert into aime values ('Triated', 111, to_date('2022-04-14', 'yyyy-mm-dd'));
insert into aime values ('Wooduousted', 111, to_date('2022-04-15', 'yyyy-mm-dd'));
insert into aime values ('Carmseepan', 111, to_date('2022-04-16', 'yyyy-mm-dd'));
insert into aime values ('Hene1991', 111, to_date('2022-04-17', 'yyyy-mm-dd'));
insert into aime values ('Bullithein', 111, to_date('2022-04-18', 'yyyy-mm-dd'));
insert into aime values ('Wassible', 111, to_date('2022-04-18', 'yyyy-mm-dd'));
insert into aime values ('Formaded', 111, to_date('2022-04-18', 'yyyy-mm-dd'));
insert into aime values ('Pround', 111, to_date('2022-04-18', 'yyyy-mm-dd'));
insert into aime values ('Uniscomen', 111, to_date('2022-04-19', 'yyyy-mm-dd'));
insert into aime values ('Aptir1980', 112, to_date('2022-04-25', 'yyyy-mm-dd'));
insert into aime values ('Haverfice', 112, to_date('2022-04-26', 'yyyy-mm-dd'));
insert into aime values ('Malactind', 112, to_date('2022-04-27', 'yyyy-mm-dd'));
insert into aime values ('Eveithe56', 112, to_date('2022-04-28', 'yyyy-mm-dd'));
insert into aime values ('Accoure', 112, to_date('2022-04-29', 'yyyy-mm-dd'));
insert into aime values ('Owbet1963', 112, to_date('2022-04-29', 'yyyy-mm-dd'));
insert into aime values ('Othoose56', 112, to_date('2022-04-29', 'yyyy-mm-dd'));
insert into aime values ('Riotied', 112, to_date('2022-04-29', 'yyyy-mm-dd'));
insert into aime values ('Triated', 112, to_date('2022-04-29', 'yyyy-mm-dd'));
insert into aime values ('Wooduousted', 112, to_date('2022-04-30', 'yyyy-mm-dd'));
insert into aime values ('Carmseepan', 112, to_date('2022-05-01', 'yyyy-mm-dd'));
insert into aime values ('Hene1991', 113, to_date('2022-04-26', 'yyyy-mm-dd'));
insert into aime values ('Bullithein', 118, to_date('2022-06-05', 'yyyy-mm-dd'));
insert into aime values ('Wassible', 118, to_date('2022-06-05', 'yyyy-mm-dd'));
insert into aime values ('Formaded', 119, to_date('2022-06-09', 'yyyy-mm-dd'));
insert into aime values ('Pround', 123, to_date('2022-07-19', 'yyyy-mm-dd'));
insert into aime values ('Riotied', 126, to_date('2022-08-07', 'yyyy-mm-dd'));
insert into aime values ('Triated', 128, to_date('2022-08-17', 'yyyy-mm-dd'));
insert into aime values ('Wooduousted', 128, to_date('2022-08-18', 'yyyy-mm-dd'));
insert into aime values ('Carmseepan', 129, to_date('2022-08-22', 'yyyy-mm-dd'));
insert into aime values ('Hene1991', 129, to_date('2022-08-22', 'yyyy-mm-dd'));
insert into aime values ('Bullithein', 129, to_date('2022-08-23', 'yyyy-mm-dd'));
insert into aime values ('Wassible', 129, to_date('2022-08-24', 'yyyy-mm-dd'));

---profil publique
create or replace view profil as
select u.pseudonyme, count(distinct a1.abonne_a) as abonnement, count(distinct a2.pseudonyme) as abonne,
    count(distinct r.id) as publication, u.description_utlisateur
from utilisateur u
left join abonnement a1 on u.pseudonyme = a1.pseudonyme
left join abonnement a2 on u.pseudonyme = a2.abonne_a
left join recette r on u.pseudonyme = r.pseudonyme
group by u.pseudonyme, u.description_utlisateur;

---nombre de commentaire et j'aime par photo ou recette
create or replace view profil as
select r.id, r.nom_recette, count(distinct c.pseudonyme) as commentaire, count(distinct a.pseudonyme) as aime
from recette r
left join commentaire c on r.id = c.id_recette
left join aime a on r.id = a.id_recette
group by r.id, r.nom_recette;

create or replace view prix_moyen_par_article_kilo as
select f.nom_recette, avg(i.prix_kilo_ou_litre) as prix_moyen_par_article_au_kilo
from faite_avec f, ingredient i
where f.nom_ingredient = i.nom_ingredient
group by f.nom_recette;

---vue pour modération
create or replace view moderation as
select u.description_utlisateur as texte
from utilisateur u
where u.description_utlisateur IS NOT NULL
union all
select c.commentaire
from commentaire c
where c.commentaire is not null
union all
select r.nom_recette
from recette r
where nom_recette is not null
union all
select f.description_etape
from faite_avec f
where f.description_etape is not null
union all
select i.nom_ingredient
from ingredient i;

---la liste des ingredient utilisé par chaque utilisateur dans leurs recette
create or replace view ingredient_utilise_par_user as
select distinct u.pseudonyme, f.nom_ingredient
from utilisateur u, recette r, faite_avec f
where u.pseudonyme = r.pseudonyme
and r.nom_recette = f.nom_recette
and f.nom_ingredient is not null
order by u.pseudonyme;

---recette avec photo qui contient 1 ingredient specifique
create or replace view recette_photo_ingredient as
select distinct r.nom_recette, r.chemin_photo, f.nom_ingredient
from faite_avec f, recette r
where f.nom_recette = r.nom_recette
and r.chemin_photo is not null
and f.nom_ingredient is not null;

---recette avec 1 ingredient specifique
create or replace view recette_avec_ingredient as
select distinct r.nom_recette, f.nom_ingredient
from faite_avec f, recette r
where f.nom_recette = r.nom_recette
and f.nom_ingredient is not null;

---quelques stats que chaque utilisateur a
select u.nom, u.prenom, u.email, u.pseudonyme, count(distinct a1.abonne_a) as abonnement, count(distinct a2.pseudonyme) as abonne,
    count(distinct r.id) as publication, count(distinct c.id_recette) as commentaire_publie, count(distinct a.id_recette) as aime_publie, 
    count(distinct f.nom_ingredient) as ingredient_utilise
from utilisateur u
left join abonnement a1 on u.pseudonyme = a1.pseudonyme
left join abonnement a2 on u.pseudonyme = a2.abonne_a
left join recette r on u.pseudonyme = r.pseudonyme
left join commentaire c on u.pseudonyme = c.pseudonyme
left join aime a on u.pseudonyme = a .pseudonyme
left join faite_avec f on r.nom_recette = f.nom_recette
group by u.pseudonyme, u.nom, u.prenom, u.email;


---Trigger avant suppression d'un ingrédient
CREATE OR REPLACE TRIGGER BeforeDeleteIngredient
BEFORE DELETE ON Ingredient
FOR EACH ROW
DECLARE
    recette_count NUMBER;
BEGIN
    -- Vérifier s'il existe des recettes qui utilisent cet ingrédient
    SELECT COUNT(1) INTO recette_count
    FROM Faite_Avec
    WHERE nom_ingredient = :old.nom_ingredient;

    IF recette_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cet ingrédient est utilisé dans des recettes. Suppression impossible.');
    END IF;
END;
/