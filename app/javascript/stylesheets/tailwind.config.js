module.exports = {
  purge: [
    "./app/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/javascript/**/*.vue"
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        skyblue: {
          50: '#f4fafe', 
          100: '#e8f6fe', 
          200: '#c7e8fc', 
          300: '#a5d9fa', 
          40: '#61bdf6', 
          500: '#1da1f2', 
          600: '#1a91da', 
          700: '#1679b6', 
          800: '#116191', 
          900: '#0e4f77'
        }
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
