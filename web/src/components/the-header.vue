<template>
  <a-layout-header class="header">
    <div class="logo">Coun</div>
    <a-menu
      theme="dark"
      mode="horizontal"
      :style="{ lineHeight: '64px' }"
    >
      <a-menu-item key="/">
        <router-link to="/">首页</router-link>
      </a-menu-item>
      <a-menu-item key="/admin/user" :style="user.id? {} : {display:'none'}">
        <router-link to="/admin/user">用户管理</router-link>
      </a-menu-item>
      <a-menu-item key="/admin/ebook" :style="user.id? {} : {display:'none'}">
        <router-link to="/admin/ebook">电子书管理</router-link>
      </a-menu-item>
      <a-menu-item key="/admin/category" :style="user.id? {} : {display:'none'}">
        <router-link to="/admin/category">分类管理</router-link>
      </a-menu-item>


      <a-popconfirm
        title="确认退出登录?"
        ok-text="是"
        cancel-text="否"
        @confirm="logout()"
      >
        <a class="login-menu" v-show="user.id">
          <span>退出登录</span>
        </a>
      </a-popconfirm>
      <a class="login-menu" v-show="user.id">
        <span>您好：{{user.name}}</span>
      </a>
      <a class="login-menu" v-show="!user.id" @click="showRegisterModal">
        <span>注册</span>
      </a>
      <a class="login-menu" v-show="!user.id" @click="showLoginModal">
        <span>登录</span>
      </a>
    </a-menu>

    <a-modal
        title="注册"
        :visible="registerModalVisible"
        :confirm-loading="RegirsterModalVisible"
        @cancel="closeModal"
        @ok="register"
    >
      <a-form :model="RegirsterUser" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
        <a-form-item label="登录名">
          <a-input v-model:value="RegirsterUser.loginName" />
        </a-form-item>
        <a-form-item label="密码">
          <a-input v-model:value="RegirsterUser.password" type="password" />
        </a-form-item>
        <a-form-item label="昵称">
          <a-input v-model:value="RegirsterUser.name" />
        </a-form-item>
      </a-form>
    </a-modal>

    <a-modal
      title="登录"
      :visible="loginModalVisible"
      :confirm-loading="loginModalLoading"
      @cancel="closeModal"
      @ok="login"
    >
      <a-form :model="loginUser" :label-col="{ span: 6 }" :wrapper-col="{ span: 18 }">
        <a-form-item label="登录名">
          <a-input v-model:value="loginUser.loginName" />
        </a-form-item>
        <a-form-item label="密码">
          <a-input v-model:value="loginUser.password" type="password" />
        </a-form-item>

      </a-form>
    </a-modal>
  </a-layout-header>
</template>

<script lang="ts">
  import { defineComponent, ref, computed } from 'vue';
  import axios from 'axios';
  import { message } from 'ant-design-vue';
  import store from "@/store";
  import {useRouter } from "vue-router";

  declare let hexMd5: any;
  declare let KEY: any;

  export default defineComponent({
    name: 'the-header',
    setup () {
      const router = useRouter();
      // 登录后保存
      const user = computed(() => store.state.user);
      //用于注册
      const RegirsterUser = ref({
        loginName: "",
        password: "",
        name : ""
      });
      // 用来登录
      const loginUser = ref({
        loginName: "",
        password: ""
      });
      //登录界面
      const loginModalVisible = ref(false);
      //注册界面
      const registerModalVisible = ref(false);
      const loginModalLoading = ref(false);
      //注册加载
      const RegirsterModalVisible = ref(false);
      //注册窗口显示
      const showRegisterModal = () =>{
        registerModalVisible.value = true;
      }
      //登入窗口显示
      const showLoginModal = () => {
        loginModalVisible.value = true;
      };
      const closeModal =() =>{
        loginModalVisible.value = false;
        registerModalVisible.value = false;
      };
      //注册
      const register = () =>{
        console.log("注册");
        RegirsterModalVisible.value = true;
        RegirsterUser.value.password = hexMd5(RegirsterUser.value.password + KEY);
        axios.post('/user/regirster',RegirsterUser.value).then((response) =>{
          console.log(response)
          RegirsterModalVisible.value = false;
          const data = response.data;
          if(data.success) {
            registerModalVisible.value = false;
            message.success("注册成功");
          }
          else{
            message.error(data.message);
          }
        })
      }
      // 登录
      const login = () => {
        console.log("开始登录");
        loginModalLoading.value = true;
        loginUser.value.password = hexMd5(loginUser.value.password + KEY);

        axios.post('/user/login', loginUser.value).then((response) => {
          loginModalLoading.value = false;
          const data = response.data;
          if (data.success) {
            loginModalVisible.value = false;
            message.success("登录成功！");

            store.commit("setUser", data.content);
          } else {
            message.error(data.message);
          }
        });
      };

      // 退出登录
      const logout = () => {
        console.log("退出登录开始");

        axios.get('/user/logout/' + user.value.token).then((response) => {
          const data = response.data;
          if (data.success) {
            message.success("退出登录成功！");
            store.commit("setUser", {});
            router.push('/');
          } else {
            message.error(data.message);
          }
        });
      };

      return {
        loginModalVisible,
        registerModalVisible,
        loginModalLoading,
        showLoginModal,
        closeModal,
        showRegisterModal,
        RegirsterModalVisible,
        RegirsterUser,
        loginUser,
        login,
        register,
        user,
        logout
      }
    }
  });
</script>

<style>
  .logo {
    width: 120px;
    height: 31px;
    /*background: rgba(255, 255, 255, 0.2);*/
    /*margin: 16px 28px 16px 0;*/
    float: left;
    color: white;
    font-size: 18px;
  }
  .login-menu {
    float: right;
    color: white;
    padding-left: 10px;
  }
</style>
