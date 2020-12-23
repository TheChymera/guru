# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic

DESCRIPTION="Support for mounting HubiC drive in GNU/Linux"
HOMEPAGE="https://github.com/TurboGit/hubicfuse"
SRC_URI="https://github.com/TurboGit/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SLOT="0"

LICENSE="LGPL-3"
KEYWORDS="~amd64 ~arm ~arm64 ~mips ~ppc ~ppc64 ~x86"
IUSE="libressl"

DEPEND="
	net-misc/curl
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	sys-fs/fuse:0
	sys-apps/file
	dev-libs/libxml2
	dev-libs/json-c
"
RDEPEND="${DEPEND}"

DOCS=( README.md )

src_configure() {
	append-cflags -fcommon
	default
}

src_install() {
	default

	dobin hubic_token

	ewarn "The hubiC service is now closed to new subscriptions:"
	ewarn "https://www.ovh.co.uk/subscriptions-hubic-ended/"
	ewarn "Make sure that you already have hubiC account."
}
