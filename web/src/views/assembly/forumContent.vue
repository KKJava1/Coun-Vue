<template>
  <div>
    <a-modal :visible="modelValue"
             width="1000px"
             title="Basic Modal"
             wrapClassName="full-modal"
             @ok="handleOk"
             @cancel="handleCancel">
      <p>Some contents...</p>
      <p>Some contents...</p>
      <p>Some contents...</p>
    </a-modal>
  </div>
</template>

<script setup lang="ts">
import {defineProps, defineEmit} from 'vue';
const props = defineProps({
  forumDetails: Object,
  modelValue: Boolean
})

const emit = defineEmit(['update:modelValue'])

const showModal = () => {
  emit('update:modelValue', true);
};

const handleCancel = () => {
  emit('update:modelValue', false);
};

// handleOk can be similar to handleCancel
const handleOk = () => {
  emit('update:modelValue', false);
};
</script>
<style>
.full-modal .ant-modal {
  height: 100vh;
}
.full-modal .ant-modal-content {
  height: 100%;
}
.full-modal .ant-modal-body {
  height: calc(100% - 55px); /* Subtract header height */
  overflow: auto;
}
</style>
