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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$RayXTNr0MUPb$OkIOOCG+6jd0U20oC2cwL2EABon2ymhG+njCG2KuhR0=','2022-04-15 01:36:50.421410',1,'vagrant','','','vagrant@iit.edu',1,1,'2022-03-06 07:54:39.617517'),(2,'pbkdf2_sha256$150000$k4iGivxSNKz4$WbRFdCfuVkKBhRx53Xc2z+xTdKDI7AABb8HiDSeMHKc=','2022-04-02 07:16:09.754580',0,'bsmith','','','',0,1,'2022-04-01 18:34:03.000000'),(3,'pbkdf2_sha256$150000$35mcYWVbzsQp$mDEt3tUFmxHYTk4yw7u8A230xGLmoouLP1hs9mf8YWQ=','2022-04-02 07:15:57.590966',0,'cmiller','','','',0,1,'2022-04-01 19:28:13.112812'),(4,'pbkdf2_sha256$150000$yOKVfAj7kjka$ZyWQPMZAUgUC6xpG84WqL/fdUOyJrFEVl+XDIJIxE7I=','2022-04-02 05:57:32.115006',0,'djohnson','','','',0,1,'2022-04-01 19:29:23.051711'),(5,'pbkdf2_sha256$150000$SohDLM7WvKIq$CK9DPlYtAXTqIdcVIZjk6687T9txfDYt7mYxzmMSWuM=','2022-04-02 07:14:16.292872',0,'vanderson','','','',0,1,'2022-04-01 19:30:24.984564'),(6,'pbkdf2_sha256$150000$kRc0NNT3WzQ6$Zm99JwCFRqAEJKrw2QNb6UH1hdHbddB5h3iQ+boQ71w=','2022-04-02 06:03:24.069609',0,'fbruce','','','',0,1,'2022-04-01 19:32:12.488895'),(8,'pbkdf2_sha256$150000$fZPkIa169iFZ$xOUAHeHQ2Taopj/mIk8lE+U/KmGs4Bkj/v/C7DpYLEY=','2022-04-14 22:32:00.538285',0,'cbriggs','','','',0,1,'2022-04-14 04:12:22.110183'),(9,'pbkdf2_sha256$150000$A3vS8BKDLR72$l6uwNNM1JIMsK0xzxGNs0ysBZIhjGQDjmkL+8jqRtok=','2022-04-14 23:31:31.213158',0,'mgarcia','','','',0,1,'2022-04-14 04:13:03.143605'),(10,'pbkdf2_sha256$150000$oy8heALVezlo$7IdOxBfeUTBwlp9aJVMPnkClqlBJtZIw4EDihy//IS8=','2022-04-14 22:22:11.586386',0,'anorth','','','',0,1,'2022-04-14 04:14:10.054518'),(11,'pbkdf2_sha256$150000$kX50ufpbJ0kM$pxDi1W3PNNJkPMWaoea5o57CIu2sURopEM4D6vwmYqA=','2022-04-14 22:52:03.217515',0,'jredforn','','','',0,1,'2022-04-14 04:14:32.655162'),(12,'pbkdf2_sha256$150000$fNyfdcfnpv66$9X8RQgYfB2wR/pCwMbOC7YStrt5x8sCbWBU1JYgzxMw=','2022-04-14 22:37:50.558947',0,'epreston','','','',0,1,'2022-04-14 04:58:28.159847'),(13,'pbkdf2_sha256$150000$qZikcOu5hdNV$vFKuqDODANEotJd9z5CztTW9nAQwIvI5jGta1JMRlgM=','2022-04-15 00:57:32.833381',0,'ybrooks','','','',0,1,'2022-04-14 04:58:49.362503'),(14,'pbkdf2_sha256$150000$aXSuosNBZpJJ$wDyiKCCX/kODz1wWfVbSL4u63xRG0q9yJvfps86OPU4=','2022-04-14 23:30:10.275579',0,'lturner','','','',0,1,'2022-04-14 04:59:10.245745'),(15,'pbkdf2_sha256$150000$rk99yLzhGe5w$NbPYQfu86/pEorPaVBVxpAuICgmlIH7zEEk4M+c49bk=','2022-04-15 00:39:57.938898',0,'srowe','','','',0,1,'2022-04-14 04:59:52.372620'),(16,'pbkdf2_sha256$150000$DzQK7GTcUnZH$FDqu0Z+RIF1IKF0pcIMxDvQD/S0KC/UqMOSewX5F6qc=','2022-04-15 01:21:38.366298',0,'zwhiteley','','','',0,1,'2022-04-14 05:05:05.784594'),(17,'pbkdf2_sha256$150000$OwWTT3Q1CjLW$upO9GwFa00jwzk2mw+mgIIYq4IyVmzxVzfUw+3eXUkU=','2022-04-15 00:38:00.283682',0,'sdwhitney','','','',0,1,'2022-04-14 05:05:41.571388'),(18,'pbkdf2_sha256$150000$dxSy8vK3O6sG$7KTYxnqlO/nTx/HmBWDkHnxCfeeTBC8CuwXpPJnLKmk=','2022-04-15 00:41:45.138994',0,'tmcbride','','','',0,1,'2022-04-14 05:06:27.585405'),(19,'pbkdf2_sha256$150000$EDMJcjywSvJ7$KNublsNVsrvimsEMeY4jSpq7oJL/iAxYWUikLq5f1ro=','2022-04-14 23:25:23.248756',0,'kbartlett','','','',0,1,'2022-04-14 05:06:47.199812'),(20,'pbkdf2_sha256$150000$EkD6HrhofOdN$746xY2x5lYudXzZw2DsaX+tttAl81Mo5d6lsLIy9SZQ=','2022-04-14 22:50:31.415969',0,'jbart','','','',0,1,'2022-04-14 05:07:11.200478'),(21,'pbkdf2_sha256$150000$rbyzyibTkD6N$hCZAYhMWGlOAUvCXHt9jVqJmn3Bn+BEctFdDeCYZ2+o=','2022-04-14 22:36:00.304029',0,'eball','','','',0,1,'2022-04-14 05:10:54.245110'),(22,'pbkdf2_sha256$150000$p3QtzaPtSckX$d6dWURnbv4ANNWRt7pgUoXBXVqXeGQazl347gGvCqTU=','2022-04-14 22:39:33.341095',0,'fsykes','','','',0,1,'2022-04-14 05:11:27.884528'),(23,'pbkdf2_sha256$150000$NL057hQDMMq3$SL5UtihJmmbqMXpB0TocqPo9IInSYm5JIkN9LfkETls=','2022-04-14 22:46:39.585789',0,'irtucker','','','',0,1,'2022-04-14 20:50:54.506242'),(24,'pbkdf2_sha256$150000$olDPYSFEyrBm$TWhcvqu2oy5fHQ/UoRvWnKp6FEQavJxvdGeYAYvZ/og=','2022-04-15 00:36:00.837912',0,'rjmcgee','','','',0,1,'2022-04-14 20:51:23.238565'),(25,'pbkdf2_sha256$150000$uALGyk6MtBhq$Mhd3DXp//hGd55+FOTdgwGM66HWNOoXSpxPM7pB9Muc=','2022-04-14 22:19:28.949689',0,'abarry','','','',0,1,'2022-04-14 21:08:30.455689'),(26,'pbkdf2_sha256$150000$ILRoTTk9bXrg$peJNMAzyGODR/GADSGgSU12e9kvT3ZrAHax8FbDixco=','2022-04-14 22:24:14.217727',0,'bprosser','','','',0,1,'2022-04-14 21:08:52.984884'),(27,'pbkdf2_sha256$150000$gHmeGR0usKcQ$bRdM4xMh21Bv5B8nT2eXsR+Px/WaL3hdNxJBngobyCw=','2022-04-14 22:34:18.209018',0,'dryan','','','',0,1,'2022-04-14 21:09:18.702565'),(28,'pbkdf2_sha256$150000$QtHHTImHK2y4$bgahG9N4uomrfsLTH1q39mDsby6DbWhF2ckzEYaQgd8=','2022-04-14 22:48:08.942105',0,'itimms','','','',0,1,'2022-04-14 21:09:43.074515'),(29,'pbkdf2_sha256$150000$0k2e6rJhEItb$rmaR/zR1NipjSF/nOBQqKJirN4HCGiGVrkWhuPYAJMk=','2022-04-14 23:27:04.339812',0,'kwatts','','','',0,1,'2022-04-14 21:10:13.274910'),(30,'pbkdf2_sha256$150000$2VUdvSfCOO6l$rAvD4nzYYknvAReu+Rw4JcGMUFTtmXnwy/+hrbbZOok=','2022-04-14 23:28:33.308214',0,'lhagan','','','',0,1,'2022-04-14 21:10:39.151733'),(31,'pbkdf2_sha256$150000$Bk5QIZbPU80a$EUlXZz503y1muWxqLJQoxryVJHUe2QakisW8+TPHKik=','2022-04-14 23:33:19.778508',0,'msharples','','','',0,1,'2022-04-14 21:10:58.875268'),(32,'pbkdf2_sha256$150000$lsqQvNVwK4TZ$ruOjezgFpaeYqwN8nWTH+p1YHs7uF3IsF+cGQ1IOZ5o=','2022-04-15 01:00:12.226728',0,'yhamilton','','','',0,1,'2022-04-14 21:11:24.114719'),(33,'pbkdf2_sha256$150000$1bjpLrfDbFEo$Rl+6xLcBEW3uJrZLYLzvDhtNZJSFgmsvmy+y/QN++Ow=','2022-04-14 23:47:26.735558',0,'qwinter','','','',0,1,'2022-04-14 21:33:18.854699'),(34,'pbkdf2_sha256$150000$soHg9Adl3kTP$nL8E21KJ2GRhxc9G7YeXz0voDyRlg0oA3NH/VpKvt4M=','2022-04-14 23:45:40.259313',0,'qscott','','','',0,1,'2022-04-14 21:33:40.987369'),(35,'pbkdf2_sha256$150000$HtPqXjo0ZwCh$gSEJOau87EoOmujMW98PcQGwwTPUm/EMa4fQv1oowGY=','2022-04-14 22:43:28.257822',0,'hcat','','','',0,1,'2022-04-14 21:33:56.396603'),(36,'pbkdf2_sha256$150000$EzZ77XYGF1Di$o5ERj2k9CHypqXueuFVVYXIovdzVUdN7cx/4quBGmkQ=','2022-04-15 00:53:21.658982',0,'xsingh','','','',0,1,'2022-04-14 21:34:37.218469'),(37,'pbkdf2_sha256$150000$cGpRWyLmmdOF$a+5lT1EqVsysIyDDv+GTcVi8LDJaf3RfhNc8roZ5asY=','2022-04-15 00:56:08.812345',0,'xstore','','','',0,1,'2022-04-14 21:34:58.349968'),(38,'pbkdf2_sha256$150000$siaCiE9oFQJ7$C0xNDi/XrOfwCsloZCMxR4raOwJLKP7zfnHYIqd2Dz8=','2022-04-15 00:44:40.881920',0,'uyam','','','',0,1,'2022-04-14 21:35:28.964710'),(39,'pbkdf2_sha256$150000$oNtvj8uKLnTq$el+q9EhQPXVZyyBQn2mDzGC4NUE9y5bs03FNMMzSRsA=','2022-04-15 00:43:06.213880',0,'uhooper','','','',0,1,'2022-04-14 21:35:51.838095'),(40,'pbkdf2_sha256$150000$tnQNHDX62FgC$JicLLIifBgpJA6s4S/WmgObMJ3MCl4d4KwK5bgYBLEM=','2022-04-14 22:40:56.812719',0,'golson','','','',0,1,'2022-04-14 21:50:46.544649'),(41,'pbkdf2_sha256$150000$CIrrvtX5OWa9$JA+zp3c4yJnQX0A1X11zbvwDAXQpRZM/ykK+ZpBNwaU=','2022-04-14 22:42:11.422995',0,'gpratt','','','',0,1,'2022-04-14 21:51:01.621323'),(42,'pbkdf2_sha256$150000$E9Kb1uTulxSm$jbzzwY0NOTnk7twNyKWi0QkVWNGONnkCnylKvfZ5ODs=','2022-04-15 01:19:54.194023',0,'zclark','','','',0,1,'2022-04-14 21:51:27.109841'),(43,'pbkdf2_sha256$150000$zIAd6TDPjkOx$BWnJU3h4z95eswbwOTaBwD3fD5saqiOSe3d7LRUA8Vg=','2022-04-15 00:50:54.352415',0,'wrich','','','',0,1,'2022-04-14 21:51:54.077633'),(44,'pbkdf2_sha256$150000$rRfMK3FNhh7u$pY5t4bkXX3Mw7uKRVZp6IBwqnYJvXXR0dSu5L85csKk=','2022-04-15 00:47:55.472742',0,'wparker','','','',0,1,'2022-04-14 21:52:20.592503'),(45,'pbkdf2_sha256$150000$l63Fbj9B0xVu$hmrl8Bv38D+890IvTq9Xj2lMMpBkrl8HsuayDjUZbkE=','2022-04-15 00:46:15.137422',0,'vyay','','','',0,1,'2022-04-14 21:52:58.004408'),(46,'pbkdf2_sha256$150000$lWeUk8cPCjRr$KvscwLjJ/2+mgO/lb67BaWI/f2s9bfuLsIL27M++S1I=','2022-04-14 23:37:28.956509',0,'npalmer','','','',0,1,'2022-04-14 22:14:13.803017'),(47,'pbkdf2_sha256$150000$6eDAGGE6lUOT$W3Vx52Ocg066tL0iMWnCRqnwtzNYdJYxY27T2UEgvRE=','2022-04-14 23:35:21.494716',0,'nkenny','','','',0,1,'2022-04-14 22:14:32.554504'),(48,'pbkdf2_sha256$150000$RkeET8Wc9tdd$jCzCpOuJKQYl8FW5JVGsSTBVU53hPdDQCwfAbO1yEaM=','2022-04-14 23:48:50.616083',0,'relliot','','','',0,1,'2022-04-14 22:14:47.478440'),(49,'pbkdf2_sha256$150000$9yD8ZcJV1QkD$63YvCxvmDBtHxRcpVDanftRCQpDTweFPwq9VZHYG/g8=','2022-04-14 23:39:22.587240',0,'olindsey','','','',0,1,'2022-04-14 22:15:02.563899'),(50,'pbkdf2_sha256$150000$WlVKZnBmZZln$ZjCR7XivLDHcMsSKFB3V4A4A5lkELXrKbtKb7Ok1QDQ=','2022-04-14 23:41:51.706922',0,'olong','','','',0,1,'2022-04-14 22:15:20.758374'),(51,'pbkdf2_sha256$150000$P9pmPHkGlS2G$j813liH3zn0rdXQrDASgXAN9xSR0sb5EYsy3krd+Ydc=','2022-04-14 23:43:40.484343',0,'pcate','','','',0,1,'2022-04-14 22:15:41.997554'),(52,'pbkdf2_sha256$150000$qo1tjEtHzChA$k7yGb5cpp8F9MxgsBdPPL9SawTuLsF6ywaH3m4Cg9HA=','2022-04-14 22:45:08.634042',0,'hflight','','','',0,1,'2022-04-14 22:16:21.327863');
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-01 18:34:03.702804','2','Bsmith',1,'[{\"added\": {}}]',4,1),(2,'2022-04-01 19:28:13.201590','3','cmiller',1,'[{\"added\": {}}]',4,1),(3,'2022-04-01 19:29:23.142631','4','djohnson',1,'[{\"added\": {}}]',4,1),(4,'2022-04-01 19:29:35.812549','2','bsmith',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',4,1),(5,'2022-04-01 19:30:25.075268','5','vanderson',1,'[{\"added\": {}}]',4,1),(6,'2022-04-01 19:32:12.578219','6','fbruce',1,'[{\"added\": {}}]',4,1),(7,'2022-04-01 20:04:55.450417','1','bsmith - Question',1,'[{\"added\": {}}]',7,1),(8,'2022-04-14 04:11:49.751658','7','Phab',3,'',4,1),(9,'2022-04-14 04:12:22.199452','8','cbriggs',1,'[{\"added\": {}}]',4,1),(10,'2022-04-14 04:13:03.235066','9','mgarcia',1,'[{\"added\": {}}]',4,1),(11,'2022-04-14 04:14:10.140739','10','anorth',1,'[{\"added\": {}}]',4,1),(12,'2022-04-14 04:14:32.800258','11','jredforn',1,'[{\"added\": {}}]',4,1),(13,'2022-04-14 04:58:28.248378','12','epreston',1,'[{\"added\": {}}]',4,1),(14,'2022-04-14 04:58:49.470270','13','ybrooks',1,'[{\"added\": {}}]',4,1),(15,'2022-04-14 04:59:10.336344','14','lturner',1,'[{\"added\": {}}]',4,1),(16,'2022-04-14 04:59:52.458676','15','srowe',1,'[{\"added\": {}}]',4,1),(17,'2022-04-14 05:05:05.875372','16','zwhiteley',1,'[{\"added\": {}}]',4,1),(18,'2022-04-14 05:05:41.816692','17','sdwhitney',1,'[{\"added\": {}}]',4,1),(19,'2022-04-14 05:06:27.676662','18','tmcbride',1,'[{\"added\": {}}]',4,1),(20,'2022-04-14 05:06:47.292529','19','kbartlett',1,'[{\"added\": {}}]',4,1),(21,'2022-04-14 05:07:11.291639','20','jbart',1,'[{\"added\": {}}]',4,1),(22,'2022-04-14 05:10:54.333295','21','eball',1,'[{\"added\": {}}]',4,1),(23,'2022-04-14 05:11:27.977243','22','fsykes',1,'[{\"added\": {}}]',4,1),(24,'2022-04-14 20:50:54.598828','23','irtucker',1,'[{\"added\": {}}]',4,1),(25,'2022-04-14 20:51:23.329804','24','rjmcgee',1,'[{\"added\": {}}]',4,1),(26,'2022-04-14 21:08:30.541139','25','abarry',1,'[{\"added\": {}}]',4,1),(27,'2022-04-14 21:08:53.071715','26','bprosser',1,'[{\"added\": {}}]',4,1),(28,'2022-04-14 21:09:18.800179','27','dryan',1,'[{\"added\": {}}]',4,1),(29,'2022-04-14 21:09:43.162661','28','itimms',1,'[{\"added\": {}}]',4,1),(30,'2022-04-14 21:10:13.361261','29','kwatts',1,'[{\"added\": {}}]',4,1),(31,'2022-04-14 21:10:39.236287','30','lhagan',1,'[{\"added\": {}}]',4,1),(32,'2022-04-14 21:10:58.962600','31','msharples',1,'[{\"added\": {}}]',4,1),(33,'2022-04-14 21:11:24.230391','32','yhamilton',1,'[{\"added\": {}}]',4,1),(34,'2022-04-14 21:33:18.971415','33','qwinter',1,'[{\"added\": {}}]',4,1),(35,'2022-04-14 21:33:41.102600','34','qscott',1,'[{\"added\": {}}]',4,1),(36,'2022-04-14 21:33:56.504985','35','hcat',1,'[{\"added\": {}}]',4,1),(37,'2022-04-14 21:34:37.305071','36','xsingh',1,'[{\"added\": {}}]',4,1),(38,'2022-04-14 21:34:58.468194','37','xstore',1,'[{\"added\": {}}]',4,1),(39,'2022-04-14 21:35:29.052694','38','uyam',1,'[{\"added\": {}}]',4,1),(40,'2022-04-14 21:35:51.925375','39','uhooper',1,'[{\"added\": {}}]',4,1),(41,'2022-04-14 21:50:46.633090','40','golson',1,'[{\"added\": {}}]',4,1),(42,'2022-04-14 21:51:01.714939','41','gpratt',1,'[{\"added\": {}}]',4,1),(43,'2022-04-14 21:51:27.197835','42','zclark',1,'[{\"added\": {}}]',4,1),(44,'2022-04-14 21:51:54.163760','43','wrich',1,'[{\"added\": {}}]',4,1),(45,'2022-04-14 21:52:20.720865','44','wparker',1,'[{\"added\": {}}]',4,1),(46,'2022-04-14 21:52:58.094733','45','vyay',1,'[{\"added\": {}}]',4,1),(47,'2022-04-14 22:14:13.903693','46','npalmer',1,'[{\"added\": {}}]',4,1),(48,'2022-04-14 22:14:32.642691','47','nkenny',1,'[{\"added\": {}}]',4,1),(49,'2022-04-14 22:14:47.578274','48','relliot',1,'[{\"added\": {}}]',4,1),(50,'2022-04-14 22:15:02.655872','49','olindsey',1,'[{\"added\": {}}]',4,1),(51,'2022-04-14 22:15:20.846979','50','olong',1,'[{\"added\": {}}]',4,1),(52,'2022-04-14 22:15:42.088350','51','pcate',1,'[{\"added\": {}}]',4,1),(53,'2022-04-14 22:16:21.414784','52','hflight',1,'[{\"added\": {}}]',4,1),(54,'2022-04-14 22:19:16.495445','15','abarry - Question',1,'[{\"added\": {}}]',7,1),(55,'2022-04-14 22:21:38.704640','6','Do you like to eat some desserts after dinner? - vanderson',3,'',8,1),(56,'2022-04-14 22:21:50.264658','7','Do you read the nutritional information on the foods you buy? - vanderson',3,'',8,1);
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
INSERT INTO `django_session` VALUES ('9ijrnvfa2uktft75ezog45470fcfd6oi','MTc2MWNjMzZjMzk1MjU4MGZhNTVjNjdkNmYzYmYxNDY5NjRjZDc3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MTZjYzA0MGEwZTJlMjU2YzdjNDc2NDM5NDRiMGUzZmY5Y2RiMzU1In0=','2022-04-24 07:17:59.961343'),('m8w8t2hxd63ek1kfa2eq0uu09n33rz3o','MTc2MWNjMzZjMzk1MjU4MGZhNTVjNjdkNmYzYmYxNDY5NjRjZDc3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MTZjYzA0MGEwZTJlMjU2YzdjNDc2NDM5NDRiMGUzZmY5Y2RiMzU1In0=','2022-04-16 07:17:16.440016'),('zyz4v9sxgxhn0qwlcm12dnw7zop48kxp','MTc2MWNjMzZjMzk1MjU4MGZhNTVjNjdkNmYzYmYxNDY5NjRjZDc3Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MTZjYzA0MGEwZTJlMjU2YzdjNDc2NDM5NDRiMGUzZmY5Y2RiMzU1In0=','2022-04-29 01:36:50.424074');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stackbase_comment`
--

DROP TABLE IF EXISTS `stackbase_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stackbase_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stackbase_comment_question_id_7e187e91_fk_stackbase_question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stackbase_comment`
--

LOCK TABLES `stackbase_comment` WRITE;
/*!40000 ALTER TABLE `stackbase_comment` DISABLE KEYS */;
INSERT INTO `stackbase_comment` VALUES (1,'cmiller','<p>I personally love pasta the best!</p>','2022-04-02 05:56:39.731746',1),(2,'djohnson','<p>I personally love to cook burgers and grilled cheese.&nbsp;</p>','2022-04-02 06:01:45.660265',5),(3,'fbruce','<p>I go out to eat pretty often at least 3 times a week. I do need to cut down on doing that though.</p>','2022-04-02 06:57:17.739954',7),(4,'vanderson','<p>I definitely do! Fruit is great, especially grapes.</p>','2022-04-02 07:15:35.252752',8),(5,'bsmith','<p>I love desserts everyday! I personally like to eat pudding and ice cream.</p>','2022-04-02 07:16:59.842834',11),(8,'abarry','<p>I personally do!</p>','2022-04-14 22:20:44.681647',9),(9,'anorth','<p>I like mountain dew.</p>','2022-04-14 22:23:54.445296',16),(10,'bprosser','<p>I like broccoli.</p>','2022-04-14 22:31:34.007934',17),(11,'cbriggs','<p>I also cook a lot!</p>','2022-04-14 22:34:03.842399',20),(12,'dryan','<p>I also like black coffee! :)</p>','2022-04-14 22:35:43.399321',22),(13,'eball','<p>I like a classic peanut butter and jelly sandwich.</p>','2022-04-14 22:37:36.818010',23),(14,'epreston','<p>I like salad more.</p>','2022-04-14 22:39:18.639985',25),(15,'fsykes','<p>I like dinner the best.</p>','2022-04-14 22:40:39.391608',28),(16,'golson','<p>I like waffles too!</p>','2022-04-14 22:41:56.749493',29),(17,'gpratt','<p>I like vanilla better.</p>','2022-04-14 22:43:11.538671',32),(18,'hcat','<p>I like spicy meals too!</p>','2022-04-14 22:44:52.461889',34),(19,'hflight','<p>I like burgers more.</p>','2022-04-14 22:46:18.258857',35),(20,'irtucker','<p>I also like juice more. :))</p>','2022-04-14 22:47:51.070163',38),(21,'itimms','<p>I like scones more.</p>','2022-04-14 22:50:09.699565',39),(22,'jbart','<p>I like chocolate cake more.</p>','2022-04-14 22:51:49.933004',41),(23,'jredforn','<p>I like nachos more.</p>','2022-04-14 23:25:02.499580',43),(24,'kbartlett','<p>I like root beer more too!</p>','2022-04-14 23:26:50.028137',45),(25,'kwatts','<p>I like doughnuts more.</p>','2022-04-14 23:28:16.964193',48),(26,'lhagan','<p>I personally like just three meals a day.</p>','2022-04-14 23:29:50.634204',50),(27,'lturner','<p>I like white rice more.</p>','2022-04-14 23:31:16.514823',52),(28,'mgarcia','<p>I personally love bagels too!</p>','2022-04-14 23:33:06.771496',53),(29,'msharples','<p>I like the classic ones the best.</p>','2022-04-14 23:35:07.785350',55),(30,'nkenny','<p>I also love apples too!</p>','2022-04-14 23:37:12.658454',58),(31,'npalmer','<p>I also like that combination too!</p>','2022-04-14 23:39:04.086991',60),(32,'olindsey','<p>I personally just had chocolate cake recently.</p>','2022-04-14 23:41:37.687277',61),(33,'olong','<p>I&#39;d rather go to a restaurant.</p>','2022-04-14 23:43:21.279974',64),(34,'pcate','<p>I like grape jam the best.</p>','2022-04-14 23:45:18.025280',66),(35,'qscott','<p>I would rather give up cheese.</p>','2022-04-14 23:46:58.245554',68),(36,'qwinter','<p>I&#39;d also rather eat square-shaped food!</p>','2022-04-14 23:48:33.528200',69),(37,'relliot','<p>I&#39;d also rather eat avocado ice cream too!</p>','2022-04-15 00:35:34.316502',71),(38,'rjmcgee','<p>Definitely give up sugar.</p>','2022-04-15 00:37:27.307293',74),(39,'sdwhitney','<p>fried chicken</p>','2022-04-15 00:39:19.153411',75),(40,'srowe','<p>I&#39;d rather have ice cream.</p>','2022-04-15 00:41:06.143903',78),(41,'tmcbride','<p>I&#39;d have to say brownie batter for me!</p>','2022-04-15 00:42:48.428100',79),(42,'uhooper','<p>I&#39;d rather make rice crispies!</p>','2022-04-15 00:44:23.530705',82),(43,'uyam','<p>I&#39;d say kale chips.</p>','2022-04-15 00:45:53.765459',83),(44,'vyay','<p>I like pineapple pizza!</p>','2022-04-15 00:47:32.405755',85),(45,'wparker','<p>I like yellow tortilla chips!</p>','2022-04-15 00:50:33.710863',88),(46,'wrich','<p>I like scallops!</p>','2022-04-15 00:52:58.823144',90),(47,'xsingh','<p>I also like spiral lollipops!</p>','2022-04-15 00:55:16.238589',92),(48,'xstore','<p>I also love oatmeal!</p>','2022-04-15 00:57:19.496751',94),(49,'ybrooks','<p>I like salmon.</p>','2022-04-15 00:59:50.212444',96),(50,'yhamilton','<p>I like them too!</p>','2022-04-15 01:18:30.771110',98),(51,'zclark','<p>I love milkshakes more too.</p>','2022-04-15 01:21:25.271919',99),(52,'zwhiteley','<p>I like almonds the best.</p>','2022-04-15 01:36:33.848714',101);
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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stackbase_question`
--

LOCK TABLES `stackbase_question` WRITE;
/*!40000 ALTER TABLE `stackbase_question` DISABLE KEYS */;
INSERT INTO `stackbase_question` VALUES (1,'What is your favorite food?','I just wanted to ask what others favorite food is. :))','2022-04-01 20:04:00.000000',2),(3,'Does anyone else like steak?','I love steak! Does anyone agree?','2022-04-02 05:52:55.458137',2),(4,'What unhealthy food do you love?','I love junk food. What kind of junk food do you guys love?','2022-04-02 05:55:04.154929',3),(5,'What kinds of food do you like to cook?','I love to cook, so I wanted to ask, what do you guys like to cook?','2022-04-02 05:56:09.888613',3),(6,'Does anyone know any tasty healthy foods to eat?','I wanted to ask whether anyone had any recs on healthy foods since I want to start eating healthier.','2022-04-02 05:59:13.946141',4),(7,'How often do you go out to eat?','How often do you go out to eat?','2022-04-02 06:00:11.034366',4),(8,'Do you like to eat fruit everyday?','I love fruit, so I was curious :)','2022-04-02 06:55:04.256719',6),(9,'Do you like to try new food often?','I personally do!','2022-04-02 06:56:36.184353',6),(11,'Do you like to eat some desserts after dinner?','I love desserts!','2022-04-02 07:14:30.584749',5),(12,'Do you read the nutritional information on the foods you buy?','I personally do to keep up on my nutrition.','2022-04-02 07:14:57.504878',5),(15,'What\'s your favorite jellybeans flavor?','Mine\'s cherry.','2022-04-14 22:17:42.000000',25),(16,'What\'s your favorite soda?','I like pepsi.','2022-04-14 22:20:21.454114',25),(17,'What\'s your favorite vegetable?','I like carrots personally.','2022-04-14 22:22:48.280550',10),(18,'Is there any kind of food that doesn\'t expire?','Just curious.','2022-04-14 22:23:34.507070',10),(19,'What food tastes bad to you?','I personally think peanuts taste bad.','2022-04-14 22:30:43.109414',26),(20,'Are any of you good cooks?','I cook a lot personally.','2022-04-14 22:31:09.601499',26),(21,'Is a hot dog a sandwich?','Wondering what you all think. :)','2022-04-14 22:32:49.800116',8),(22,'How do you drink your coffee?','I like black coffee.','2022-04-14 22:33:46.393179',8),(23,'What\'s your favorite sandwich?','I love a ham and cheese sandwich.','2022-04-14 22:34:52.558792',27),(24,'If you could eat one food for the rest of your life, what would it be?','I would eat pasta personally.','2022-04-14 22:35:27.881851',27),(25,'Do you like soup or salad more?','I like soup more.','2022-04-14 22:36:29.485197',21),(26,'Do you like pizza or pasta more?','I like pizza more.','2022-04-14 22:37:14.912725',21),(27,'Do you like ice cream or cake more?','I like cake more personally.','2022-04-14 22:38:19.840597',12),(28,'Do you like breakfast, lunch, or dinner more?','I like breakfast the best.','2022-04-14 22:39:01.995367',12),(29,'Do you like waffles or pancakes more?','I like waffles more.','2022-04-14 22:39:57.019601',22),(30,'Do you like rice or noodles more?','I like rice more.','2022-04-14 22:40:24.263349',22),(31,'Do you prefer salt or pepper on your meals?','I like salt on my meals more.','2022-04-14 22:41:17.637641',40),(32,'Do you like vanilla or chocolate more?','I like chocolate much more.','2022-04-14 22:41:40.851119',40),(33,'Do you like sweet or savory dishes more?','I like sweet dishes more.','2022-04-14 22:42:31.725035',41),(34,'Do you like spicy or mild meals more?','I like spicy meals more.','2022-04-14 22:42:54.017068',41),(35,'Do you like burgers or tacos more?','I like tacos more.','2022-04-14 22:43:54.135876',35),(36,'Do you like seafood or steak more?','I like seafood way more.','2022-04-14 22:44:37.036652',35),(37,'Do you like coffee or tea more?','I like tea more.','2022-04-14 22:45:32.658679',52),(38,'Do you like smoothies or juice more?','I like juice more.','2022-04-14 22:46:01.769770',52),(39,'Do you like scones or muffins more?','I like muffins more personally.','2022-04-14 22:46:58.869523',23),(40,'Do you like peanut butter or nutella more?','I love peanut butter.','2022-04-14 22:47:32.886708',23),(41,'What\'s your favorite type of cake?','I like red velvet.','2022-04-14 22:49:03.575271',28),(42,'Do you like doritos or cheetos more?','I like doritos more.','2022-04-14 22:49:52.739361',28),(43,'Do you like french fries or nachos more?','I like french fries more. :)','2022-04-14 22:50:58.582730',20),(44,'Do you like cereal or cupcakes more?','I like cupcakes more since I love sweets.','2022-04-14 22:51:36.705050',20),(45,'Do you like root beer or mountain dew more?','I like root beer more.','2022-04-14 23:24:05.720629',11),(46,'Do you like fruit roll-ups or fruit gushers?','I like fruit gushers more.','2022-04-14 23:24:43.221026',11),(47,'Do you like M&Ms or Twizzlers more?','I like M&Ms more.','2022-04-14 23:26:02.248317',19),(48,'Do you like doughnuts or pies?','I like pie way more. :))','2022-04-14 23:26:32.179706',19),(49,'Do you like hot or cool food?','I like hot food more.','2022-04-14 23:27:28.362001',29),(50,'Do you like snacks or meals more?','I love snacks throughout the day.','2022-04-14 23:27:56.016705',29),(51,'Do you like lasagna or mac and cheese more?','I like mac and cheese more personally.','2022-04-14 23:28:58.068647',30),(52,'Do you like white rice or fried rice more?','I love fried rice way more. :)','2022-04-14 23:29:26.695359',30),(53,'Do you like bagels or ham sandwiches more?','I like bagels with sour cream more.','2022-04-14 23:30:35.964375',14),(54,'Do you like bread or crackers more?','I love crackers.','2022-04-14 23:31:00.609007',14),(55,'Do you like classic candy canes or rainbow candy canes more?','I love rainbow candy canes personally.','2022-04-14 23:32:10.842228',9),(56,'Do you like eggnog or hot chocolate more?','I love hot chocolate a ton.','2022-04-14 23:32:38.224176',9),(57,'Do you like Pizza Hut or Dominos more?','I like Pizza Hut more.','2022-04-14 23:33:59.504013',31),(58,'Do you like apples or oranges more?','I like apples more.','2022-04-14 23:34:42.662437',31),(59,'What\'s your favorite cookie?','I like chocolate chip and sugar cookies.','2022-04-14 23:36:10.103144',47),(60,'Does anyone like avocado with grilled cheese?','I do!','2022-04-14 23:36:55.298880',47),(61,'What\'s the most recent food you\'ve tasted?','I had blueberries most recently.','2022-04-14 23:38:16.362290',46),(62,'What\'s your cooking specialty?','Just curious :))','2022-04-14 23:38:46.806191',46),(63,'Would you rather have an omelette or scrambled eggs.','I\'d personally choose an omelette.','2022-04-14 23:40:31.301886',49),(64,'Would you rather have a picnic or eat at a restaurant?','I\'d rather go on a picnic.','2022-04-14 23:41:12.346823',49),(65,'Does anyone like candy corn?','I personally do during Halloween.','2022-04-14 23:42:36.334652',50),(66,'Do you have a favorite jam?','I like strawberry jam.','2022-04-14 23:43:03.986355',50),(67,'What kind of popcorn do you like?','I like cheese popcorn.','2022-04-14 23:44:14.034855',51),(68,'Would you rather give up cheese or chocolate forever?','I would rather give up chocolate forever.','2022-04-14 23:44:59.527808',51),(69,'Would you rather only eat square-shaped food or only eat circle-shaped food?','I\'d rather eat square-shaped food.','2022-04-14 23:46:01.690741',34),(70,'Would you rather eat every meal with ketchup or with mayo?','I\'d rather eat every meal with mayo personally.','2022-04-14 23:46:42.545277',34),(71,'Would you rather eat brocoli-chip cookies or eat avocado ice cream?','I\'d rather eat avocado ice cream personally.','2022-04-14 23:47:51.621500',33),(72,'Would you rather eat pizza for breakfast every morning or eat pancakes for dinner every night?','I\'d rather eat pancakes for dinner every night.','2022-04-14 23:48:15.411651',33),(73,'Would you choose McDonald’s fries or Burger King Fries?','I would definitely choose McDonald\'s fries.','2022-04-15 00:34:48.130510',48),(74,'Would you rather give up sugar or give up salt?','I would rather give up sugar.','2022-04-15 00:35:09.571387',48),(75,'Would you rather choose fried chicken or chicken nuggets?','Fried chicken all the way.','2022-04-15 00:36:25.262755',24),(76,'Would you rather be allergic to everything salty or everything sweet?','I\'d rather be allergic to everything sweet.','2022-04-15 00:36:56.099526',24),(77,'Would you rather live in a world without french fries or a world without onion rings?','Without onion rings for me personally.','2022-04-15 00:38:38.129220',17),(78,'Would you rather have ice cream or a popsicle on the hottest day of summer?','Definitely a popsicle','2022-04-15 00:38:57.532203',17),(79,'Would you rather eat cookie dough or brownie batter?','Cookie dough for me!','2022-04-15 00:40:11.322265',15),(80,'Would you rather have it rain chocolate or snow cotton candy?','I\'d love for it to snow cotton candy.','2022-04-15 00:40:49.202368',15),(81,'Would you rather have Cheez-Its or Goldfish?','I would rather have Goldfish.','2022-04-15 00:42:10.727653',18),(82,'Would you rather bake brownies or make rice crispy treats?','I love baking brownies!','2022-04-15 00:42:28.170959',18),(83,'Would you rather have veggie sticks or kale chips?','I personally like veggie sticks.','2022-04-15 00:43:41.862596',39),(84,'Would you rather eat Lunchables every day for a year or eat cup noodles every day for a year?','I\'d say cup noodles for sure.','2022-04-15 00:44:00.784153',39),(85,'What kind of pizza do you like best?','I like pepperoni the best!','2022-04-15 00:45:14.484371',38),(86,'Would you rather have Lays or Ruffles?','Ruffles is the best for me!','2022-04-15 00:45:36.108470',38),(87,'Would you rather give up soda or candy for a year?','I\'d rather give up soda.','2022-04-15 00:46:45.849241',45),(88,'What kind of tortilla chips do you like?','I like blue tortilla chips.','2022-04-15 00:47:15.596311',45),(89,'Who likes salsa here?','I do!','2022-04-15 00:48:46.813968',44),(90,'What kind of seafood do you like?','I like shrimp.','2022-04-15 00:50:10.209389',44),(91,'How do you like your steak cooked?','I like it cooked medium rare.','2022-04-15 00:52:06.401931',43),(92,'What kind of lollipop do you guys like?','I like spiral lollipops.','2022-04-15 00:52:46.548350',43),(93,'What kinds of grains do you like?','I like whole grain bread.','2022-04-15 00:54:35.348714',36),(94,'Does anyone like oatmeal here?','I love oatmeal, so I was curious!','2022-04-15 00:54:57.952214',36),(95,'What kind of cheese do you like?','I like blue cheese.','2022-04-15 00:56:39.253389',37),(96,'What kind of fish do you like?','I like tuna fish.','2022-04-15 00:57:06.443371',37),(97,'What\'s your favorite cereal?','I like Fruit Loops!','2022-04-15 00:58:47.554739',13),(98,'Does anyone like shrimp tacos?','I love them!','2022-04-15 00:59:35.345829',13),(99,'Do you like milkshakes or ice cream more?','I like milkshakes more.','2022-04-15 01:17:30.015323',32),(100,'What kind of salad do you like?','I like Caesar salad.','2022-04-15 01:18:11.560685',32),(101,'What kind of nuts do you like?','I like cashews.','2022-04-15 01:20:14.231824',42),(102,'Do you like blueberries or raspberries more?','I like raspberries more!','2022-04-15 01:21:07.311306',42),(103,'What\'s your favorite food during a movie?','Mine\'s popcorn.','2022-04-15 01:35:14.601083',16),(104,'What\'s your favorite food during a barbecue?','I like hot dogs during a barbecue.','2022-04-15 01:36:10.640081',16);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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

-- Dump completed on 2022-04-15  1:43:01
