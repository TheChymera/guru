# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
aho-corasick-0.7.18
anyhow-1.0.56
async-broadcast-0.3.4
async-channel-1.6.1
async-executor-1.4.1
async-io-1.6.0
async-lock-2.5.0
async-recursion-0.3.2
async-task-4.1.0
async-trait-0.1.52
atty-0.2.14
autocfg-1.1.0
bitflags-1.3.2
block-buffer-0.10.2
byteorder-1.4.3
bytes-1.1.0
cache-padded-1.2.0
cc-1.0.73
cfg-if-1.0.0
chrono-0.4.19
clap-3.1.1
clap_derive-3.1.0
concurrent-queue-1.2.2
cpufeatures-0.2.1
crypto-common-0.1.3
derivative-2.2.0
digest-0.10.3
easy-parallel-3.2.0
enumflags2-0.7.3
enumflags2_derive-0.7.3
env_logger-0.9.0
event-listener-2.5.2
fastrand-1.7.0
form_urlencoded-1.0.1
futures-0.3.21
futures-channel-0.3.21
futures-core-0.3.21
futures-executor-0.3.21
futures-io-0.3.21
futures-lite-1.12.0
futures-macro-0.3.21
futures-sink-0.3.21
futures-task-0.3.21
futures-util-0.3.21
generic-array-0.14.5
getrandom-0.2.5
hashbrown-0.11.2
heck-0.4.0
hermit-abi-0.1.19
hex-0.4.3
humantime-2.1.0
idna-0.2.3
indexmap-1.8.0
instant-0.1.12
ipnet-2.4.0
iptables-0.5.0
itoa-1.0.1
lazy_static-1.4.0
libc-0.2.121
lock_api-0.4.6
log-0.4.16
matches-0.1.9
memchr-2.4.1
memoffset-0.6.5
mio-0.8.0
miow-0.3.7
netlink-packet-core-0.4.2
netlink-packet-route-0.11.0
netlink-packet-utils-0.5.1
netlink-proto-0.9.2
netlink-sys-0.8.2
nix-0.22.3
nix-0.23.1
ntapi-0.3.7
num-integer-0.1.44
num-traits-0.2.14
num_cpus-1.13.1
once_cell-1.9.0
ordered-float-2.10.0
ordered-stream-0.0.1
os_str_bytes-6.0.0
parking-2.0.0
parking_lot-0.12.0
parking_lot_core-0.9.1
paste-1.0.6
percent-encoding-2.1.0
pin-project-lite-0.2.8
pin-utils-0.1.0
polling-2.2.0
ppv-lite86-0.2.16
proc-macro-crate-1.1.2
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.36
quote-1.0.15
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.6.3
redox_syscall-0.2.10
regex-1.5.4
regex-syntax-0.6.25
rtnetlink-0.9.1
ryu-1.0.9
same-file-1.0.6
scopeguard-1.1.0
serde-1.0.136
serde-value-0.7.0
serde_derive-1.0.136
serde_json-1.0.79
serde_repr-0.1.7
sha1-0.6.1
sha1_smol-1.0.0
sha2-0.10.2
signal-hook-registry-1.4.0
simple-error-0.2.3
slab-0.4.5
smallvec-1.8.0
socket2-0.4.4
static_assertions-1.1.0
strsim-0.10.0
syn-1.0.86
sysctl-0.4.4
termcolor-1.1.2
textwrap-0.14.2
thiserror-1.0.30
thiserror-impl-1.0.30
time-0.1.43
tinyvec-1.5.1
tinyvec_macros-0.1.0
tokio-1.17.0
tokio-macros-1.7.0
toml-0.5.8
typenum-1.15.0
unicode-bidi-0.3.7
unicode-normalization-0.1.19
unicode-xid-0.2.2
url-2.2.2
version_check-0.9.4
waker-fn-1.1.0
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
wepoll-ffi-0.1.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-sys-0.32.0
windows_aarch64_msvc-0.32.0
windows_i686_gnu-0.32.0
windows_i686_msvc-0.32.0
windows_x86_64_gnu-0.32.0
windows_x86_64_msvc-0.32.0
zbus-2.1.1
zbus_macros-2.1.1
zbus_names-2.1.0
zvariant-3.1.2
zvariant_derive-3.1.2
"

inherit cargo

DESCRIPTION="A container network stack"
HOMEPAGE="https://github.com/containers/netavark"
SRC_URI="$(cargo_crate_uris) https://github.com/containers/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-go/go-md2man
app-containers/aardvark-dns"
RDEPEND=""

src_compile() {
	emake || die "emake failed"
}

src_install() {
	go-md2man < docs/${PN}.1.md > docs/${PN}.1
	emake DESTDIR="${D}" PREFIX="/usr" install
}
