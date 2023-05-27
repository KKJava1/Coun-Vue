<template>
  <div style="background-color: #ececec; padding: 20px">
    <a-row :gutter="16" justify="center">
      <a-col :span="12">
        <a-card :bordered="false">
          <a-button shape="round" >
            发动态
          </a-button>
          <a-col  style="background-color:#F8F8F8;margin-top: 10px;" >
            <a-input
                v-model:value="title"
                style="background-color:#F8F8F8;"
                placeholder="请输入标题，最多20字"
            />
            <a-divider style="margin: 1px 0"/>
            <a-textarea
                v-model:value="context"
                style="background-color:#F8F8F8;"
                placeholder="此刻你想跟大家分享什么"
                :auto-size="{ minRows: 2, maxRows: 12 }"
            />
          </a-col>
          <a-row style="margin-top: 5px">
            <a-col :span="8" >
              <a-button type="link"><SmileTwoTone />表情</a-button>
              <a-button type="link"><SoundOutlined />话题</a-button>
              <a-button type="link"><PictureOutlined />图片</a-button>
            </a-col>
            <a-col :span="16" style="text-align: right">
              <a-button
                  class="custom-button"
                  shape="round"
                  :loading="iconLoading"
                  :disabled="!context"
                  @click="release()">
                发布
              </a-button>
            </a-col>
          </a-row>
        </a-card>
      </a-col>
    </a-row>
    <a-row :gutter="16" justify="center" style="margin-top: 20px">
    <a-col :span="12">
      <a-card title="card title" :bordered="false">
<!--        <a-button type="link">-->
<!--         推荐-->
<!--        </a-button>-->
        <a-list item-layout="vertical" size="large" :pagination="pagination" :data-source="forumData">
          <template #renderItem="{ item }">
            <a-list-item key="item.name">
              <template #actions>
          <span v-for="{ type, text } in actions" :key="type">
            <component v-bind:is="type" style="margin-right: 8px" />
            {{ text }}
          </span>
              </template>
              <a-list-item-meta :description="item.createTime">
                <template #title>
                  <a>{{ item.userName }}</a>
                </template>
                <template #avatar><a-avatar :src="item.avatar" /></template>
              </a-list-item-meta>
              <h1 style="margin-top: -10px">{{item.title}}</h1>
              {{ item.context }}
            </a-list-item>
          </template>
        </a-list>
      </a-card>
    </a-col>
    </a-row>
  </div>
</template>

<script setup lang="ts">

import {onMounted, ref} from "vue";
import {message, notification} from "ant-design-vue";
import store from "@/store";
import axios from "axios";
//分页信息
const pagination = ref({});
const title = ref('')
const context = ref('')
const iconLoading = ref(false)
const forumData = ref([]);

//初始化加载页面
onMounted(()=>{
  fetchForumList({ page: 1, size: 10 });
})

//发布
const release = () =>{
  iconLoading.value = true
  const releaseData = {
    userId: store.state.user.id, // 从Vuex中获取userId
    title :title.value,
    context : context.value
  }
  console.log(releaseData)
  axios.post('/forum/save',releaseData).then((response) =>{
    const data = response.data;
    if (data.success){
      message.success("发起讨论成功")
      console.log("数据为"+data)
      iconLoading.value = false
      fetchForumList({ page: 1, size: 10 });
    }
  })
}
//查找讨论列表
const fetchForumList =(params: any) =>{
  axios.get('/forum/fetchForumList',{
    params: {
      page: params.page,
      size: params.size,
    }
  }).then((response)=>{
    const data = response.data;
    console.log("dasdsadasdsa",data)
    forumData.value = data.content.list;
    // 更新分页信息
    pagination.value = {
      current: data.content.page, // 当前页码
      pageSize: data.content.size, // 每页条目数
      total: data.content.total, // 总条目数
      // 当页面改变时，重新获取数据
      onChange: (page: number, pageSize: number) => {
        fetchForumList({ page, size: pageSize });
      },
    }
  })
}
</script>

<style scoped>
.custom-button {
  background-color: green !important;
  color: white !important;
  border-color: green !important;
}
:deep(.ant-list-vertical .ant-list-item-meta-title) {
  margin-top: -10px !important;
  margin-bottom: 12px !important;
  color: rgba(0, 0, 0, 0.85) !important;
  font-size: 16px !important;
  line-height: 24px !important;
}
:deep(.ant-list-item-meta-description) {
    margin-top: -10px;
    color: rgba(0, 0, 0, 0.45);
    font-size: 14px;
    line-height: 22px;
}
</style>