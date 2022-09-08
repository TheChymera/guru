# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.1

EAPI=8

CRATES="
	aho-corasick-0.7.18
	anyhow-1.0.57
	arc-swap-1.5.0
	autocfg-1.1.0
	bitflags-1.3.2
	bstr-0.2.17
	bytecount-0.6.2
	bytes-1.1.0
	cassowary-0.3.0
	cc-1.0.73
	cfg-if-1.0.0
	chardetng-0.1.17
	chrono-0.4.19
	clipboard-win-4.4.1
	content_inspector-0.2.4
	crossbeam-utils-0.8.8
	crossterm-0.23.2
	crossterm_winapi-0.9.0
	dirs-next-2.0.0
	dirs-sys-next-0.1.2
	either-1.6.1
	encoding_rs-0.8.31
	encoding_rs_io-0.1.7
	error-code-2.3.1
	etcetera-0.4.0
	fern-0.6.1
	fnv-1.0.7
	form_urlencoded-1.0.1
	futures-core-0.3.21
	futures-executor-0.3.21
	futures-task-0.3.21
	futures-util-0.3.21
	fuzzy-matcher-0.3.7
	getrandom-0.2.6
	globset-0.4.8
	grep-matcher-0.1.5
	grep-regex-0.1.9
	grep-searcher-0.1.8
	hermit-abi-0.1.19
	idna-0.2.3
	ignore-0.4.18
	itoa-1.0.1
	jsonrpc-core-18.0.0
	lazy_static-1.4.0
	libc-0.2.121
	libloading-0.7.3
	lock_api-0.4.7
	log-0.4.17
	lsp-types-0.93.0
	matches-0.1.9
	memchr-2.4.1
	memmap2-0.3.1
	mio-0.8.2
	miow-0.3.7
	ntapi-0.3.7
	num-integer-0.1.44
	num-traits-0.2.14
	num_cpus-1.13.1
	once_cell-1.12.0
	parking_lot-0.12.0
	parking_lot_core-0.9.2
	percent-encoding-2.1.0
	pin-project-lite-0.2.8
	pin-utils-0.1.0
	proc-macro2-1.0.36
	pulldown-cmark-0.9.1
	quickcheck-1.0.3
	quote-1.0.17
	rand-0.8.5
	rand_core-0.6.3
	redox_syscall-0.2.13
	redox_users-0.4.3
	regex-1.5.6
	regex-automata-0.1.10
	regex-syntax-0.6.26
	retain_mut-0.1.7
	ropey-1.4.1
	ryu-1.0.9
	same-file-1.0.6
	scopeguard-1.1.0
	serde-1.0.137
	serde_derive-1.0.137
	serde_json-1.0.81
	serde_repr-0.1.7
	signal-hook-0.3.14
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	signal-hook-tokio-0.3.1
	similar-2.1.0
	slab-0.4.6
	slotmap-1.0.6
	smallvec-1.8.0
	smartstring-1.0.1
	smawk-0.3.1
	socket2-0.4.4
	static_assertions-1.1.0
	str-buf-1.0.5
	str_indices-0.3.2
	syn-1.0.90
	textwrap-0.15.0
	thiserror-1.0.31
	thiserror-impl-1.0.31
	thread_local-1.1.4
	threadpool-1.8.1
	tinyvec-1.5.1
	tinyvec_macros-0.1.0
	tokio-1.18.2
	tokio-macros-1.7.0
	tokio-stream-0.1.8
	toml-0.5.9
	tree-sitter-0.19.1
	tree-sitter-0.20.6
	unicase-2.6.0
	unicode-bidi-0.3.7
	unicode-general-category-0.5.1
	unicode-linebreak-0.1.2
	unicode-normalization-0.1.19
	unicode-segmentation-1.9.0
	unicode-width-0.1.9
	unicode-xid-0.2.2
	url-2.2.2
	version_check-0.9.4
	walkdir-2.3.2
	wasi-0.10.2+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	which-4.2.5
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.34.0
	windows_aarch64_msvc-0.34.0
	windows_i686_gnu-0.34.0
	windows_i686_msvc-0.34.0
	windows_x86_64_gnu-0.34.0
	windows_x86_64_msvc-0.34.0
"

inherit cargo

DESCRIPTION="A post-modern text editor."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/helix-editor/helix"
SRC_URI="
	https://github.com/helix-editor/helix/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
	"
LANGUAGES=(
	"bash https://github.com/tree-sitter/tree-sitter-bash 275effdfc0edce774acf7d481f9ea195c6c403cd"
	"c https://github.com/tree-sitter/tree-sitter-c f05e279aedde06a25801c3f2b2cc8ac17fac52ae"
	"c-sharp https://github.com/tree-sitter/tree-sitter-c-sharp 53a65a908167d6556e1fcdb67f1ee62aac101dda"
	"cairo https://github.com/archseer/tree-sitter-cairo 5155c6eb40db6d437f4fa41b8bcd8890a1c91716"
	"cmake https://github.com/uyha/tree-sitter-cmake f6616f1e417ee8b62daf251aa1daa5d73781c596"
	"comment https://github.com/stsewd/tree-sitter-comment 5dd3c62f1bbe378b220fe16b317b85247898639e"
	"cpon https://github.com/fvacek/tree-sitter-cpon cc6a22b1fa8917c2d041af399f19f34a0a9d94ff"
	"cpp https://github.com/tree-sitter/tree-sitter-cpp e8dcc9d2b404c542fd236ea5f7208f90be8a6e89"
	"css https://github.com/tree-sitter/tree-sitter-css 94e10230939e702b4fa3fa2cb5c3bc7173b95d07"
	"dart https://github.com/UserNobody14/tree-sitter-dart 6a25376685d1d47968c2cef06d4db8d84a70025e"
	"devicetree https://github.com/joelspadin/tree-sitter-devicetree 877adbfa0174d25894c40fa75ad52d4515a36368"
	"dockerfile https://github.com/camdencheek/tree-sitter-dockerfile 7af32bc04a66ab196f5b9f92ac471f29372ae2ce"
	"eex https://github.com/connorlay/tree-sitter-eex f742f2fe327463335e8671a87c0b9b396905d1d1"
	"elixir https://github.com/elixir-lang/tree-sitter-elixir 1dabc1c790e07115175057863808085ea60dd08a"
	"elm https://github.com/elm-tooling/tree-sitter-elm bd50ccf66b42c55252ac8efc1086af4ac6bab8cd"
	"embedded-template https://github.com/tree-sitter/tree-sitter-embedded-template d21df11b0ecc6fd211dbe11278e92ef67bd17e97"
	"erlang https://github.com/the-mikedavis/tree-sitter-erlang 6cd8f956ada445b277de1581b5328ae8e8be9aac"
	"fish https://github.com/ram02z/tree-sitter-fish 04e54ab6585dfd4fee6ddfe5849af56f101b6d4f"
	"gdscript https://github.com/PrestonKnopp/tree-sitter-gdscript 2a6abdaa47fcb91397e09a97c7433fd995ea46c6"
	"git-commit https://github.com/the-mikedavis/tree-sitter-git-commit 7ae23de633de41f8f5b802f6f05b6596df6d00c1"
	"git-config https://github.com/the-mikedavis/tree-sitter-git-config 0e4f0baf90b57e5aeb62dcdbf03062c6315d43ea"
	"git-diff https://github.com/the-mikedavis/tree-sitter-diff c12e6ecb54485f764250556ffd7ccb18f8e2942b"
	"gitattributes https://github.com/mtoohey31/tree-sitter-gitattributes 3dd50808e3096f93dccd5e9dc7dc3dba2eb12dc4"
	"gitignore https://github.com/shunsambongi/tree-sitter-gitignore f4685bf11ac466dd278449bcfe5fd014e94aa504"
	"gleam https://github.com/gleam-lang/tree-sitter-gleam d7861b2a4b4d594c58bb4f1be5f1f4ee4c67e5c3"
	"glsl https://github.com/theHamsta/tree-sitter-glsl 88408ffc5e27abcffced7010fc77396ae3636d7e"
	"go https://github.com/tree-sitter/tree-sitter-go 0fa917a7022d1cd2e9b779a6a8fc5dc7fad69c75"
	"gomod https://github.com/camdencheek/tree-sitter-go-mod e8f51f8e4363a3d9a427e8f63f4c1bbc5ef5d8d0"
	"gowork https://github.com/omertuc/tree-sitter-go-work 6dd9dd79fb51e9f2abc829d5e97b15015b6a8ae2"
	"graphql https://github.com/bkegley/tree-sitter-graphql 5e66e961eee421786bdda8495ed1db045e06b5fe"
	"hare https://git.sr.ht/~ecmma/tree-sitter-hare bc26a6a949f2e0d98b7bfc437d459b250900a165"
	"haskell https://github.com/tree-sitter/tree-sitter-haskell b6ec26f181dd059eedd506fa5fbeae1b8e5556c8"
	"hcl https://github.com/MichaHoffmann/tree-sitter-hcl 3cb7fc28247efbcb2973b97e71c78838ad98a583"
	"heex https://github.com/phoenixframework/tree-sitter-heex 592e22292a367312c35e13de7fdb888f029981d6"
	"html https://github.com/tree-sitter/tree-sitter-html d93af487cc75120c89257195e6be46c999c6ba18"
	"iex https://github.com/elixir-lang/tree-sitter-iex 39f20bb51f502e32058684e893c0c0b00bb2332c"
	"java https://github.com/tree-sitter/tree-sitter-java bd6186c24d5eb13b4623efac9d944dcc095c0dad"
	"javascript https://github.com/tree-sitter/tree-sitter-javascript 4a95461c4761c624f2263725aca79eeaefd36cad"
	"json https://github.com/tree-sitter/tree-sitter-json 65bceef69c3b0f24c0b19ce67d79f57c96e90fcb"
	"julia https://github.com/tree-sitter/tree-sitter-julia 12ea597262125fc22fd2e91aa953ac69b19c26ca"
	"kotlin https://github.com/fwcd/tree-sitter-kotlin a4f71eb9b8c9b19ded3e0e9470be4b1b77c2b569"
	"latex https://github.com/latex-lsp/tree-sitter-latex 7f720661de5316c0f8fee956526d4002fa1086d8"
	"lean https://github.com/Julian/tree-sitter-lean d98426109258b266e1e92358c5f11716d2e8f638"
	"ledger https://github.com/cbarrete/tree-sitter-ledger 0cdeb0e51411a3ba5493662952c3039de08939ca"
	"llvm https://github.com/benwilliamgraham/tree-sitter-llvm 3b213925b9c4f42c1acfe2e10bfbb438d9c6834d"
	"llvm-mir https://github.com/Flakebi/tree-sitter-llvm-mir 06fabca19454b2dc00c1b211a7cb7ad0bc2585f1"
	"lua https://github.com/nvim-treesitter/tree-sitter-lua 6f5d40190ec8a0aa8c8410699353d820f4f7d7a6"
	"make https://github.com/alemuller/tree-sitter-make a4b9187417d6be349ee5fd4b6e77b4172c6827dd"
	"markdown https://github.com/MDeiml/tree-sitter-markdown ad8c32917a16dfbb387d1da567bf0c3fb6fffde2"
	"meson https://github.com/bearcove/tree-sitter-meson feea83be9225842490066522ced2d13eb9cce0bd"
	"nickel https://github.com/nickel-lang/tree-sitter-nickel c4dd1420b6cfeb6103d38eb1ce5195eb81197edc"
	"nix https://github.com/cstrahan/tree-sitter-nix 50f38ceab667f9d482640edfee803d74f4edeba5"
	"nu https://github.com/LhKipp/tree-sitter-nu db4e990b78824c8abef3618e0f93b7fe1e8f4c0d"
	"ocaml https://github.com/tree-sitter/tree-sitter-ocaml 23d419ba45789c5a47d31448061557716b02750a"
	"ocaml-interface https://github.com/tree-sitter/tree-sitter-ocaml 23d419ba45789c5a47d31448061557716b02750a"
	"odin https://github.com/MineBill/tree-sitter-odin da885f4a387f169b9b69fe0968259ee257a8f69a"
	"org https://github.com/milisims/tree-sitter-org 1c3eb533a9cf6800067357b59e03ac3f91fc3a54"
	"perl https://github.com/ganezdragon/tree-sitter-perl 0ac2c6da562c7a2c26ed7e8691d4a590f7e8b90a"
	"php https://github.com/tree-sitter/tree-sitter-php 57f855461aeeca73bd4218754fb26b5ac143f98f"
	"protobuf https://github.com/yusdacra/tree-sitter-protobuf 19c211a01434d9f03efff99f85e19f967591b175"
	"python https://github.com/tree-sitter/tree-sitter-python d6210ceab11e8d812d4ab59c07c81458ec6e5184"
	"r https://github.com/r-lib/tree-sitter-r cc04302e1bff76fa02e129f332f44636813b0c3c"
	"git-rebase https://github.com/the-mikedavis/tree-sitter-git-rebase 332dc528f27044bc4427024dbb33e6941fc131f2"
	"regex https://github.com/tree-sitter/tree-sitter-regex e1cfca3c79896ff79842f057ea13e529b66af636"
	"rescript https://github.com/jaredramirez/tree-sitter-rescript 4cd7ba91696886fdaca086fb32b5fd8cc294a129"
	"ruby https://github.com/tree-sitter/tree-sitter-ruby dfff673b41df7fadcbb609c6338f38da3cdd018e"
	"rust https://github.com/tree-sitter/tree-sitter-rust a360da0a29a19c281d08295a35ecd0544d2da211"
	"scala https://github.com/tree-sitter/tree-sitter-scala 0a3dd53a7fc4b352a538397d054380aaa28be54c"
	"scheme https://github.com/6cdh/tree-sitter-scheme 27fb77db05f890c2823b4bd751c6420378df146b"
	"solidity https://github.com/slinlee/tree-sitter-solidity f3a002274744e859bf64cf3524985f8c31ea84fd"
	"sql https://github.com/DerekStride/tree-sitter-sql 0caa7fa2ee00e0b770493a79d4efacc1fc376cc5"
	"sshclientconfig https://github.com/metio/tree-sitter-ssh-client-config 769d7a01a2e5493b4bb5a51096c6bf4be130b024"
	"svelte https://github.com/Himujjal/tree-sitter-svelte 349a5984513b4a4a9e143a6e746120c6ff6cf6ed"
	"swift https://github.com/Dispersia/tree-sitter-swift e75240f89bb3bfd3396155859ae364e5c58d7377"
	"tablegen https://github.com/Flakebi/tree-sitter-tablegen 568dd8a937347175fd58db83d4c4cdaeb6069bd2"
	"toml https://github.com/ikatyang/tree-sitter-toml 7cff70bbcbbc62001b465603ca1ea88edd668704"
	"tsq https://github.com/tree-sitter/tree-sitter-tsq b665659d3238e6036e22ed0e24935e60efb39415"
	"tsx https://github.com/tree-sitter/tree-sitter-typescript 3e897ea5925f037cfae2e551f8e6b12eec2a201a"
	"twig https://github.com/eirabben/tree-sitter-twig b7444181fb38e603e25ea8fcdac55f9492e49c27"
	"typescript https://github.com/tree-sitter/tree-sitter-typescript 3e897ea5925f037cfae2e551f8e6b12eec2a201a"
	"vala https://github.com/vala-lang/tree-sitter-vala c9eea93ba2ec4ec1485392db11945819779745b3"
	"verilog https://github.com/andreytkachenko/tree-sitter-verilog 514d8d70593d29ef3ef667fa6b0e504ae7c977e3"
	"vue https://github.com/ikatyang/tree-sitter-vue 91fe2754796cd8fba5f229505a23fa08f3546c06"
	"wgsl https://github.com/szebniok/tree-sitter-wgsl f00ff52251edbd58f4d39c9c3204383253032c11"
	"yaml https://github.com/ikatyang/tree-sitter-yaml 0e36bed171768908f331ff7dff9d956bae016efb"
	"zig https://github.com/maxxnino/tree-sitter-zig 93331b8bd8b4ebee2b575490b2758f16ad4e9f30"
)

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 ISC MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc +grammar"

QA_FLAGS_IGNORED="
	usr/bin/hx
"

language_uris() {
	for line in "${LANGUAGES[@]}"; do
		read -r name url commit <<< "${line}"

		SRC_URI+=" grammar? ( ${url}/archive/${commit}.tar.gz -> ${url##*/}-${commit}.tar.gz )"
	done
}

language_uris

src_prepare() {
	if use grammar; then
		for line in "${LANGUAGES[@]}"; do
			read -r name url commit <<< "${line}"

			mkdir -p "${S}/runtime/grammars/sources/${name}" || die
			cp -r "${WORKDIR}"/${url##*/}-${commit}/* "${S}/runtime/grammars/sources/${name}" || die
		done
	fi

	eapply_user
}

src_compile() {
	export HELIX_DISABLE_AUTO_GRAMMAR_BUILD=1
	export HELIX_RUNTIME="${S}/runtime"
	cargo_src_compile
	use grammar && ( target/release/hx --grammar build || die )
}

src_install() {
	use grammar && ( rm -rf "${S}/runtime/grammars/sources" || die )
	insinto /usr/share/helix
	doins -r runtime
	use doc && dodoc README.md CHANGELOG.md
	use doc && dodoc -r docs/
	cargo_src_install --path helix-term
}
