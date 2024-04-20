-- JavaScript Snippets
--
-- NOTE: to start a snippet:
--  1. add s(info, code) to returned list
--  2. define trigger, name, and description
--  3. define code
--   a. end with '\t' to make next line with indent
--   b. end with '' to make a new line with no indent
--
return {
  s({ trig = 'colors', name = 'Color Palette', dscr = 'Template for Tailwind CSS colors' }, {
    t { 'colors: {', '\t' },
    t { 'primary: `#74c7ec`,', '\t' },
    t { 'secondary: `#cba6f7`,', '\t' },
    t { 'overlay: `#6c7086`,', '\t' },
    t { 'surface: `#313244`,', '\t' },
    t { 'base: `#1e1e2e`,', '\t' },
    t { 'mantle: `#181825`,', '\t' },
    t { 'crust: `#11111b`,', '\t' },
    t { 'success: `#a6e3a1`,', '\t' },
    t { 'error: `#f38ba8`,', '' },
    t { '},' },
  }),
}
