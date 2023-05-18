<template>
  <a-modal
      :title="title"
      v-model:visible="visible"
      :confirm-loading="confirmLoading"
      @cancel="closeModal"
      @ok="handleSubmit"
  >
    <a-form :model="userData" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
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

const props = defineProps({
  title: String,
  userData: Object,
  visible: Boolean,
  confirmLoading: Boolean
})

const emit = defineEmit(['update:visible', 'submit'])

const closeModal = () => {
  emit('update:visible', false)
}

const handleSubmit = () => {
  emit('submit', props.userData)
}
</script>
