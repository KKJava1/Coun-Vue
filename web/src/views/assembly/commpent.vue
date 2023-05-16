<template>
  <div>
    <a-comment :author="comment.name" :datetime="comment.createTime">
      <template #content>
        <p>
          {{ comment.content }}
        </p>
        <!-- 添加一个回复按钮 -->
        <a-button type="link" @click="toggleReplyForm">回复</a-button>
        <!-- 添加一个回复表单 -->
        <div v-if="showReplyForm">
          <a-input v-model:value="replyContent" placeholder="请输入回复..."></a-input>
          <a-button type="link" @click="submitReply">提交回复</a-button>
        </div>

        <div v-for="(reply, replyIndex) in comment.replies" :key="replyIndex">
          <!-- 对每个子评论，递归地使用 CommentComponent -->
          <CommentComponent :comment="reply" @reply="handleReply" />
        </div>
      </template>
    </a-comment>
  </div>
</template>

<script>
import { ref } from 'vue';

import {useStore} from "vuex";
import {useRoute} from "vue-router";
export default {
  name: 'CommentComponent',
  props: {
    comment: Object,
  },
  setup(props, context) {
    const showReplyForm = ref(false);
    const replyContent = ref('');
    const store = useStore();
    const route = useRoute();
    const toggleReplyForm = () => {
      showReplyForm.value = !showReplyForm.value;
    };
    const handleReply = (reply) => {
      // 处理 reply...
      context.emit('reply', reply);
    };

    const submitReply = () => {
      context.emit('reply', {
        userId: store.state.user.id, // 从Vuex中获取userId
        ebookId: route.query.ebookId,
        content: replyContent.value,
        parentId: props.comment.id,
        replytouserId: props.comment.userId,
      });
      replyContent.value = '';
      showReplyForm.value = false;
    };

    return {
      showReplyForm,
      replyContent,
      toggleReplyForm,
      submitReply,
      handleReply
    };
  },
};
</script>
