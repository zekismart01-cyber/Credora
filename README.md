# Credora V6

Credora is a **non-lending prototype**. It does not approve, issue, collect, or service real loans.

## Included
- Supabase email/password authentication.
- Per-user cloud profile and simulated application-history sync.
- Row Level Security: each authenticated user can access only their own `credora_user_data` row.
- Demo phone OTP (`246810`), simulated personal/face/bank checks, calculator and application activity.

## Supabase
The app uses the project URL and browser publishable key provided by the project owner. The publishable key is intended for browser use. Never add a service-role or secret key to this repository.

The SQL setup file is included for reference. The project owner previously reported that the SQL setup had already run successfully and Email auth was enabled.

## Deploy
This repository is configured for GitHub Pages. Publish `index.html` from the `main` branch root. Then set the GitHub Pages URL as the Supabase Auth Site URL and add it to the allowed Redirect URLs.

## Privacy and prototype safety
- Only display name, fictional phone number and simulated loan application state are sent to Supabase.
- NIN, BVN, bank account number, date of birth, face images and biometrics are not uploaded or stored.
- Use fictional test details only.
- Demo OTP is not an SMS OTP. Facial and bank checks are simulations.
- No money is disbursed or collected.
