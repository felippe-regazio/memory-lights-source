<template>
	<span :class="`game-timer ${turn}`">{{time}}</span>
</template>

<script>
	export default {
		name: 'game-timer',
		mounted () {
			setInterval(() => this.count(), 1000);
			window.$gamelights_timer = this;
		},
		data () {
			return {
				h: 0, m: 0, s: 0,
				time: "00:00:00"
			}
		},
		computed: {
			turn () {
				return this.$store.state.state
			}
		},
		methods: {
			count () {
				if (this.$store.state.state === "gameover") {
					return;
				}
				this.s++;
				if (this.s >= 60) {
					this.s = 0;
					this.m++
				}
				if (this.m >= 60) {
					this.m = 0;
					this.h++;
				}
				this.time = [
					this.h,
					this.m,
					this.s
				].map(val => String(Math.trunc(val)).padStart(2, '0')).join(':');
			},
			reset () {
				this.h = 0;
				this.m = 0;
				this.s = 0;
				this.time = "00:00:00";				
			}
		}
	}
</script>

<style lang="scss" scoped>
.game-timer {
	font-size: var(--base-font);
	color: #444;
	display: flex;
	align-items: center;
	&::after {
		content: "";
		height: 20px;
		width: 20px;
		border-radius: 100%;
		background-color: #cccccc;
		display: inline-block;
		margin-left: 8px;
	}
	&.listening::after {
		background-color: green;
	}
	&.waiting::after {
		background-color: red;
	}
}
</style>