<template>
  <div>
    <a-comment :author="comment.name" :datetime="comment.createTime">
      <template #content>
        <p>
          {{ comment.content }}
        </p>
        <div v-for="(reply, replyIndex) in comment.replies" :key="replyIndex">
          <!-- 对每个子评论，递归地使用 CommentComponent -->
          <CommentComponent :comment="reply" />
        </div>
      </template>
    </a-comment>
  </div>
</template>

<script>
export default {
  name: 'CommentComponent',
  props: {
    comment: Object,
  },
};
</script>
