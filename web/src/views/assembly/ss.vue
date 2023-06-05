<template>
  <div>
    <el-upload
        action="/api/upload"
        :on-success="handleSuccess1"
        :on-remove="handleRemove1"
        :file-list="form.comment.attachments"
    >
      <!-- 内容... -->
    </el-upload>

    <el-upload
        action="/api/upload"
        :on-success="handleSuccess2"
        :on-remove="handleRemove2"
        :file-list="form.comment.images"
    >
      <!-- 内容... -->
    </el-upload>

    <el-button @click="submitForm">提交</el-button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      form: {
        user: '你的用户名',
        comment: {
          attachments: [],  // 附件
          images: []        // 图片
        }
      }
    };
  },
  methods: {
    handleSuccess1(response, file, fileList) {
      let fileData = {
        name: file.name,  // 你可能需要从响应或文件对象中获取正确的文件名
        url: response.url,  // URL从响应中获取
        status: 'finished'  // 当文件上传成功后，设置状态为'finished'
      };
      this.form.comment.attachments.push(fileData);

    },
    handleRemove1(file, fileList) {
      this.form.comment.attachments = this.form.comment.attachments.filter(item => item.url !== file.url);
    },
    handleSuccess2(response, file, fileList) {
      let fileData = {
        name: file.name,
        url: response.url,
        status: 'finished'
      };
      this.form.comment.images.push(fileData);
    },
    handleRemove2(file, fileList) {
      this.form.comment.images = this.form.comment.images.filter(item => item.url !== file.url);

    },
    submitForm() {
      axios.post('/api/comments', this.form)
          .then(response => console.log(response))
          .catch(error => console.error(error));
    }
  }
};
</script>
