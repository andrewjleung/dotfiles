#!/bin/sh

TARGET=$1
TARGET_DIRNAME=$(dirname $TARGET)
TARGET_BASENAME=$(basename $TARGET)

if ! [ -f "$TARGET" ]; then 
    gum log --level="error" "target file $TARGET not found."
    exit 1
fi

# copy the file to the source path
cp "$TARGET" "$(chezmoi source-path)/base_$TARGET_BASENAME"

gum log --level="info" "created base source file at $(chezmoi source-path)/base_$TARGET_BASENAME."

# specify the symlink
chezmoi manage --template "$TARGET"
SOURCE=$(chezmoi source-path $TARGET)
echo "{{ .chezmoi.sourceDir }}/base_$TARGET_BASENAME" > "$SOURCE"
mv "$SOURCE" "$(dirname $SOURCE)/symlink_$(basename $SOURCE)"

gum log --level="info" "created symlink source file at $(dirname $SOURCE)/symlink_$(basename $SOURCE)"


