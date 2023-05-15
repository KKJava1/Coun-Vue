<template>
  <a-layout>
    <a-layout-content :style="{ background: '#fff', padding: '24px', margin: 0, minHeight: '280px' }">
      <h3 v-if="level1.length === 0">对不起，找不到相关文档！</h3>
      <a-row>
        <a-col :span="6">
          <a-tree
            v-if="level1.length > 0"
            :tree-data="level1"
            @select="onSelect"
            :replaceFields="{title: 'name', key: 'id', value: 'id'}"
            :defaultExpandAll="true"
            :defaultSelectedKeys="defaultSelectedKeys"
          >
          </a-tree>
        </a-col>
        <a-col :span="18">
          <div>
            <h2>{{doc.name}}</h2>
            <div>
              <span>阅读数：{{doc.viewCount}}</span> &nbsp; &nbsp;
              <span>点赞数：{{doc.voteCount}}</span>
            </div>
            <a-divider style="height: 2px; background-color: #9999cc"/>
          </div>
          <div class="wangeditor" :innerHTML="html"></div>
          <div class="vote-div">
            <a-button style="margin-right: 10px" type="primary" shape="round" :size="'large'"  @click="showDrawer">
              <template #icon><BarsOutlined />&nbsp;评论：{{commentCount}} </template>
            </a-button>
            <a-button type="primary" shape="round" :size="'large'" @click="vote">
              <template #icon><LikeOutlined /> &nbsp;点赞：{{doc.voteCount}} </template>
            </a-button>
          </div>
        </a-col>

        <a-drawer
            title="评论"
            placement="right"
            width="700"
            keyboard="true"
            :closable="false"
            v-model:visible="visible"
            :after-visible-change="afterVisibleChange"
        >

          <a-comment :author="username">
            <template #content>
              <a-form-item>
                <a-textarea :rows="4" style="width: 700px;" v-model:value="commentValue" placeholder="请写下你的评论..." />
              </a-form-item>
              <a-form-item>
                <a-button type="primary" @click="handleSubmitComment" :loading="submitting">
                  发表评论
                </a-button>
              </a-form-item>
            </template>
          </a-comment>
          <a-list :header="`${comments.length} 个评论`" item-layout="horizontal" :data-source="comments">
            <template #renderItem="{ item, index }">
              <a-list-item>
                <!-- 对每个顶级评论，使用 CommentComponent -->
                <CommentComponent :comment="item" />
              </a-list-item>
            </template>
          </a-list>
        </a-drawer>
      </a-row>
    </a-layout-content>
  </a-layout>
</template>

<script lang="ts">
import {defineComponent, onMounted, ref, createVNode, computed} from 'vue';
  import axios from 'axios';
  import {message} from 'ant-design-vue';
  import {Tool} from "@/util/tool";
  import {useRoute} from "vue-router";
  import {useStore} from 'vuex';
import CommentComponent from './assembly/commpent.vue';
  export default defineComponent({
    name: 'Doc',
    components: {
      CommentComponent,
    },
    setup() {
      // 添加一个用于存储评论的引用
      const comments = ref<Comment[]>([]); // Comment 是一个有 id 和 userId 属性的接口
      interface Comment {
        id: number;
        userId: number;

      }
      const route = useRoute();
      const store = useStore();
      const username = computed(() => store.state.user.name);
      const docs = ref();
      const html = ref();
      //评论数量
      const commentCount = ref(0);
      //通过传递过来拿到ebookId
      const ebookId =route.query.ebookId;
      const defaultSelectedKeys = ref();
      defaultSelectedKeys.value = [];
      //评论
      const commentValue = ref();
      //提交评论所需要的loading
      const submitting = ref(false);
      // 当前选中的文档
      const doc = ref();
      doc.value = {};
      const level1 = ref(); // 一级文档树，children属性就是二级文档
      level1.value = [];
      //评论窗口是否弹出
      const visible = ref<boolean>(false);
      //添加显示回复的响应式
      const showReply = ref<boolean[]>([]);
      const replyContent = ref([]);
      const showReplyForm = ref<boolean[]>([]);

      const toggleReplyForm = (index: number) => {
        // 切换指定评论的回复表单的可见状态
        showReplyForm.value[index] = !showReplyForm.value[index];
      };
      const afterVisibleChange = (bool: boolean) => {
        console.log('visible', bool);
      };
      // 创建一个方法来获取评论
      const fetchComments = () => {
        axios.get('/doc/comments/' + ebookId).then(response => {
          const fetchedComments = response.data.content;
          commentCount.value = fetchedComments.length;
          comments.value = fetchedComments;
          console.log('评论列表', comments.value);
        });
      }

      //回复评论
      const submitReply = (index: number) => {
        if (!replyContent.value[index]) {  // 如果评论是空的
          message.error("评论为空，无法提交，请重新输入");
          return;
        }
          const item =comments.value[index];
          const commentReplyData = {
            userId: store.state.user.id, // 从Vuex中获取userId
            ebookId: route.query.ebookId,
            content: replyContent.value[index],
            parentId: item.id,
            replytouserId : item.userId
          };
        axios.post("/doc/handleReplyComment/", commentReplyData).then((response)=>{
          console.log("回复的信息",response.data);
          const data = response.data
          if(data.success){
            message.success("回复成功")
            // 提交回复后，隐藏回复输入框
            showReplyForm.value[index] = !showReplyForm.value[index]
            fetchComments()
          }
        })
      }
      //提交评论
      const handleSubmitComment = () => {
        if (!commentValue.value || !commentValue.value.trim()) {  // 如果评论是空的
          message.error("评论为空，无法提交，请重新输入");
          return;
        }
        //loading界面加载
        submitting.value = true;
        const commentData = {
          userId: store.state.user.id, // 从Vuex中获取userId
          ebookId: route.query.ebookId,
          content: commentValue.value
        };

        axios.post("/doc/handleSubmitComment/", commentData)
            .then((response) => {
              const data = response.data;
              if (data.success) {
                submitting.value = false;
                message.success("评论成功");
                fetchComments();  // 提交评论后刷新评论
              }
              else {
                submitting.value = false;
                message.error(data.message);
              }
            })
            .catch((error) => {
              submitting.value = false;
              message.error("提交评论失败，原因：" + error.message);
            });
      };

      const showDrawer = () => {
        visible.value = true;
        //使用懒加载的方案减低性能损耗
        fetchComments();  // 打开评论按钮时获取评论
      };
      /**
       * 内容查询
       **/
      const handleQueryContent = (id: number) => {
        axios.get("/doc/find-content/" + id).then((response) => {
          const data = response.data;
          if (data.success) {
            html.value = data.content;
          } else {
            message.error(data.message);
          }
        });
      };

      /**
       * 数据查询
       **/
      const handleQuery = () => {
        axios.get("/doc/all/" + ebookId).then((response) => {
          const data = response.data;
          if (data.success) {
            docs.value = data.content;
            level1.value = [];
            level1.value = Tool.array2Tree(docs.value, 0);
            if (Tool.isNotEmpty(level1)) {
              defaultSelectedKeys.value = [level1.value[0].id];
              handleQueryContent(level1.value[0].id);
              // 初始显示文档信息
              doc.value = level1.value[0];
            }
          } else {
            message.error(data.message);
          }
        });
      };

      const onSelect = (selectedKeys: any, info: any) => {
        console.log('selected', selectedKeys, info);
        if (Tool.isNotEmpty(selectedKeys)) {
          // 选中某一节点时，加载该节点的文档信息
          doc.value = info.selectedNodes[0].props;
          // 加载内容
          handleQueryContent(selectedKeys[0]);
        }
      };

      // 点赞
      const vote = () => {
        axios.get('/doc/vote/' + doc.value.id).then((response) => {
          const data = response.data;
          if (data.success) {
            doc.value.voteCount++;
          } else {
            message.error(data.message);
          }
        });
      };

      onMounted(() => {
        handleQuery();
        fetchComments();
      });

      return {
        level1,
        html,
        onSelect,
        CommentComponent,
        defaultSelectedKeys,
        username,
        doc,
        vote,
        ebookId,
        visible,
        afterVisibleChange,
        showDrawer,
        commentValue,
        submitting,
        handleSubmitComment,
        comments,
        fetchComments,
        commentCount,
        showReply,
        replyContent,
        showReplyForm,
        submitReply,
        toggleReplyForm
      }
    }
  });
</script>

<style>
  /* wangeditor默认样式, 参照: http://www.wangeditor.com/doc/pages/02-%E5%86%85%E5%AE%B9%E5%A4%84%E7%90%86/03-%E8%8E%B7%E5%8F%96html.html */
  /* table 样式 */
  .wangeditor table {
    border-top: 1px solid #ccc;
    border-left: 1px solid #ccc;
  }
  .wangeditor table td,
  .wangeditor table th {
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    padding: 3px 5px;
  }
  .wangeditor table th {
    border-bottom: 2px solid #ccc;
    text-align: center;
  }

  /* blockquote 样式 */
  .wangeditor blockquote {
    display: block;
    border-left: 8px solid #d0e5f2;
    padding: 5px 10px;
    margin: 10px 0;
    line-height: 1.4;
    font-size: 100%;
    background-color: #f1f1f1;
  }

  /* code 样式 */
  .wangeditor code {
    display: inline-block;
    *display: inline;
    *zoom: 1;
    background-color: #f1f1f1;
    border-radius: 3px;
    padding: 3px 5px;
    margin: 0 3px;
  }
  .wangeditor pre code {
    display: block;
  }

  /* ul ol 样式 */
  .wangeditor ul, ol {
    margin: 10px 0 10px 20px;
  }

  /* 和antdv p冲突，覆盖掉 */
  .wangeditor blockquote p {
    font-family:"YouYuan";
    margin: 20px 10px !important;
    font-size: 16px !important;
    font-weight:600;
  }

  /* 点赞 */
  .vote-div {
    padding: 15px;
    text-align: center;
  }

  /* 图片自适应 */
  .wangeditor img {
    max-width: 100%;
    height: auto;
  }

  /* 视频自适应 */
  .wangeditor iframe {
    width: 100%;
    height: 400px;
  }
</style>
