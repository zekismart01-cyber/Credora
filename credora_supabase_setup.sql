-- Credora prototype cloud storage
-- Stores only display name, fictional phone number and simulated loan state.
-- Never add NIN, BVN, bank account numbers, passwords or biometric data.

create table if not exists public.credora_user_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null default 'Demo user',
  phone text not null default '',
  app_state jsonb not null default '{\"activeLoan\":null,\"apps\":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.credora_user_data enable row level security;
drop policy if exists "Users can view their own Credora data" on public.credora_user_data;
create policy "Users can view their own Credora data" on public.credora_user_data for select to authenticated using ((select auth.uid()) = user_id);
drop policy if exists "Users can insert their own Credora data" on public.credora_user_data;
create policy "Users can insert their own Credora data" on public.credora_user_data for insert to authenticated with check ((select auth.uid()) = user_id);
drop policy if exists "Users can update their own Credora data" on public.credora_user_data;
create policy "Users can update their own Credora data" on public.credora_user_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
grant select, insert, update on public.credora_user_data to authenticated;
revoke all on public.credora_user_data from anon;
