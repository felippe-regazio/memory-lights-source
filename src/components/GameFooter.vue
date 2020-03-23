<template>
	<footer class="game-footer">
		<div class="game-footer__content container">
			<div>
				Made with 🍵 by <a href="https://felippe-regazio.github.io" target="_blank">Felippe Regazio</a>
			</div>
			<div>
				<a href="https://felippe-regazio.github.io" target="_blank" @click="toggleHowToPlay($event)">How to Play</a>
			</div>
			<div class="how-to-play" v-if="howToPlay">
				<div class="how-to-play__content container">
					<h1 class="title">How To Play ?</h1>
					<ul>
						<li>The computer will play a sequence</li>
						<li>Then you must press the exact same sequence</li>
						<li>Everytime you hit the right sequence, the computer will show you a harder one</li>
						<li>You can click on the buttons or use the keyboard</li>
						<li>There is a bullet on the right side of the timer. When the bullet is red, is the computer turn, if is green is yours</li>
						<li>You can press Enter to start/restart the game</li>
						<li>The game has no end, test your limits</li>
					</ul>
					<br/>
					<p>This game is a variation of the <a href="https://en.wikipedia.org/wiki/Simon_(game)" target="_blank">Simon Game</a></p>
					<h1 aria-role="button" class="ok" @click="toggleHowToPlay">Ok</h1>
				</div>
			</div>
		</div>
	</footer>
</template>

<script>
	export default {
		name: 'game-footer',
		data () {
			return {
				howToPlay: false
			}
		},
		methods: {
			toggleHowToPlay ($event) {
				$event.preventDefault();
				this.howToPlay = !this.howToPlay;
			}
		}
	}
</script>

<style lang="scss" scoped>
	.game-footer {
		position: absolute;
		left: 0;
		bottom: 0;
		width: 100%;
		background-color: #ffffff;
		&__content {
			padding: 16px;
			display: flex;
			justify-content: space-between;
			.how-to-play {
				position: fixed;
				top: 0;
				left: 0;
				width: 100vw;
				height: 100vh;
				overflow: auto;
				background-color: #ffffff;
				padding: 8px;
				.title {
					color: green;
					margin-bottom: 34px;
					span {
						color: #000000;
					}
				}
				.ok {
					cursor: pointer;
					color: purple;
					width: 100%;
					text-align: center;
					margin: 40px 0;
					opacity: .8;
					&:hover {
						opacity: 1;
					}
				}
				ul {
					margin: 0;
					padding-left: 16px;
					li {
						padding-bottom: 16px;
						margin-bottom: 16px;
						font-weight: normal;
						border-bottom: dashed	 1px #cccccc;
					}
				} 
			}
		}
	}
</style>