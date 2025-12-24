#!/usr/bin/env sh
set -eu

SSH_DIR="$HOME/.ssh"
MACHINE_KEY="$SSH_DIR/id_ed25519"

providers="github university strato gitea"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

###############################################################################
# 1. Ensure machine-only key exists
###############################################################################

if [ ! -e "$MACHINE_KEY" ]; then
    echo "No machine key found. Generating id_ed25519 (machine-only)."

    ssh-keygen \
        -t ed25519 \
        -f "$MACHINE_KEY" \
        -N "" \
        -C "$(hostname)-machine"

    chmod 600 "$MACHINE_KEY"
    chmod 644 "$MACHINE_KEY.pub"

    echo "Machine key created:"
    echo "  $MACHINE_KEY"
    echo "  $MACHINE_KEY.pub"
else
    echo "Machine key already exists: $MACHINE_KEY"
fi

###############################################################################
# 2. Provider-specific key bootstrap
###############################################################################

echo
echo "Select provider:"
i=1
for p in $providers; do
    printf "  %d) %s\n" "$i" "$p"
    i=$((i + 1))
done

printf "> "
read -r choice

case "$choice" in
    1) provider="github" ;;
    2) provider="university" ;;
    3) provider="strato" ;;
    4) provider="gitea" ;;
    *)
        echo "Invalid selection" >&2
        exit 1
        ;;
esac

key_path="$SSH_DIR/id_$provider"

if [ -e "$key_path" ]; then
    echo "Refusing to overwrite existing key: $key_path" >&2
    exit 1
fi

umask 077

echo
echo "Paste the private key for '$provider'."
echo "Finish with EOF (Ctrl-D on empty line)."
echo

key="$(cat)"

case "$key" in
    *"BEGIN "*PRIVATE*" KEY"*)
        ;;
    *)
        echo "Input does not look like a private key. Aborting." >&2
        exit 1
        ;;
esac

printf "%s\n" "$key" > "$key_path"
chmod 600 "$key_path"

echo
echo "Key written to $key_path with permissions 600"
