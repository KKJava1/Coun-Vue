/*
 Navicat MySQL Data Transfer

 Source Server         : 106.14.183.201
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 106.14.183.201:3306
 Source Schema         : wiki

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 22/06/2023 10:25:02
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
INSERT INTO `category` VALUES (504, 100, 'JavaScript', 103);
INSERT INTO `category` VALUES (52447426497351681, 400, 'Redis', 402);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `ebook_id` bigint(0) NULL DEFAULT NULL,
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '评论是回复别人的评论，这个字段表示被回复的评论的ID',
  `replyToUser_id` bigint(0) NULL DEFAULT NULL COMMENT '如果这个评论是回复别人的评论，这个字段表示被回复的用户的ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论的内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '评论更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

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
INSERT INTO `content` VALUES (38625501966897152, '<p>如果说是JQuery是手工作坊，那么Vue.js就像是一座工厂，虽然Vue.js做的任何事情JQuery都可以做，但无论是代码量还是流程规范性都是前者较优。</p><p>Vue.js的<a href=\"https://links.jianshu.com/go?to=https%3A%2F%2Fcn.vuejs.org%2Fv2%2Fguide%2F\" target=\"_blank\">官方中文教程</a>其实也是一个不错的教程，不过相比于一次性把所有概念掌握，我更倾向于先会用，之后再在实际应用中把未涉及到的知识点逐步补全。</p><p>就像开车，不是非要知道发动机的工作原理才能上路的，甚至你可能一辈子也不用知道。</p><p>好了，开始吧</p><p><br></p><p>\n\n\n\n\n\n\n\n\n<br><br>作者：景行1023<br>链接：https://www.jianshu.com/p/5d0d913d2453<br>来源：简书<br>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p>');
INSERT INTO `content` VALUES (39790373182246912, '<h1><a href=\"https://so.csdn.net/so/search?q=RocketMQ&amp;spm=1001.2101.3001.7020\" target=\"_blank\" style=\"font-size: 1em; background-color: rgb(255, 255, 255);\">RocketMQ</a><span style=\"font-size: 1em;\">作为一款纯java、分布式、队列模型的开源消息中间件，支持事务消息、顺序消息、批量消息、定时消息、消息回溯等</span><br></h1>');
INSERT INTO `content` VALUES (39790662006214656, '');
INSERT INTO `content` VALUES (39790797704531968, '<p>支持发布/订阅（Pub/Sub）和点对点（P2P）消息模型<br><br>在一个队列中可靠的先进先出（FIFO）和严格的顺序传递 （RocketMQ可以保证严格的消息顺序，而ActiveMQ无法保证）<br><br>支持拉（pull）和推（push）两种消息模式<br><br>pull其实就是消费者主动从MQ中去拉消息，而push则像rabbit MQ一样，是MQ给消费者推送消息。但是RocketMQ的push其实是基于pull来实现的。<br>它会先由一个业务代码从MQ中pull消息，然后再由业务代码push给特定的应用/消费者。其实底层就是一个pull模式<br><br>单一队列百万消息的堆积能力 （RocketMQ提供亿级消息的堆积能力，这不是重点，重点是堆积了亿级的消息后，依然保持写入低延迟）<br><br>支持多种消息协议，如 JMS、MQTT 等<br><br>分布式高可用的部署架构,满足至少一次消息传递语义（RocketMQ原生就是支持分布式的，而ActiveMQ原生存在单点性）<br><br>提供 docker 镜像用于隔离测试和云集群部署<br><br>提供配置、指标和监控等功能丰富的 Dashboard<br>————————————————<br>版权声明：本文为CSDN博主「fFee-ops」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_21040559/article/details/122703715</p>');
INSERT INTO `content` VALUES (39791363037990912, '<p><a href=\"https://so.csdn.net/so/search?q=RocketMQ&amp;spm=1001.2101.3001.7020\" target=\"_blank\">RocketMQ</a>作为一款纯java、分布式、队列模型的开源消息中间件，支持事务消息、顺序消息、批量消息、定时消息、消息回溯等<br></p>');
INSERT INTO `content` VALUES (39791679196237824, '<h1 id=\"ol6di\">在Maven中导入RocketMq的依赖</h1><pre>&lt;dependency&gt;\n    &lt;groupId&gt;org.apache.rocketmq&lt;/groupId&gt;\n    &lt;artifactId&gt;rocketmq-spring-boot-starter&lt;/artifactId&gt;\n    &lt;version&gt;2.0.2&lt;/version&gt;\n&lt;/dependency&gt;<br></pre>');
INSERT INTO `content` VALUES (39791879704940544, '<p>导入配置，在properties或者yml中</p><pre>rocketmq.name-server=127.0.0.1:9876\nrocketmq.producer.group=default<br></pre><p><br></p><p><br></p><p>且需要打开你的RocketMq 输入<span style=\"font-size: 1em;\">mqbroker.cmd -n 127.0.0.1:9876 autoCreateTopicEnable=true 和打开</span><span style=\"font-size: 1em;\">mqnamesrv.cmd</span></p>');
INSERT INTO `content` VALUES (39792357465526272, '<p>在应用中导入</p><pre>@Autowired<br>private RocketMQTemplate rocketMQTemplate;</pre><p>并且在代码中直接使用converAndSend方法进行发送</p><p>/**<br>         * 点赞<br>         */<br>        public void vote(Long id) {<br>            // docMapperCust.increaseVoteCount(id);<br>            // 远程IP+doc.id作为key，24小时内不能重复<br>            String ip = RequestContext.getRemoteAddr();<br>            if (redisUtil.validateRepeat(\"DOC_VOTE_\" + id + \"_\" + ip, 5000)) {<br>                docMapperCust.increaseVoteCount(id);<br>            } else {<br>                throw new BusinessException(BusinessExceptionCode.VOTE_REPEAT);<br>            }<br><br>            // 推送消息<br>            Doc docDb = docMapper.selectByPrimaryKey(id);<br>            String logId = MDC.get(\"LOG_ID\");<br>//            wsService.sendInfo(\"【\" + docDb.getName() + \"】被点赞！\", logId);<br>             rocketMQTemplate.convertAndSend(\"VOTE_TOPIC\", \"【\" + docDb.getName() + \"】被点赞！\");<br>        }<br></p>');
INSERT INTO `content` VALUES (39794574159384576, '<p><h3 id=\"h1asa\">通过注解@RocketMQMessageListener 设置consumerGroup&nbsp;对应的是我们配置文件的consumerGroup&nbsp;，和topic&nbsp;对应的是我们的发送端发送的topic</h3>topic&nbsp;<br> @Service<br> @RocketMQMessageListener(consumerGroup = \"default\", topic = \"VOTE_TOPIC\")<br> public class VoteTopicConsumer implements RocketMQListener&lt;MessageExt&gt; {<br><br>     private static final Logger LOG = LoggerFactory.getLogger(VoteTopicConsumer.class);<br><br>     @Resource<br>     public WebSocketServer webSocketServer;<br><br>     @Override<br>     public void onMessage(MessageExt messageExt) {<br>         byte[] body = messageExt.getBody();<br>         LOG.info(\"ROCKETMQ收到消息：{}\", new String(body));<br>         webSocketServer.sendInfo(new String(body));<br>     }<br> }<br></p>');
INSERT INTO `content` VALUES (39794595206402048, '<p><h3 id=\"h1asa\">通过注解@RocketMQMessageListener 设置consumerGroup&nbsp;对应的是我们配置文件的consumerGroup&nbsp;，和topic&nbsp;对应的是我们的发送端发送的topic</h3>topic&nbsp;<br> @Service<br> @RocketMQMessageListener(consumerGroup = \"default\", topic = \"VOTE_TOPIC\")<br> public class VoteTopicConsumer implements RocketMQListener&lt;MessageExt&gt; {<br><br>     private static final Logger LOG = LoggerFactory.getLogger(VoteTopicConsumer.class);<br><br>     @Resource<br>     public WebSocketServer webSocketServer;<br><br>     @Override<br>     public void onMessage(MessageExt messageExt) {<br>         byte[] body = messageExt.getBody();<br>         LOG.info(\"ROCKETMQ收到消息：{}\", new String(body));<br>         webSocketServer.sendInfo(new String(body));<br>     }<br> }<br></p>');
INSERT INTO `content` VALUES (39794616198893568, '<p><h3 id=\"h1asa\">通过注解@RocketMQMessageListener 设置consumerGroup&nbsp;对应的是我们配置文件的consumerGroup&nbsp;，和topic&nbsp;对应的是我们的发送端发送的topic</h3>topic&nbsp;<br> @Service<br> @RocketMQMessageListener(consumerGroup = \"default\", topic = \"VOTE_TOPIC\")<br> public class VoteTopicConsumer implements RocketMQListener&lt;MessageExt&gt; {<br><br>     private static final Logger LOG = LoggerFactory.getLogger(VoteTopicConsumer.class);<br><br>     @Resource<br>     public WebSocketServer webSocketServer;<br><br>     @Override<br>     public void onMessage(MessageExt messageExt) {<br>         byte[] body = messageExt.getBody();<br>         LOG.info(\"ROCKETMQ收到消息：{}\", new String(body));<br>         webSocketServer.sendInfo(new String(body));<br>     }<br> }<br></p>');
INSERT INTO `content` VALUES (39794637241716736, '<p><h3 id=\"h1asa\">通过注解@RocketMQMessageListener 设置consumerGroup&nbsp;对应的是我们配置文件的consumerGroup&nbsp;，和topic&nbsp;对应的是我们的发送端发送的topic</h3>topic&nbsp;<br> @Service<br> @RocketMQMessageListener(consumerGroup = \"default\", topic = \"VOTE_TOPIC\")<br> public class VoteTopicConsumer implements RocketMQListener&lt;MessageExt&gt; {<br><br>     private static final Logger LOG = LoggerFactory.getLogger(VoteTopicConsumer.class);<br><br>     @Resource<br>     public WebSocketServer webSocketServer;<br><br>     @Override<br>     public void onMessage(MessageExt messageExt) {<br>         byte[] body = messageExt.getBody();<br>         LOG.info(\"ROCKETMQ收到消息：{}\", new String(body));<br>         webSocketServer.sendInfo(new String(body));<br>     }<br> }<br></p>');
INSERT INTO `content` VALUES (39794648457285632, '<p><h3 id=\"2oqdc\">通过注解@RocketMQMessageListener 设置consumerGroup 对应的是我们配置文件的consumerGroup ，和topic 对应的是我们的发送端发送的topic</h3>@Service<br>@RocketMQMessageListener(consumerGroup = \"default\", topic = \"VOTE_TOPIC\")<br>public class VoteTopicConsumer implements RocketMQListener&lt;MessageExt&gt; {<br><br>private static final Logger LOG = LoggerFactory.getLogger(VoteTopicConsumer.class);<br><br>@Resource<br>public WebSocketServer webSocketServer;<br><br>@Override<br>public void onMessage(MessageExt messageExt) {<br>byte[] body = messageExt.getBody();<br>LOG.info(\"ROCKETMQ收到消息：{}\", new String(body));<br>webSocketServer.sendInfo(new String(body));<br>}<br>}<br></p>');
INSERT INTO `content` VALUES (39800584710262784, '<h3 id=\"u7xkq\">通过以上步骤就能实现一个最基本的Mq的使用</h3>');
INSERT INTO `content` VALUES (41217789775712256, '');
INSERT INTO `content` VALUES (41217813754548224, '');
INSERT INTO `content` VALUES (41260598448754688, '<p>防抖（Debounce）和节流（Throttle）是在 JavaScript 中常见的两种优化策略，它们的主要目的是控制函数的执行频率。这两种策略在处理一些高频率事件（如滚动、输入、点击等）时非常有用，可以帮助我们避免因为频繁的函数执行而导致的性能问题。<br></p>');
INSERT INTO `content` VALUES (41260702874341376, '<ol><li><p>防抖（Debounce）：防抖的主要思想是，在某段时间内，不论你触发了多少次函数，我都只认最后一次。在这段时间结束后，才会执行函数。这在用户输入或者窗口大小调整等操作时非常有用。例如，在用户完成输入后自动触发搜索，而不是每输入一个字符就触发搜索。</p></li></ol>');
INSERT INTO `content` VALUES (41260840728530944, '<ol><li><p>节流（Throttle）：节流的主要思想是，在一段时间内，函数只执行一次，即使这段时间内触发了多次函数。这在处理滚动事件时非常有用，可以避免每次滚动都触发函数执行。</p></li></ol>');
INSERT INTO `content` VALUES (41261844488392704, '<h1 id=\"hh0ah\">直接说我们的一个实战应用需求：</h1><h2 id=\"gtq2e\">&nbsp; &nbsp;目前我们需要保存用户的最后一次退出页面的文档记录，但是我们不能每次都一直执行，如果用户一直点文档的话，会造成我们的一个性能损耗，所以我们需要有这么一个防抖策略</h2><p>&nbsp; &nbsp;<b> 1. 定义一个值<span style=\"font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 1em;\">let timeoutId: number | undefined; // 这是一个全局变量，用于储存当前的定时器ID</span></b></p><p><span style=\"font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 1em;\"><b>&nbsp; 2.设置一个防抖方法</b></span></p><p><b><span style=\"font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 1em;\">&nbsp; &nbsp;</span>const debounceSaveDoc = () =&gt; {</b></p><b>&nbsp; &nbsp; &nbsp;clearTimeout(timeoutId)// 如果已有定时器，清除它<br>&nbsp; &nbsp; &nbsp;// 设定一个新的定时器，在一段时间后再次调用saveDoc函数<br>&nbsp; &nbsp; &nbsp;timeoutId = setTimeout(saveDoc, 3000);<br>&nbsp; &nbsp; &nbsp; }</b><p><b>&nbsp; &nbsp; &nbsp; 3.在应用到他的地方将这个方法替换成debounceSaveDoc&nbsp;</b></p><p><b>&nbsp; &nbsp; &nbsp; &nbsp;const onSelect = (selectedKey: any, info: any) =&gt; {</b></p><b>        if (Tool.isNotEmpty(selectedKey)) {<br>          // 选中某一节点时，加载该节点的文档信息<br>          doc.value = info.selectedNodes[0].props;<br>          // 加载内容<br>          handleQueryContent(selectedKey[0]);<br>          if (store.state.user.id !=null) {<br>            debounceSaveDoc();<br>          }<br>          // 更新选中的节点<br>          defaultSelectedKeys.value = selectedKey;<br>        }<br>      };</b><h1 id=\"m3inf\">&nbsp;总结：这么一来，用户在点击文档后，停留三秒才会去执行saveDocId的方法，减少了性能损耗</h1>');
INSERT INTO `content` VALUES (41265633660375040, '<p>let lastCallTime;<br><br>function throttle(func, delay) {<br>    return function(...args) {<br>        const now = Date.now();<br>        if (!lastCallTime || (now - lastCallTime) &gt; delay) {<br>            lastCallTime = now;<br>            return func.apply(this, args);<br>        }<br>    }<br>}<br><br>// 使用示例：<br>const throttledFunction = throttle(() =&gt; console.log(\'Function Executed\'), 2000);<br><br>// 然后你就可以按照正常方式调用这个被节流的函数了：<br>throttledFunction();<br>throttledFunction();<br>throttledFunction();<br>// 以上三次调用，只有第一次会被执行，后两次调用因为在2秒之内，所以不会执行<br></p>');

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
INSERT INTO `doc` VALUES (1, 1, 0, '文档1', 1, 684, 13);
INSERT INTO `doc` VALUES (2, 1, 1, '文档1.1', 1, 27, 5);
INSERT INTO `doc` VALUES (3, 1, 0, '文档2', 2, 16, 1);
INSERT INTO `doc` VALUES (4, 1, 3, '文档2.1', 1, 33, 2);
INSERT INTO `doc` VALUES (5, 1, 3, '文档2.2', 2, 22, 2);
INSERT INTO `doc` VALUES (6, 1, 5, '文档2.2.1', 1, 79, 4);
INSERT INTO `doc` VALUES (37841703666847744, 1, 5, '文档2.2.2', 1, 22, 2);
INSERT INTO `doc` VALUES (37841746528440320, 1, 37841703666847744, '文档2.2.2.1', 1, 34, 2);
INSERT INTO `doc` VALUES (38625501966897152, 2, 0, '初识Vue', 1, 230, 6);
INSERT INTO `doc` VALUES (39790373182246912, 6, 39790373182246912, '介绍', 1, 0, 0);
INSERT INTO `doc` VALUES (39790662006214656, 6, 0, 'RocketMQ 介绍及基本概念', 0, 114, 3);
INSERT INTO `doc` VALUES (39790797704531968, 6, 39790662006214656, 'RocketMQ 特点', 2, 14, 2);
INSERT INTO `doc` VALUES (39791363037990912, 6, 39790662006214656, '介绍', 1, 7, 3);
INSERT INTO `doc` VALUES (39791679196237824, 6, 0, 'RocketMq在Springboot的基础应用', 1, 12, 1);
INSERT INTO `doc` VALUES (39791879704940544, 6, 39791679196237824, '配置', 1, 8, 0);
INSERT INTO `doc` VALUES (39792357465526272, 6, 39791679196237824, '生产者和消费者（发送端和接受端）', 2, 38, 3);
INSERT INTO `doc` VALUES (39794574159384576, 6, 39791679196237824, '服务端', 3, 6, 0);
INSERT INTO `doc` VALUES (39800584710262784, 6, 39791679196237824, '完结', 4, 10, 0);
INSERT INTO `doc` VALUES (41217789775712256, 4, 0, '恶趣味', 1, 6, 0);
INSERT INTO `doc` VALUES (41217813754548224, 4, 0, 'ee', 2, 6, 1);
INSERT INTO `doc` VALUES (41260598448754688, 7, 0, 'JS的优化策略', 1, 74, 5);
INSERT INTO `doc` VALUES (41260702874341376, 7, 0, 'JS的防抖策略', 2, 14, 2);
INSERT INTO `doc` VALUES (41260840728530944, 7, 0, 'JS的节流策略', 3, 14, 3);
INSERT INTO `doc` VALUES (41261844488392704, 7, 41260702874341376, 'JS实战防抖策略基础', 1, 36, 6);
INSERT INTO `doc` VALUES (41265633660375040, 7, 41260840728530944, 'JS节流策略实战', 1, 21, 3);

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
INSERT INTO `ebook` VALUES (1, 'Spring Boot 入门教程', 200, 202, '零基础入门 Java 开发，企业级应用开发最佳首选框架', 'https://img.bizhizu.com/2015/1231/20151231030245752.jpg', 8, 917, 31);
INSERT INTO `ebook` VALUES (2, 'Vue 入门教程', 100, 101, '零基础入门 Vue 开发，企业级应用开发最佳首选框架', '', 1, 230, 6);
INSERT INTO `ebook` VALUES (3, 'Python 入门教程', 300, 301, '零基础入门 Python 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (4, 'Mysql 入门教程', 400, 401, '零基础入门 Mysql 开发，企业级应用开发最佳首选框架', 'http://127.0.0.1:8880/file/image-20220717120448125.png', 2, 12, 1);
INSERT INTO `ebook` VALUES (5, 'Oracle 入门教程', NULL, NULL, '零基础入门 Oracle 开发，企业级应用开发最佳首选框架', NULL, 0, 0, 0);
INSERT INTO `ebook` VALUES (6, 'RocketMq实战基础', 200, 202, 'RocketMq详情介绍', 'https://pic3.zhimg.com/v2-a3e16e00c6267e75187904a4df793346_r.jpg', 9, 209, 12);
INSERT INTO `ebook` VALUES (7, 'JS防抖策略和节流策略', 100, 504, 'JS实战', 'http://127.0.0.1:8880/file/image-20220202111056036.png', 5, 159, 19);
INSERT INTO `ebook` VALUES (52447510677032960, 'Redis入门到实战', 400, 52447426497351681, NULL, '', 0, 0, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 232 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电子书快照表' ROW_FORMAT = Compact;

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
INSERT INTO `ebook_snapshot` VALUES (50, 1, '2023-05-13', 214, 12, 146, 2);
INSERT INTO `ebook_snapshot` VALUES (51, 2, '2023-05-13', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (52, 3, '2023-05-13', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (53, 4, '2023-05-13', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (54, 5, '2023-05-13', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (55, 1, '2023-05-14', 407, 12, 193, 0);
INSERT INTO `ebook_snapshot` VALUES (56, 2, '2023-05-14', 59, 0, 59, 0);
INSERT INTO `ebook_snapshot` VALUES (57, 3, '2023-05-14', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (58, 4, '2023-05-14', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (59, 5, '2023-05-14', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (60, 1, '2023-05-15', 430, 12, 23, 0);
INSERT INTO `ebook_snapshot` VALUES (61, 2, '2023-05-15', 72, 0, 13, 0);
INSERT INTO `ebook_snapshot` VALUES (62, 3, '2023-05-15', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (63, 4, '2023-05-15', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (64, 5, '2023-05-15', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (65, 1, '2023-05-16', 451, 15, 21, 3);
INSERT INTO `ebook_snapshot` VALUES (66, 2, '2023-05-16', 144, 1, 72, 1);
INSERT INTO `ebook_snapshot` VALUES (67, 3, '2023-05-16', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (68, 4, '2023-05-16', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (69, 5, '2023-05-16', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (70, 1, '2023-05-17', 487, 15, 36, 0);
INSERT INTO `ebook_snapshot` VALUES (71, 2, '2023-05-17', 215, 3, 71, 2);
INSERT INTO `ebook_snapshot` VALUES (72, 3, '2023-05-17', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (73, 4, '2023-05-17', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (74, 5, '2023-05-17', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (75, 6, '2023-05-17', 38, 4, 38, 4);
INSERT INTO `ebook_snapshot` VALUES (76, 1, '2023-05-18', 524, 21, 37, 6);
INSERT INTO `ebook_snapshot` VALUES (77, 2, '2023-05-18', 219, 4, 4, 1);
INSERT INTO `ebook_snapshot` VALUES (78, 3, '2023-05-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (79, 4, '2023-05-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (80, 5, '2023-05-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (81, 6, '2023-05-18', 94, 4, 56, 0);
INSERT INTO `ebook_snapshot` VALUES (83, 1, '2023-05-19', 554, 21, 30, 0);
INSERT INTO `ebook_snapshot` VALUES (84, 2, '2023-05-19', 220, 4, 1, 0);
INSERT INTO `ebook_snapshot` VALUES (85, 3, '2023-05-19', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (86, 4, '2023-05-19', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (87, 5, '2023-05-19', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (88, 6, '2023-05-19', 106, 4, 12, 0);
INSERT INTO `ebook_snapshot` VALUES (90, 1, '2023-05-20', 720, 21, 166, 0);
INSERT INTO `ebook_snapshot` VALUES (91, 2, '2023-05-20', 220, 4, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (92, 3, '2023-05-20', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (93, 4, '2023-05-20', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (94, 5, '2023-05-20', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (95, 6, '2023-05-20', 106, 4, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (97, 1, '2023-05-21', 841, 24, 121, 3);
INSERT INTO `ebook_snapshot` VALUES (98, 2, '2023-05-21', 220, 4, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (99, 3, '2023-05-21', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (100, 4, '2023-05-21', 8, 0, 8, 0);
INSERT INTO `ebook_snapshot` VALUES (101, 5, '2023-05-21', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (102, 6, '2023-05-21', 171, 4, 65, 0);
INSERT INTO `ebook_snapshot` VALUES (104, 7, '2023-05-21', 16, 5, 16, 5);
INSERT INTO `ebook_snapshot` VALUES (105, 1, '2023-05-22', 841, 24, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (106, 2, '2023-05-22', 220, 4, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (107, 3, '2023-05-22', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (108, 4, '2023-05-22', 8, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (109, 5, '2023-05-22', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (110, 6, '2023-05-22', 171, 4, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (111, 7, '2023-05-22', 16, 5, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (112, 1, '2023-05-23', 843, 24, 2, 0);
INSERT INTO `ebook_snapshot` VALUES (113, 2, '2023-05-23', 221, 5, 1, 1);
INSERT INTO `ebook_snapshot` VALUES (114, 3, '2023-05-23', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (115, 4, '2023-05-23', 8, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (116, 5, '2023-05-23', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (117, 6, '2023-05-23', 179, 6, 8, 2);
INSERT INTO `ebook_snapshot` VALUES (118, 7, '2023-05-23', 19, 5, 3, 0);
INSERT INTO `ebook_snapshot` VALUES (119, 1, '2023-05-24', 845, 26, 2, 2);
INSERT INTO `ebook_snapshot` VALUES (120, 2, '2023-05-24', 221, 5, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (121, 3, '2023-05-24', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (122, 4, '2023-05-24', 8, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (123, 5, '2023-05-24', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (124, 6, '2023-05-24', 179, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (125, 7, '2023-05-24', 63, 5, 44, 0);
INSERT INTO `ebook_snapshot` VALUES (126, 1, '2023-05-25', 868, 26, 23, 0);
INSERT INTO `ebook_snapshot` VALUES (127, 2, '2023-05-25', 227, 6, 6, 1);
INSERT INTO `ebook_snapshot` VALUES (128, 3, '2023-05-25', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (129, 4, '2023-05-25', 10, 1, 2, 1);
INSERT INTO `ebook_snapshot` VALUES (130, 5, '2023-05-25', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (131, 6, '2023-05-25', 198, 7, 19, 1);
INSERT INTO `ebook_snapshot` VALUES (132, 7, '2023-05-25', 70, 5, 7, 0);
INSERT INTO `ebook_snapshot` VALUES (133, 1, '2023-05-26', 872, 26, 4, 0);
INSERT INTO `ebook_snapshot` VALUES (134, 2, '2023-05-26', 227, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (135, 3, '2023-05-26', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (136, 4, '2023-05-26', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (137, 5, '2023-05-26', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (138, 6, '2023-05-26', 198, 7, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (139, 7, '2023-05-26', 70, 5, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (140, 1, '2023-05-27', 872, 26, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (141, 2, '2023-05-27', 228, 6, 1, 0);
INSERT INTO `ebook_snapshot` VALUES (142, 3, '2023-05-27', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (143, 4, '2023-05-27', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (144, 5, '2023-05-27', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (145, 6, '2023-05-27', 198, 7, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (146, 7, '2023-05-27', 70, 5, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (147, 1, '2023-05-28', 907, 27, 35, 1);
INSERT INTO `ebook_snapshot` VALUES (148, 2, '2023-05-28', 228, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (149, 3, '2023-05-28', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (150, 4, '2023-05-28', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (151, 5, '2023-05-28', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (152, 6, '2023-05-28', 199, 7, 1, 0);
INSERT INTO `ebook_snapshot` VALUES (153, 7, '2023-05-28', 76, 5, 6, 0);
INSERT INTO `ebook_snapshot` VALUES (154, 1, '2023-05-29', 907, 27, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (155, 2, '2023-05-29', 228, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (156, 3, '2023-05-29', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (157, 4, '2023-05-29', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (158, 5, '2023-05-29', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (159, 6, '2023-05-29', 199, 7, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (160, 7, '2023-05-29', 76, 5, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (161, 1, '2023-05-31', 909, 27, 909, 27);
INSERT INTO `ebook_snapshot` VALUES (162, 2, '2023-05-31', 228, 6, 228, 6);
INSERT INTO `ebook_snapshot` VALUES (163, 3, '2023-05-31', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (164, 4, '2023-05-31', 10, 1, 10, 1);
INSERT INTO `ebook_snapshot` VALUES (165, 5, '2023-05-31', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (166, 6, '2023-05-31', 199, 7, 199, 7);
INSERT INTO `ebook_snapshot` VALUES (167, 7, '2023-05-31', 97, 5, 97, 5);
INSERT INTO `ebook_snapshot` VALUES (168, 1, '2023-06-04', 911, 27, 911, 27);
INSERT INTO `ebook_snapshot` VALUES (169, 2, '2023-06-04', 230, 6, 230, 6);
INSERT INTO `ebook_snapshot` VALUES (170, 3, '2023-06-04', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (171, 4, '2023-06-04', 10, 1, 10, 1);
INSERT INTO `ebook_snapshot` VALUES (172, 5, '2023-06-04', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (173, 6, '2023-06-04', 199, 7, 199, 7);
INSERT INTO `ebook_snapshot` VALUES (174, 7, '2023-06-04', 99, 5, 99, 5);
INSERT INTO `ebook_snapshot` VALUES (175, 1, '2023-06-05', 911, 27, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (176, 2, '2023-06-05', 230, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (177, 3, '2023-06-05', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (178, 4, '2023-06-05', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (179, 5, '2023-06-05', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (180, 6, '2023-06-05', 199, 7, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (181, 7, '2023-06-05', 99, 5, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (182, 1, '2023-06-08', 915, 30, 915, 30);
INSERT INTO `ebook_snapshot` VALUES (183, 2, '2023-06-08', 230, 6, 230, 6);
INSERT INTO `ebook_snapshot` VALUES (184, 3, '2023-06-08', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (185, 4, '2023-06-08', 10, 1, 10, 1);
INSERT INTO `ebook_snapshot` VALUES (186, 5, '2023-06-08', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (187, 6, '2023-06-08', 201, 9, 201, 9);
INSERT INTO `ebook_snapshot` VALUES (188, 7, '2023-06-08', 125, 8, 125, 8);
INSERT INTO `ebook_snapshot` VALUES (189, 1, '2023-06-11', 915, 30, 915, 30);
INSERT INTO `ebook_snapshot` VALUES (190, 2, '2023-06-11', 230, 6, 230, 6);
INSERT INTO `ebook_snapshot` VALUES (191, 3, '2023-06-11', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (192, 4, '2023-06-11', 10, 1, 10, 1);
INSERT INTO `ebook_snapshot` VALUES (193, 5, '2023-06-11', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (194, 6, '2023-06-11', 201, 9, 201, 9);
INSERT INTO `ebook_snapshot` VALUES (195, 7, '2023-06-11', 125, 8, 125, 8);
INSERT INTO `ebook_snapshot` VALUES (196, 1, '2023-06-17', 915, 30, 915, 30);
INSERT INTO `ebook_snapshot` VALUES (197, 2, '2023-06-17', 230, 6, 230, 6);
INSERT INTO `ebook_snapshot` VALUES (198, 3, '2023-06-17', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (199, 4, '2023-06-17', 10, 1, 10, 1);
INSERT INTO `ebook_snapshot` VALUES (200, 5, '2023-06-17', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (201, 6, '2023-06-17', 201, 9, 201, 9);
INSERT INTO `ebook_snapshot` VALUES (202, 7, '2023-06-17', 126, 8, 126, 8);
INSERT INTO `ebook_snapshot` VALUES (203, 1, '2023-06-18', 915, 30, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (204, 2, '2023-06-18', 230, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (205, 3, '2023-06-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (206, 4, '2023-06-18', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (207, 5, '2023-06-18', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (208, 6, '2023-06-18', 201, 9, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (209, 7, '2023-06-18', 138, 13, 12, 5);
INSERT INTO `ebook_snapshot` VALUES (210, 1, '2023-06-19', 915, 30, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (211, 2, '2023-06-19', 230, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (212, 3, '2023-06-19', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (213, 4, '2023-06-19', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (214, 5, '2023-06-19', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (215, 6, '2023-06-19', 201, 9, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (216, 7, '2023-06-19', 138, 13, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (217, 1, '2023-06-20', 915, 30, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (218, 2, '2023-06-20', 230, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (219, 3, '2023-06-20', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (220, 4, '2023-06-20', 10, 1, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (221, 5, '2023-06-20', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (222, 6, '2023-06-20', 201, 9, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (223, 7, '2023-06-20', 148, 15, 10, 2);
INSERT INTO `ebook_snapshot` VALUES (224, 1, '2023-06-21', 917, 31, 2, 1);
INSERT INTO `ebook_snapshot` VALUES (225, 2, '2023-06-21', 230, 6, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (226, 3, '2023-06-21', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (227, 4, '2023-06-21', 12, 1, 2, 0);
INSERT INTO `ebook_snapshot` VALUES (228, 5, '2023-06-21', 0, 0, 0, 0);
INSERT INTO `ebook_snapshot` VALUES (229, 6, '2023-06-21', 209, 12, 8, 3);
INSERT INTO `ebook_snapshot` VALUES (230, 7, '2023-06-21', 159, 19, 11, 4);
INSERT INTO `ebook_snapshot` VALUES (231, 52447510677032960, '2023-06-21', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讨论的内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (1, 1, 'Java', 'springboot', '2023-05-27 22:55:57', NULL);
INSERT INTO `forum` VALUES (2, 1, 'Vue', 'Javascript', '2023-05-27 23:32:13', NULL);
INSERT INTO `forum` VALUES (3, 1, 'Java就业方向', '前后端', '2023-05-28 02:11:54', NULL);
INSERT INTO `forum` VALUES (4, 1, 'Java就业方向', '前后端的发现', '2023-05-28 02:12:15', NULL);
INSERT INTO `forum` VALUES (5, 2, 'Vue3', '组件式开发', '2023-05-28 18:25:29', NULL);

-- ----------------------------
-- Table structure for read_progress
-- ----------------------------
DROP TABLE IF EXISTS `read_progress`;
CREATE TABLE `read_progress`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `ebook_id` bigint(0) NULL DEFAULT NULL,
  `doc_id` bigint(0) NULL DEFAULT NULL COMMENT '用户阅读最后一章',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `doc_id`(`doc_id`) USING BTREE,
  INDEX `ebook_id`(`ebook_id`) USING BTREE,
  CONSTRAINT `doc_id` FOREIGN KEY (`doc_id`) REFERENCES `doc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ebook_id` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of read_progress
-- ----------------------------
INSERT INTO `read_progress` VALUES (1, 1, 1, 37841703666847744);
INSERT INTO `read_progress` VALUES (2, 1, 6, 39792357465526272);
INSERT INTO `read_progress` VALUES (3, 1, 4, 41217813754548224);
INSERT INTO `read_progress` VALUES (4, 1, NULL, 41260598448754688);
INSERT INTO `read_progress` VALUES (5, 1, 7, 41265633660375040);
INSERT INTO `read_progress` VALUES (6, 1, NULL, 39792357465526272);
INSERT INTO `read_progress` VALUES (7, 1, NULL, 41260598448754688);
INSERT INTO `read_progress` VALUES (8, 2, 1, 6);
INSERT INTO `read_progress` VALUES (9, 1, NULL, 37841746528440320);
INSERT INTO `read_progress` VALUES (10, 1, NULL, 41260702874341376);
INSERT INTO `read_progress` VALUES (11, 1, NULL, 41261844488392704);
INSERT INTO `read_progress` VALUES (12, 1, NULL, 41265633660375040);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_name_unique`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40029961687535619 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', 'test', 'e70e2222a9d67c4f2eae107533359aa4', 'http://127.0.0.1:8880/file/image-20220202121318183-16437751995162.png');
INSERT INTO `user` VALUES (2, '1', '1', 'b9b237df8bd22c295180ea0109cb7e67', 'http://127.0.0.1:8880/file/login-background.jpg');
INSERT INTO `user` VALUES (40029961687535618, '3', '3', '93a6c6a957e1f1ea3a3c49122d8cbe4e', 'http://127.0.0.1:8880/file/image-20220202111056036-16437714601701.png');

-- ----------------------------
-- Table structure for user_books
-- ----------------------------
DROP TABLE IF EXISTS `user_books`;
CREATE TABLE `user_books`  (
  `user_id` bigint(0) NOT NULL,
  `ebook_id` bigint(0) NOT NULL,
  `added_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`user_id`, `ebook_id`) USING BTREE,
  INDEX `ebook_id`(`ebook_id`) USING BTREE,
  CONSTRAINT `user_books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_books_ibfk_2` FOREIGN KEY (`ebook_id`) REFERENCES `ebook` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_books
-- ----------------------------
INSERT INTO `user_books` VALUES (1, 1, '2023-05-28 11:18:32');
INSERT INTO `user_books` VALUES (1, 2, '2023-05-26 00:05:22');
INSERT INTO `user_books` VALUES (1, 7, '2023-05-23 22:22:34');

SET FOREIGN_KEY_CHECKS = 1;
