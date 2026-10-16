let
  system = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFZz5PTpKuozO9jHbB+7KRwyX0b/N/hUm4cMVN1vQuzn root@nixos";
  nikita = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7vqsJauxFUyZI6csYi8EYrqeBAWP86fj3ri8NfUlR8";
  users = [ system nikita ];
in
{
  "github-token.age".publicKeys = [ system nikita ];
  "gemini-api-key.age".publicKeys = [ system nikita ];
  "curseforge-api-key.age".publicKeys = [ system nikita ];
  "dahl-api-key.age".publicKeys = [ system nikita ];
  "exa-api-key.age".publicKeys = [ system nikita ];
  "nvidia-api-key.age".publicKeys = [ system nikita ];
}
