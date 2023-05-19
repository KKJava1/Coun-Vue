<template>
  <div class="card-container" style="margin-top: 20px;margin-left: 20px">
    <a-card
        v-for="(book, index) in fetchedCollects"
        :key="index"
        hoverable
        style="width: 300px; margin-right: 20px;"
        @click="handleCollect(book.id)"
    >
      <template #cover>
        <img
            alt="book cover"
            :src="book.cover"
        />
      </template>
      <template #actions>
        <setting-outlined key="setting" />
        <edit-outlined key="edit" />
        <ellipsis-outlined key="ellipsis" />
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

export default {
  name: "AdminCollect",
  components: {
    SettingOutlined,
    EditOutlined,
    EllipsisOutlined,
  },
  setup() {
    const store = useStore();
    const userId = store.state.user.id;
    const fetchedCollects = ref([]);

    //查询该用户收藏的书本
    const fetchCollect = async () => {
      const response = await axios.get(`/user/collect/${userId}`);
      fetchedCollects.value = response.data.content;
      console.log(fetchedCollects.value)
    };
    //根据用户点击的书本到哪本电子书中
    const handleCollect = async (bookId: number) =>{
      console.log("dsadas")
      const response = await  axios.get(`/doc/all/${bookId}`);

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
  justify-content: start;
  align-items: stretch;
}

.card-container img {
  height: 200px;  /* Adjust this value as needed */
  object-fit: cover;  /* This makes sure the aspect ratio of the image is preserved */
}
.a-card-meta {
  height: 100px; /* You can adjust the value according to your needs */
  overflow: auto;
}
</style>

