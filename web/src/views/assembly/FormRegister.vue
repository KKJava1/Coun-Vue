<template>
  <a-modal
      :title="title"
      v-model:visible="visible"
      :confirm-loading="confirmLoading"
      @cancel="closeModal"
      @ok="handleSubmit"
  >
    <a-form :model="userData" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
      <a-form-item label="头像">
      <a-upload
          style="margin-left: 50px"
          v-model:file-list="fileList"
          name="avatar"
          list-type="picture-card"
          class="avatar-uploader"
          :show-upload-list="false"
          action="http://127.0.0.1:8880/ebook/upload/avatar"
          :before-upload="beforeUpload"
          @change="handleChange"
      >
        <img v-if="imageUrl" :src="imageUrl" alt="avatar" />
        <div v-else>
          <loading-outlined v-if="coverLoading"></loading-outlined>
          <plus-outlined v-else></plus-outlined>
          <div class="ant-upload-text">Upload</div>
        </div>
      </a-upload>
      </a-form-item>
      <a-form-item label="登陆名">
        <a-input v-model:value="userData.loginName" :disabled="!!userData.id"/>
      </a-form-item>
      <a-form-item label="昵称">
        <a-input v-model:value="userData.name" />
      </a-form-item>
      <a-form-item label="密码" v-show="!userData.id">
        <a-input v-model:value="userData.password"/>
      </a-form-item>
    </a-form>
  </a-modal>
</template>

<script setup lang="ts">
import {defineProps, ref, defineEmit} from 'vue'
import {message} from "ant-design-vue";
import { toRef } from 'vue';



const props = defineProps({
  title: String,
  userData: {
    type: Object,
    default: () => ({}),
  },
  visible: Boolean,
  confirmLoading: Boolean,
});

const fileList = ref([])
const coverLoading = ref<boolean>(false)
const imageUrl = ref<string>('');
const userData = toRef(props, 'userData');
// 子组件
const emit = defineEmit(['update:visible', 'submit', 'update']);

function getBase64(img: Blob, callback: (base64Url: string) => void) {
  const reader = new FileReader();
  reader.addEventListener('load', () => callback(reader.result as string));
  reader.readAsDataURL(img);
}
/**
 * 上传文件
 * */
const handleChange = (info: any) => {
  if (info.file.status === 'uploading') {
    coverLoading.value = true;
    return;
  }
  if (info.file.status === 'done') {
    // Get this url from response in real world.
    getBase64(info.file.originFileObj, (base64Url: string) => {
      imageUrl.value = base64Url;
      coverLoading.value = false;
    });
    userData.value.avatar = "http://127.0.0.1:8880/file/"+ info.file.name;
    // 当头像上传完成后，触发自定义事件，将更新后的用户数据传回父组件
    emit('update', userData.value);
  }
  if (info.file.status === 'error') {
    message.error('upload error');
  }
};
const beforeUpload = (file: any) => {
  const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png';
  if (!isJpgOrPng) {
    message.error('You can only upload JPG file!');
  }
  const isLt2M = file.size / 1024 / 1024 < 2;
  if (!isLt2M) {
    message.error('Image must smaller than 2MB!');
  }
  return isJpgOrPng && isLt2M;
};


const closeModal = () => {
  emit('update:visible', false)
}

const handleSubmit = () => {
  emit('submit', props.userData)
}
</script>
