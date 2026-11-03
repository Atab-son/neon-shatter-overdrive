# NEON SHATTER // OVERDRIVE

A single-page arcade game prepared for Vite, Tailwind CSS 4, Supabase, GitHub, and Vercel.

## Local setup

1. Install Node.js (LTS) from https://nodejs.org/.
2. In this folder, run `npm install`.
3. Copy `.env.example` to `.env.local` and fill in your Supabase project URL and publishable key.
4. Run `npm run dev` and open the local URL shown in the terminal.
5. Run `npm run build` to create the production build in `dist/`.

## Supabase setup

1. Create a Supabase project at https://supabase.com/dashboard.
2. Open SQL Editor and run the contents of `supabase-setup.sql`.
3. Copy the Project URL and Publishable Key from Project Settings / API Keys.
4. Set `VITE_SUPABASE_URL` and `VITE_SUPABASE_PUBLISHABLE_KEY` in `.env.local` locally.
5. In Authentication → URL Configuration, set the local Site URL to `http://localhost:5173` and allow `http://localhost:5173/**`.
6. When deployed, add the Vercel URL to allowed redirect URLs and set it as Site URL as appropriate.

## GitHub + Vercel

1. Create a GitHub repository and push this folder. `.env.local` is ignored; never commit secrets.
2. Import the repository in Vercel.
3. Set Vercel Environment Variables:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_PUBLISHABLE_KEY`
4. Build command: `npm run build`; output directory: `dist`.
5. Deploy. Vercel rebuilds after each push to the connected branch.

## Notes

- Tailwind CSS is compiled during Vite builds; the Tailwind CDN warning is removed.
- Supabase's publishable key is intended for frontend use; database security relies on Row Level Security policies in the SQL file.
- This browser game does not validate scores server-side. A competitive leaderboard needs a server-side scoring/anti-cheat design.
