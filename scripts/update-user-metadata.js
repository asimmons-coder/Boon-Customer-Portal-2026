// Run with: node scripts/update-user-metadata.js
// Requires: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY env vars

const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL || process.env.VITE_SUPABASE_URL;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !serviceRoleKey) {
  console.error('Missing environment variables:');
  console.error('  SUPABASE_URL or VITE_SUPABASE_URL');
  console.error('  SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, serviceRoleKey, {
  auth: { autoRefreshToken: false, persistSession: false }
});

async function updateUserMetadata() {
  const email = 'jay.kantar@mediaartslab.com';

  // First, find the user
  const { data: { users }, error: listError } = await supabase.auth.admin.listUsers();

  if (listError) {
    console.error('Error listing users:', listError);
    process.exit(1);
  }

  const user = users.find(u => u.email === email);

  if (!user) {
    console.error(`User not found: ${email}`);
    process.exit(1);
  }

  console.log('Found user:', user.id);
  console.log('Current metadata:', user.app_metadata);

  // Update the metadata
  const { data, error } = await supabase.auth.admin.updateUserById(user.id, {
    app_metadata: {
      role: 'customer',
      company: 'Media Arts Lab',
      company_id: '0f0e4325-db49-4daf-8f75-519f55cfba38',
      provider: 'email',
      providers: ['email'],
      program_type: 'Scale'
    }
  });

  if (error) {
    console.error('Error updating user:', error);
    process.exit(1);
  }

  console.log('Successfully updated user metadata!');
  console.log('New metadata:', data.user.app_metadata);
}

updateUserMetadata();
