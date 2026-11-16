#!/usr/bin/env bash
set -euo pipefail

# Configuration & Defaults : config file, ynh backup archives folder a staging folder (a temp folder)
# Read from env, if not available use default. a ynh_app_setting_set_default but for files
CONFIG_FILE="${CONFIG_FILE:-/etc/yunohost-restic.conf}"
YNH_ARCHIVE_DIR="${YNH_ARCHIVE_DIR:-/var/backups/yunohost/archives}"
TMP_STAGING_BASE="/tmp/ynh_restic_staging"

# Default YunoHost system backup parts (from code)
SYSTEM_PARTS=(
    "conf_ldap"
    "data_home"
    "data_multimedia"
    "conf_ynh_settings"
    "conf_ynh_certs"
    "data_mail"
    "conf_manually_modified_files"
)

