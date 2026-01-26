import { createClient } from '@supabase/supabase-js';

// Read from Vite environment variables (must be prefixed with VITE_)
// Fallback to hardcoded values for now until env vars are confirmed working
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'https://nbwwqreqmxakevkwzmij.supabase.co';
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5id3dxcmVxbXhha2V2a3d6bWlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU0MTY2OTUsImV4cCI6MjA4MDk5MjY5NX0.Xd0bdoQHW9oJLznRC6JC7kLevjB5Wh0hYOpRKVPjIq8';

// Log to help debug env var issues
console.log('Supabase URL:', supabaseUrl ? 'SET' : 'MISSING');
console.log('Supabase Key:', supabaseAnonKey ? 'SET' : 'MISSING');

// Initialize the Supabase client with increased row limit
export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  db: {
    schema: 'public',
  },
  global: {
    headers: { 'x-my-custom-header': 'boon-dashboard' },
  },
});