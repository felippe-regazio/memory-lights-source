import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    hits: [],
    level: 0,
    started: false,
    state: 'waiting', // waiting, ready, listening, gameover
    elapsedTime: 0,
    currentSequence: [],
    sequenceListener: undefined 
  }
})
