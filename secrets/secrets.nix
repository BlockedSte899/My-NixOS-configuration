let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFZz5PTpKuozO9jHbB+7KRwyX0b/N/hUm4cMVN1vQuzn root@nixos";
  nikita = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7vqsJauxFUyZI6csYi8EYrqeBAWP86fj3ri8NfUlR8 nikitaparshutkin26@gmail.com";
  users = [ system nikita ];
in
{
  "github-token.age".publicKeys = [ system nikita ];
  "gemini-api-key.age".publicKeys = [ system nikita ];
}