<template>
	<span class="game-hits">{{icon}} {{hits}}</span>
</template>

<script>
	export default {
        name: 'game-timer',
        data () {
            return {
                icon: '🤨',
                iconsPerHit: {
                    0: '🤨',
                    10:  '🙂',
                    20: '🤗',
                    30: '🤠',
                    40: '🤓',
                    50: '😗',
                    60: '😄',
                    70: '🤩',
                    80: '🤭',
                    90: '🙃',
                    100: '😎'
                }
            }
        },
		computed: {
			hits () {
                const hits = this.$store.state.hits.length;
                this.iconPerHit(hits);
				return hits;
            }
        },
        methods: {
            iconPerHit (hits) {
                if (this.$store.state.state === "gameover") {
                    this.icon = '💀'
                } else if (this.iconsPerHit[hits]) {
                    this.icon = this.iconsPerHit[hits];
                } 
            }
        }
	}
</script>

<style lang="scss" scoped>
    .game-hits {
        font-size: 33px;
        color: #444;
    }
</style>