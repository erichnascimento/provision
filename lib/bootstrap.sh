#!/usr/bin/env bash

#
# Canonize a path
#
canonical-dir() {
	readlink --canonicalize $1
}

#
# Create, if necessary, the user directory for configurations
#
create-user-config-dir() {
	if [ -d "$USER_CONFIG_" ]; then
		return 0
	fi

	log-info "Creating user config dir on \"$USER_CONFIG_\""
	mkdir $USER_CONFIG_
}

log-info() {
  cat << EOF
  [INFO] $@
EOF
}

panic () {
  cat << 'EOF'
  An unkown error occured
EOF
  exit 1
}

# Root dir
ROOT_=$(canonical-dir $(dirname $0)/..)

# Lib dir
LIB_=$ROOT_/lib

# Profiles dir
PROFILES_=$ROOT_/profiles

# Scripts dir
SCRIPTS_=$ROOT_/scripts

# User provision config dir
USER_CONFIG_=~/.provision