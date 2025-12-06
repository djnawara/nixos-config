# Daveloper's Nix Config

It's a nix config. ¯\\\_(ツ)\_/¯

* Plasma 6 with plasma-manager
* Basic KWin; no fancy tiling window manager (there are some old commits with Niri working, but I'm not into that).
* JetBrains stuff
* Warp Terminal (screw the telemetry, but I really like their text input)
* Ghostty, dunno why
* Firefox (tried Falkon, but it crashes)

## Secrets Management

Uses [agenix](https://github.com/ryantm/agenix) with SSH key encryption.

### Changing your password

```bash
# 1. Change password
passwd

# 2. Get the new hash
sudo cat /etc/shadow | grep "^dave:" | cut -d: -f2 | wl-copy

# 3. Re-encrypt (paste the hash when prompted, then Ctrl+D)
nix-shell -p age --run "age -e -R ~/.ssh/id_ed25519.pub -o secrets/dave-password.age"

# 4. Rebuild
nix-update
```

### Setting up a new machine

#### Option A: Copy existing SSH key (quick)

1. Copy your SSH key (`~/.ssh/id_ed25519` and `~/.ssh/id_ed25519.pub`) to the new machine
2. Clone this repo
3. Run `nix-update`

#### Option B: New key per machine (more secure)

Each machine gets its own SSH key. Secrets are encrypted so any authorized key can decrypt independently.

1. On the new machine, generate a new SSH key:
   ```bash
   ssh-keygen -t ed25519
   ```

2. Get the new machine's public key to an existing machine (email, USB, etc.)

3. On an existing machine, add the new public key to `secrets/secrets.nix`:
   ```nix
   let
     dave = "ssh-ed25519 AAAA...";  # existing key
     dave-newmachine = "ssh-ed25519 AAAA...";  # new machine's key
   in
   {
     "dave-password.age".publicKeys = [ dave dave-newmachine ];
   }
   ```

4. Re-encrypt secrets so either key can decrypt:
   ```bash
   nix-shell -p age --run "age -d -i ~/.ssh/id_ed25519 secrets/dave-password.age | age -e -R ~/.ssh/id_ed25519.pub -R /path/to/newmachine.pub -o secrets/dave-password.age"
   ```

5. Commit and push from the existing machine

6. On the new machine, pull and run `nix-update`
