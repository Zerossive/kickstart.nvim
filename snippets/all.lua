---@diagnostic disable: undefined-global
-- Snippets for all filetypes
--
-- NOTE: to start a snippet:
--  1. add s(info, code) to returned list
--  2. define trigger, name, and description
--  3. define code
--
return {
	-- Lorem Ipsum Sentence
	s({
		trig = 'loremSentence',
		name = 'Lorem Ipsum Sentence',
	}, {
		t {
			'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem.',
		},
	}),

	-- Lorem Ipsum Paragraph
	s({
		trig = 'loremParagraph',
		name = 'Lorem Ipsum Paragraph',
	}, {
		t {
			'Ullus investigandi veri, nisi inveneris, et quaerendi defatigatio turpis est, cum esset accusata et vituperata ab Hortensio. Qui liber cum et mortem contemnit, qua qui est imbutus quietus esse numquam potest. Praeterea bona praeterita grata recordatione renovata delectant. Est autem situm in nobis ut et voluptates.',
		},
	}),

	-- Lorem Ipsum Article
	s({
		trig = 'loremArticle',
		name = 'Lorem Ipsum Article',
	}, {
		t {
			'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim aeque doleamus animo, cum corpore dolemus, fieri tamen permagna accessio potest.',
			'',
			'Ullus investigandi veri, nisi inveneris, et quaerendi defatigatio turpis est, cum esset accusata et vituperata ab Hortensio. Qui liber cum et mortem contemnit, qua qui est imbutus quietus esse numquam potest. Praeterea bona praeterita grata recordatione renovata delectant.',
			'',
			'Quod idem licet transferre in voluptatem, ut postea variari voluptas distinguique possit, augeri amplificarique non possit. Est autem situm in nobis ut et.',
		},
	}),

	-- Catppuccin Colors
	s('catppuccin', {
		t {
			'Rosewater:\t#F5E0DC',
			'Flamingo:\t#F2CDCD',
			'Pink:\t\t#F5C2E7',
			'Mauve:\t\t#CBA6F7',
			'Red:\t\t#F38BA8',
			'Maroon:\t\t#EBA0AC',
			'Peach:\t\t#FAB387',
			'Yellow:\t\t#F9E2AF',
			'Green:\t\t#A6E3A1',
			'Teal:\t\t#94E2D5',
			'Sky:\t\t#89DCEB',
			'Sapphire:\t#74C7EC',
			'Blue:\t\t#89B4FA',
			'Lavender:\t#B4BEFE',
			'Text:\t\t#CDD6F4',
			'Subtext1:\t#BAC2DE',
			'Subtext0:\t#A6ADC8',
			'Overlay2:\t#9399B2',
			'Overlay1:\t#7F849C',
			'Overlay0:\t#6C7086',
			'Surface2:\t#585B70',
			'Surface1:\t#45475A',
			'Surface0:\t#313244',
			'Base:\t\t#1E1E2E',
			'Mantle:\t\t#181825',
			'Crust:\t\t#11111B',
		},
	}),

	-- Individual Catppuccin Colors
	s('rosewater', { t '#F5E0DC' }),
	s('flamingo', { t '#F2CDCD' }),
	s('pink', { t '#F5C2E7' }),
	s('mauve', { t '#CBA6F7' }),
	s('red', { t '#F38BA8' }),
	s('maroon', { t '#EBA0AC' }),
	s('peach', { t '#FAB387' }),
	s('yellow', { t '#F9E2AF' }),
	s('green', { t '#A6E3A1' }),
	s('teal', { t '#94E2D5' }),
	s('sky', { t '#89DCEB' }),
	s('sapphire', { t '#74C7EC' }),
	s('blue', { t '#89B4FA' }),
	s('lavender', { t '#B4BEFE' }),
	s('text', { t '#CDD6F4' }),
	s('subtext1', { t '#BAC2DE' }),
	s('subtext0', { t '#A6ADC8' }),
	s('overlay2', { t '#9399B2' }),
	s('overlay1', { t '#7F849C' }),
	s('overlay0', { t '#6C7086' }),
	s('surface2', { t '#585B70' }),
	s('surface1', { t '#45475A' }),
	s('surface0', { t '#313244' }),
	s('base', { t '#1E1E2E' }),
	s('mantle', { t '#181825' }),
	s('crust', { t '#11111B' }),
}
