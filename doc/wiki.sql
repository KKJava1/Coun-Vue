/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : wiki

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 13/05/2023 12:22:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `parent` bigint(0) NOT NULL DEFAULT 0 COMMENT '父id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int(0) NULL DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (100, 0, '前端开发', 100);
INSERT INTO `category` VALUES (101, 100, 'Vue', 101);
INSERT INTO `category` VALUES (102, 100, 'HTML & CSS', 102);
INSERT INTO `category` VALUES (200, 0, 'Java', 200);
INSERT INTO `category` VALUES (201, 200, '基础应用', 201);
INSERT INTO `category` VALUES (202, 200, '框架应用', 202);
INSERT INTO `category` VALUES (300, 0, 'Python', 300);
INSERT INTO `category` VALUES (301, 300, '基础应用', 301);
INSERT INTO `category` VALUES (302, 300, '进阶方向应用', 302);
INSERT INTO `category` VALUES (400, 0, '数据库', 400);
INSERT INTO `category` VALUES (401, 400, 'MySQL', 401);
INSERT INTO `category` VALUES (500, 0, '其它', 500);
INSERT INTO `category` VALUES (501, 500, '服务器', 501);
INSERT INTO `category` VALUES (502, 500, '开发工具', 502);
INSERT INTO `category` VALUES (503, 500, '热门服务端语言', 503);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `ebook_id` bigint(0) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论的内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '评论更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, 'good', '2023-05-13 03:33:45', NULL);

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `id` bigint(0) NOT NULL COMMENT '文档id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (1, '<p>Spring Boot makes it easy to create stand-alone, production-grade Spring based Applications that you can \"just run\".</p><p>We take an opinionated view of the Spring platform and third-party libraries so you can get started with minimum fuss. Most Spring Boot applications need minimal Spring configuration.</p><p>If you’re looking for information about a specific version, or instructions about how to upgrade from an earlier release, check out&nbsp;<a href=\"https://github.com/spring-projects/spring-boot/wiki#release-notes\">the project release notes section</a>&nbsp;on our wiki.</p><h2><a href=\"https://spring.io/projects/spring-boot#features\"></a>Features</h2><ul><li><p>Create stand-alone Spring applications</p></li><li><p>Embed Tomcat, Jetty or Undertow directly (no need to deploy WAR files)</p></li><li><p>Provide opinionated \'starter\' dependencies to simplify your build configuration</p></li><li><p>Automatically configure Spring and 3rd party libraries whenever possible</p></li><li><p>Provide production-ready features such as metrics, health checks, and externalized configuration</p></li><li><p>Absolutely no code generation and no requirement for XML configuration</p></li></ul><h2><a href=\"https://spring.io/projects/spring-boot#getting-started\"></a>Getting Started</h2><ul><li><p>Super quick — try the&nbsp;<a href=\"https://spring.io/quickstart\">Quickstart Guide</a>.</p></li><li><p>More general — try&nbsp;<a href=\"https://spring.io/guides/gs/spring-boot/\">Building an Application with Spring Boot</a></p></li><li><p>More specific — try&nbsp;<a href=\"https://spring.io/guides/gs/rest-service/\">Building a RESTful Web Service</a>.</p></li><li><p>Or search through all our guides on the&nbsp;<a href=\"https://spring.io/guides\">Guides</a>&nbsp;homepage.</p></li></ul><h2><a href=\"https://spring.io/projects/spring-boot#talks-and-videos\"></a>Talks and videos</h2><ul><li><p><a href=\"https://content.pivotal.io/springone-platform-2017/its-a-kind-of-magic-under-the-covers-of-spring-boot-brian-clozel-st%C3%A9phane-nicoll\">It’s a Kind of Magic: Under the Covers of Spring Boot</a></p></li><li><p><a href=\"https://content.pivotal.io/springone-platform-2017/whats-new-in-spring-boot-2-0-phillip-webb-madhura-bhave\">What’s New in Spring Boot 2.0</a></p></li><li><p><a href=\"https://content.pivotal.io/webinars/mar-13-introducing-spring-boot-2-0-webinar\">Introducing Spring Boot 2.0 webinar</a></p></li><li><p><a href=\"https://content.pivotal.io/springone-platform-2017/test-driven-development-with-spring-boot-sannidhi-jalukar-madhura-bhave\">Test Driven Development with Spring Boot</a></p></li><li><p><a href=\"https://content.pivotal.io/springone-platform-2017/from-zero-to-hero-with-spring-boot-brian-clozel\">From Zero to Hero with Spring Boot 2.0</a></p></li></ul><p>You can also join the&nbsp;<a href=\"https://gitter.im/spring-projects/spring-boot\">Spring Boot community on Gitter</a>!</p>');
INSERT INTO `content` VALUES (37841703666847744, '');
INSERT INTO `content` VALUES (37841746528440320, '');

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES (1, '测试');

-- ----------------------------
-- Table structure for doc
-- ----------------------------
DROP TABLE IF EXISTS `doc`;
CREATE TABLE `doc`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `ebook_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '电子书id',
  `parent` bigint(0) NOT NULL DEFAULT 0 COMMENT '父id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int(0) NULL DEFAULT NULL COMMENT '顺序',
  `view_count` int(0) NULL DEFAULT 0 COMMENT '阅读数',
  `vote_count` int(0) NULL DEFAULT 0 COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文档' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doc
-- ----------------------------
INSERT INTO `doc` VALUES (1, 1, 0, '文档1', 1, 96, 5);
INSERT INTO `doc` VALUES (2, 1, 1, '文档1.1', 1, 6, 2);
INSERT INTO `doc` VALUES (3, 1, 0, '文档2', 2, 2, 0);
INSERT INTO `doc` VALUES (4, 1, 3, '文档2.1', 1, 5, 1);
INSERT INTO `doc` VALUES (5, 1, 3, '文档2.2', 2, 4, 1);
INSERT INTO `doc` VALUES (6, 1, 5, '文档2.2.1', 1, 4, 1);
INSERT INTO `doc` VALUES (37841703666847744, 1, 5, '文档2.2.2', 1, 2, 0);
INSERT INTO `doc` VALUES (37841746528440320, 1, 37841703666847744, '文档2.2.2.1', 1, 2, 0);

-- ----------------------------
-- Table structure for ebook
-- ----------------------------
DROP TABLE IF EXISTS `ebook`;
CREATE TABLE `ebook`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category1_id` bigint(0) NULL DEFAULT NULL COMMENT '分类1',
  `category2_id` bigint(0) NULL DEFAULT NULL COMMENT '分类2',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `doc_count` int(0) NOT NULL DEFAULT 0 COMMENT '文档数',
  `view_count` int(0) NOT NULL DEFAULT 0 COMMENT '阅读数',
  `vote_count` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电子书' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ebook
-- ----------------------------
INSERT INTO `ebook` VALUES (1, 'Spring Boot 入门教程', 200, 202, '零基础入门 Java 开发，企业级应用开发最佳首选框架', NULL, 8, 121, 10);
INSERT INTO `ebook` VALUES (2, 'Vue 入门教程', 100, 101, '零基础入门 Vue 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (3, 'Python 入门教程', 300, 301, '零基础入门 Python 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (4, 'Mysql 入门教程', 400, 401, '零基础入门 Mysql 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (5, 'Oracle 入门教程', NULL, NULL, '零基础入门 Oracle 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);

-- ----------------------------
-- Table structure for ebook_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `ebook_snapshot`;
CREATE TABLE `ebook_snapshot`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ebook_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '电子书id',
  `date` date NOT NULL COMMENT '快照日期',
  `view_count` int(0) NOT NULL DEFAULT 0 COMMENT '阅读数',
  `vote_count` int(0) NOT NULL DEFAULT 0 COMMENT '点赞数',
  `view_increase` int(0) NOT NULL DEFAULT 0 COMMENT '阅读增长',
  `vote_increase` int(0) NOT NULL DEFAULT 0 COMMENT '点赞增长',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ebook_id_date_unique`(`ebook_id`, `date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电子书快照表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ebook_snapshot
-- ----------------------------
INSERT INTO `ebook_snapshot` VALUES (1, 1, '2023-03-02', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (2, 2, '2023-03-02', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (3, 3, '2023-03-02', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (4, 4, '2023-03-02', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (5, 5, '2023-03-02', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (6, 1, '2023-03-05', 8, 5, 8, 5);
INSERT INTO `ebook_snapshot` VALUES (7, 2, '2023-03-05', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (8, 3, '2023-03-05', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (9, 4, '2023-03-05', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (10, 5, '2023-03-05', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (11, 1, '2023-03-06', 9, 6, 1, 1);
INSERT INTO `ebook_snapshot` VALUES (12, 2, '2023-03-06', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (13, 3, '2023-03-06', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (14, 4, '2023-03-06', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (15, 5, '2023-03-06', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (16, 1, '2023-03-18', 10, 7, 10, 7);
INSERT INTO `ebook_snapshot` VALUES (17, 2, '2023-03-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (18, 3, '2023-03-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (19, 4, '2023-03-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (20, 5, '2023-03-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (21, 1, '2023-03-23', 10, 7, 10, 7);
INSERT INTO `ebook_snapshot` VALUES (22, 2, '2023-03-23', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (23, 3, '2023-03-23', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (24, 4, '2023-03-23', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (25, 5, '2023-03-23', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (28, 1, '2023-04-24', 10, 7, 10, 7);
INSERT INTO `ebook_snapshot` VALUES (29, 2, '2023-04-24', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (30, 3, '2023-04-24', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (31, 4, '2023-04-24', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (32, 5, '2023-04-24', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (33, 1, '2023-05-10', 10, 7, 10, 7);
INSERT INTO `ebook_snapshot` VALUES (34, 2, '2023-05-10', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (35, 3, '2023-05-10', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (36, 4, '2023-05-10', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (37, 5, '2023-05-10', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (38, 1, '2023-05-11', 10, 7, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (39, 2, '2023-05-11', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (40, 3, '2023-05-11', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (41, 4, '2023-05-11', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (42, 5, '2023-05-11', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (45, 1, '2023-05-12', 68, 10, 58, 3);
INSERT INTO `ebook_snapshot` VALUES (46, 2, '2023-05-12', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (47, 3, '2023-05-12', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (48, 4, '2023-05-12', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (49, 5, '2023-05-12', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (50, 1, '2023-05-13', 120, 10, 52, 0);
INSERT INTO `ebook_snapshot` VALUES (51, 2, '2023-05-13', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (52, 3, '2023-05-13', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (53, 4, '2023-05-13', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (54, 5, '2023-05-13', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name_unique`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37814121005191173 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', '测试', 'db0887127059810ba9f80186d795edb5');
INSERT INTO `user` VALUES (37814121005191169, '1', '1', 'c4ca4238a0b923820dcc509a6f75849b');
INSERT INTO `user` VALUES (37814121005191170, '2', '2', 'c81e728d9d4c2f636f067f89cc14862c');
INSERT INTO `user` VALUES (37814121005191171, '4', '4', '8621246ddb05c1bc6cba1e463a90ad23');
INSERT INTO `user` VALUES (37814121005191172, 's', 's', '03c7c0ace395d80182db07ae2c30f034');
INSERT INTO `user` VALUES (37814121005191173, 'c', 'c', '8e30ae412d4db47c704dca300d053a8f');

SET FOREIGN_KEY_CHECKS = 1;
