// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
	config: {
		// choose either `'stable'` for receiving highly polished,
		// or `'canary'` for less polished but more frequent updates
		updateChannel: 'stable',

		fontSize: 12,

		fontFamily:
			'"Fira Code", "SF Mono", Monaco, monospace',

		fontWeight: 'normal',

		fontWeightBold: 'bold',

		lineHeight: 1,

		letterSpacing: 0,

		cursorColor: '#cbc3b7',

		// terminal text color under BLOCK cursor
		cursorAccentColor: '#cbc3b7',

		// `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
		cursorShape: 'BEAM',

		cursorBlink: true,

		foregroundColor: '#cbc3b7',

		backgroundColor: '#060519',

		selectionColor: 'rgba(120,119,129,0.3)',

		borderColor: '#060519',

		// custom CSS to embed in the main window
		css: '',

		// custom CSS to embed in the terminal window
		termCSS: '',

		// if you're using a Linux setup which show native menus, set to false
		// default: `true` on Linux, `true` on Windows, ignored on macOS
		showHamburgerMenu: '',

		// set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
		// additionally, set to `'left'` if you want them on the left, like in Ubuntu
		// default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
		showWindowControls: '',

		// custom padding (CSS format, i.e.: `top right bottom left`)
		padding: '0 7px 6px 7px',

		// the full list. if you're going to provide the full color palette,
		// including the 6 x 6 color cubes and the grayscale map, just provide
		// an array here instead of a color map object
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

		// the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
		// if left empty, your system's login shell will be used by default
		//
		// Windows
		// - Make sure to use a full path if the binary name doesn't work
		// - Remove `--login` in shellArgs
		//
		// Bash on Windows
		// - Example: `C:\\Windows\\System32\\bash.exe`
		//
		// PowerShell on Windows
		// - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
		shell: '',

		// for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
		// by default `['--login']` will be used
		shellArgs: ['--login'],

		// for environment variables
		env: {},

		// set to `false` for no bell
		bell: 'false',

		// if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
		copyOnSelect: false,

		// if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
		defaultSSHApp: true,

		// if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
		// selection is present (`true` by default on Windows and disables the context menu feature)
		quickEdit: false,

		// choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
		// or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
		// (inside tmux or vim with mouse mode enabled for example).
		macOptionSelectionMode: 'vertical',

		// URL to custom bell
		// bellSoundURL: 'http://example.com/bell.mp3',

		// Whether to use the WebGL renderer. Set it to false to use canvas-based
		// rendering (slower, but supports transparent backgrounds)
		webGLRenderer: false,

		hypercwd: {
			initialWorkingDirectory: '~/',
		},
		hyperTabs: {
			trafficButtons: true,
			border: true,
			activityColor: '#d2585a',
		},
		// for advanced config flags please refer to https://hyper.is/#cfg
	},

	// a list of plugins to fetch and install from npm
	// format: [@org/]project[#version]
	// examples:
	//   `hyperpower`
	//   `@company/project`
	//   `project#1.0.1`
	plugins: [
		'hyper-pane',
		'hypercwd',
		'hyper-font-ligatures',
		'hyper-tabs-enhanced',
	],

	// in development, you can create a directory under
	// `~/.hyper_plugins/local/` and include it here
	// to load it and avoid it being `npm install`ed
	localPlugins: [],

	keymaps: {
		// Example
		// 'window:devtools': 'cmd+alt+o',
	},
};
