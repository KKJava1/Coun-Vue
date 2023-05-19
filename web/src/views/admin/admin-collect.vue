<template>
  <div class="card-container" style="margin-top: 20px;margin-left: 20px">
    <a-card
        v-for="(book, index) in fetchedCollects"
        :key="index"
        hoverable
        style="width: 300px; margin-right: 20px; background-color: white;"
        @click="handleCollect(book.id)"
    >
      <template #cover>
        <img
            alt="book cover"
            :src="book.cover"
        />
      </template>
      <template #actions>
              <span @click.stop>
                <a-tooltip title="章节数">
                <component v-bind:is="'FileOutlined'" style="margin-right: 8px" />
                {{ book.docCount }}
                </a-tooltip>
              </span>
        <span>
                <a-tooltip title="阅读数" @click.stop>
                <component v-bind:is="'UserOutlined'" style="margin-right: 8px" />
                {{ book.viewCount }}
                </a-tooltip>
              </span>
        <span>
                <a-tooltip title="点赞数" @click.stop>
                <component v-bind:is="'LikeOutlined'" style="margin-right: 8px" />
                {{ book.voteCount }}
                  </a-tooltip>
              </span>
      </template>
      <a-card-meta
          style="margin-top: 5px"
          :title="book.name"
          :description="book.description"
          class="a-card-meta"
      >
        <template #avatar>
          <a-avatar :src="book.cover" />
        </template>
      </a-card-meta>
    </a-card>
  </div>
</template>

<script lang="ts">
import { SettingOutlined, EditOutlined, EllipsisOutlined } from '@ant-design/icons-vue';
import { useStore } from 'vuex';
import { onMounted, ref } from "vue";
import axios from "axios";
import {useRoute, useRouter} from "vue-router";
import { Tooltip } from 'ant-design-vue';
export default {
  name: "AdminCollect",
  components: {
    Tooltip,
    SettingOutlined,
    EditOutlined,
    EllipsisOutlined,
  },
  setup() {
    const store = useStore();
    const userId = store.state.user.id;
    const fetchedCollects = ref([]);
    const router = useRouter();
    //查询该用户收藏的书本
    const fetchCollect = async () => {
      const response = await axios.get(`/user/collect/${userId}`);
      fetchedCollects.value = response.data.content;
      console.log(fetchedCollects.value)
    };
    //根据用户点击的书本到哪本电子书中
    const handleCollect = async (bookId: number) =>{
      router.push('/doc?ebookId='+bookId)
    }

    onMounted(fetchCollect);
    return {
      fetchedCollects,
      handleCollect
    };
  },
}
</script>

<style scoped>
.card-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;  /* 修改这里 */
  align-items: stretch;
}

.card-container img {
  height: 200px;
  object-fit: cover;
}
.a-card-meta {
  height: 100px;
  overflow: auto;
}

</style>

