module.exports = {
	config: {

		updateChannel: 'stable',

		fontSize: 12,

		fontFamily:
			'"Fira Code", "SF Mono", Monaco, monospace',

		fontWeight: 'normal',

		fontWeightBold: 'bold',

		lineHeight: 1,

		letterSpacing: 0,

		cursorColor: '#cbc3b7',

		cursorAccentColor: '#cbc3b7',

		cursorShape: 'BEAM',

		cursorBlink: true,

		foregroundColor: '#cbc3b7',

		backgroundColor: '#060519',

		selectionColor: 'rgba(120,119,129,0.3)',

		borderColor: '#060519',

		css: '',

		termCSS: '',

		showHamburgerMenu: '',
		showWindowControls: '',

		padding: '0 7px 6px 7px',

		colors: {
			black: '#201f1f',
			red: '#ea2617',
			green: '#d95c24',
			yellow: '#e8ae3a',
			blue: '#868fa6',
			magenta: '#a47bae',
			cyan: '#856767',
			white: '#aea498',
			lightBlack: '#6f6e6e',
			lightRed: '#d2585a',
			lightGreen: '#f48444',
			lightYellow: '#e3b865',
			lightBlue: '#637ea0',
			lightMagenta: '#ab0461',
			lightCyan: '#987d7d',
			lightWhite: '#d6d6dd',
		},

		shell: '',

		shellArgs: ['--login'],

		env: {},

		bell: 'false',

		copyOnSelect: false,

		defaultSSHApp: true,

		quickEdit: false,

		macOptionSelectionMode: 'vertical',

		webGLRenderer: false,

		hypercwd: {
			initialWorkingDirectory: '~/',
		},
		hyperTabs: {
			trafficButtons: true,
			border: true,
			activityColor: '#d2585a',
		},
	},

	plugins: [
		'hyper-pane',
		'hypercwd',
		'hyper-font-ligatures',
		'hyper-tabs-enhanced',
	],

	localPlugins: [],

	keymaps: {
		},
};
