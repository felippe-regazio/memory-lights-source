<template>
  <div :class="`game-lights ${state}`">
      <gl-holder>
        <gl-button :shortkey="'E'" :color="'#FF0000'" :sound="'1.mp3'"/>
        <gl-button :shortkey="'I'" :color="'#008000'" :sound="'2.mp3'"/>
        <gl-button :shortkey="'F'" :color="'#0000FF'" :sound="'3.mp3'"/>
        <gl-button :shortkey="'J'" :color="'#008B8B'" :sound="'4.mp3'"/>
      </gl-holder>
      <game-over v-if="state == 'gameover'"/>
  </div>
</template>

<script>

import GameOver from '@/components/GameLights/GameOver.vue'
import GlHolder from '@/components/GameLights/Holder.vue'
import GlButton from '@/components/GameLights/Button.vue'

export default {
  name: 'GameLights',
  components: {
    GlHolder,
    GlButton,
    GameOver
  },
  computed: {
    level: {
      get () {
        return this.$store.state.level
      },
      set (value) {
        this.$store.state.level = value
      }
    },    
    currentSequence: {
      get () {
        return this.$store.state.currentSequence
      },
      set (value) {
        this.$store.state.currentSequence = value
      }
    },
    state: {
      get () {
        return this.$store.state.state
      },
      set (value) {
        this.$store.state.state = value
      }
    }    
  },
  methods: {
    play (sequence = []) {
      this.setState('waiting');
      sequence.forEach((n, i) => {
        setTimeout(() => {
          document.querySelectorAll(`[data-light-button]`)[n].click();
          if (i == sequence.length - 1) {
            this.setState('listening');
          } 
        }, 800 * i);
      });
    },
    levelUp () {
      this.level++;
      this.currentSequence = [];
      for (let i=0; i<this.level; i++) {
        this.currentSequence.push(this.randomNumber(0,3));
      }
      this.play(this.currentSequence);
    },
    restart () {
      this.setState('waiting');
      this.$store.state.started = true;
      this.$store.state.hits = [];
      this.$store.state.level = 0;
      this.$store.state.elapsedTime = 0;
      this.$store.state.currentSequence = [];
      this.$store.state.sequenceListener = undefined;  
      window?.$gamelights_timer?.reset();     
      setTimeout(() => {
          window.$gamelights.levelUp();
      }, 500);      
    },    
    gameOver () {
      this.setState('gameover');
      this.$store.state.started = false;
    },
    randomNumber (min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    },
    setState (state) {
      this.$store.state.state = state;
    },
    getState () {
      return this.$store.state.state;
    },
    sequence () {
      return this.currentSequence;
    },
    shiftSequence () {
      return this.currentSequence.shift();
    }
  },
  mounted () {
    window.$gamelights = this;
  }
}
</script>

<style scoped lang="scss">
  .game-lights {
    position: relative;
    margin-bottom: 40px;
    &.waiting {
      pointer-events: none;
    }
  }
</style>
