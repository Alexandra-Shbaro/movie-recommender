-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movie_recommender
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast` (
  `cast_id` int NOT NULL AUTO_INCREMENT,
  `cast_name` varchar(255) NOT NULL,
  `movie_id` int DEFAULT NULL,
  PRIMARY KEY (`cast_id`),
  KEY `movie_id_fk_idx` (`movie_id`),
  CONSTRAINT `movie_id_fk` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` VALUES (4,'Alexis Manenti',4),(5,'Andréa Bescond',4),(6,'Alexandra Noisier',4),(7,'Pathé Amiens',5),(8,'Pathé Angers',6),(9,'Shawn Mendes',7),(10,'Paul Mescal',8),(11,'Denzel Washington',8),(12,'Pedro Pascal',8),(13,'Pathé Angers',9),(14,'Pedro Pascal',10),(15,'Denzel Washington',10),(16,'Paul Mescal',10),(17,'Pathé Angers',11),(18,'João Lagarto',12),(19,'Lázaro Ramos',12),(20,'Pedro Hossi',12),(21,'Dennis Quaid',13),(22,'Demi Moore',13),(23,'Margaret Qualley',13),(24,'Eye Haidara',14),(25,'José Garcia',14),(26,'Pio Marmaï',14),(27,'Robin Wright',15),(28,'Tom Hanks',15),(29,'Paul Bettany',15),(30,'Grégory Gadebois',16),(31,'Alexandra Lamy',16),(32,'Camille Cottin',17),(33,'Vincent Macaigne',17),(34,'Sara Forestier',17),(35,'Chiwetel Ejiofor',18),(36,'Juno Temple',18),(37,'Tom Hardy',18),(38,'Nicholas Hoult',19),(39,'Toni Collette',19),(40,'J.K Simmons',19),(41,'Ivy Wolk',20),(42,'Lindsey Normington',20),(43,'Karren Karagulian',20),(44,'Nationalité : Lettonie',21),(45,'Aloïse Sauvage',22),(46,'Philippe Rebbot',22),(47,'Sara Giraudeau',22),(48,'Lionel Cecilio',23),(49,'Tahar Rahim',23),(50,'Bastien Bouillon',23),(51,'Gérard Lanvin',24),(52,'Didier Bourdon',24),(53,'Isabelle Nanty',24),(54,'Mallory Wanecque',25),(55,'Adèle Exarchopoulos',25),(56,'François Civil',25),(57,'Dylan Gelula',26),(58,'Kyle Gallner',26),(59,'Lukas Gage',26),(60,'Nationalité : Etats-Unis',27),(61,'Jeremy Strong',28),(62,'Maria Bakalova',28),(63,'Emily Mitchell',28),(64,'Abou Sangare',29),(65,'Alpha Oumar Sow',29),(66,'Emmanuel Yovanie',29),(67,'Joaquin Phoenix',30),(68,'Lady Gaga',30),(138,'Pathé Amiens',60),(142,'Ciomara Morais',62),(143,'Cheila Lima',62),(144,'Willion Brandão',62),(145,'Robert Pattinson',63),(146,'Taylor Lautner',63),(147,'Kristen Stewart',63),(148,'Geoffrey Arend',64),(149,'Zooey Deschanel',64),(150,'Joseph Gordon-Levitt',64),(155,'Pathé Angers',67);
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(255) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Comédie'),(2,'Fantastique'),(3,'Drame'),(4,'Concert'),(5,'Action'),(6,'Aventure'),(7,'Péplum'),(8,'Historique'),(9,'Epouvante-horreur'),(10,'Romance'),(11,'Thriller'),(12,'Animation'),(13,'Comédie dramatique'),(14,'Biopic'),(15,'Musical'),(16,'Courts-métrages'),(17,'Science fiction'),(18,'Guerre'),(19,'Policier');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(255) NOT NULL,
  `release_date` date DEFAULT NULL,
  `movie_description` text,
  `movie_image` varchar(255) DEFAULT NULL,
  `movie_producer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (4,'Diamant brut','2024-11-19','Liane, 19 ans, téméraire et incandescente, vit avec sa mère et sa petite sœur sous le soleil poussiéreux de Fréjus. Obsédée par la beauté et le besoin de devenir quelqu’un, elle voit en la télé-réalité la possibilité d’être aimée. Le destin semble enfin lui sourire lorsqu’elle passe un casting pour « Miracle Island ».','https://media.pathe.fr/movie/alex/HO00007674/poster/md/59/movie&uuid=FC3A6EA7-1EBB-40CD-9E86-B0FD76892A3C','Agathe Riedinger'),(5,'Sadrak','2024-11-14','Un homme emploie une jeune aide-soignante pour s\'occuper de son père, qui souffre de la maladie d\'Alzheimer, mais l\'aide-soignante elle-même souffre d\'une grave maladie rénale.','https://media.pathe.fr/movie/alex/HO00008528/poster/md/3/movie&uuid=B2846EDA-9986-4FA4-AF65-1DDE070E866A','Narcisse Wandji'),(6,'Emna','2024-11-13','Daniel, un botaniste suisse, est effrayé par ses pulsions suicidaires. Brisé par sa situation familiale, ne supportant plus la pression sociale, il décide de s’isoler dans la cabane de ses parents pour échapper à sa dépression.  Au même moment, complètement perdues dans les montagnes après avoir été lâchées par un passeur à la frontière Italo-Suisse, Zaineb et sa fille de huit ans essaient de joindre illégalement une ville suisse.','https://media.pathe.fr/movie/alex/HO00008540/poster/md/3/movie&uuid=6489E363-7796-457B-AFF8-8D22410100DB','Pathé Amiens'),(7,'Shawn Mendes: For Friends & Family Only (A Live Concert Film)','2024-11-13','Avec son concert filmé au théâtre historique de Bearsville à Woodstock, l’auteur compositeur musicien interprète propose un événement totalement exclusif à ses fans. Shawn Mendes : For Friends & Family Only (A Live Concert Film) offre aux fans l’occasion de découvrir son nouvel album en intégralité, juste avant sa sortie.   Tout au long du film, Shawn Mendes partage des histoires personnelles et l\'inspiration derrière chaque morceau, offrant un regard intime sur son parcours créatif.','https://media.pathe.fr/movie/alex/HO00008536/poster/md/3/movie&uuid=FF0794D4-94F1-4748-85C1-F35F1A827F18','Connor Brashier, Anthony Wilson'),(8,'Gladiator II','2024-11-12','L\'histoire de Lucius, le fils de Lucilla (Connie Nielsen dans Gladiator) et neveu de Commode (Joaquin Phoenix). Lucius est très admiratif du parcours de Maximus et devrait suivre ses traces.','https://media.pathe.fr/movie/alex/HO00007481/poster/md/87/movie&uuid=8C8A2897-61A9-4327-8A05-87BB50B355B1','Ridley Scott'),(9,'Tejiri','2024-11-12','Tejiri, un jeune homme en déplacement se retrouve mystérieusement détenu dans une prison hautement surveillée sans aucune nouvelle de sa famille. Tandis que l’inspecteur Prempeh et son partenaire Baako se lancent dans une course contre la montre pour découvrir le mystère qui se cache derrière sa disparition, il doit se battre pour survivre dans ce nouveau monde s’il veut être retrouvé.','https://media.pathe.fr/movie/alex/HO00008538/poster/md/3/movie&uuid=3D61E788-C7E0-4149-8D60-1F15E68DC1E0','Pathé Amiens'),(10,'Séance All Inclusive : Gladiator II','2024-11-09','Venez découvrir en Avant-Première et dans les meilleures conditions, le nouveau chef-d’œuvre de Ridley Scott : Gladiator II. L’offre All Inclusive, c’est un accueil personnalisé par l’équipe de votre cinéma, un verre de bienvenu offert, ainsi qu’une collation gourmande salée et sucrée, pour un moment privilégié exceptionnel !  Synopsis : Des années après avoir assisté à la mort du héros vénéré Maximus aux mains de son oncle, Lucius est forcé d\'entrer dans le Colisée lorsque son pays est conquis par les empereurs tyranniques qui gouvernent désormais Rome d\'une main de fer. La rage au cœur et l\'avenir de l\'Empire en jeu, Lucius doit se tourner vers son passé pour trouver la force et l\'honneur de rendre la gloire de Rome à son peuple','https://media.pathe.fr/movie/alex/HO00008557/poster/md/9/movie&uuid=C327BAFF-7F16-47C2-80E9-F49582334CD8','Ridley Scott'),(11,'Disco Afrika : une histoire malgache','2024-11-09','Madagascar, aujourd’hui. Kwame, 20 ans, tente de gagner sa vie dans les mines clandestines de saphir. Suite à un événement inattendu, il doit rejoindre sa ville natale où il retrouve sa mère, d’anciens amis, mais aussi la corruption qui gangrène son pays. Ballotté par des sentiments contraires, il va devoir choisir entre argent facile et fraternité, individualisme et éveil à une conscience politique.','https://www.pathe.fr/assets/source/img/poster-placeholder-pathe-empty.jpg','Pathé Amiens'),(12,'O Grande Kilapy','2024-11-06','Librement inspirée de faits réels. Joãozinho, escroc doté d’une profonde éthique de l’amitié, « bon vivant » à tout prix, est une personne simple qui réunit en lui un ensemble d’impératifs de « jouissance » indifférents aux contingences de la vie dans une colonie portugaise : couleur de peau et  préjugés sociaux. En raison des circonstances, Joãozinho finit par devenir un personnage inconfortable, subversif et politique pour le régime colonial  portugais.','https://media.pathe.fr/movie/alex/HO00008527/poster/md/3/movie&uuid=18176078-6A85-48BE-A074-0F0CE877FF03','Zézé Gamboa'),(13,'The Substance','2024-11-05','Avez-vous déjà rêvé d’une meilleure version de vous-même ? Vous devriez essayer ce nouveau produit : THE SUBSTANCE Il a changé ma vie. Il permet de générer une autre version de vous-même, plus jeune, plus belle, plus parfaite. Respectez les instructions :VOUS ACTIVEZ une seule fois VOUS STABILISEZ chaque jour VOUS PERMUTEZ tous les sept jours sans exception. Il suffit de partager le temps. C’est si simple, qu’est-ce qui pourrait mal tourner ?','https://media.pathe.fr/movie/alex/HO00007842/poster/md/35/movie&uuid=D64EEBB3-3E37-41AA-BC26-E21FE566125D','Coralie Fargeat'),(14,'À toute allure','2024-11-05','Elle est officier de sous-marin tactique. Il est steward. Ils se rencontrent lors d\'une escale. Mais leur aventure naissante doit subitement s\'interrompre. Et le voilà qui s\'accroche ! Qui la suit ! Qui la colle ! Comme si on avait le temps d\'être amoureuse à bord d\'un bâtiment militaire ! Reste que l\'océan Pacifique n\'est pas assez grand pour le décourager. L\'océan Arctique non plus d\'ailleurs. Le monde est si petit quand on s\'aime d\'un si grand amour...','https://media.pathe.fr/movie/alex/HO00006269/poster/md/40/movie&uuid=9A06F9EF-B612-42C8-AD00-EC347A736622','Lucas Bernard'),(15,'Here - Les plus belles années de notre vie','2024-11-05','Toute l’équipe de FORREST GUMP revient au cinéma, et vous transporte dans un voyage unique à travers le temps.  L’histoire de familles dont les peines, les joies et les moments de doutes se font écho à travers les générations.','https://media.pathe.fr/movie/alex/HO00008278/poster/md/39/movie&uuid=F9887A57-0F1C-4EA9-BC34-78C0071B1DA8','Robert Zemeckis'),(16,'Louise Violet','2024-11-05','1889. Envoyée dans un village de la campagne française, l’institutrice Louise Violet doit y imposer l’école de la République (gratuite, obligatoire et laïque). Une mission qui ne la rend populaire ni auprès des enfants… ni auprès des parents.','https://media.pathe.fr/movie/alex/HO00006938/poster/md/126/movie&uuid=C24572C5-7E1A-4435-8DAD-58D9EB698690','Éric Besnard'),(17,'Trois amies','2024-11-05','Joan n\'est plus amoureuse de Victor et souffre de se sentir malhonnête avec lui. Alice, sa meilleure amie, la rassure : elle-même n’éprouve aucune passion pour Eric et pourtant leur couple se porte à merveille ! Elle ignore qu’il a une liaison avec Rebecca, leur amie commune... Quand Joan décide finalement de quitter Victor et que celui-ci disparaît, la vie des trois amies et leurs histoires s’en trouvent bouleversées.','https://media.pathe.fr/movie/alex/HO00007746/poster/md/30/movie&uuid=8C6D56FE-0E73-4443-AAC5-151BC9757840','Emmanuel Mouret'),(18,'Venom: The Last Dance','2024-10-29','Dans VENOM: THE LAST DANCE, ultime opus de la trilogie, Tom Hardy est de retour sous les traits de Venom, l’un des personnages le plus complexes de l’univers Marvel. Eddie et Venom sont en cavale. Chacun est traqué par ses semblables et alors que l’étau se resserre, le duo doit prendre une décision dévastatrice qui annonce la conclusion des aventures d’Eddie & Venom.','https://media.pathe.fr/movie/alex/HO00007480/poster/md/58/movie&uuid=EA09B5FD-809D-4111-8D31-D0F173ED5D86','Kelly Marcel'),(19,'JURE N°2','2024-10-29','Le film suit Justin Kemp, un père de famille ordinaire, qui se retrouve juré dans un procès pour meurtre très médiatisé. Alors qu\'il est confronté à un dilemme moral déchirant, Justin réalise qu\'il détient le pouvoir d\'influencer le verdict du jury, ce qui pourrait soit condamner, soit libérer l\'accusé.','https://media.pathe.fr/movie/alex/HO00008324/poster/md/27/movie&uuid=37655D4B-6E68-4D14-88CB-C94E58DEAD04','Clint Eastwood'),(20,'Anora','2024-10-29','Anora, jeune strip-teaseuse de Brooklyn, se transforme en Cendrillon des temps modernes lorsqu’elle rencontre le fils d’un oligarque russe. Sans réfléchir, elle épouse avec enthousiasme son prince charmant ; mais lorsque la nouvelle parvient en Russie, le conte de fées est vite menacé : les parents du jeune homme partent pour New York avec la ferme intention de faire annuler le mariage...  Festival de Cannes 2024 - Palme d\'Or','https://media.pathe.fr/movie/alex/HO00007688/poster/md/70/movie&uuid=8965A8F9-D75E-4DFD-A65A-94BBAEE3D9E9','Sean Baker'),(21,'Flow, le chat qui n’avait plus peur de l’eau','2024-10-29','Un chat se réveille dans un univers envahi par l’eau où toute vie humaine semble avoir disparu. Il trouve refuge sur un bateau avec un groupe d’autres animaux.  Mais s’entendre avec eux s’avère un défi encore plus grand que de surmonter sa peur de l’eau ! Tous devront désormais apprendre à surmonter leurs différences et à s’adapter au nouveau monde qui s’impose à eux.','https://media.pathe.fr/movie/alex/HO00007735/poster/md/45/movie&uuid=444119EF-3FC4-49CE-ADAF-5B2A90971BB7','Gints Zilbalodis'),(22,'Sur un fil','2024-10-29','Jo, une jeune femme, artiste de cirque de rue, découvre le travail des clowns professionnels de \"Nez pour rire\". Vite - peut-être trop vite - entrée dans l’association, elle se retrouve à l’hôpital au contact des enfants, des malades, des soignants et des familles, à qui ces clowns tentent inlassablement d’apporter de la joie et du réconfort.','https://media.pathe.fr/movie/alex/HO00007272/poster/md/42/movie&uuid=78FDDF77-696E-4E1E-840E-41210D259FEE','Reda Kateb'),(23,'Monsieur Aznavour','2024-10-22','Fils de réfugiés, petit, pauvre, à la voix voilée, on disait de lui qu’il n’avait rien pour réussir. À force de travail, de persévérance et d’une volonté hors norme, Charles Aznavour est devenu un monument de la chanson, et un symbole de la culture française. Avec près de 1200 titres interprétés dans le monde entier et dans toutes les langues, il a inspiré des générations entières. Découvrez le parcours exceptionnel et intemporel de MONSIEUR AZNAVOUR.','https://media.pathe.fr/movie/alex/HO00006381/poster/md/118/movie&uuid=9CD278A5-823C-48CB-8C8E-FC5F6EF9837B','Grand Corps Malade, Mehdi Idir'),(24,'4 Zéros','2024-10-22','Depuis 3 Zéros, vingt ans ont passé… Sylvie Colonna présidente des célèbres Haricots d’Arpajon qui sont devenus des haricots extra-fins, a refait sa vie avec José Pinto. Ensemble ils tiennent un restaurant portugais à Pontault-Combault : le Churrasco. Mais depuis le covid, les affaires vont mal. Leur fils, Manu, s’improvise « scout » et cherche le nouveau Mbappé pour sortir la famille de la galère. Un jour, lors du « défi de la Lucarne », il tombe sur une pépite : Kidane, un jeune migrant comorien qui a perdu son identité et sa famille lors d’une traversée en Méditerranée. Mais d’autres scouts rôdent, déjà. Manu va-t-il réussir à le garder ? Sylvie prend l’initiative d’appeler son frère à la rescousse. Alain Colonna sort de sa retraite à Tahiti pour aider les Pinto. Mais « le football il a changé », comme dit un célèbre joueur du PSG. 4 Zéros, un coup à quatre bandes qui va permettre à Kidane d’accomplir son rêve et de trouver une famille !','https://media.pathe.fr/movie/alex/HO00007584/poster/md/29/movie&uuid=5DEE7182-653B-48F6-9518-9F900FA4BD28','Fabien Onteniente'),(25,'L\'Amour ouf','2024-10-15','Les années 80, dans le nord de la France. Jackie et Clotaire grandissent entre les bancs du lycée et les docks du port. Elle étudie, il traîne. Et puis leurs destins se croisent et c\'est l\'amour fou. La vie s\'efforcera de les séparer mais rien n\'y fait, ces deux-là sont comme les deux ventricules du même cœur...','https://media.pathe.fr/movie/alex/HO00003500/poster/md/153/movie&uuid=57F7FFC4-CA75-458C-A4C6-DE0A4677E815','Gilles Lellouche'),(26,'Smile 2','2024-10-15','À l’aube d’une nouvelle tournée mondiale, la star de la pop Skye Riley (Naomi Scott) se met à vivre des événements aussi terrifiants qu’inexplicables. Submergée par la pression de la célébrité et devant un quotidien qui bascule de plus en plus dans l’horreur, Skye est forcée de se confronter à son passé obscur pour tenter de reprendre le contrôle de sa vie avant qu’il ne soit trop tard.','https://media.pathe.fr/movie/alex/HO00007869/poster/md/122/movie&uuid=698F6563-5DAF-4905-83D0-3E76FC7BD898','Parker Finn'),(27,'Le Robot Sauvage','2024-10-08','DreamWorks Animation présente en exclusivité l’adaptation du roman illustré de Peter Brown, véritable phénomène littéraire, n°1 de la liste des meilleures ventes du New York Times : LE ROBOT SAUVAGE (The Wild Robot).  LE ROBOT SAUVAGE suit l’incroyable épopée d\'un robot – l\'unité ROZZUM 7134 alias “Roz” – qui après avoir fait naufrage sur une île déserte doit apprendre à s\'adapter à un environnement hostile en nouant petit à petit des relations avec les animaux de l\'île. Il finit par adopter le petit d’une oie, un oison, qui se retrouve orphelin.  Pour les rôles principaux on retrouve les voix de Lupita Nyong\'o® (US, BLACK PANTHER 1 et 2), dans le rôle de Roz le robot, Pedro Pascal (The Last of Us, The Mandalorian) dans celui de Fink le renard, Catherine O\'Hara (Schitt\'s Creek, ARGYLLE) prête son talent à Pinktail l\'opossum, Bill Nighy® (IL ÉTAIT TEMPS, LOVE ACTUALLY) est Longneck l\'oie, Kit Connor (HEARTSTOPPER, ROCKETMAN) interprète Brightbill le petit oison orphelin et Stephanie Hsu® (EVERYTHING EVERYWHERE ALL AT ONCE, THE FALL GUY) est Vontra, un autre robot qui va perturber quelque peu la vie de Roz sur l\'île.  Dans les rôles secondaires, se distingue une distribution non moins prestigieuse avec les voix de Mark Hamill, légende de la culture pop (la franchise STAR WARS, LE GARÇON ET LE HERON), Matt Berry (What We Do in the Shadows et la franchise BOB L’ÉPONGE) et Ving Rhames (MISSION : IMPOSSIBLE, PULP FICTION).  Cette histoire forte est centrée sur la découverte de soi, une observation passionnante des ponts qui relient nature et technologie tout en explorant avec sensibilité ce que cela signifie d’être au monde et connecté au vivant sous toutes ses formes.   LE ROBOT SAUVAGE est écrit et réalisé par Chris Sanders®, à qui on doit notamment la franchise DRAGON pour DreamWorks Animation, LES CROODS et LILO & STITCH pour Disney. Le film est produit par Jeff Hermann (BABY BOSS 2 pour DreamWorks Animation et coproducteur sur la franchise KUNG FU PANDA).  Le Robot Sauvage de Peter Brown, est un roman illustré pour les 7-8 ans publié pour la première fois en 2016. Le livre a depuis inspiré une trilogie qui comprend désormais The Wild Robot Escapes et The Wild Robot Protects. Peter Brown est un écrivain à succès qui collectionne les récompenses. Il a notamment reçu : le Caldecott Honor, le Horn Book Award, deux E.B. White Awards, deux E.B. White Honors, un Children\'s Choice Award en qualité d’Illustrateur de l\'année, deux Irma Black Honors, un Golden Kite Award et un New York Times Best Illustrated Book Award.','https://media.pathe.fr/movie/alex/HO00007217/poster/md/97/movie&uuid=A8AD4AE6-9E11-412A-B97C-7F6C7A1BCEA9','Chris Sanders'),(28,'The Apprentice','2024-10-08','Véritable plongée dans les arcanes de l\'empire américain, THE APPRENTICE retrace l\'ascension vers le pouvoir du jeune Donald Trump grâce à un pacte faustien avec l\'avocat conservateur et entremetteur politique Roy Cohn.','https://media.pathe.fr/movie/alex/HO00007687/poster/md/36/movie&uuid=84C55D35-80BC-459B-B6D5-6EB85E5FBB53','Ali Abbasi'),(29,'L\'histoire de Souleymane','2024-10-08','Tandis qu’il pédale dans les rues de Paris pour livrer des repas, Souleymane répète son histoire. Dans deux jours, il doit passer son entretien de demande d’asile, le sésame pour obtenir des papiers. Mais Souleymane n’est pas prêt.','https://media.pathe.fr/movie/alex/HO00007682/poster/md/48/movie&uuid=AFD49FCE-BBA7-4C88-93F0-294A24AA8C87','Boris Lojkine'),(30,'Joker : Folie à Deux','2024-10-01','A quelques jours de son procès pour les crimes commis sous les traits du Joker, Arthur Fleck rencontre le grand amour et se trouve entraîné dans une folie à deux...','https://media.pathe.fr/movie/alex/HO00004911/poster/md/178/movie&uuid=1153B7E8-5F50-4B65-ADE8-B76C2D73B5CA','Todd Phillips'),(60,'Courts-métrages 1 Festival Africlap','2023-11-09','Programme de courts-métrages.','https://media.pathe.fr/movie/alex/HO00005419/poster/md/3/movie&uuid=34AAF566-89B4-4912-B502-E24C3051993B','Nationalité : Egypte'),(62,'Alda et Maria','2015-01-13','Lisbonne, été 1980. Deux sœurs de seize et dix-sept ans arrivent d’Angola pour fuir la guerre. Livrées à elles-mêmes, Alda et Maria vont devoir apprendre à survivre sans argent, dans une banlieue grise et polluée de cette ville étrangère. Avec la complicité d’autres Angolais, les deux adolescentes s’organisent une existence précaire. Cet exil va leur apprendre à choisir leur destin en devenant des femmes fortes et dignes…','https://www.pathe.fr/assets/source/img/poster-placeholder-pathe-empty.jpg','Pocas Pascoal'),(63,'Twilight - Chapitre 2 : tentation','2009-11-17','Tu ne me reverras plus. Je ne reviendrai pas. Poursuis ta vie, ce sera comme si je n\'avais jamais existé.\" Abandonnée par Edward, celui qu\'elle aime passionnément, Bella ne s\'en relève pas. Comment oublier son amour pour un vampire et revenir à une vie normale ? Pour combler son vide affectif, Bella court après le danger et prends des risques de plus en plus inconsidérés. Edward n\'étant plus là pour la protéger, c\'est Jacob, l\'ami discret et indéfectible qui va la défendre et veiller sur elle. Mais peu à peu elle réalise l\'ambigüité des sentiments qu\'ils éprouvent l\'un envers l\'autre...','https://media.pathe.fr/movie/alex/HO00006920/poster/md/3/movie&uuid=A8BC8B0F-B120-4BBB-90C5-B6896273FE32','Chris Weitz'),(64,'(500) JOURS ENSEMBLE','2009-09-29','Tom croit encore en un amour qui transfigure, un amour à la destinée cosmique, un coup de foudre unique. Ce qui n\'est pas du tout le cas de Summer. Cela n\'empêche pourtant pas Tom de partir à sa conquête, armé de toute sa force et de tout son courage, tel un Don Quichotte des temps modernes. La foudre tombe le premier jour, quand Tom rencontre Summer la nouvelle secrétaire de son patron, une belle jeune fille enjouée.  Au 31ème jour, les choses avancent, lentement. Le 32ème jour, Tom est irrémédiablement conquis, pris dans le tourbillon étourdissant d\'une vie avec Summer. 185 jours après leur rencontre, la situation est de plus en plus incertaine – mais pas sans espoir. Alors que l\'histoire fait des allers-retours au sein de la relation parfois heureuse, mais souvent tumultueuse de Tom et Summer, le récit couvre tout le spectre de la relation amoureuse, du premier coup de coeur aux rendez-vous, du sexe à la séparation, à la récrimination et à la rédemption et décrit toutes les raisons qui nous poussent à nous battre aussi ardemment pour arriver à trouver un sens à l\'amour... Et, avec un peu de chance, à en faire une réalité.','https://www.pathe.fr/assets/source/img/poster-placeholder-pathe-empty.jpg','Marc Webb'),(67,'Séance cinémathèque - En quatrième vitesse','1955-09-06','Le détective privé Mike Hammer enquête sur la mort d\'une jeune femme qu\'il a connue furtivement. Ses investigations le mènent vers des enjeux qui le dépassent.','https://media.pathe.fr/movie/alex/HO00008403/poster/md/3/movie&uuid=BE9B9514-BE73-4121-AFC1-44D568D8F0F8','Pathé Amiens');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genre` (
  `movie_genre_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`movie_genre_id`),
  KEY `movie_genre_ibfk_1` (`movie_id`),
  KEY `movie_genre_ibfk_2` (`genre_id`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (7,4,3),(8,5,3),(9,6,3),(10,7,4),(11,8,5),(12,8,6),(13,8,3),(14,9,3),(15,10,5),(16,10,3),(17,10,7),(18,11,3),(19,12,3),(20,12,8),(21,13,3),(22,13,9),(23,14,1),(24,14,10),(25,15,3),(26,16,3),(27,16,8),(28,17,3),(29,18,5),(30,18,6),(31,19,3),(32,19,11),(33,20,3),(34,21,12),(35,21,6),(36,21,2),(37,22,13),(38,23,14),(39,23,15),(40,24,1),(41,25,13),(42,25,10),(43,26,9),(44,26,11),(45,27,12),(46,27,6),(47,28,14),(48,28,3),(49,28,8),(50,29,3),(51,30,5),(52,30,3),(103,60,16),(107,62,3),(108,63,2),(109,63,10),(110,63,17),(111,64,1),(112,64,3),(113,64,10),(117,67,19),(118,67,11);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_metrics`
--

DROP TABLE IF EXISTS `movie_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_metrics` (
  `movie_metrics_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `visit_count` int DEFAULT '0',
  `visit_time` int DEFAULT '0',
  `rating_total` int DEFAULT '0',
  `rating_count` int DEFAULT '0',
  `bookmark_count` int DEFAULT '0',
  `final_count` int DEFAULT '0',
  PRIMARY KEY (`movie_metrics_id`),
  KEY `movie_metrics_ibfk_1` (`movie_id`),
  CONSTRAINT `movie_metrics_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_metrics`
--

LOCK TABLES `movie_metrics` WRITE;
/*!40000 ALTER TABLE `movie_metrics` DISABLE KEYS */;
INSERT INTO `movie_metrics` VALUES (98,67,94,8095,1,1,1,1),(259,4,21,6351,5,2,14,3),(260,5,78,2997,1,1,0,1),(261,6,85,8330,8,2,0,4),(262,7,46,5517,2,1,0,1),(263,8,14,6461,4,1,0,2),(264,9,3,7929,6,2,2,3),(265,10,91,9943,2,1,0,1),(266,11,16,1361,1,1,0,1),(267,12,52,432,4,1,0,2),(268,13,15,7842,3,1,0,2),(269,14,99,5730,5,1,0,3),(270,15,65,6665,2,1,0,1),(271,16,78,8492,5,1,0,3),(272,17,92,9418,5,1,0,3),(273,18,84,4203,3,1,0,2),(274,19,57,1952,2,1,0,1),(275,20,59,2738,3,1,0,2),(276,21,7,6328,5,1,0,3),(277,22,81,2349,4,1,0,2),(278,23,98,7107,3,1,0,2),(279,24,86,5195,1,1,0,1),(280,25,47,3750,3,1,0,2),(281,26,5,9757,4,1,0,2),(282,27,61,9336,5,1,0,3),(283,28,36,3458,4,1,0,2),(284,29,6,4624,1,1,0,1),(285,30,20,6587,4,1,0,2),(286,60,45,2162,4,1,0,2),(287,62,93,5115,4,1,0,2),(288,63,27,853,4,1,0,2),(289,64,76,190,4,1,0,2);
/*!40000 ALTER TABLE `movie_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(1000) DEFAULT NULL,
  `isAdmin` tinyint DEFAULT '0',
  `isBanned` tinyint DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'test','$2y$10$8orjwmGRchf1F1/RYTgU.u5adJWGM8DXqt6FgUlB1awjk16msRx8S','test@test.com',0,1),(3,'test','$2y$10$Wx/c3rq/LfpdPhDi/THBgO9FzxldWUUqvV1cDVm5lxeV3ttIkOWUW','test@test.com',0,1),(4,'test1','$2y$10$HzFHyLbx/fCPLD0AiX2Oi.230z7YGi6Akpd4bYavQ57/oRkXsoCcS','test@test.com',0,1),(5,'test2','test@test.com','$2y$10$slaSzCmup9BEnME2mP75BOw1WS01QQ8J0xgMwpIG.pFX8UV0MXlyu',1,0),(6,'test10','test10@test10.com','$2y$10$44IeGyczQ.Hnu0Q36rTrf.EdR1XQ4SlnquxTSCzAXq0H0KHNMKaee',1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_bookmark`
--

DROP TABLE IF EXISTS `user_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_bookmark` (
  `user_bookmark_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_bookmark_id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `user_bookmark_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_bookmark_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_bookmark`
--

LOCK TABLES `user_bookmark` WRITE;
/*!40000 ALTER TABLE `user_bookmark` DISABLE KEYS */;
INSERT INTO `user_bookmark` VALUES (3,2,67,'2024-11-13 13:22:38'),(18,4,9,'2024-11-13 14:19:35');
/*!40000 ALTER TABLE `user_bookmark` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_bookmark_AFTER_INSERT` AFTER INSERT ON `user_bookmark` FOR EACH ROW BEGIN
	UPDATE movie_metrics
    SET bookmark_count = bookmark_count + 1
    WHERE movie_id = NEW.movie_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_movie_metrics`
--

DROP TABLE IF EXISTS `user_movie_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_movie_metrics` (
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_clicks` int NOT NULL,
  `user_time` int NOT NULL,
  PRIMARY KEY (`movie_id`,`user_id`),
  CONSTRAINT `user_movie_metrics_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_movie_metrics`
--

LOCK TABLES `user_movie_metrics` WRITE;
/*!40000 ALTER TABLE `user_movie_metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_movie_metrics` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_movie_metrics_AFTER_INSERT` AFTER INSERT ON `user_movie_metrics` FOR EACH ROW BEGIN
	UPDATE movie_metrics
    SET visit_count = visit_count + 1
    WHERE movie_id = NEW.movie_id;

    UPDATE movie_metrics
    SET visit_time = visit_time + NEW.user_time
    WHERE movie_id = NEW.movie_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_rating` (
  `user_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `rating` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `user_rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_rating_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rating`
--

LOCK TABLES `user_rating` WRITE;
/*!40000 ALTER TABLE `user_rating` DISABLE KEYS */;
INSERT INTO `user_rating` VALUES (4,4,4,'2024-11-13 13:52:55'),(4,6,4,'2024-11-13 13:59:01'),(4,9,1,'2024-11-13 14:19:03');
/*!40000 ALTER TABLE `user_rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_rating_AFTER_INSERT` AFTER INSERT ON `user_rating` FOR EACH ROW BEGIN
 UPDATE movie_metrics
    SET 
        rating_total = rating_total + NEW.rating,
        rating_count = rating_count + 1,
        final_count = rating_total / rating_count
    WHERE movie_id = NEW.movie_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-13 21:23:32
