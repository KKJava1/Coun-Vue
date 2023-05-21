import { createStore } from 'vuex'
import createPersistedState from "vuex-persistedstate";
declare let SessionStorage: any;
const USER = "USER";

const store = createStore({
  state: {
    user: SessionStorage.get(USER) || {},
    favoriteStatus: 0,
  },
  mutations: {
    setUser (state, user) {
      console.log("store user：", user);
      state.user = user;
      SessionStorage.set(USER, user);
    },
    setFavoriteStatus(state, status) {
      state.favoriteStatus = status;
    },
  },
  actions: {
  },
  modules: {
  },
  plugins: [createPersistedState()]
});

export default store;
