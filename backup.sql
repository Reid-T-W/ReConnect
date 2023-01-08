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
INSERT INTO `picture` VALUES ('1db84c07-4d12-4fd1-bec8-07c32213bc37','2023-01-06 14:17:53','2023-01-06 14:17:57','images/007A26.JPG',_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \nn\�r<\r\�ɻ% $=h��=\�Z\�9M\�<A\� ��e=\�$�\�׼�\�=i���=z^.�Bi\�;,��C�C<t\0���\�<\�\�;+�\�==<5���Q�q��Je0<Z}<Q*u=\�j\n=\�=d\��܊l�\�a8<�e�J\���s\r�\r̐�2�3�,�\�b�;=���,�v=���<�\�	�\�T@��0�\�K\0=-I^<�&\0�\"Kn�D��B\��<j\�Y�]\��=\�<l\"=7if�j^P=\�Ҩ<4\�\�;Ƅ�<�\�}=\\����/��\�Z�pg��\�\�O=�8=Eyw�-[ݼ�̉�y�?�\�<6xL��\�#=8ą=s3=�\���y�;& ܼ\�@�<,\� <�B�\\«����\�@�:�:<�:|=CT��@��<\�>�=\�\�$��nȼs��]�=\�n+�d��=�0=\�\�f�c\��\�iP<,N��Ua���x!=�p���μx��+\�\r�����\n��h�|<��=K\�<�m\r�\�>�\Z�S�=��꼨\��<ۥ;4{`=\�N\"=\�F=-�\�C�<ϭ�=\��<mH\�=�\�ʼ\�<Zh\�/<,\�=��;��\�<\�\�<9ݸ< �@=9=\"��\�î<\rF��b5����;�\�#�\�\\w;�S�=|\";ݓz<��\���I�ٕ<�Z\�<���������<���H��<�\�=><�\\�=\�`=\0C��=\'\�L���f�!v=��M<[�\�c<18@=VP�=\�N�=\�\�=^�\�m\ZļRm�;\�C2<\�1\\��\�\�:%�=E݉<A\����}�\�9����=�\�q�GC�� C�\nͼ\�\�K�O�=\�\��<]P=�\�\�\n;��o<Y8��3��ӣŽ{	���\�q<q㜼\�LF<� ���쉎;\�B��s�5<\�q\�c��<���=r�\�<;q�;9�<{\�\�sR=\�\���Ё�;]\�=�-���m=��t<I_���\�R;\�kT��6�=�u��D\n�;\�\�=d��T�o�\�\���o�t���C��)�V\�=g\'&�\�\���	=���=И輷��=�\���0��\���<1���@>\�Ӌ�\�\�L=\�ʽļ�0P=�Q#� ��\�>\�=ؗ^=NL\�\���B���z*�mci�j)!�\�\r�=�\0��(x��v�<\�\n0��Lպ�\�N��\�*��y�=�\�\�<\�ZY�\�K-=�\�3=\�\���ZD`�\�I<�\'\���\�=�\���FM7�\�\�<D\�\�=\n�<\�\09�s��\�,E�\�\r+={b\�;*xT=P&X=0�|�*��=M\�\�;P7\�;�s�\�t\�\�G�<@�˼��=\�jh;)\���v��\�\��=\�3麺\'I�G����;���B�(=h���|ŀ��Sc��\��{�<���=ƚ�;@5�=��C�?���\�1�=�m�q\�i=��ۼ,t\�\�\�\�<��#����<�i\�<�e�<L�b<\�:]�����7y��r\�;v�f��\�P=�\�O�m[T=AMH=��&��{4�\�V%<\r�<G&��\�\�.<\�ޥ�5\�r��\�W���<\�c鼖�=\�\�h=^�<�ٜ���\�<Q��=ّ<_���{5�<�/�m���\�:�l��v\�5��r��\\&\�=LҼ:�\�ҹ\�K-�t\�ܼ\�l=�,��`������~\"-�\��\\.�;\�S|=�!9�Q-���}5�\�G\�;W\�~�]G=�G���\��<�*�Q��񺼹\���\��#\�\�<R_=�و<�t�;�\�Ƚ\�\�=(\�x�\�1�[���8&=	.�<ng(=�2N=��;\�%�<{63;ƿA��\�\r�1�m��2!�j��D\�D=\"�=��\\<\�\��g���\�==�b���$ �\�|��\�% ���\�\�|a=\�W��s:c< �\�;�.\�=c>\\=�u��\r��\�4s=1�(�\�\�u=�n�\�F=Жu=}��O\n(��r��2-c=�Qb=�\Z8�r��$\�A��	}�b����=�?�6��;�\�D��\�\�=�Ia�3k]�\�s��e\�\�<}r\�<\�j\�<��H�;=&��<�v\��Gy�6�����5�h<�,��p�/^C=ߵG=\�_%<\�\�=j(7=\�%���<��ۼ\�d�c�\�<\����)��Cb�(P]=�\�7�\��ͻ\n*=\�3�GTO<\�6=WF�9P\Z�\�Ú<\�>�=�J��a i�z�H=lGx;\���T�<0���@�q�I\�<�=o�l�\�\�;�\�\�<\�5�P��;','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1'),('9659ccf3-a2b2-488c-8eab-fa2b5b002036','2023-01-06 14:20:23','2023-01-06 14:20:26','images/001A28.JPG',_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n\0�_�;�:�\�Ӽ�(QA=�v<T�~�e!��V^\n�5L׼1o2<\�\�\�<\�)�<XK\�;R4�=>J�͙ٻZ�g=��4�2�U�8\'R�\�<xu(=\r~���ǼE��9o<�\�5<\�N\�\�\�<�\��=h�,\�\'=��U���1=\�O伲Ll<�\�=�\�o�K\�$�\�\�\�:��;\�V��\��v�ϣ�\�\�:�v��<Uw<\�ҽZg8���+��6N=u\Z�;A8l�\�6���\��\�\�=�x=\�p���=���;B\�<4<\�\�5�*H8:|�ɼ\�\�]=0�#��\�Y< +�PI\�<�Ӽ���y\�e=\�\�)���%<\�+*�|\�=�{?=\�\�O�\�-��V\�=\\�:�����51��\�}��<\�<U]��\�a��1�;	�;X������S\�e<G���\�\�\�<~P��*��:(8Q<z�ļ:@�\�Fx;}\Z\�==�S��?V=����\�\�\0=?Ӷ�ўY<�cD�\�\�>=9M������\�n;c\��<g[�=3%�=<!=\�J4<\�(����-<͊�Լ?Y,=f9�=N\n��*�_��\\t�\����3�;�\�<��=}̼G0��\�\'\�;|ټ@�?=����\�|`���7��g\�<\�A;L_\�<�\0e<[�Q=H	���>u�\r$��0�\�<܋B�\�%U��\'��\�\�\�LY=����\n<\�\�<-Nؼ\"=]m���\'��\n�\�<��^==���~G�=\�+���*��>��3�<G\��<��_=\�]=U��\0��j�Q���\�=/R7��ː�\\��A\�,=�\��nq=ܹ=6\�\�<1��<K޹�\�\��<e\�(=\0�˼[\'���F�e\�=c�b<4q*�\�=ɓ�=\�9\�<�\�Ͻ\�\r\0;\n���\�\���H�<	������ݮ=�4��3�<���\�RB\�<\n\�D=D_=\�G��\�:X�j<�����L�<���JD�\�\'v<v\0��\�;@(�����Y>y<v�\�<\�\n=q�\�g��5�<fҼ�W�=�\�\�;�G���;��=\�\�\'=j\��\�͢<HR�\�Y�2\�\r�d�輣�N��Ի\�V\�<gOo=\�o$=\�\���;��\�<�ϼ�\�B�\�\�Ļ\�e=�2�<3\�.=g�-;\"c�Yض<r\�e=�\�����;w�?�<6�Q\�P��ݳ=�\�\"=\�oM:\�Wa;?cD=\�\�<ω��M��\�����<\�\0��6T[=󏷼��-=w���Z�2���2�,\��\�\�X<(�v=9,1��n:�/n\�q���\Z.�����=�*\';#k�og���{\�<|z\�<\��=uvP<���=\�o��Z= B\���\�\�<i�\�\�=wID�6#X��	\0=x�$;\��=m�<(B�<���<�\�Z=1���Q\�	����E4�<Hw=�{%�\�׼��@<�=��t�ZT<��9�c\�\�=\�\�=\�=n\�<<v̚;\�,��ܽ�\�b��\�Ἧy<8���2�\�=#�S�\�	(�{\�L�S��=\�M=�I���y�pc�=jM=tm+��\�S��\"޼\\m�;_S|;�L��\�kC=\�\�;�9=\�\�0=�N<藇=\����\�\�ս��\�:�j_�%�\�<ȭ��5`<H�\�<\�\�c<\�`<.�<؝I<^-���j\�<s�������7�ۼ ���\"ټ�ɓ<^���\�\�9���9=	ʸ�%�=`���������=\�]�<��<�� =���<t[@=\�b=֣�=�=\�u~���>T<x&�\�xͻk\�\0�ʈ\�<�~Q�\�<�\�\�O=�iؽ>\�V;T\��;\�s�=��p�zxԻ+\�+<-)N=/\�=�D��+��7n\"�:\�\"�d@\\=\�\�\\<t���\�	Ļ[\�;\����\��<d+��0�8<�#�<	H��v�ʣU�\'z��\�;�K��2V3�n���r\���N�=\�<\�s�=���<\�j=�V�����l\�<G~���6==�-=(Yz�tY��#p�s̑=`8S=�g\�:�b\0;䐎��M\�<[�>�1�o�{\�=\�f\�:�3�����r�\�u���<���\�b<�C=9�S>�;e��=5\'�\�K�<\�ڎ=A�R\�[�\�Z�<�u��oa&=�\�\�=\�K߻�z�Nr3<jI�=\� ���4=[`\"�\n�ӼX\�=���ˮ�=|B<���Ic=R�S�P�+�H0=�0��\�:u_=\��\�<9}0=\�\�5=�k�=2	M�\�j��','f45cdabf-4c74-42b9-a610-c09aeead5e92'),('9c99d0e8-6542-4a02-8866-ec007d82497a','2023-01-06 14:20:26','2023-01-06 14:20:30','images/001A29.JPG',_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n^�F�箖;.�\������`=\�p\�<�)����a<}c�?祼\�O\�;�_/=�\�0=�f;l�=[Q�u.�`A/=\�.��|S��8,�RY\�;�l=�\Zi�\�\�H?�b�<\�~�ks��h��<{\�����_\'-=\�\�ŻX\�<�н:�y<ݽ\�=\�@��\�׼� k<M�?�C0O�E�e��\�N�\����>Q�<���<\n������֘��_=U\�;y�n�\�R��&l<���<P�$=�\n.�kf<\�&��e>\�<d���y�\�\�<��P��4;�\ZR�6����\�<�\�\�:��,=\�Ta�ˤ��G\�%=vGN�\�\�/�\���\�=P\�L<�����(�d\�=\�*^��̼�\���)Ҽ\�\\=\"7u�E�f�n��;��B<\�g컎|��]j8=t-%�\�\�0<޼�l�;^A3�I�\r;/�\�;\�K.<ߣ�=�p�R�,=*\�0�K3\Z<\�\�\';�\�;\�ji�\�=����\r��\��D�\�=W)�=V�m=\�v���o;�4 �\�y;}���\�\�2�\�=l�=�\�@<$[0;�|�LF��}km<\�]�<\�|�=Te���1�\�`��;�5�\�6=�\�I�\�\�\"�\0la��[=l[x<\�&=\�<��\\=+�i���\�|<��<E\rx�[0����Y�.29=\Z��\�!w;\�<��=���<��f�Z���!=}�=}�l��~O=\\	�f�\\�\�΅��P,<yZ�<F�\�<�Y0=\�a~�\�B��\�J\��ggv=j!��Λ�\�3z�o\�<�\�m����<{�~=ڡL=\�Wh<\�:�<��\�=�\�#=���Un�f`<\�\�`=E�#\�ܼ	.=qL�=���:F���ޟP�\0�P�C~J�$==����ê7�h�v=\�0����;}��;\r؉����O=r�����\�;\��\�<}\� �\n\�!=�{���r\�:悮<\�<����\�<�c���\�j�`\�\�<u�<vB\��Oу�%��b³;nsY��\�=2V<~��5���\�A-<�~�=%�<���<����g\�$�$]���1�%\'>�\�x���G\�<\�o=$2�<+sͼ��=�\�<\�\�6�J$<�.�<�z=\�c]<�dJ=\�\��\����\��\�<Y�=\�猼>H\�<\�M\�;\Z�\Z�}\�M������<P\�=�gV��΅;.T�=�-\'<\�m�Ym��\���k��<\'7$�a��=E\�\'��\�;Q\�\n�\"��D_E�U���5X=�W\\=ٻ,�F}|�\��0b_����\�\�=\�\�<�v��\�u�\�q%=�f&<�\�\�=`\�\�<&b�=#v5��\0\�<\"���x=h%�Y��<n�\"�^a8�\��F=%�<ڬy=\�9;\\<��&=\�\�O=�/�\�Ny<ʙ��G�}:d��=\�w�v�o�CAb<m6<�-��W�M;�\���J\�=b�<��=Y<?\Ze<\� �\�\�?\'2<s.��\�6\�<5���N�=�)\��m�RX�\�z�=t\�8=\�\�M�\���\�=#��={\��WP�WՐ�hV	�S8ۼ}���-=���<B<<_ֶ�\';�;=��<Ъ=\�\���\�(�r�\�q���`\�=[\��<$�<�:�<O\"A�؎#<\�`\�:ȱ=�2A���$<	���6.��\�\��D�*�\��\�ӎ<\�f+��ٳ<\�랽1C=εb����=Ĝ ��\�˼���=^\�7=\�,N<M��<\�꙼�\�=�K{=\�3�<\�\"�=@G��1��=[=�`:<�d�s�̼\�2\�<?\�t�\��_�\�w&=CF��4Z;\�\�\�N�=��g��\0�<3|�<;[[=%P;E�������?{q��O�\�\�=��ݼ\�S׼\�{�<�\�:\�_%����Â�\�\�<�c=�c\�3��\�\�\n����L\���$���k�@\��<\Z\�ۼ\�=G/׺d�\�<T��<b\�?=\�H��j磽˶b=La��黐=ۇ=s|��\�;s2=�-E=}\�M=�\��!\�ۼ�,��N8�=~\�+�ik�а=�<м\��Y\�=�p3;��;\���<1~�aa�;l@k=}��6;�\�=8`<�<�==�/_�ݠ��zm<��ý\�D�=q�=����\�<Ͻw\�\�<<�G=4:~��D�\�ͼ8�̼g�f=\�X_�\�\�Z=5�\�{W�j�=M�\n�\�\�l�k|.=rļ\�J��T�=к.�\�4=x\�f=[ٚ=�A���G�','f45cdabf-4c74-42b9-a610-c09aeead5e92'),('a5966ed8-7eab-4515-a6f6-5a00f72f04dd','2023-01-06 14:17:47','2023-01-06 14:17:53','images/007A23.JPG',_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n̵\�<\�y��O��f �=܉��\�[W=?P�nǗ=�|.�8�=��\�\�<\�穽֐��n~��,X<Y�ѧ��y 0�/�~<\�VC�,`e=kր�\�)�\�㝼z}�<\�+�\�\�=�%=\�;m\�<�:�\�)\�;\�\��\�{�<X���%��I&�k>D<[s;��\�|\�==�+=/L��e)�o2=\�\�\�<ja\�9M|��b�\�;\�lG:XL=`o�<;�\�=OK]<��[��C\�<h�,=\�9\�\�x�E=	\�\�<�������k��6�\�ǜ=�0B=\�a�<�	�<M^k��Q����;<ٞ��䘿<֊=��<=U\�4�I�����\�U�=1\�<>�M�\�G\Z=	);\�ȥ<djs<� =/\r��==�	�=W����>�<cq\�8\�\�<N��\nD=�\�\�<{*���u�E��#�|)��\�2=͍;gX�;��)=\0\�\��k\��\�H��&\�\r�ӡ�<i\�<\�\���;\n�K֞�-)�<U�\�p\�\�<��<3\�:=0x��SD=�7�����<C�=*g+<�\�|=ƣû�\�=\�{�����F\�`=�0�<��<�Y=�\�\�<��=�\�<���\�?=!����<o\��o�b��<�z=�25�)2�<\�T�Ƴ.���ʼ|�\�s��^����\�;� =Dz=e=qK�<���=u4�=��?���= �A�!D�y8\�;�>�}{���\�<�\�=�6�=;\�\�=��=<A��]��_:B<P^&=+�?�\���:cż޻�=z�.=c[9�>Vy��\��*HK=#`��<�;\�H������M�\�����PG=����:<���<j8P<�\n���N@2�\�e<\� \�<::=��\'<�Օ��=�â�	�Ƽ\�\���j�=�C�=m9%=^�]��_�<\�n��cU�=&>$�\�7;]9\�;�Bg�I\�d=E��<p?��$ˀ<\�<ΎG=��\�\�+<4\�\�<l\�<V#���n���P��_`�1[\\�\�\�=>]9L}X����:y\�v=\�n\�;ąh=!����&u�\�F=fb=\�\�\'�؊��u=A&B��n2=A8���G�<6\�=翉<86=�H��>b��Z2��Ha\�<$ĭ�\�N;\�%<� ��\�2 ��~��\�I��\0Ի�\�<M�Ľ���=\�R\�<U\�ȼ\�.=.\�)=1s��ᐽ�\�P��f:�\'\�ż��+=�\���ż��*�\�{�=�h=>I׺\�\'��l\��oo\�;zƏ��gM=A{\�;��\�o|\�<s�Q<\ZlD=��h��G<�=\�����=%��j+ݼ�L\n�\��Y=pk���㕼��i��bi�\�cļ\�\�\�<�\���\r�v<&VR���߼\�@Q<\�=\�\\�=쑞<D\�;����\�Oӽa\�>�彴\�o=�;���=�ʥ<\�\�\�<-<�\��)Z=5\�9շ3=���Pq�\\l=\"ȣ�\�\�=���m3�=%�\�<�\�?�	ͧ�[\�<u\�2=�U��:$<\�?�Fϧ�Ōּ6�s��Ģ;\�O\�<7p�<�{<�`�\�n��%\�F=*\�غ?�s�j<R�f�\r=�V[��\����żnв�9D�=-\�$=�i\�<b�:�Ak�t\�q�Ƚ��ݬ�ݦ�hI,���q���]�\�\��<�/A��\�}����\��<UP;0\�f=B�\'����<H-5;lDt��V�������&<\�F=i\�<\�]=\��<s^��Ep\�=�>[�a잽\�u:���><\�\�$=\�1<�\�h<\�\�\�;\�;�5z;��\�9 I:�\r��>.;�\�௽^��<�FO=\�\�<ۤ\"�]\��:RJ�<\�\��\�G��xU����\�q���h{=�ǽ�\�\Z;ի��`�k=ۺX柼\�\��=\�\�<��!=\�TQƼ!k�<�Lǻ_f$;m�\�\�?\�=��<�~#<w\�<X���?0��P�\��S=b/&��\�L��K�\�?\�=�Mw=\�\�U�(�\'=GN<­\�;\�P��e�Zsn=\\b�<�\�B�WH�o\�J;�C��\�׹����m6��N\�t<�s���\��|E =\�3<\�}պY\�ۼ,T���\�*\�;U��\�\�.�\�!�g~\�;�%���ι�#\�8=\'�@�TB4<	C=���Q3\��Ը\�<^�=g7Ľ���<�\�Q=�\�i;󅼩־<$���\�=\�\�;\���=\�\�\��\�\"=[z0=89�D�','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1'),('c2f096a6-68f6-443f-9946-750c921988a2','2023-01-06 14:20:19','2023-01-06 14:20:23','images/001A22.JPG',_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \nC�s�x\�<\��\�\�Y�刻3Dh=���G%9<;�\'�����\�<f<�=8\'\�;�@\�=��x��@�%8�<ӄ&�S����ґ��泻�\�=L�<9\0=f�\�&���\�^����p>\�<f�:�\�\���HE;2m\r=\0�L=�2\�<3!:=\�b=\�\�`��\r�\�!=��d��\�ܼe��\�m��6W�ᗾ<!nZ<p\�@�D�<\�(R�p�=�}\�;�\'��,�\�<S��<&�p��	\�<\"u�<*��=�\�ϼ�X\Z=����s�x�8\�=�����!<��U�r��l�<)\"��R9=Z��A��^�=\\b�/\� �ڙ!�ax=�\���==�����v8=Q<C�\��||r�c�?�6J:=8h�܇g�\\?2=\�\�m<V	��M8�\� �<l�.�0�<ge��>\�;ƺ\�<O\�<�ҼmI<xy=Ǹ��x�#=\�]4��\�;8̻��<㊍���M=K\����n� �\Z�$2@<7�\�<;=�U��\�@2;)�:�\�<><\�﫼\�S\Z=̓\�=_\�ۻ\�\��<��g}q�f��2;C�=\�Я�\�	�Z�\"<�;�U=#\n\��\�4�}�V��l��}+=\�6��\�^W:G\�U=8e��0f��me<��;�TʼJe�, ��\09�a\�=�/�\���J]\"=�!\�<�H\�<\��\�\�	���<��=�gʼq	=pA�:guU�\�r���\�;l\Zb=\�\�=\�g_=@u��E5\\� 2Z�z)�=�\�A;\�<\�6�l��6\�;�Cr�)�=4O=�\Z�\�\�\�\�\�=.j=~,�.t_�\�lD;|�Z<���=�o��Dƽ\���<*�B=q��<����Xn�M\�B\��\�x�=����FQ!�e�����F�2\���0\0�@\�m���/;�p<�;�\��<Y\"=n\��O0�=t\�_�?]\0<\�,�;p���6\�<�e��l7��(c\�<\�M�<o��;\�#\���t�\'��<W�B��ǭ=\�!�vN̼#<=&\�=�=\�~<�\0��\� ��\�a���\�}��ʶ��\�8�E��<�M=V\��=Hځ<s�\�<�<�PF<\�[�Q駼:+c<\�]μ�� =:\r��\��K�\�<\�\n�=��\�z\�<4@h�\�j�ýx�z�\�\�\�<\n���0��\�v#=˳i=nX�� tp:��������\r�¼[�&�ݧ\'=LA;\�<e\0O�\�WF��Ӽ;����\'<U��<\�a�\�\0�b\�ؽ�r������v�=R\�=S{���ڙ=��+��\�=�8=z��=0h�H%=(�	;\\\��=�\0��B7=\�}�/����q�<QD��U�\Z=�7ֻ�D�:E��=�^=\�\0�/\���1�Ľ�Q�QAX=\�V�yվ�\��d�?;\�<J<\�Y}�wh=<�Uk=\�\�P=d[R=��\�w���F��ѽǿO<\"\��S��=&~���\�\�=gڼ7�d�i\�\0�\�Ւ=�=\�������ߘ=\���<.\����N���Y/�&ټ�\�\'<~9��\�\n\\=)\Z=qx�1!?�V�3\�ͻ\\\'�<��~ j�=vԽ3\�\�<1����=\�\�z�a\�\�<\�2=�g\Z=\�0<R\�׹Ĥ��Dx�|\�=G��\�\�*��@J�����ǻ��=L\�;�\�\�u=T��G#E<����=ͼ��9|��=��_=\�$Z<|v\�4���\�\��<e%/=H�\�<w�\�=\�\��~	>i.^=��-<�r�%�[��{�=\�/Ἲ��A\�\�=9Ϩ�ˡ\�<�\"/��Ҫ=M\�\�;�\�\�n<O\��\�mK=�ֽ_�\�;�M�\�\�V�\�As=ë<=�UpV=�XO<��v�T;���ݢ<�Ӟ<;UY�\�F=\�g���\��<Xv�\�<a��U��\�0<K\"ɼ!��=wzɼ��\�<\�YI:\�[\�<OT<�yd�`&=��Ƽ���<�\�e=w\��\��<�\0G�W\�=\nǀ=S�<�i��\�V޼���=���)߸�?3�=\�\��l\�<\�EV�vr!��̷�U�\���3Xt<sl=\\\�;\��0<mc=8�\�<M�;�<���;�[�\�\�<\�Dr��Y�<H=�`���\�_\rż(\�;=l��l\'�<���[�\�G[|=R<��i��<|\�\�<9F�\�G=$\�$�\�\Z�ݙ=/�)��\�o;���;���\�u=Y�l=q�=\�PO�)-o�','f45cdabf-4c74-42b9-a610-c09aeead5e92'),('db40e29c-69fa-47c1-8dc7-1903924df52a','2023-01-06 14:17:57','2023-01-06 14:18:00','images/007A37.JPG',_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n,�1;\\Ӌ���\��Ky=8�\0��=\�\�d`<\�v��\Z�\�E�<d���\�(w:*��\r\�?=ز��X��\0\0�U��=b���S\�l=�\0\';9�,���\�\�<V����=�\�=;k=�<{;�<�˸��[�;č&<\0͇��*��\�\�;ȳt=\�ϩ�\ng�=O���;/�]��\�\'�<%*;�����yaG=Ѯǻ\�\�<�M<1.]=qVs<��<C<���=��<V\�<=\\=\�I@=fcg�\���m@��-R���~=\�~�=,\�P�R\�\�i���l��\�=\"�L�-ג<�k8=r�J=MF��=���� �Q�=\�\�ͼ���I\�~<9*��\�B=\��l\�=<\�C�:�̤<�Ԅ=�\r⼹\�E�������3=쇓�\�=\�/=g��6f\���\n=\�\nx��y��/*�=\�����Uy��<�\�0x <qWb��J]=ɒ��G�<\�?V�\�\�!�����\"\�\�<`<�\�\�<l5=��=�һx��<\�\�f��i=*o=\�wD=��=ڗ7�\����g��mj<o0�<\"=�<S\�\�<\�ᙷ+�=\nX=\�Xy=\Z<c�\"���\�\�\�\\�\���\�\�I�\�;�Q(=��\�}=<����;\"�\"��͝����=f\�\n�:iĽ*\��;*��(\�<R\�<\�\�M=\��>\�Ò<����\�=]�p�Uu��Ay�<V\�=�|�\�m=Ժt=F@=&�\0>\�\�=Z��\��sk�;�\�=4C\r��W��y��A�=��0=3{)��\Z�<sS���,=��\�\��<�����=�4���0�,\�<�𼜎	�\�ǉ����<(@�AŽ\�\�J��N5\��<`4\�<v|{�*���i�}<�\\ƽk�˼��\�Qp=)o=\��;/����;\�\'�\�sl=�}\�l]����J;L>\�\�~=\��e<����xGx<F�=!n=鼉�\�$�<Է\�<\�\�Ǽ].\�~\�;��F��\\�=\��D<�:C\Z��\�\�=��/����=�����s��=1���\�jC�e.4�\�\�=�8��r(Ӽ~��<Ej�w!d��\�\�=��E=�\�6=̑��L=u���c�<�d\�:\�\0<\�\�\�<3:�<���\�0V�b7<&�ϻT����1���\�=�+Żt\n���.=f=a�C�~3���i��\�gF�\�1:�#6=\�-�8\�6�\�`f�\�!.=\�\�+;8M<\Z\�\'�ϋԼs�%=\�d�;���<�̢<|�A�v\�k=7W\"=�\�\�<]L�;\�\�N�\���<\�)�E_�=\��{N��چ�\�`�=i�`=nF��Yx�%�;��Z$�\n\�=�q���Lz�\\@�;\���\�T�\nO�;��A=\�I0=B\��y\r��;e���>���m\�=L衽\�e[9\�ƽ<1vv��>b�\�u=e\�+<)��J�$=A��TD��C\�;\�\�@�^=h�ἄ\�=\'\��=C-F�\\\�d�\�=�A�;���}1d=T ;�㡻 A8�\Z=\�\�-<�94=\Z��=ϝ\�<�Ǌ�\�:j0\�<l\�\'<\�J������!Z�pB��\�o���2�\��=�<A\�=���{x�nfl�\�Y���@��^\�\Z:k����M��)f�g\�-��\�\�;y\�3=W.�i\��7����^\�<��˼�7&=�컖s\�<��%�\�.B�\�����\�<\\G��:@\�<\��=��b<(�.=>~i���=q�w��^=�ȁ��^_=�\�<7�ʻw�E<0�c�\r�;��F�Y�ۼCێ�r\�<�\�V���b���=H�\�<N2<̰O�����==*=\�1j��xa�(	\���\�Z\�<�\n����Ժ\��;s�=&\�G;�<��4^��-�=f7�B��<Pꕽ���<aX,=\�\�%����W\�\Z =\�w�=\�Mf:�]U�\07q���\Z<Ih����<�uH�*I���T���\�=Ch<\Zk\�X�\�<2\�o���\�<_�%<�<�\0O=\Z�=J5[�\�}\�\�=M=;٣��S�<���6\"�eJ=n\�g=n\�>��f�<\�=����¶T;�\0���ἵO=\".�p\�L�+�\�@\�<D�j���n�=9�\�\�5=\�h<�\��K\��\�\�[=�z�=�.�y�>=q\�\�<\r\���	�<�(y��π�\�@��\�=ȧ>�2�<��=p~P�Ŝ�','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1'),('dcfddff3-66c4-47d6-a8e9-07716d883b16','2023-01-06 14:18:00','2023-01-06 14:18:04','images/007A38.JPG',_binary '�NUMPY\0v\0{\'descr\': \'<f4\', \'fortran_order\': False, \'shape\': (512,), }                                                          \n�?<�\Z�nu�I�=�2���\0\�=\�l\�j\�<��u�����\�1=l-��\�D�N�h�	`\�<�~~�\�\�3<�̘�RH.=2d\�:J?�=\'%�<Ӊ��Kn4������jứٞ=��=M+q;݋<Kn���xD;\"�����\�\��\����3_h�\n\�Y��N�=\�7\��\�/\�=f\�+�����\�\�����?=�\�=< �\�;���\�T=E�u�ꌂ<\����W�=o\"¼\�P̼o<;�Q==�R<���<*\�:=у#=N0Y�\�뼒OM�d\���ԁ[=\�\�=��3��5��m\�Z�ŝ��:lE=\�y\�\\\��<�\�(=u\'\�<\'\"�~\�T�U۱�u��<\�����4\0�\�Z���<�Ȼ�:=N���xȹ�;V<=o�s��Y��y�i�*=Lu�qmc=�H=\�\�.��2༩M<�\�=��1#�5\� =_\�U<sZO�����1\�\n�f\�d;�m�d\�=,\�=�;\�L���)�\��;����pV\"� �\�<�PS=\��~=w\�<\��<\�I\0�\�=fB=�^\�<�\�\�=(,��s $�\0���\�b�<��\�<\0����<U!|;Y�=�\�<3�=`\� �6|=��м\�~ܼ�㧺����Bˇ;�\�<\�W\�u����A�;������#���=;�\��\���\�\�<��9\"\�=��;��]<vR�=�\�<�\�x�o�x=�[�L���	?<\�\Z�<�c���3=%lW=\��=2p\n>\�3\�=$Žj\����=�i\�:%N��\�`�<�\�\Z<p57=�d�<���Dl<j�ü��<.���:=5P<\��x���T \'�	S�<1X��宬<G5�K\�|9m\�H�o���Zy�y�<N\��H��\'��I��\�,2=\�總ȅ���\�\�s�<a\\=OG=\�R��j ��+�(�\�̓=#\n!���(�;}\�C�P�w=�\�<\�c��p\�=Z�<�N�=�\0=u����0Y=�%\�<\�?|��\�\�Bȍ<e\�e���`���=\�<R���\�\�.��1\\=z\����=�:�����`8F=E\�\�\�(�\��x�J=� ����h�:\�|[�\�:>�\�6\n>a)=_j=�V��	=g\�\�9r\�<\�>�<.�\�;T1�<G$�<�a�;�d;\���h~ =��;zL���\�=�s=�\�(O1=�\�6=x\�=����zr� L*�W\'��FA=b�\�<�&���<6�\��=(\�5<f#�<\��*�x*<X�=5����l�<\��	=�叽EE=]c�;�\�<�\�\r�A�W�/��<-0��YD=/���g��\�i!;a.\Z=B\'B<\�\�b�\�\�7�U��<0=����<)\�\�D��g��/H������,<Kyc=\��,=\'\�	�H�5�\�\�U��2%>\�\��\��=�����\�<A<A\\7�m\�7���<?��<�;)Q=լ�;Trq�<H�<��\�Ta�=h&I��}�=.a�=�\���\�3�\��>=\�\'3�g^\��7(=�\�;�C�O�1cмZ.\�<P�\n=�=Y�S=\�Y\r=\�Z��&���N=n��;Rs㻽6\�;\�P�٤\�[���\�\�y�@[��+\�<���=\�Bj��h��ʭX�ȁw<�\�}�\�l(�r���\�e����M<���-F<\��J=:*�s�P�ɭp�uJf=\�dQ�ń4=\0���~��<&7߻\Z\Z��8�f�চ�\�\�\�<]�\�;u\�<��@<6�.=\Z��\�t=��i��6��0=/\�|;x��<%ӭ<a�߼(\�~<N�\�W��ϴ<��<\�a��f9�O$�=\�2(=�)ȼ0<;�\�$��K6=[0��{7��Q\\c�aڼO�M�uT�<\�hýKP��%\�컗�\�=X%};\����7鶽}�P=\"b�<Ɩ�<����	�\���=l]��p��\\P�s�%=\��=��^;Ƅ\�=���E�;�\�\�$-=g\�<|�+�\�uD�y\��=�}�<�\�\�\�<�\�����<\�\�\���<�P3=OlY=V U�\�ļ\�ю=ӌ�V�=PNL�\�i<�,�</<=U\�:�\�/=\�*=]0��!\�:\�\�׼{nS9К\�<��8�(-꼚k�1\�\r=XZs�̖J:\��\r<�o\Z�z&=$0��c�(��5�G<P=\�&�=_�t̟�K\��=\0�=\Z\�%�\�2�<\����Ű޼�#h�o��=\�r]�[�\�;�^=\�\0R�E�','95d7ca2b-cdf1-413c-89d3-c31f6f9959c1');
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
