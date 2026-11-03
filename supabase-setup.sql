-- NEON SHATTER // OVERDRIVE pilot profiles and leaderboard
create table if not exists public.pilot_profiles (
    id uuid primary key references auth.users(id) on delete cascade,
    callsign text not null default 'PILOT',
    high_score integer not null default 0 check (high_score >= 0),
    max_wave integer not null default 1 check (max_wave between 1 and 3),
    updated_at timestamptz not null default now()
);

alter table public.pilot_profiles enable row level security;
revoke all on table public.pilot_profiles from anon, authenticated;
grant usage on schema public to anon, authenticated;
grant select on table public.pilot_profiles to anon, authenticated;
grant insert, update on table public.pilot_profiles to authenticated;

drop policy if exists "Leaderboard is publicly readable" on public.pilot_profiles;
create policy "Leaderboard is publicly readable"
on public.pilot_profiles for select to anon, authenticated using (true);

drop policy if exists "Pilots can insert their own profiles" on public.pilot_profiles;
create policy "Pilots can insert their own profiles"
on public.pilot_profiles for insert to authenticated
with check ((select auth.uid()) = id);

drop policy if exists "Pilots can update their own profiles" on public.pilot_profiles;
create policy "Pilots can update their own profiles"
on public.pilot_profiles for update to authenticated
using ((select auth.uid()) = id)
with check ((select auth.uid()) = id);

create index if not exists pilot_profiles_score_idx
on public.pilot_profiles (high_score desc);
