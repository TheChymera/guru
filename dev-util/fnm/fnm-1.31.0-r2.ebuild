# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler-1.0.2
	adler32-1.2.0
	aho-corasick-0.7.18
	alloc-no-stdlib-2.0.3
	alloc-stdlib-0.2.1
	ansi_term-0.12.1
	anyhow-1.0.53
	async-compression-0.3.14
	async-compression-0.3.8
	async-trait-0.1.56
	atty-0.2.14
	autocfg-1.0.1
	autocfg-1.1.0
	base64-0.13.0
	base-x-0.2.10
	bitflags-1.3.2
	brotli-3.3.2
	brotli-3.3.4
	brotli-decompressor-2.3.2
	bstr-0.2.17
	bumpalo-3.10.0
	bumpalo-3.7.1
	byteorder-1.4.3
	bytes-1.1.0
	bzip2-0.4.3
	bzip2-sys-0.1.11+1.0.8
	cc-1.0.70
	cc-1.0.73
	cfg-if-1.0.0
	chrono-0.4.19
	clap-3.0.14
	clap_complete-3.0.6
	clap_derive-3.0.5
	colored-2.0.0
	console-0.15.0
	console_error_panic_hook-0.1.7
	const_fn-0.4.9
	cookie-0.15.1
	cookie_store-0.15.1
	core-foundation-0.9.2
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	crc32fast-1.2.1
	crc32fast-1.3.2
	crossbeam-channel-0.5.1
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.9.5
	crossbeam-utils-0.8.5
	csv-1.1.6
	csv-core-0.1.10
	ctor-0.1.21
	data-encoding-2.3.2
	diff-0.1.12
	dirs-4.0.0
	dirs-sys-0.3.6
	discard-1.0.4
	doc-comment-0.3.3
	dtoa-0.4.8
	duct-0.13.5
	either-1.6.1
	embed-resource-1.6.5
	encode_unicode-0.3.6
	encoding_rs-0.8.28
	encoding_rs-0.8.31
	encoding_rs_io-0.1.7
	enum-as-inner-0.3.4
	env_logger-0.8.4
	env_logger-0.9.0
	fastrand-1.6.0
	fastrand-1.7.0
	filetime-0.2.15
	flate2-1.0.22
	flate2-1.0.24
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	futures-channel-0.3.18
	futures-channel-0.3.21
	futures-core-0.3.18
	futures-core-0.3.21
	futures-io-0.3.18
	futures-io-0.3.21
	futures-sink-0.3.18
	futures-sink-0.3.21
	futures-task-0.3.18
	futures-task-0.3.21
	futures-util-0.3.18
	futures-util-0.3.21
	getrandom-0.2.3
	getrandom-0.2.7
	h2-0.3.10
	h2-0.3.13
	hashbrown-0.11.2
	hashbrown-0.12.1
	heck-0.4.0
	hermit-abi-0.1.19
	hostname-0.3.1
	http-0.2.5
	http-0.2.8
	httparse-1.5.1
	httparse-1.7.1
	http-body-0.4.4
	http-body-0.4.5
	httpdate-1.0.2
	humantime-2.1.0
	hyper-0.14.15
	hyper-0.14.19
	hyper-rustls-0.23.0
	hyper-tls-0.5.0
	idna-0.2.3
	indexmap-1.7.0
	indexmap-1.9.1
	indoc-1.0.3
	insta-1.12.0
	instant-0.1.11
	instant-0.1.12
	ipconfig-0.2.2
	ipnet-2.3.1
	ipnet-2.5.0
	itoa-0.4.8
	itoa-1.0.1
	itoa-1.0.2
	js-sys-0.3.55
	js-sys-0.3.58
	junction-0.2.0
	lazy_static-1.4.0
	libc-0.2.112
	libc-0.2.126
	libflate-1.2.0
	libflate_lz77-1.1.0
	linked-hash-map-0.5.4
	lock_api-0.4.5
	lock_api-0.4.7
	log-0.4.14
	log-0.4.17
	lru-cache-0.1.2
	lzma-sys-0.1.17
	match_cfg-0.1.0
	matches-0.1.9
	memchr-2.4.1
	memchr-2.5.0
	memoffset-0.6.4
	mime-0.3.16
	mime_guess-2.0.4
	miniz_oxide-0.4.4
	miniz_oxide-0.5.3
	mio-0.7.14
	mio-0.8.4
	miow-0.3.7
	native-tls-0.2.10
	ntapi-0.3.6
	num_cpus-1.13.0
	num_cpus-1.13.1
	num-integer-0.1.44
	num-traits-0.2.14
	once_cell-1.12.0
	once_cell-1.9.0
	openssl-0.10.40
	openssl-macros-0.1.0
	openssl-probe-0.1.4
	openssl-probe-0.1.5
	openssl-src-111.21.0+1.1.1p
	openssl-sys-0.9.74
	os_pipe-0.9.2
	os_str_bytes-6.0.0
	output_vt100-0.1.2
	parking_lot-0.11.2
	parking_lot_core-0.8.5
	percent-encoding-2.1.0
	pin-project-lite-0.2.7
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.20
	pkg-config-0.3.25
	ppv-lite86-0.2.16
	pretty_assertions-1.1.0
	proc-macro2-1.0.29
	proc-macro2-1.0.40
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	psl-types-2.0.10
	publicsuffix-2.1.1
	quick-error-1.2.3
	quote-1.0.10
	quote-1.0.20
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	rayon-1.5.1
	rayon-core-1.9.1
	redox_syscall-0.2.10
	redox_syscall-0.2.13
	redox_users-0.4.0
	regex-1.5.4
	regex-1.5.6
	regex-automata-0.1.10
	regex-syntax-0.6.25
	regex-syntax-0.6.26
	remove_dir_all-0.5.3
	resolv-conf-0.7.0
	ring-0.16.20
	rle-decode-fast-1.0.3
	rustc_version-0.2.3
	rustls-0.20.2
	rustls-0.20.6
	rustls-native-certs-0.6.1
	rustls-native-certs-0.6.2
	rustls-pemfile-0.2.1
	rustls-pemfile-1.0.0
	ryu-1.0.10
	ryu-1.0.5
	schannel-0.1.19
	schannel-0.1.20
	scoped-tls-1.0.0
	scopeguard-1.1.0
	sct-0.7.0
	security-framework-2.4.2
	security-framework-2.6.1
	security-framework-sys-2.4.2
	security-framework-sys-2.6.1
	semver-0.9.0
	semver-1.0.5
	semver-parser-0.7.0
	serde-1.0.136
	serde-1.0.137
	serde_derive-1.0.136
	serde_derive-1.0.137
	serde_json-1.0.79
	serde_json-1.0.81
	serde_urlencoded-0.7.0
	serde_urlencoded-0.7.1
	serde_yaml-0.8.21
	serial_test-0.5.1
	serial_test_derive-0.5.1
	sha1-0.6.1
	sha1_smol-1.0.0
	shared_child-0.3.5
	shell-escape-0.1.5
	similar-2.1.0
	slab-0.4.5
	slab-0.4.6
	smallvec-1.7.0
	smallvec-1.8.0
	socket2-0.3.19
	socket2-0.4.2
	socket2-0.4.4
	spin-0.5.2
	standback-0.2.17
	stdweb-0.4.20
	stdweb-derive-0.5.3
	stdweb-internal-macros-0.2.9
	stdweb-internal-runtime-0.1.5
	strsim-0.10.0
	syn-1.0.78
	syn-1.0.98
	sysinfo-0.23.2
	tar-0.4.38
	tempfile-3.3.0
	termcolor-1.1.2
	termcolor-1.1.3
	terminal_size-0.1.17
	test-log-0.2.8
	textwrap-0.14.2
	thiserror-1.0.30
	thiserror-1.0.31
	thiserror-impl-1.0.30
	thiserror-impl-1.0.31
	time-0.1.44
	time-0.2.27
	time-macros-0.1.1
	time-macros-impl-0.1.2
	tinyvec-1.5.0
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-1.14.0
	tokio-1.19.2
	tokio-macros-1.8.0
	tokio-native-tls-0.3.0
	tokio-rustls-0.23.1
	tokio-rustls-0.23.4
	tokio-socks-0.5.1
	tokio-util-0.6.10
	tokio-util-0.6.9
	tokio-util-0.7.3
	tower-service-0.3.1
	tower-service-0.3.2
	tracing-0.1.29
	tracing-0.1.35
	tracing-core-0.1.21
	tracing-core-0.1.28
	trust-dns-proto-0.20.4
	trust-dns-resolver-0.20.4
	try-lock-0.2.3
	unicase-2.6.0
	unicode-bidi-0.3.6
	unicode-bidi-0.3.8
	unicode-ident-1.0.1
	unicode-normalization-0.1.19
	unicode-xid-0.2.2
	unindent-0.1.7
	untrusted-0.7.1
	url-2.2.2
	vcpkg-0.2.15
	version_check-0.9.3
	version_check-0.9.4
	vswhom-0.1.0
	vswhom-sys-0.1.0
	want-0.3.0
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.78
	wasm-bindgen-0.2.81
	wasm-bindgen-backend-0.2.78
	wasm-bindgen-backend-0.2.81
	wasm-bindgen-futures-0.4.28
	wasm-bindgen-futures-0.4.31
	wasm-bindgen-macro-0.2.78
	wasm-bindgen-macro-0.2.81
	wasm-bindgen-macro-support-0.2.78
	wasm-bindgen-macro-support-0.2.81
	wasm-bindgen-shared-0.2.78
	wasm-bindgen-shared-0.2.81
	wasm-bindgen-test-0.3.31
	wasm-bindgen-test-macro-0.3.31
	webpki-0.22.0
	webpki-roots-0.22.1
	webpki-roots-0.22.3
	web-sys-0.3.55
	web-sys-0.3.58
	widestring-0.4.3
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows-sys-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
	winreg-0.10.1
	winreg-0.6.2
	winreg-0.7.0
	xattr-0.2.2
	xz2-0.1.6
	yaml-rust-0.4.5
	zip-0.5.13
"

inherit cargo bash-completion-r1

DESCRIPTION="Fast and simple Node.js version manager"
HOMEPAGE="https://github.com/Schniz/fnm"
REQWEST_COMMIT="d92d2aa3ce4667faa38454c8dae4fa9f72b91b71"
SRC_URI="
	https://github.com/Schniz/fnm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/seanmonstar/reqwest/archive/${REQWEST_COMMIT}.tar.gz -> reqwest-${REQWEST_COMMIT}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="Apache-2.0 BSD GPL-3 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

PROPERTIES="test_network"
RESTRICT="!test? ( test )"

DEPEND="|| ( >=app-shells/bash-3.0:* app-shells/zsh app-shells/fish )"
RDEPEND="${DEPEND}"
BDEPEND="
	test? (
		>=app-shells/bash-3.0:*
		app-shells/zsh
		app-shells/fish
	)
"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_prepare() {
	eapply "${FILESDIR}/${P}-cargo.patch"
	sed -i "s|@@REQWEST_PATH@@|\"${WORKDIR}/reqwest-${REQWEST_COMMIT}\"|g" "${S}/Cargo.toml" || die "Cannot patch reqwuest cargo dependency"

	# Skip testing against PowerShell and WinCmd
	eapply "${FILESDIR}/${P}-skip-windows-related-tests.patch"

	# https://bugs.gentoo.org/854366
	eapply "${FILESDIR}/${P}-skip-npm-installing-tests.patch"

	default
}

src_install() {
	cargo_src_install

	"${D}"/usr/bin/fnm completions --shell bash > fnm.bash-completion || die "Cannot generate bash completions"
	newbashcomp fnm.bash-completion fnm

	"${D}"/usr/bin/fnm completions --shell zsh > fnm.zsh-completion || die "Cannot generate zsh completions"
	insinto /usr/share/zsh/site-functions
	newins fnm.zsh-completion _fnm

	"${D}"/usr/bin/fnm completions --shell fish > fnm.fish-completion || die "Cannot generate fish completions"
	insinto /usr/share/fish/vendor_completions.d/
	newins fnm.fish-completion fnm.fish

	dodoc CHANGELOG.md README.md
}
