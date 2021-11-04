#!/bin/bash
#
# Description:   ds4drv installer
#
# Company:       Robotnik Automation S.L.L.
# Creation Year: 2021
# Author:        Guillem Gari <ggari@robotnik.es>
#
#
# Copyright (c) 2021, Robotnik Automation S.L.L.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Robotnik Automation S.L.L. nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL Robotnik Automation S.L.L. BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#Colour
red_colour='\033[0;31m'
green_colour='\033[0;32m'
light_purple_colour='\033[1;35m'
err_colour="${red_colour}"
nfo_colour="${light_purple_colour}"
suc_colour="${green_colour}"
no_colour='\033[0m'

#udev
udev_rule_file="55-ds4drv.rules"
udev_rule_destiny="/etc/udev/rules.d/${udev_rule_file}"

udev_rule_copy_command="cp ${udev_rule_file} ${udev_rule_destiny}"
udev_reload_rules_command="udevadm control --reload-rules && udevadm trigger"

systemd_service_file="ds4drv.service"
systemd_service_destiny="/etc/systemd/system/${systemd_service_file}"

systemd_service_copy_command="cp ${systemd_service_file} ${systemd_service_destiny}"
systemd_daemon_reload_command="systemctl daemon-reload"
systemd_enable_service_command="systemctl enable ${systemd_service_file}"
systemd_start_service_command="systemctl enable ${systemd_service_file}"

function print_error() {
	local message="${1}"
	eval "echo -e "'"'"${err_colour}[ERROR]${no_colour}:   ${message}"'"'" 2>&1"
}

function print_info() {
	local message="${1}"
	eval "echo -e "'"'"${nfo_colour}[INFO]${no_colour}:    ${message}"'"'""
}

function print_success() {
	local message="${1}"
	eval "echo -e "'"'"${suc_colour}[SUCCESS]${no_colour}: ${message}"'"'""
}
function check_root_permission() {
	if [[ "${EUID}" = 0 ]]; then
		return 0
	else
		echo "You need root privileges try:" >&2
		echo "sudo ${0}"
		return 1
	fi
}

function install_ds4drv() {
	return 0
}

function install_udev_rules() {
	return 0
}

function install_systemd_service() {
	return 0
}


function main() {
	if ! check_root_permission; then
		return 1
	fi
	if ! install_ds4drv; then
		return 1
	fi
	if ! install_udev_rules; then
		return 1
	fi
	if ! install_systemd_service; then
		return 1
	fi
}

main "${@}"
exit $?
