# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="OpenSSL Provider for TPM2 integration"

HOMEPAGE="https://github.com/tpm2-software/tpm2-openssl"
SRC_URI="https://github.com/tpm2-software/tpm2-openssl/releases/download/${PV}/${P}.tar.gz"
LICENSE="BSD"

SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=app-crypt/tpm2-tss-3.2.0:=
	=dev-libs/openssl-3.0*:0="

DEPEND="${RDEPEND}
	test? ( app-crypt/swtpm
		app-crypt/tpm2-abrmd
		app-crypt/tpm2-tools )"

BDEPEND="sys-devel/autoconf-archive
	 virtual/pkgconfig"

RESTRICT="!test? ( test )"

dbus_run() {
	(
		# start isolated dbus session bus
		dbus_data=$(dbus-launch --sh-syntax) || exit
		eval "${dbus_data}"

		$@
		ret=${?}

		kill "${DBUS_SESSION_BUS_PID}"
		exit "${ret}"
	) || die
}

tpm2_run_with_emulator() {
	export XDG_CONFIG_HOME="${T}/.config/swtpm"
	"${BROOT}"/usr/share/swtpm/swtpm-create-user-config-files || die

	mkdir -p "${XDG_CONFIG_HOME}/mytpm1" || die
	swtpm_setup_args=(
		--tpm2
		--tpmstate "${XDG_CONFIG_HOME}/mytpm1"
		--createek
		--allow-signing
		--decryption
		--create-ek-cert
		--create-platform-cert
		--lock-nvram
		--overwrite
		--display
	)
	swtpm_setup "${swtpm_setup_args[@]}" || die

	swtpm_socket_args=(
		--tpm2
		--tpmstate dir="${XDG_CONFIG_HOME}/mytpm1"
		--flags startup-clear
		--ctrl type=unixio,path="${XDG_CONFIG_HOME}/mytpm1/swtpm.socket.ctrl"
		--server type=unixio,path="${XDG_CONFIG_HOME}/mytpm1/swtpm.socket"
		--pid file="${XDG_CONFIG_HOME}/mytpm1/swtpm.pid"
		--daemon
	)
	swtpm socket "${swtpm_socket_args[@]}" || die

	tpm2_abrmd_args=(
		--logger=stdout
		--tcti=swtpm:path="${XDG_CONFIG_HOME}/mytpm1/swtpm.socket"
		--session
		--flush-all
	)
	tpm2-abrmd "${tpm2_abrmd_args[@]}" &

	export TPM2OPENSSL_TCTI="tabrmd:bus_type=session"
	export TPM2TOOLS_TCTI="tabrmd:bus_type=session"

	$@ || die

	# When swtpm dies, tmp2-abrmd will exit
	kill $(< "${XDG_CONFIG_HOME}/mytpm1/swtpm.pid") || die
}

src_prepare() {
	# See bug #833887 (and similar); eautoreconf means version information
	# could be incorrectly embedded

	sed -i \
	"s/m4_esyscmd_s(\[git describe --tags --always --dirty\])/${PV}/" \
	"${S}/configure.ac" || die
	eautoreconf
	default
}

src_install() {
	default
	find "${ED}" -iname \*.la -delete || die

	# No libtool files are install, so nothing to check for bug #833887
}

src_test() {
	dbus_run tpm2_run_with_emulator make check
}
