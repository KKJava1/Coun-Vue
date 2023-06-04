<template>
  <div>
    <a-modal :visible="modelValue"
             width="1000px"
             wrapClassName="full-modal"
             @ok="handleOk"
             @cancel="handleCancel">
      <template #title>
        <a-list item-layout="vertical" size="large" :data-source="[forumDetails]">
          <template #renderItem="{ item }">
            <a-list-item key="item.name">
              <a-affix>
              <a-list-item-meta :description="item.createTime" class="">
                <template #title>
                  <a>{{ item.userName }}</a>
                </template>
                <template #avatar><a-avatar :src="item.avatar" /></template>
              </a-list-item-meta>
               </a-affix>
              <h1 style="margin-top: -10px">{{item.title}}</h1>
              {{ item.context }}
            </a-list-item>
          </template>
        </a-list>

      </template>
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
  document.body.style.overflow = 'hidden';
  emit('update:modelValue', true);
};

const handleCancel = () => {
  document.body.style.overflow = '';
  emit('update:modelValue', false);
};

const handleOk = () => {
  document.body.style.overflow = '';
  emit('update:modelValue', false);
};

</script>
<style scoped>
:deep(.ant-list-item-meta-description) {
  color: rgba(0, 0, 0, 0.45);
  font-size: 14px;
  line-height: 22px;
  margin-top: -12px;
}

:deep(.ant-list-vertical .ant-list-item-meta-title) {
  margin-bottom: 12px;
  color: rgba(0, 0, 0, 0.85);
  font-size: 16px;
  line-height: 24px;
  margin-top: -10px;
}
</style>


