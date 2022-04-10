-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: team01m
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add question',7,'add_question'),(26,'Can change question',7,'change_question'),(27,'Can delete question',7,'delete_question'),(28,'Can view question',7,'view_question'),(29,'Can add comment',8,'add_comment'),(30,'Can change comment',8,'change_comment'),(31,'Can delete comment',8,'delete_comment'),(32,'Can view comment',8,'view_comment'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$RayXTNr0MUPb$OkIOOCG+6jd0U20oC2cwL2EABon2ymhG+njCG2KuhR0=','2022-04-02 07:17:16.435402',1,'vagrant','','','vagrant@iit.edu',1,1,'2022-03-06 07:54:39.617517'),(2,'pbkdf2_sha256$150000$k4iGivxSNKz4$WbRFdCfuVkKBhRx53Xc2z+xTdKDI7AABb8HiDSeMHKc=','2022-04-02 07:16:09.754580',0,'bsmith','','','',0,1,'2022-04-01 18:34:03.000000'),(3,'pbkdf2_sha256$150000$35mcYWVbzsQp$mDEt3tUFmxHYTk4yw7u8A230xGLmoouLP1hs9mf8YWQ=','2022-04-02 07:15:57.590966',0,'cmiller','','','',0,1,'2022-04-01 19:28:13.112812'),(4,'pbkdf2_sha256$150000$yOKVfAj7kjka$ZyWQPMZAUgUC6xpG84WqL/fdUOyJrFEVl+XDIJIxE7I=','2022-04-02 05:57:32.115006',0,'djohnson','','','',0,1,'2022-04-01 19:29:23.051711'),(5,'pbkdf2_sha256$150000$SohDLM7WvKIq$CK9DPlYtAXTqIdcVIZjk6687T9txfDYt7mYxzmMSWuM=','2022-04-02 07:14:16.292872',0,'vanderson','','','',0,1,'2022-04-01 19:30:24.984564'),(6,'pbkdf2_sha256$150000$kRc0NNT3WzQ6$Zm99JwCFRqAEJKrw2QNb6UH1hdHbddB5h3iQ+boQ71w=','2022-04-02 06:03:24.069609',0,'fbruce','','','',0,1,'2022-04-01 19:32:12.488895');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-01 18:34:03.702804','2','Bsmith',1,'[{\"added\": {}}]',4,1),(2,'2022-04-01 19:28:13.201590','3','cmiller',1,'[{\"added\": {}}]',4,1),(3,'2022-04-01 19:29:23.142631','4','djohnson',1,'[{\"added\": {}}]',4,1),(4,'2022-04-01 19:29:35.812549','2','bsmith',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',4,1),(5,'2022-04-01 19:30:25.075268','5','vanderson',1,'[{\"added\": {}}]',4,1),(6,'2022-04-01 19:32:12.578219','6','fbruce',1,'[{\"added\": {}}]',4,1),(7,'2022-04-01 20:04:55.450417','1','bsmith - Question',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'stackbase','comment'),(7,'stackbase','question'),(9,'stackusers','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-03-06 07:54:37.900289'),(2,'auth','0001_initial','2022-03-06 07:54:38.016438'),(3,'admin','0001_initial','2022-03-06 07:54:38.353667'),(4,'admin','0002_logentry_remove_auto_add','2022-03-06 07:54:38.438373'),(5,'admin','0003_logentry_add_action_flag_choices','2022-03-06 07:54:38.449658'),(6,'contenttypes','0002_remove_content_type_name','2022-03-06 07:54:38.507552'),(7,'auth','0002_alter_permission_name_max_length','2022-03-06 07:54:38.552631'),(8,'auth','0003_alter_user_email_max_length','2022-03-06 07:54:38.569080'),(9,'auth','0004_alter_user_username_opts','2022-03-06 07:54:38.582054'),(10,'auth','0005_alter_user_last_login_null','2022-03-06 07:54:38.614409'),(11,'auth','0006_require_contenttypes_0002','2022-03-06 07:54:38.618199'),(12,'auth','0007_alter_validators_add_error_messages','2022-03-06 07:54:38.630212'),(13,'auth','0008_alter_user_username_max_length','2022-03-06 07:54:38.678011'),(14,'auth','0009_alter_user_last_name_max_length','2022-03-06 07:54:38.718601'),(15,'auth','0010_alter_group_name_max_length','2022-03-06 07:54:38.732923'),(16,'auth','0011_update_proxy_permissions','2022-03-06 07:54:38.744273'),(17,'sessions','0001_initial','2022-03-06 07:54:38.767334'),(18,'stackbase','0001_initial','2022-03-06 07:54:38.801594'),(19,'stackbase','0002_question_user','2022-03-06 07:54:38.820554'),(20,'stackbase','0003_auto_20211011_0037','2022-03-06 07:54:38.886988'),(21,'stackbase','0004_question_likes','2022-03-06 07:54:38.944242'),(22,'stackbase','0005_auto_20211011_2351','2022-03-06 07:54:39.081174'),(23,'stackusers','0001_initial','2022-03-06 07:54:39.112265'),(24,'stackusers','0002_auto_20211007_0118','2022-03-06 07:54:39.184804'),(25,'stackusers','0003_alter_profile_phone','2022-03-06 07:54:39.215179');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('m8w8t2hxd63ek1kfa2eq0uu09n33rz3o','MTc2MWNjMzZjMzk1MjU4MGZhNTVjNjdkNmYzYmYxNDY5NjRjZDc3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MTZjYzA0MGEwZTJlMjU2YzdjNDc2NDM5NDRiMGUzZmY5Y2RiMzU1In0=','2022-04-16 07:17:16.440016');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stackbase_comment`
--

DROP TABLE IF EXISTS `stackbase_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stackbase_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stackbase_comment_question_id_7e187e91_fk_stackbase_question_id` (`question_id`),
  CONSTRAINT `stackbase_comment_question_id_7e187e91_fk_stackbase_question_id` FOREIGN KEY (`question_id`) REFERENCES `stackbase_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stackbase_comment`
--

LOCK TABLES `stackbase_comment` WRITE;
/*!40000 ALTER TABLE `stackbase_comment` DISABLE KEYS */;
INSERT INTO `stackbase_comment` VALUES (1,'cmiller','<p>I personally love pasta the best!</p>','2022-04-02 05:56:39.731746',1),(2,'djohnson','<p>I personally love to cook burgers and grilled cheese.&nbsp;</p>','2022-04-02 06:01:45.660265',5),(3,'fbruce','<p>I go out to eat pretty often at least 3 times a week. I do need to cut down on doing that though.</p>','2022-04-02 06:57:17.739954',7),(4,'vanderson','<p>I definitely do! Fruit is great, especially grapes.</p>','2022-04-02 07:15:35.252752',8),(5,'bsmith','<p>I love desserts everyday! I personally like to eat pudding and ice cream.</p>','2022-04-02 07:16:59.842834',11);
/*!40000 ALTER TABLE `stackbase_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stackbase_question`
--

DROP TABLE IF EXISTS `stackbase_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stackbase_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stackbase_question_user_id_6bdf1467_fk_auth_user_id` (`user_id`),
  CONSTRAINT `stackbase_question_user_id_6bdf1467_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stackbase_question`
--

LOCK TABLES `stackbase_question` WRITE;
/*!40000 ALTER TABLE `stackbase_question` DISABLE KEYS */;
INSERT INTO `stackbase_question` VALUES (1,'What is your favorite food?','I just wanted to ask what others favorite food is. :))','2022-04-01 20:04:00.000000',2),(3,'Does anyone else like steak?','I love steak! Does anyone agree?','2022-04-02 05:52:55.458137',2),(4,'What unhealthy food do you love?','I love junk food. What kind of junk food do you guys love?','2022-04-02 05:55:04.154929',3),(5,'What kinds of food do you like to cook?','I love to cook, so I wanted to ask, what do you guys like to cook?','2022-04-02 05:56:09.888613',3),(6,'Does anyone know any tasty healthy foods to eat?','I wanted to ask whether anyone had any recs on healthy foods since I want to start eating healthier.','2022-04-02 05:59:13.946141',4),(7,'How often do you go out to eat?','How often do you go out to eat?','2022-04-02 06:00:11.034366',4),(8,'Do you like to eat fruit everyday?','I love fruit, so I was curious :)','2022-04-02 06:55:04.256719',6),(9,'Do you like to try new food often?','I personally do!','2022-04-02 06:56:36.184353',6),(11,'Do you like to eat some desserts after dinner?','I love desserts!','2022-04-02 07:14:30.584749',5),(12,'Do you read the nutritional information on the foods you buy?','I personally do to keep up on my nutrition.','2022-04-02 07:14:57.504878',5);
/*!40000 ALTER TABLE `stackbase_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stackbase_question_likes`
--

DROP TABLE IF EXISTS `stackbase_question_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stackbase_question_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stackbase_question_likes_question_id_user_id_a93f8cbe_uniq` (`question_id`,`user_id`),
  KEY `stackbase_question_likes_user_id_c87b7812_fk_auth_user_id` (`user_id`),
  CONSTRAINT `stackbase_question_l_question_id_3e2a497e_fk_stackbase` FOREIGN KEY (`question_id`) REFERENCES `stackbase_question` (`id`),
  CONSTRAINT `stackbase_question_likes_user_id_c87b7812_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stackbase_question_likes`
--

LOCK TABLES `stackbase_question_likes` WRITE;
/*!40000 ALTER TABLE `stackbase_question_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `stackbase_question_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stackusers_profile`
--

DROP TABLE IF EXISTS `stackusers_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stackusers_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `bio` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `stackusers_profile_user_id_0439996d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stackusers_profile`
--

LOCK TABLES `stackusers_profile` WRITE;
/*!40000 ALTER TABLE `stackusers_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `stackusers_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03 23:19:41
