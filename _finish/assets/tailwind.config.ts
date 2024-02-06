import type { Config } from 'tailwindcss'

export default {
  content: ['./source/**/*.{html,md,twig}'],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
      }
    },
  },
  plugins: [],
} satisfies Config

