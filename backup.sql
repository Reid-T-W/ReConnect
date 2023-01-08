-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: reconnect_db
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `subcity` varchar(30) NOT NULL,
  `woreda` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('1afc55a4-d29b-42ca-a992-b27b6365eb3f','2023-01-06 14:20:19','2023-01-06 14:20:19','Addis Ababa','Bole','09'),('2e04264f-6245-40ec-ac2d-e35596132750','2023-01-06 14:17:47','2023-01-06 14:17:47','Addis Ababa','Bole','12');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `contacts_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES ('13ba9596-c5e6-4b32-984a-7d1666ab09d2','2023-01-06 14:20:19','2023-01-06 14:20:19','Hanna Mekonnen'),('1f3eb266-def8-4f9e-a518-d04fcefb2b0e','2023-01-06 14:20:19','2023-01-06 14:20:19','Haile Mekonnen'),('93aa27a1-47b7-4ef3-aa8b-b11ab63875b3','2023-01-06 14:17:47','2023-01-06 14:17:47','Filimon Tadesse'),('96d8f3ad-4edf-4e74-80f4-cd946e681350','2023-01-06 14:17:47','2023-01-06 14:17:47','Biniyam Tadesse');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactsphone`
--

DROP TABLE IF EXISTS `contactsphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactsphone` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `contactsphone_name` varchar(30) NOT NULL,
  `contacts_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_id` (`contacts_id`),
  CONSTRAINT `contactsphone_ibfk_1` FOREIGN KEY (`contacts_id`) REFERENCES `contacts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactsphone`
--

LOCK TABLES `contactsphone` WRITE;
/*!40000 ALTER TABLE `contactsphone` DISABLE KEYS */;
INSERT INTO `contactsphone` VALUES ('1e5e1c4c-09f6-4a10-b00c-4db3bd71dd7b','2023-01-06 14:20:19','2023-01-06 14:20:19','456789489','13ba9596-c5e6-4b32-984a-7d1666ab09d2'),('2d957d7f-449c-471c-a42c-2002cecadd1e','2023-01-06 14:20:19','2023-01-06 14:20:19','789456456','1f3eb266-def8-4f9e-a518-d04fcefb2b0e'),('6c4dec23-176a-4c7e-9086-b386505e447f','2023-01-06 14:17:47','2023-01-06 14:17:47','111222333','93aa27a1-47b7-4ef3-aa8b-b11ab63875b3'),('ac0cafae-b510-4389-a4d4-815f553d478b','2023-01-06 14:17:47','2023-01-06 14:17:47','456889123','96d8f3ad-4edf-4e74-80f4-cd946e681350');
/*!40000 ALTER TABLE `contactsphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missingperson`
--

DROP TABLE IF EXISTS `missingperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missingperson` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `missingperson_name` varchar(50) NOT NULL,
  `missingperson_gender` varchar(6) NOT NULL,
  `missingperson_description` varchar(500) DEFAULT NULL,
  `address_id` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `missingperson_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missingperson`
--

LOCK TABLES `missingperson` WRITE;
/*!40000 ALTER TABLE `missingperson` DISABLE KEYS */;
INSERT INTO `missingperson` VALUES ('95d7ca2b-cdf1-413c-89d3-c31f6f9959c1','2023-01-06 14:17:47','2023-01-06 14:17:47','Solomon Tadesse','male','Curly hair wearing black suit','2e04264f-6245-40ec-ac2d-e35596132750'),('f45cdabf-4c74-42b9-a610-c09aeead5e92','2023-01-06 14:20:19','2023-01-06 14:20:19','Leul Mekonnen','male','Wearing red shirt and blue jeans','1afc55a4-d29b-42ca-a992-b27b6365eb3f');
/*!40000 ALTER TABLE `missingperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missingpersoncontact`
--

DROP TABLE IF EXISTS `missingpersoncontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `missingpersoncontact` (
  `missingperson_id` varchar(60) NOT NULL,
  `contacts_id` varchar(60) NOT NULL,
  PRIMARY KEY (`missingperson_id`,`contacts_id`),
  KEY `contacts_id` (`contacts_id`),
  CONSTRAINT `missingpersoncontact_ibfk_1` FOREIGN KEY (`missingperson_id`) REFERENCES `missingperson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `missingpersoncontact_ibfk_2` FOREIGN KEY (`contacts_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missingpersoncontact`
--

LOCK TABLES `missingpersoncontact` WRITE;
/*!40000 ALTER TABLE `missingpersoncontact` DISABLE KEYS */;
INSERT INTO `missingpersoncontact` VALUES ('f45cdabf-4c74-42b9-a610-c09aeead5e92','13ba9596-c5e6-4b32-984a-7d1666ab09d2'),('f45cdabf-4c74-42b9-a610-c09aeead5e92','1f3eb266-def8-4f9e-a518-d04fcefb2b0e'),('95d7ca2b-cdf1-413c-89d3-c31f6f9959c1','93aa27a1-47b7-4ef3-aa8b-b11ab63875b3'),('95d7ca2b-cdf1-413c-89d3-c31f6f9959c1','96d8f3ad-4edf-4e74-80f4-cd946e681350');
/*!40000 ALTER TABLE `missingpersoncontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picture` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `picture` varchar(500) NOT NULL,
  `embedding` blob,
  `missingperson_id` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `missingperson_id` (`missingperson_id`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`missingperson_id`) REFERENCES `missingperson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES ('1db84c07-4d12-4fd1-bec8-07c32213bc37','2023-01-06 14:17:53','2023-01-06 14:17:57','images/007A26.JPG',_binary 'ìNUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \nn\r<\r\‡…ª% $=h¯à=\ŒZ\ﬂ9M\›<A\« Ωúe=\œ$Ω\œ◊ºÆ\Ô=i≥Ω®=z^.ΩBi\Ô;,åºCéC<t\0Ωß®\˜<\Ú\⁄;+ß\ ==<5º±úQΩqóΩJe0<Z}<Q*u=\Èj\n=\¬¬à=d\˜º‹älΩ\ a8<¸eΩJ\Œºãs\rª\rÃêΩ2£3Ω,Ω\‹bó;=äÖΩ,ªv=çëº<â\ı	º\ÒT@º§0º\·K\0=-I^<î&\0Ω\"KnºD∑ªB\ﬁ˛<j\ÊYª]\ıù=\Ûèº<l\"=7ifºj^P=\»“®<4\÷\Ù;∆Ñ∞<à\√}=\\¶ùΩâ/Ω˘\‹Zºpg˙º\…\ﬁO=§8=Eywª-[›º®ÃâΩy©?Ω\‡∞<6xLΩú\#=8ƒÖ=s3=Ä\√ºÑyó;& ‹º\Î@°<,\… <ãBº\\¬´∫õèº\À@º:û:<≠:|=CTäª@Ü¯<\Û>Ö=\⁄\Ï$Ω£n»ºs˙Ω]å=\Òn+Ωd¢ç=ñ0=\¬\«fºc\ˆº\…iP<,NàΩUa≥Ωéx!=˛p™ºÜŒºxáº+\·\rºˇ´Ñº\n´Ωh°|<í∏=K\·ß<°m\rΩ\Âº>º\ZºSß=•ÅÍº®\Ú˘<€•;4{`=\ N\"=\‰ßF=-Ö\ÛºµCü<œ≠§=\Èö<mH\«=ì\√ º\Ë<Zh\Âº/<,\‹=Ç¯;π§\ﬁ<\ÔÜ\Â<9›∏< Å@=9=\"πΩ\Ÿ√Æ<\rF˚ºb5Ω©˙ì;∫\«#Ω\‘\\w;çSÅ=|\";›ìz<¢Ñ\ÙªõIΩŸï<˙Z\Û<ø±Ω≥≥ΩÆÖª<∂âºHûë<≥\Ë=><∑\\˚=\·`=\0C¥Ω=\'\ÃLº®±fΩ!v=ÇåM<[Ω\Îëc<18@=VPÖ=\ıNá=\Ûë\‡=^˝\ÒΩm\ZƒºRm£;\—C2<\»1\\ºΩ\Ê\Âú:%¡=E›â<A\ÛΩô˙}º\Ò9º¿°û=å\ƒqΩGCΩÖ Cº\nÕº\Ê\ÛKΩOâ=\‘\Ù°<]P=Ω\Í\Ù\n;çöo<Y8Øº3çΩ”£≈Ω{	ùΩ˙\Ìq<q„úº\‡LF<˘ ºöæÏâé;\„BπΩsï5<\∆q\Òªcî†<¡£ó=râ\—<;q˚;9î<{\Ú\ÛºàsR=\ı\Ù®º–Å£;]\⁄=Ω-Ωóâm=ïπt<I_ãΩµ\ﬁR;\ÙkTºØ6ò=ëuººD\n™;\¬\ÏÇ=d¶ºT˝oΩ\˜\ﬁ˘ªo®tºÖ±CΩç)ΩV\–=g\'&º\◊\ÙΩÇ	=É∫ê=–òËº∑¨í=û\Õ˛Ω0¸º\˜á˘<1ÅÅº@>\Òºã”ãΩ\ƒ\ËL=\Ó≠ ΩƒºÉ0P=ΩQ#Ω ßΩ\‰>\Á=ÿó^=NL\Û∫ã\‡ùºB¿º¶z*ºmciªj)!º\œ\rº=©\0Ω¿(x∫övú<\”\n0Ω£L’∫Æ\ÈNªõ\À*Ωúy˝=à\È\◊<\ıZYΩ\÷K-=É\Ô3=\Á\ÙººZD`Ω\–I<ù\'\‚ª˚º\Ã=•\«¯ªFM7∫\Ò\‘<D\Ê\œ=\nê<\œ\09ºsíΩ\⁄,Eº\⁄\r+={b\Ô;*xT=P&X=0ø|º*´ò=M\ \Í;P7\Â;∑sº\€t\·ª\–G´<@˚Àº´•=\Ÿjh;)\‚Ω∂vöº\„\è=\⁄3È∫∫\'IΩG¢èΩ˘;ΩπΩBü(=h˛øª|≈ÄºΩScªå\‹Ω{•<º§†=∆öü;@5è=øßCΩ?õèΩ\’1ø=úmæq\Ãi=†¶€º,t\Òº\»\ﬂ\Ÿ<ûû#Ω˘£¶<äi\Ÿ<¢eâ<LÑb<\Œ:]ª¯™ºí7yΩër\“;véf∫ø\”P=˝\ÔOºm[T=AMH=¨≥&Ω∂{4Ω\‹V%<\rÜ<G&ìΩ\ƒ\˜.<\‚ﬁ•º5\œrºê\…Wºæ£<\ÌcÈºñô=\Û\⁄h=^ç<•ŸúΩùß\ﬂ<Qåú=Ÿë<_ïôº{5ˇ<ã/Ωm¶ßº\Ïä:Ωl•Ωv\Â5Ω¨rëº\\&\ÿ=L“º:±\⁄“π\’K-Ωt\ı‹º\Ÿl=Ω,Ω∫`òΩò∂ÉΩ~\"-Ω\˜Ω\\.≥;\œS|=ö!9ºQ-∫ªÑ}5Ω\ƒG\Ó;W\È~º]G=§Gçºá\ﬂ˛<™*ºQΩòÒ∫ºπ\Ê˝º\Â±π#\⁄\È<R_=˘Ÿà<±tÆ;™\ﬂ»Ω\„\„=(\–xª\¬1Ω[¡àΩ8&=	.∏<ng(=ˇ2N=û©;\ˆ%≥<{63;∆øAΩæ\‚\rΩ1§mº¿2!ºj™ΩD\ÓD=\"Å=µÆ\\<\Â\ÊΩg˛üº\„==•bèº∞$ Ω\—|ÇΩ\È% Ω˘®\ÏΩ\Ó|a=\“WùΩs:c< ˛\–;Æ.\‚=c>\\=´uºß\r©Ω\’4s=1ë(ª\»\‘u=õnº\ƒF=–ñu=}¡ΩO\n(º¢rûª2-c=ÉQb=ã\Z8ªröª$\÷AΩå	}Ωb¢Ω±¨=ù?Ω6™Æ;ò\ﬁDº¸\Ë\Ù=ÆIaº3k]Ω\Ósßªe\‘\÷<}r\«<\Ój\◊<â∫Hê;=&≤ß<ˇv\ˆºGyª6∏π∫ÇΩ5•h<´,ΩÇpº/^C=ﬂµG=\‘_%<\Ê\=j(7=\Ï%ÇΩê<ì˚€º\Õdªc£\Õ<\ÔΩ≥¨)º¢CbΩ(P]=õ\≈7Ω\˜ÆÕª\n*=\Ô3ΩGTO<\⁄6=WFÉ9P\ZΩ\˜√ö<\Á>©=¢JªΩa iºzûH=lGx;\œˇºT™<0∂àΩ@˚qºI\Ó°<ì=o∑lΩ\Ó\‰ç;Æ\Ï\Õ<\È5ΩP£∞;','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1'),('9659ccf3-a2b2-488c-8eab-fa2b5b002036','2023-01-06 14:20:23','2023-01-06 14:20:26','images/001A28.JPG',_binary 'ìNUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n\0ã_Ω;ü:¨\Ì”ºº(QA=ôv<T®~ºe!ÖªV^\nΩ5L◊º1o2<\Ì\Ò\<\Î)ˇ<XK\⁄;R4¢=>JΩÕôŸªZπg=¨ö4º2∏UΩ8\'Rº\‚Ç<xu(=\r~¯º¢«ºEêΩ9o<å\ﬁ5<\ﬂN\Îº\ﬂ\‚<≤\ÕΩ=hΩ,\\'=¨óUº¸∞1=\‰O‰º≤Ll<ú\ÚÑ=ç\ŸoΩK\ı$Ω\“\Ï\Õ:£é;\‚Vöª\˜∞vΩœ£Ω\»\÷:ªv®¿<Uw<\Ë“ΩZg8ªˇ®+Ωè6N=u\Z≥;A8lΩ\«6ëº©\ŸΩ\Í\›=™x=\‘pº£Ñ=£™Ω;B\Á<4<\„\ˆ5Ω*H8:|ˇ…º\Â\◊]=0Ω#õª\”Y< +ªPI\◊<è”ºòíΩy\„e=\Ó\Ì)Ω∏˚%<\ı+*Ω|\√=ó{?=\˜\ÊOΩ\Û-öºV\¬=\\¶:ΩˇâΩØ51Ωó\√}ºˇ<\Û<U]ßΩ\ÍìaΩó1ã;	ã;XÄª¯çáΩS\œe<Gâäº\–\·\—<~Pºº*ºˇ:(8Q<zøƒº:@º\√Fx;}\Z\¬==∂SΩˇ?V=ù¶òº\Û\Ÿ\0=?”∂ª—ûY<ÆcDΩ\’\‚>=9MΩ©ö©ºπ\Ûn;c\Ù†<g[Ñ=3%Ä=<!=\‹J4<\’(ˇº¸à-<Õäª‘º?Y,=f9∑=N\n¸º*∞_ªµ\\tΩ\ÍÑΩ∫3ó;¡\ÂÉ<˘º=}ÃºG0üº\Ÿ\'\È;|Ÿº@¨?=µ©≠º\Û|`Ωï£7Ω≥g\’<\ŸA;L_\Ï<π\0e<[ØQ=H	æΩñ>uΩ\r$Äº0Ω\Á<‹ãBΩ\÷%UΩæ\'ÜΩ\◊\⁄\„ªLY=å©Ωå\n<\Ô\ÿ<-Nÿº\"=]m¡∫≥\'ßª\nò\‡<Åˇ^==¶¯º~Gß=\Õ+ºïà*Ωâ>ÇΩ3é<G\˜å<áª_=\ˆ]=UΩ£\0úΩjâQΩπÑ\Ÿ=/R7Ω†ÀêΩ\\≤ºA\‘,=Ω\ıºnq=‹π=6\Œ\”<1åÖ<Kﬁπº\¬\∆¯<e\Ã(=\0ïÀº[\'Ωµ¶Fºe\Áã=cáb<4q*Ω\Âº=…ìí=\ƒ9\“<˝\ƒœΩ\Ã\r\0;\nòÇº\Ÿ\“Ω¶Hõ<	ïΩπÜ¶Ω›Æ=™4öΩ3í<ºÆô\ÎºRB\œ<\n\·D=D_=\»GëΩ\Òü:X≤j<åºâªûL∑<øèºJDº\Ó\'v<v\0Ωº\Ó;@(ÆΩãûΩY>y<võ\∆<\È\n=qΩ\ÌÄgΩò5Ä<f“ºìW∞=˛\È\Á;ìGΩ¿õ;µ¨=\\œ\'=j\Ëª\ŒÕ¢<HRΩ\ŒYº2\¬\rΩdÇËº£âNΩä‘ª\˜V\Á<gOo=\∆o$=\Ì\«ª¿;ëº\‰á<´œºñ\⁄Bº\ƒ\‘ƒª\Îe=ù2Ç<3\“.=g©-;\"cºYÿ∂<r\œe=£\ÍºÖûæ;wî?ª<6ΩQ\ÛªPüΩ›≥=ü\Á\"=\‹oM:\’Wa;?cD=\ÿ\¬<œâÇΩM˚º\ÀáΩ©˝<\È\0åº6T[=Ûè∑º∏ó-=w≠íºZ≠2Ωªæ2Ω,\‹Ω\Õ\⁄X<(∏v=9,1Ωˇn:Ω/n\·Ωq¯æº\Z.ûΩúˇê=¨*\';#kºog¢ºã{\Í<|z\ƒ<\„á=uvP<∏¡∫=\“oΩÇZ= B\ıºÑ\⁄\À<iº\ﬂ\Ù=wIDΩ6#XΩ£	\0=xÜ$;\„á=m¸<(Bí<˝˘˝<á\œZ=1ä¢ΩQ\Í	∫é≠ΩE4¥<Hw=£{%º\◊ºÅí@<ñ=£ôtΩZT<òØ9ºc\◊\»=\œ\ =\ﬂ=n\Ã<<vÃö;\ﬂ,ºˇ‹ΩÄ\ƒbª˚\–·ºØy<8òáΩ2è\≈=#±Sª\ı	(Ω{\ˆLΩSªî=\˜M=çIºúˇyΩpcä=jM=tm+Ω¢\ÈSΩê\"ﬁº\\m∂;_S|;£Låº\„kC=\‘\Ó;ã9=\ÏÓºº\„0=âN<Ëóá=\„æîΩ\Ë\Ï’Ω¨∑\ı:öj_Ω%∂\ÿ<»≠ªΩ5`<H∂\Ú<\»\Ÿc<\Â`<.á<ÿùI<^-æºåj\œ<s∞ÆΩä°ëΩ7˛€º ∂ºÑ\"Ÿºê…ì<^•®Ω\œ\ı9ßΩ´9=	 ∏Ω%é=`Ñãºπ¨˚º˙õ=\›]ò<Öé<¡Ω =æüî<t[@=\Í°b=÷£ö=¨=\€u~ΩÅ≤>T<x&ª\ÈxÕªk\Ì\0Ω à\≈<¶~QΩ\‹<Ω\Û\‡O=àiÿΩ>\ÚV;T\Í¡;\Ësπ=†°pºzx‘ª+\Á+<-)N=/\Á=≠DçΩ+îº7n\"Ω:\\"Ωd@\\=\‹\Œ\\<tëªª\«	ƒª[\‰û;\ˆˇ˛º\ˆ¡<d+ëΩ0º8<î#¨<	HõºvΩ £UΩ\'zºˇ\ ;ßK§º2V3ΩnµÉ∫r\◊¸ºNä=\·<\‚ªsü=âøª<\≈j=îVΩ≠í´Ωl\‹<G~Ω™Ü6==∂-=(YzΩtY∏º#pºsÃë=`8S=∂g\ÿ:éb\0;‰êéº˝M\ﬁ<[ö>Ω1ÑoΩ{\‰=\Áf\:í3ΩäûªÆrª\Èuº≤ß<çøΩ\„b<±C=9ΩS>õ;eì™=5\'º\—K∞<\Ô⁄é=AªR\⁄[Ω\‚ZÑ<˝uöΩoa&=¨\’\¬=\›KﬂªÇzæNr3<jIù=\” ®Ω˚4=[`\"Ω\n±”ºX\‰ú=òéΩÀÆè=|B<çΩºIc=RôSΩP¡+ΩH0=É0∞º\‹:u_=\ˆ™\œ<9}0=\Ù\Ú5=∞k∂=2	MΩ\ˆjÆΩ','f45cdabf-4c74-42b9-a610-c09aeead5e92'),('9c99d0e8-6542-4a02-8866-ec007d82497a','2023-01-06 14:20:26','2023-01-06 14:20:30','images/001A29.JPG',_binary 'ìNUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n^ÇFΩÁÆñ;.Ω\ˆºÖ¥àº`=\√p\„<ˇ)Ωº©∫a<}cΩ?Á•º\’O\≈;˛_/=ü\‹0=ßf;l≥=[QΩu.º`A/=\».£ª|SéΩ8,ΩRY\ˆ;ál=¯\Ziª\’\Ò∫πH?Ωb∞<\€~ºksΩºhñ™<{\Ù£ºéΩ_\'-=\\ˆ≈ªX\ÂΩ<©–Ω:§y<›Ω\ =\Ï@ÖΩ\·µ◊º† k<M£?ΩC0OºEîeΩµ\ËNΩ\Ñéº>Q˛<Üéì<\nΩΩΩò˝ª÷òΩó_=U\»;y∏nΩ\⁄R˙º&l<Ö±ß<Pî$=ã\n.ªkf<\·&åΩe>\∆<dåº†yº\Î\‰<˝ûPΩÖ4;â\ZRΩ6ìºâæ\«<ˇ\ı\Ê:éÆ,=\»TaΩÀ§´ΩG\÷%=vGNΩ\È\‚/Ω\„°Ω\≈=P\·L<ûπúºï(ºd\Ëñ=\Õ*^ΩóÃº¥\«º¡)“º\–\\=\"7uΩE£fΩnëè;äØB<\ÀgÏªé|ëΩ]j8=t-%Ω\·\‚0<ﬁºßl§;^A3ªIà\r;/æ\ÿ;\≈K.<ﬂ£®=£pΩRá,=*\‡0ΩK3\Z<\√\˜\';∫\ÁÇ;\◊jiΩ\Ì´ê=˙≥èΩ\rçΩ\∆¸D∫\Â´=W)ò=Vâm=\„æv∫ä©o;¢4 Ω\Óûy;}˝åº\Œ\◊2Ω\Îá=l¶=Ñ\œ@<$[0;ñ|ΩLF∞Ω}km<\∆]±<\«|æ=Te≥ºé1º\·`øπ;º5Ω\Ë6=´\‰Iº\‚\’\"Ω\0laΩ˚[=l[x<\“&=\Òåã<ûø\\=+éiΩÇõ\Ìº∞|<¡˙<E\rxº[0Ω≠Ô¢ºõõYº.29=\Z¡Ω\Â!w;\ÛÖ<É§=´˛´<ã†fºZãºπ!=}â=}ùlΩï~O=\\	Ωfó\\Ω\ÓŒÖΩöP,<yZ∏<F´\‘<îY0=\ a~º\»BîΩ\›J\˜ªggv=j!ΩøŒõΩ\≈3zªo\<¢\ÙmΩçè¡<{˚~=⁄°L=\ËWh<\”:ë<üâ\‘=æ\Ê#=ˇ˘ºUnªf`<\Ê\Ù`=EΩ#\ﬂ‹º	.=qLñ=¨úÅ:FºßΩﬁüPº\0πPºC~JΩ$==∂•õΩ√™7Ωhµv=\˜0Ω≠Æá;}üê;\rÿâº∞óªO=rÇÇΩÜå\’;\¬¸\«<}\’ Ω\n\Á!=∫{çº¸r\È:ÊÇÆ<\Ó<ÑΩòè\Ù<ícªΩ®\ÈjΩ`\‹\˜<u£<vB\ÙªO—Éº%ãΩb¬≥;nsYΩà\Ú∑=2V<~≤Ω5ôûª\ŒA-<¸~û=%ì<©¢ó<†¨´Ωg\Ã$Ω$]≤º¯1Ω%\'>Ω\÷xíºãG\ﬁ<\·áo=$2Ç<+sÕº¥á=ì\Èî<\ÿ\Î6ΩJ$<ß.∑<êz=\Œc]<≤dJ=\≈\”ª\⁄˝ñº\ƒ¸\Ú<Yù=\ﬁÁåº>H\Ò<\¬M\«;\Zç\ZΩ}\ÔMΩ§ùºπ∫<P\ƒ=ùgVªπŒÖ;.Tâ=æ-\'<\·mΩYmîΩ\ÈèΩk™è<\'7$Ωaêº=E\ÿ\'º®\Ï;Q\\nΩ\"∂ΩD_EΩUé¥º5X=˙W\\=Ÿª,ΩF}|º\Èæ0b_ªÑΩ¥\Í\◊=\◊\›<˙vÅº\…uΩ\‹q%=˙f&<ó\‚\ÿ=`\—\„<&bò=#v5Ωª\0\˜<\"Ωöüx=h%ΩY¯å<nß\"Ω^a8Ω\ÙêF=%à<⁄¨y=\Ÿ9;\\<∞†&=\ﬂ\ƒO=ë/Ω\·Ny< ô∏ΩG¨}:dØ¨=\Ôwºv•oΩCAb<m6<ï-ùºWïM;û\‘ª∂J\‹=b¨<˙ï=Y<?\Ze<\Â Ω\Î†\ÈΩ?\'2<s.˚º\»6\⁄<5ÑΩëN¥=ö)\‚º¢mΩRXΩ\Ìzì=t\›8=\⁄\‘Mº\≈Ωå\Úô=#∞á={\‚ΩWPΩW’êºhV	ΩS8€º}º™´-=˚ª•<B<<_÷∂º\';û;=ûí<–™=\“\—æè\Èº(örΩ\Ô≤qº•º`\Ó=[\˜Ö<$û<Å:¡<O\"Aºÿé#<\Ù`\€:»±=ª2AΩïà$<	∑§Ω6.ñΩ\…\ˆΩD¶*Ω\‰ΩΩ\À”é<\“f+Ω≠Ÿ≥<\ƒÎûΩ1C=ŒµbΩóåâ=ƒú Ωõ\◊Àº≤üá=^\Ï7=\‘,N<M°ú<\œÍôº˘\Ÿ=ÇK{=\Û3˝<\…\"ö=@GÄΩ1ï˝=[=µ`:<ΩdºsöÃº\…2\–<?\„tº\·˘_Ω\Ùw&=CFæΩ4Z;\Ì\Îº\ÙN§=•ˇgªÖ\0°<3|µ<;[[=%P;Eû≠Ωíπ˙∫?{qΩ°OΩ\Ì\Ô∞=êí›º\ÁS◊º\Ù{ò<ø\Á∞:\Ê_%º¬à¶∫å√ÇΩ\Õ\◊<µc=•c\Êª3ãª\€\ﬂ\nΩô¥ΩL\ÕΩ™$Ωú¯kΩ@\ˆè<\Z\∆€º\À=G/◊∫dè\’<T™´<b\…?=\…H≤ºjÁ£ΩÀ∂b=LaØΩÈªê=€á=s|Ωù\Ã;s2=˛-E=}\€M=§\ ª!\‘€ºä,ïºN8Å=~\Ó+ºikΩ–∞=©<–º\ÍΩY\‰=∑p3;ïé;\ˆÑó<1~ΩaaÉ;l@k=}Ωº6;˛\Û§=8`<è<˚==ê/_ª›†∞Ωzm<¥Ü√Ω\ıDà=q¿=±≠áª\È<œΩw\’\Ó<<æG=4:~Ω≠Dª\ˆÕº8æÃºgòf=\ŒX_Ω\ﬁ\»Z=5º\Ï{WΩj©=Mâ\nΩ\Â\ÂlΩk|.=rƒº\Á¶JºìTè=–∫.π\„4=x\ﬁf=[Ÿö=∏AΩä˘GΩ','f45cdabf-4c74-42b9-a610-c09aeead5e92'),('a5966ed8-7eab-4515-a6f6-5a00f72f04dd','2023-01-06 14:17:47','2023-01-06 14:17:53','images/007A23.JPG',_binary 'ìNUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \nÃµ\’<\»yîªOñºf §=‹âúº\‚[W=?PΩn«ó=©|.Ω8π=Ω≥\‚\˜<\ÁÁ©Ω÷êÑ∫n~¥º,X<Yº—ß†∫y 0Ω/ø~<\ÛVCΩ,`e=k÷Äº\‚)Ω\…„ùºz}¶<\“+Ω\“\ËÜ=ü%=\Òó;m\Ì<™:Ω\Ê)\Ú;\œ\¬Ω\Ê{æ<X˚ºæ%ΩùI&Ωk>D<[s;ù£\·Ω|\’==´+=/Lºæe)ºo2=\Õ\È\‘<ja\œ9M|ïΩbª\›;\ŸlG:XL=`oé<;∑\–=OK]<˛æ[ΩûC\ﬁ<hπ,=\Ëæ9\Ìö\Â∫xõE=	\⁄\◊<∏∑°Ωº¿ºkº∫6º\·«ú=¿0B=\Õa∑<Ü	˘<M^kΩ£QåΩëª;<ŸûÇº‰òø<÷ä=Æ∞<=U\‚4ΩI§Åºò≤\ËºU°=1\Â<>ßMº\ÀG\Z=	);\ı»•<djs<Ω =/\rÄº==¶	í=WºÇΩˇ>©<cq\„º8\Ì\Ë<NñΩ\nD=ã\”\÷<{*Ω˛ºu∏Eªª#Ω|)Ω•\ƒ2=Õç;gXò;ÄÇ)=\0\ﬁ\Ùºk\ıº\ﬂHêΩ&\Â\rΩ”°í<i\Ó<\Û\»Ω°;\nΩK÷ûº-)¸<Uˇ\„ºp\Ó\–<Ñ≥<3\˜:=0x≤ªSD=˝7±ºæçà<Cé=*g+<˛\»|=∆£√ªæ\Â=\Ó¢{Ω≠ÆùºF\Á`=´0¥<˘ˇ<îY=ò\‚\·<ÖÅ=ú\Õ<øÖΩ\‚?=!ßΩ¸ï<o\·ºÉoΩbÜä<Ñz=ö25Ω)2†<\ƒTº∆≥.º˘µ º|º\Õs§Ω^öΩ™û\“;£ =Dz=e=qKå<ñ˚Ö=u4é=≥´?Ω™∫= ¥AΩ!DΩy8\Í;ñ>º}{âºä\’<ù\Ûí=Ø6Ä=;\ı\ﬁ=Åõ=<A≤Ω]¯º_:B<P^&=+±?Ω\¬ÇΩ:c≈ºﬁªØ=zü.=c[9Ω>Vyº˚\Ÿº*HK=#`Ωõ<π;\€HºôÆº´ÑMΩ\ıú≥ºíPG=˚¢Ωû:<ïÄï<j8P<æ\nÓºÉ˙¿ΩN@2º\Í∫e<\Í \Â<::=≠ß\'<Ö’ïΩÑ=∫√¢Ω	≠∆º\Ù\Ãº©jÄ=≥C°=m9%=^û]º¡_í<\Ên∂ºcUú=&>$Ω\7;]9\Ò;çBgΩI\Ïd=E•ô<p?ìΩ$ÀÄ<\ÍÖ<ŒéG=©ó\·∫\Î+<4\›\ <l\Œ<V#¡º¸n£ºêPº∞_`Ω1[\\º\·\Óâ=>]9L}XΩ°É∑:y\ﬁv=\ n\’;ƒÖh=!™¿ΩÅ&uΩ\„F=fb=\Œ\Ó\'Ωÿäº∞u=Ó≠ΩA&BΩ∂n2=A8Ω°≠GΩ<6\ı=Áøâ<86=öH™º>bˇªZ2ä∫Ha\‘<$ƒ≠º\ N;\‰%<ô ≠º\ﬁ2 ªà~ºõ\‹IΩ∞\0‘ªπ\Ù<M§ƒΩçÜ≥=\‘R\Î<U\Ï»º\◊.=.\≈)=1sΩæ·êΩ†\»PΩ˘f:Ω\'\ƒ≈ºˇé+=¨\€ª∫≈º˘ô*Ω\ˆ{º=≥h=>I◊∫\»\'çΩl\“Ωoo\⁄;z∆èºîgM=A{\»;∂æ\Ôºo|\È<sæQ<\ZlD=¶êhª§G<¨=\÷ΩÑ¨í=%¡Ωj+›º∑L\nº\ˆúY=pkçºÇ„ïº∂©iΩ£biΩ\·cƒº\Ó\∆\˜<¶\Ÿ˙º\r¢v<&VRΩã≤ﬂº\Û@Q<\∆=\·\\î=Ïëû<D\ﬂ;ºïãº\ÒO”Ωa\Í>àÂΩ¥\«o=Ω;Ωç®=∞ •<\ \œ\∆<-<∫\ª¯)Z=5\ƒ9’∑3=ÜûΩPqΩ\\l=\"»£º\ı\„è=Æ˛ºm3≤=%ô\ﬂ<˘\ﬂ?Ω	ÕßΩ[\√<u\Ò2=ÉUºΩ:$<\Íº?ΩFœßº≈å÷º6ñsºäƒ¢;\ÎO\ˆ<7p±<ø{<ú`æ\Ánáª%\ÏF=*\Êÿ∫?Ωséj<R¸fΩ\r=ΩV[ñº\ÓΩ´ˇ≈ºn–≤º9D´=-\Ù$=ºi\È<bä:ΩAkΩt\€qΩ»Ωº°›¨Ω›¶ΩhI,Ω∑´qΩèñ]º\Ò\÷˝<Æ/AΩÉ\≈}Ωâ†Ω\‹˙<UP;0\Ùf=Bº\'Ω´´Ñ<H-5;lDtΩÜVÇΩ¸©º°ª&<\Â∞F=i\“<\Âü]=\Ïë<s^•ΩEp\ﬁ=ë>[ºaÏûΩ\Íu:Ω§∂><\€\⁄$=\Ù1<≥\ﬂh<\Ù\‘\“;\ˆ;ä5z;µé\Íº9 I:§\rΩº>.;Ω\Ë‡ØΩ^Çã<ãFO=\Ó\‰â<€§\"º]\’¯:RJ±<\Ÿ\√º\˜GºªxUΩóâΩ\ÿqÄΩóh{=ü«Ω∏\˜\Z;’´âΩ`¥k=€∫XÊüº\…\÷æÓÆÆ=\‹\È<ñù!=\—Ó¶ΩTQ∆º!k©<èL«ª_f$;m∂\º\—?\√=∞Ø<ø~#<w\Û<XôÅΩ?0ΩßPΩ\”ˇS=b/&ΩÖ\ÿLΩäKΩ\∆?\Ì=¶Mw=\ƒ\ÓU∫(í\'=GN<¬≠\Ê;\ÈPªµeΩZsn=\\bÖ<Ü\ÎBΩWHΩo\ıJ;∑CøΩ\Ÿ◊πçõÖΩm6ººN\‰t<πsª™∞\ıª|E =\‚3<\ƒ}’∫Y\Î€º,Tª¥∫\ﬂ*\ÿ;U¥Ω\‡\«.Ω\Ì!Ωg~\’;˚%ôΩ°Œπº#\◊8=\'î@ΩTB4<	C=±™ªQ3\ı∫‘∏\–<^Ö=g7ƒΩØ¿ä<˘\€Q=æ\Èi;ÛÖº©÷æ<$¶çº\ﬂ=\˜\…;\˜¸¡=\‹\·\ıº\’\"=[z0=89ΩDΩ','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1'),('c2f096a6-68f6-443f-9946-750c921988a2','2023-01-06 14:20:19','2023-01-06 14:20:23','images/001A22.JPG',_binary 'ìNUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \nCÖsΩx\Ó<\–Ω\‡\¬YΩÂàª3Dh=òáºG%9<;¸\'Ω¥¯Üº\Ì<f<Æ=8\'\ﬂ;•@\◊=ìÖxºë@ª%8©<”Ñ&ºS¿ùΩ¯“ëºöÊ≥ª∞\ÂÅ=L£<9\0=f¸\Íº&±º¡\√^ª¶≠∫p>\“<f∞:Ω\ı\‡íºHE;2m\r=\0≠L=ì2\È<3!:=\’b=\…\Í`Ωö\rΩ\Ê!=æ˝dΩç\ ‹ºeúΩ\¬mΩ£6WΩ·óæ<!nZ<p\≈@ΩD∑<\—(RΩp˛=Å}\∆;∂\'òΩ,ó\“<SÑå<&®pªÆ	\≈<\"u©<*úà=à\·œº¿X\Z=ë˚íºsèxº8\Ò=••êΩ´!<µªU±rºùlã<)\"ΩáR9=ZΩ§AéΩ^≤=\\bΩ/\Ï Ω⁄ô!Ωax=≥\Èºû==Ω≥™Ωàv8=Q<CΩ\ÈµΩ||rΩc¿?Ω6J:=8hΩ‹ágΩ\\?2=\◊\Ím<V	Ω®M8Ω\— ∂<lº.Ω0˘<geΩ†>\√;∆∫\Ã<O\›<˙“ºmI<xy=«∏àΩx˛#=\Õ]4Ω°\»;8Ãª∏Ω<„äçΩ¯ÆM=K\Ó˝∫Énº ˘\ZΩ$2@<7á\Ò<;=πU∞º\È@2;)ì:ì\±<><\’Ô´º\ÒS\Z=Ãì\Ã=_\Œ€ª\Ú\ÙÆ<æΩg}qΩfñº2;C•=\ˆ–Øº\‹	∫Z˝\"<ß;™U=#\n\˜º\‘4Ω}¶VΩΩl±º}+=\€6ëº\“^W:G\ˆU=8eÖΩ0fˇºme<ΩÉ;íT ºJeΩ, ¶ª\09Ωa\Ò=à/Ω\ﬁ¥ºJ]\"=ª!\Ÿ<≥H\ƒ<\ÎΩ\Œ\“	ΩÜê<˝ï=åg ºq	=pAˇ:guUΩ\·rΩÖπ\·;l\Zb=\Ã\Õ=\ıg_=@u∫ªE5\\Ω 2ZΩz)î=µ\·A;\‘<\ËΩ6≠lª±6\‹;˝Crº)´=4O=ß\Zª\»\€\‚º\À\Ë=.j=~,º.t_Ω\ÊlD;|πZ<¶ú¢=•oΩ¸D∆Ω\‰˛ˇ<*øB=qÆæ<≤˚ΩΩXnºM\ÛüºB\›ª\·xë=±≤éΩFQ!ΩeÇß∫µπFΩ2\√Ωì0\0Ω@\œmªî¶/;µp<´;Ω\ÛΩ<Y\"=n\⁄ºO0ç=t\“_Ω?]\0<\»,ò;p≥Ω©6\Á<áe¶Ωl7üΩ(c\‚<\’M∏<oÆ˛;\ﬂ#\Úº˚étΩ\'∞˙<W¯BΩ´«≠=\›!ΩvNÃº#<=&\Ô=î=\Õ~<ö\0êπ\÷ ñΩ\‚a∑Ω®\◊}ºØ ∂ºä\ƒ8ΩE∑≥<çM=V\ı™=H⁄Å<só\Ì<Å<ñPF<\∆[ΩQÈßº:+c<\Ÿ]Œºãã =:\ræª\‡ºKï\Ï<\÷\nó=•Ω\Ìz\Ê<4@hº\„ºjª√Ωx˛zΩ\Ó\≈\€<\n¿¸π0öº\Œv#=À≥i=nXñº tp:¨ããΩ∑Å±Ω\r∑¬º[•&Ω›ß\'=LA;\À<e\0OΩ\ıWFΩ∂”º;öΩ˛ö\'<U˚õ<\‰øaΩ\Ÿ\0Ωb\ÿΩµrºÅ≥¢ª∏vë=R\–=S{º˚Ω⁄ô=àæ+ºï\Ô=ä8=z¡Ç=0hΩH%=(ô	;\\\Ùí=Ä\0ΩûB7=\ˆ}º/¯∞ºçq¸<QDäºUÇ\Z=æ7÷ª£D¯:Eöâ=ü^=\Â\0Ω/\ˆÉº1ÆƒΩüQΩQAX=\÷VΩy’æΩ\ÌÅªd≠?;\Ì<J<\÷Y}ºwh=<ìUk=\Œ\ÿP=d[R=∑ª\ÂwΩ∂òFΩ¶—Ω«øO<\"\ÒΩS˙Ñ=&~òΩä\⁄\»=g⁄º7ödΩi\Ò\0Ω\ﬁ’í=ú=\ƒ¯°º˝ºêﬂò=\”¿∏<.\◊¡º¥NÅΩ∑Y/Ω&Ÿºè\„\'<~9ï∫\≈\n\\=)\Z=qxº1!?ºVº3\…Õª\\\'©<äæ~ jΩ=v‘Ω3\ÿ\Õ<1ñΩ¥±=\»\⁄zºa\Ã\Û<\‚2=≥g\Z=\‰Æ0<R\‹◊πƒ§åªDxΩ|\‹=GºΩ\¬\Ã*Ω§@JΩ†ÜΩÆ«ª¨Ä=L\‰;Ω\≈\Òu=TõΩG#E<≤Ωàπ=ÕºÅë9|¿ò=í¿_=\Ó$Z<|v\Â∫4ªãΩ\Ú\ÙΩ<e%/=H≥\÷<wç\∆=\Ê\ÔΩ~	>i.^=®Ü-<ÖrΩ%ˇ[Ωù{©=\—/·º∫æºA\È\”=9œ®ΩÀ°\Ã<£\"/Ωû“™=M\Ú¢ª\‰;Ω\ˆ\˜n<O\π\ mK=ë÷Ω_´\Ò;íMΩ\Ù\ÁVΩ\ŸAs=√´<=ªUpV=êXO<çΩv˘T;•íº›¢<Æ”û<;UYΩ\ÎF=\÷gπºÑ\‘˘<XvΩ\·<aΩàUâΩ\È0<K\"…º!õ™=wz…º∂ê\Ô<\ËYI:\Õ[\ﬁ<OT<∑ydΩ`&=˘±∆ºã˝°<ß\Œe=w\ÒΩ\ﬁÖ<´\0GªW\Ù=\n«Ä=Sñ<•i†º\Vﬁºßü¶=óÉΩ)ﬂ∏º?3Ω=\Â\»Ωl\Ì<\œEVºvr!ªªÃ∑ºUª\„âΩ3Xt<sl=\\\»;\Ç0<mc=8¡\∆<Mí;§<¥ä∞;∏[Ω\ƒ\Í<\’DrΩ£Yü<H¬ë=É`ªÆæ\ÒΩ_\r≈º(\ˆ;=lõΩl\'ì<¯±Ω[˝\ÂºG[|=R<¶ºiú£<|\›\”<9FΩ\ÌG=$\Ô$Ω\Ù\ZΩ›ô=/≤)Ωè\˜o;¶≤ê;îΩÇ\„u=Y¥l=q∫=\ÈPOΩ)-oΩ','f45cdabf-4c74-42b9-a610-c09aeead5e92'),('db40e29c-69fa-47c1-8dc7-1903924df52a','2023-01-06 14:17:57','2023-01-06 14:18:00','images/007A37.JPG',_binary 'ìNUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n,ü1;\\”ãºôÜ\ª˙Ky=8º\0¶´=\‡\Êºd`<\ÚvΩú\ZΩ\ÃE˛<dïµΩ\Î(w:*®Ω\r\ˆ?=ÿ≤ΩõX£ª\0\0ΩU¥á=bΩ¯ªS\›l=ö\0\';9Ω,î£º\ÿ\—<V™ßªë=¨\Óó=;k=â<{;®<µÀ∏ºü[ò;ƒç&<\0ÕáΩ˚*åº\À\‰;»≥t=\œ©Ω\ngß=OÆ∂º;/º]ÆΩ\„\'˙<%*;ÑèºπΩyaG=—Æ«ª\Í\Ú<®M<1.]=qVs<™õ<C<Ç˙¢=˝¿<V\À<=\\=\ÛI@=fcgΩ\Ú≥˚ºm@Ωó-Rªºì~=\÷~ù=,\ˆPΩR\ÛÇΩ\Û©iΩòílΩ∞\˜=\"ÖLΩ-◊í<Ök8=róJ=MFèº=àΩáê ΩQé=\¬\≈Õº˚úºI\˜~<9*åº\‡B=\…Ωl\ﬁ=<\ CØ:äÃ§<è‘Ñ=ª\r‚ºπ\ƒEΩÉ∏õº∏æ3=Ïáìº\«=\¬/=gñ∫6f\„º¸æ\n=\–\nxΩ¿y®Ω/*à=\ﬁºÅ¯ºUyö∫<ú\Âº0x <qWbΩÅJ]=…í˛ªG£<\Ò?VΩ\«\Ì!ΩÜº®º\"\…\–<`<Ω\‡Ø\‰<l5=¥ö=˚“ªx´ö<\»\ÃfªΩi=*o=\ÊwD=ß∫=⁄ó7Ω\ £ªègΩÑmj<o0Ø<\"=á<S\‹\◊<\√·ô∑+ê=\nX=\»Xy=\Z<cΩ\"Ç∏Ω\’\Óº\‚ä\\Ω\ÏºÖ\Â\ÊºIø\Õ;¥Q(=É∞\Íº}=<º≠îô;\"í\"ΩûÕù∫êçß=f\Ô\nΩ:iƒΩ*\‘˚;*Äº(\Â<R\œ<\ƒ\–M=\≈¯>\ƒ√í<´∫Ωì\Ú=]õpºUußΩAyâ<V\·=õ|Ω\Úm=‘∫t=F@=&˛\0>\Î±\÷=Z¯Ω\ˆΩskï;Ç\⁄=4C\rΩõW±ºyΩ˝AÜ=ì´0=3{)Ω†\Zã<sSæº§,=˘º\…\Å<ºîºäñ=º4ΩπØ0º,\›<¢ºúé	Ω\‡«âª≥¥ì<(@ΩA≈Ω\Ó\˜JΩ¢N5\Ôá<`4\≈<v|{ª*∞¡Ωiç}<°\\∆Ωk®Àº¥Ω\≈Qp=)o=\“˝;/ÑΩÆª;\Î\'Ω\ sl=Æ}\Òºl]´ººÆJ;L>\Ëº\ﬂ~=\‹˘e<Åú≥ΩxGx<FΩ=!n=Èºâº\‰$˙<‘∑\◊<\Ï\ﬁ«º].\·º~\Ï´;ãæFº¬éΩ\\°=\Ì˘D<∫:C\Z˛º\Ê\‰=¢¥/Ωµüè=ï˚∞Ω®sΩ™=1ä˘º\ÔjCΩe.4Ω\Ó\À=†8ÑΩr(”º~°§<EjΩw!dΩ¢\◊\‚=ÑöE=É\Î6=ÃëüºL=u≠∫≠cÇ<˘d\›:\Â\0<\¬\«\«<3:®<πºº\ÿ0Vºb7<&ØœªTèΩß±1Ωª¢\Á=ë+≈ªt\n±º§.=f=aêCΩ~3ÇΩÜiïº\ﬁgFº\⁄1:º#6=\Ú-º8\6º\ˆ`fª\–!.=\Ê\–+;8M<\Z\Û\'Ωœã‘ºs≥%=\˜dö;Ñ˝©<¢Ã¢<|ñAΩv\Îk=7W\"=î\‹\‹<]LÇ;\Ì\ŸNº\ıÜÇ<\Ì)ΩE_Ä=\ÓΩ{NΩ˛⁄Üº\Ú`ù=ié`=nFΩπYxΩ%∑;º≠Z$Ω\n\√=§q≠ºôLzΩ\\@Å;\–˙º\›TΩ\nOé;íßA=\ˆI0=B\Êºy\rΩµ;eΩïÜ>û®æm\‚ü=LË°Ω\»e[9\÷∆Ω<1vvº©>bª\‘u=e\‹+<)ùªJ°$=AΩ©TDΩÉC\≈;\–\Ì±ª@û^=hˇ·ºÑ\–=\'\‡Ç=C-FΩ\\\ dΩ\Á=çA∞;æ≤Ω}1d=T ;Ω„°ª A8Ω\Z=\Ë\‘-<Ñ94=\Z˛É=œù\›<£«äΩ\Á§:j0\Ã<l\ﬂ\'<\÷J±ºìâóº!ZΩpB®º\–oΩ†Ç2Ω\Ì®ÑΩ=Ñ<A\“=Çºò{xΩnflΩ\√Yñªü@∞Ω^\‡\Z:kÉΩüóMΩô)fΩg\—-Ωè\Ú\€;y\√3=W.Ωi\ÙΩ7¨ÖΩ¥^\Ë<ë≥ÀºÖ7&=ÜÏªñs\·<ò¿%º\⁄.BΩ\–ÜΩ¸ø\Í<\\G∑ª:@\›<\Ë¯=Ç∏b<(â.=>~iΩüº=qêwº¿^=Ω»ÅêΩ^_=´\∆<7˝ ªwêE<0àcº\rû;ì˚FªY¯€ºC€éºr\ÿ<¯\VΩâ≥bΩ∫É=H∫\Ë<N2<Ã∞Oºõê§º==*=\„1jºîxaΩ(	\ÔºÄΩ\€Z\›<ñ\n†Ω¡≥‘∫\ Ω;sõ=&\ÎG;û<øº4^¶Ω-ú=f7ºBíû<PÍïΩ©¿ó<aX,=\Ê\◊%Ω∞ΩáW\Èº\Z =\Ôw©=\·Mf:˝]UΩ\07qª∑¶\Z<IhΩ¥å¨<ãuHª*I¨º∏TΩ≥î\Â=Ch<\Zk\ÂºX∂\Ô<2\ÙoΩ≥Ø\“<_Ω%<≥<Æ\0O=\Z¨=J5[Ω\‹}\º\ÿ=M=;Ÿ£Ω≠Sü<∫Ωû6\"∏eJ=n\Òg=n\‚>ºäf¥<\À=ˇ¡Æº¬∂T;Ü\0†ºå·ºµO=\".Ωp\˜Lº+Ω\Â@\œ<D˚jΩüΩn§=9Ω\…\«5=\Ò∑h<™\ˆºK\·Ω\\Œ[=ßzî=í.æyΩ>¬Ü=q\⁄\≈<\r\ÿΩú	¡<¶(yºÅœÄº\Ì@º¥\Óõ=»ß>Ω2Ü<†å=p~PΩ≈úΩ','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1'),('dcfddff3-66c4-47d6-a8e9-07716d883b16','2023-01-06 14:18:00','2023-01-06 14:18:04','images/007A38.JPG',_binary 'ìNUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n©?<à\ZºnuºIº=ú2˝ª±\0\”=\Íl\ºüj\”<†æuΩåÅªº\œ1=l-ÅΩ\ÙDºN§hΩ	`\È<û~~º\Ÿ\ÿ3<¡ÃòºRH.=2d\Á:J?â=\'%ê<”âúºKn4Ωé¥ê∫áj·ª©Ÿû=ö™=M+q;›ã<Knì∫ÆxD;\"ΩΩ≠ûª\‘\ÿº\Ú˘ãΩ3_hª\n\ıYºÉNá=\Î7\ˆΩ\·/\√=f\—+ª¶ˇåº\’\Û˝ºñ•?=≠\Ê=< ù\Ù;˚®Ω\T=EãuºÍåÇ<\˜ë∫∫WÇ=o\"¬º\ÁPÃºo<;ãQ==ÅR<ûº∑<*\“:=—É#=N0YΩ\Ë¨ÎºíOMªd\Ô˙º‘Å[=\”\≠=îº3Ωì5¯ºm\ËZΩ≈ùÜΩ:lE=\‰y\·º\\\¬˘<ä\∆(=u\'\≈<\'\"Ω~\ÏTΩU€±ºu¡ó<\ˆºå†º4\0º\ﬁZºîó<î»ª≥:=N¸Ñºx»πª;V<=o£sΩ¯YΩöyΩi¯*=Luªqmc=¶H=\‘\Â.∫Ω2‡º©M<ú\Ï=Ω∑1#Ω5\Ê =_\ÃU<sZOºªªØº1\÷\nΩf\‡d;¢mΩd\—=,\◊=˚;\ÃLΩíé)Ω\“Æ;ãˇåªpV\"Ω ¯\’<îPS=\…˝~=w\Ÿ<\◊¡<\ÙI\0º\≠=fB=ñ^\Â<â\Ì\◊=(,Öªs $º\0∫†Ω\»bÄ<õî\∆<\0µáªæ<U!|;YÑ=ˇ\‡<3Å=`\„ Ω6|=¥®–º\È~‹ºå„ß∫µµµºBÀá;¸\Ó•<\ËW\Úºuµñª∑A˘;ñºøºæ±#ºâò=;≥\ıº\„¯Ω\ﬁ\ﬂ<ÉÄ9\"\·=≤®;˝¯]<vR˝=∑\’<∞\ÚxΩoòx=∞[ºLøΩ¡	?<\Â\Z∏<¸cΩñù3=%lW=\ıπ=2p\n>\œ3\ﬂ=$≈Ωj\„º£˙=Åi\ﬂ:%Nõº\›`•<•\ﬂ\Z<p57=∏d˝<ºΩπDl<jö√ºö˚<.˘ãº:=5P<\›¿xºåΩT \'Ω	SÆ<1X˝ºÂÆ¨<G5ªK\„|9m\ÂHΩoú¥ΩZyΩyØ<N\€ªH©∏\'º∑I£Ω\ˆ,2=\⁄Á∏Ω»Öçºñ\”\Òº´sΩ<a\\=OG=\»Rùªj ™º+π(Ω\‚Ãì=#\n!Ω∏Ôäºí(π;}\„CΩP¨w=Ü\›<\⁄c¶Ωp\‘=Zâ<åNä=ø\0=u˙ûºô0Y=∏%\œ<\«?|ºª\Õ\‰ºB»ç<e\ƒeº†Ø`ΩØè=\‡<R∏≠º\Õ\≈.ºÉ1\\=z\◊Ω¡â=â:èΩπóΩ`8F=E\Ôº\‘\ÿ(Ω\ﬂΩxîJ=ë ÑΩáΩhΩ:\„|[Ω\»:>Ω\«6\n>a)=_j=îVäº	=g\Ï\Ã9r\◊<\Ú>É<.ñ\¬;T1ö<G$ü<õa°;¯d;\œéºh~ =±Ω;zLΩßÖ\Â=És=Ø\‚º(O1=ê\”6=x\À=ΩÑÄΩzrª L*ΩW\'ûªFA=bÇ\»<±&¨ºÑ<6º\ˆÇ=(\Ê5<f#≠<\Î˝*Ωx*<X˘=5ò£ºìlá<\‡Ç	=ûÂèΩEE=]c˙;∂\<ª\∆\rºA¥WΩ/∞µ<-0ΩΩYD=/˘≠ºgãΩ\–i!;a.\Z=B\'B<\“\⁄bΩ\“\€7ΩUé¥<0=Ω©∑Ä<)\Ûº´\ŸDΩπgóº/HΩ¥≤Äºî,<Kyc=\‚¿,=\'\ÿ	ºHù5Ω\ˆ\ÔUΩ∑2%>\Ê\€æ\Ò¡=âòΩòÅ\Î<A<A\\7ºm\Ë7ºùô<?Öù<∞;)Q=’¨¸;TrqΩ<Hâ<Ü˘\ÊºTa∂=h&IΩç}ù=.a¢=ã\ı≠Ω\«3Ω\Ÿ˚>=\‚\'3ºg^\ÂΩ¸7(=∫\Ò;ΩCéOº1c–ºZ.\·<Pè\n=ù=YéS=\“Y\r=\’ZüΩ&ÜòºN=nÉ≥;Rs„ªΩ6\Ôº;\—PΩŸ§\Ûº[àîΩ\‡\ŒyΩ@[ÖΩ+\Â<ªß´=\ÛBjª∫h¸º ≠XΩ»Åw<ö\Á}Ω\’l(ºròéº\»eΩò™ºM<ÄΩ˙-F<\ˆîJ=:*ΩsÅPº…≠pΩuJf=\ÏdQ∫≈Ñ4=\0ú˛∫~ûµ<&7ﬂª\Z\ZàΩ8¥fΩ‡¶ö∂\‰\Ô\Ã<]¨\Á;u\ÊΩ<ìã@<6Ω.=\ZíΩ\Èt=áÓªº±iΩ¯6Ωù0=/\·|;x˛é<%”≠<a≤ﬂº(\›~<Nº\‰Wº§œ¥<∑ù<\ÊaΩïf9ΩO$û=\ﬂ2(=ˇ)»º0<;¸\Û$ΩñK6=[0òª{7ØºQ\\cΩa⁄ºO•MΩuTæ<\‰h√ΩKP§º%\ﬂÏªó±\√=X%};\Ó¿¢º7È∂Ω}∞P=\"bÑ<∆ñπ<≥ôΩÅ	ª\Ùæë=l]Ω∂pº´\\PΩsÆ%=\∆É=¢∑^;∆Ñ\Âª=ìΩµEì;¿\ÛûΩ\ﬁ$-=g\Ò§<|≥+Ω\ÔuDΩy\ˆ˝=ò}¶<ß\∂º\ﬁ\Èº<Ñ\ÓΩ•Çß<\Ìí\Ìº\Õ¸ç<¯P3=OlY=V UΩ\Ôƒº\Â—é=”åΩVç=PNLΩ\ÿi<É,õ</<=U\»:º\‹/=\‘*=]0ôº!\Ó:\Ú\œ◊º{nS9–ö\∆<•É8Ω(-ÍºökΩ1\”\r=XZsΩÃñJ:\ı™\r<¶o\ZΩz&=$0îºcæ(ª¸5ΩG<P=\Õ&•=_ætÃüªK\Ùú=\0ú=\Z\Ï%º\Í2´<\˝íº≈∞ﬁºñ#hºo¥æ=\ˆr]Ω[ü\„;ú^=\Ì\0RΩEº','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-08 14:08:15
