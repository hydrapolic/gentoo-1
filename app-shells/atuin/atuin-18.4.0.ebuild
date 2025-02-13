# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	aead@0.5.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.14
	anstyle-parse@0.2.4
	anstyle-query@1.1.0
	anstyle-wincon@3.0.3
	anstyle@1.0.7
	anyhow@1.0.86
	approx@0.5.1
	arboard@3.4.0
	arc-swap@1.7.1
	argon2@0.5.3
	async-stream-impl@0.3.5
	async-stream@0.3.5
	async-trait@0.1.81
	atoi@2.0.0
	atomic-waker@1.1.2
	autocfg@1.3.0
	axum-core@0.4.3
	axum-server@0.7.1
	axum@0.7.5
	backtrace@0.3.73
	base64@0.21.7
	base64@0.22.1
	base64ct@1.6.0
	beef@0.5.2
	bitflags@1.3.2
	bitflags@2.6.0
	blake2@0.10.6
	block-buffer@0.10.4
	block2@0.5.1
	bumpalo@3.16.0
	by_address@1.2.1
	bytemuck@1.16.1
	byteorder@1.5.0
	bytes@1.6.0
	cassowary@0.3.0
	castaway@0.2.3
	cc@1.1.15
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	chacha20@0.9.1
	chrono@0.4.38
	cipher@0.4.4
	clap@4.5.9
	clap_builder@4.5.9
	clap_complete@4.5.8
	clap_complete_nushell@4.5.4
	clap_derive@4.5.8
	clap_lex@0.7.1
	clipboard-win@5.4.0
	colorchoice@1.0.1
	colored@2.1.0
	compact_str@0.7.1
	concurrent-queue@2.5.0
	condtype@1.3.0
	config@0.13.4
	console@0.15.8
	const-oid@0.9.6
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.2
	cpufeatures@0.2.12
	crc-catalog@2.4.0
	crc32fast@1.4.2
	crc@3.2.1
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crypto-common@0.1.6
	crypto_secretbox@0.1.1
	curve25519-dalek-derive@0.1.1
	curve25519-dalek@4.1.3
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	dashmap@5.5.3
	der@0.7.9
	deranged@0.3.11
	derive-new@0.6.0
	diff@0.1.13
	digest@0.10.7
	directories@5.0.1
	dirs-sys@0.4.1
	dirs@5.0.1
	divan-macros@0.1.14
	divan@0.1.14
	dlib@0.5.2
	dotenvy@0.15.7
	downcast-rs@1.2.1
	ed25519-dalek@2.1.1
	ed25519@2.2.3
	either@1.13.0
	encode_unicode@0.3.6
	encoding_rs@0.8.34
	env_filter@0.1.0
	env_logger@0.11.5
	equivalent@1.0.1
	errno@0.3.9
	error-code@3.2.0
	etcetera@0.8.0
	event-listener@5.3.1
	eyre@0.6.12
	fast-srgb8@1.0.0
	fastrand@2.1.0
	fdeflate@0.3.4
	fiat-crypto@0.2.9
	filedescriptor@0.8.2
	fixedbitset@0.4.2
	flate2@1.0.30
	flume@0.11.0
	fnv@1.0.7
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	form_urlencoded@1.2.1
	fs-err@2.11.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-intrusive@0.5.0
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	fuzzy-matcher@0.3.7
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.15
	gimli@0.29.0
	h2@0.3.26
	h2@0.4.5
	hashbrown@0.12.3
	hashbrown@0.13.1
	hashbrown@0.14.5
	hashlink@0.9.1
	heck@0.5.0
	hermit-abi@0.3.9
	hex@0.4.3
	hkdf@0.12.4
	hmac@0.12.1
	home@0.5.9
	http-body-util@0.1.2
	http-body@0.4.6
	http-body@1.0.0
	http@0.2.12
	http@1.1.0
	httparse@1.9.4
	httpdate@1.0.3
	humantime@2.1.0
	hyper-rustls@0.24.2
	hyper-rustls@0.27.2
	hyper-timeout@0.5.1
	hyper-util@0.1.6
	hyper@0.14.30
	hyper@1.4.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	ident_case@1.0.1
	idna@0.5.0
	image@0.25.1
	indenter@0.3.3
	indexmap@1.9.3
	indexmap@2.2.6
	indicatif@0.17.8
	inout@0.1.3
	instant@0.1.13
	interim@0.1.2
	ipnet@2.9.0
	is_terminal_polyfill@1.70.0
	iso8601@0.6.1
	itertools@0.13.0
	itoa@1.0.11
	jpeg-decoder@0.3.1
	js-sys@0.3.69
	lazy_static@1.5.0
	libc@0.2.155
	libloading@0.8.4
	libm@0.2.8
	libredox@0.1.3
	libsqlite3-sys@0.30.1
	linux-raw-sys@0.4.14
	listenfd@1.0.1
	lock_api@0.4.12
	log@0.4.22
	logos-codegen@0.14.0
	logos-derive@0.14.0
	logos@0.14.0
	lru@0.12.3
	mach2@0.4.2
	matchers@0.1.0
	matchit@0.7.3
	md-5@0.10.6
	memchr@2.7.4
	metrics-exporter-prometheus@0.12.2
	metrics-macros@0.7.1
	metrics-util@0.15.1
	metrics@0.21.1
	miette-derive@7.2.0
	miette@7.2.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.4
	minspan@0.1.1
	mio@0.8.11
	multimap@0.10.0
	nix@0.28.0
	nom@7.1.3
	ntapi@0.4.1
	nu-ansi-term@0.46.0
	nu-ansi-term@0.50.0
	num-bigint-dig@0.8.4
	num-conv@0.1.0
	num-integer@0.1.46
	num-iter@0.1.45
	num-traits@0.2.19
	num_cpus@1.16.0
	num_threads@0.1.7
	number_prefix@0.4.0
	objc-sys@0.3.5
	objc2-app-kit@0.2.2
	objc2-core-data@0.2.2
	objc2-core-image@0.2.2
	objc2-encode@4.0.3
	objc2-foundation@0.2.2
	objc2-metal@0.2.2
	objc2-quartz-core@0.2.2
	objc2@0.5.2
	object@0.36.1
	once_cell@1.19.0
	opaque-debug@0.3.1
	openssl-probe@0.1.5
	option-ext@0.2.0
	os_pipe@1.2.0
	overload@0.1.1
	palette@0.7.6
	palette_derive@0.7.6
	parking@2.2.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	password-hash@0.5.0
	paste@1.0.15
	pathdiff@0.2.1
	pbkdf2@0.11.0
	pem-rfc7468@0.7.0
	percent-encoding@2.3.1
	petgraph@0.6.5
	phf@0.11.2
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.11.2
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.30
	png@0.17.13
	poly1305@0.8.0
	portable-atomic@1.6.0
	postmark@0.10.2
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	pretty_assertions@1.4.0
	prettyplease@0.2.20
	proc-macro2@1.0.86
	prost-build@0.13.1
	prost-derive@0.13.1
	prost-reflect@0.14.0
	prost-types@0.13.1
	prost@0.13.1
	protox-parse@0.7.0
	protox@0.7.0
	quanta@0.11.1
	quick-xml@0.34.0
	quinn-proto@0.11.8
	quinn-udp@0.5.4
	quinn@0.11.3
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ratatui@0.27.0
	raw-cpuid@10.7.0
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.4.1
	redox_syscall@0.5.2
	redox_users@0.4.5
	regex-automata@0.1.10
	regex-automata@0.4.7
	regex-lite@0.1.6
	regex-syntax@0.6.29
	regex-syntax@0.8.4
	regex@1.10.5
	reqwest@0.11.27
	reqwest@0.12.5
	ring@0.17.8
	rmp@0.8.14
	rpassword@7.3.1
	rsa@0.9.6
	rtoolbox@0.0.2
	runtime-format@0.1.3
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc-hash@2.0.0
	rustc_version@0.4.0
	rustix@0.38.34
	rustls-native-certs@0.6.3
	rustls-pemfile@1.0.4
	rustls-pemfile@2.1.2
	rustls-pki-types@1.8.0
	rustls-webpki@0.101.7
	rustls-webpki@0.102.6
	rustls@0.21.12
	rustls@0.23.12
	rustversion@1.0.17
	rusty_paserk@0.4.0
	rusty_paseto@0.7.1
	ryu@1.0.18
	salsa20@0.10.2
	schannel@0.1.23
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sct@0.7.1
	security-framework-sys@2.11.0
	security-framework@2.11.0
	semver@1.0.23
	serde@1.0.204
	serde_derive@1.0.204
	serde_json@1.0.120
	serde_path_to_error@0.1.16
	serde_regex@1.1.0
	serde_urlencoded@0.7.1
	serde_with@3.8.3
	serde_with_macros@3.8.3
	sha1@0.10.6
	sha2@0.10.8
	sharded-slab@0.1.7
	shellexpand@3.1.0
	shlex@1.3.0
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	signature@2.2.0
	simd-adler32@0.3.7
	siphasher@0.3.11
	sketches-ddsketch@0.2.2
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.7
	spin@0.9.8
	spki@0.7.3
	sql-builder@3.1.1
	sqlformat@0.2.4
	sqlx-core@0.8.1
	sqlx-macros-core@0.8.1
	sqlx-macros@0.8.1
	sqlx-mysql@0.8.1
	sqlx-postgres@0.8.1
	sqlx-sqlite@0.8.1
	sqlx@0.8.1
	stability@0.2.1
	static_assertions@1.1.0
	stringprep@0.1.5
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	syn@2.0.70
	sync_wrapper@0.1.2
	sync_wrapper@1.0.1
	sysinfo@0.30.13
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tempfile@3.10.1
	terminal_size@0.3.0
	testing_logger@0.1.1
	thiserror-impl@1.0.62
	thiserror@1.0.62
	thread_local@1.1.8
	tiff@0.9.1
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tiny-bip39@1.0.0
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tokio-macros@2.3.0
	tokio-rustls@0.24.1
	tokio-rustls@0.26.0
	tokio-stream@0.1.15
	tokio-util@0.7.11
	tokio@1.38.0
	toml@0.5.11
	tonic-build@0.12.1
	tonic-types@0.12.0
	tonic@0.12.2
	tower-http@0.5.2
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing-tree@0.4.0
	tracing@0.1.40
	tree_magic_mini@3.1.5
	try-lock@0.2.5
	typed-builder-macro@0.18.2
	typed-builder@0.18.2
	typenum@1.17.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-properties@0.1.1
	unicode-segmentation@1.11.0
	unicode-truncate@1.1.0
	unicode-width@0.1.13
	unicode_categories@0.1.1
	universal-hash@0.5.1
	untrusted@0.9.0
	url@2.5.2
	urlencoding@2.1.3
	utf8parse@0.2.2
	uuid@1.10.0
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasite@0.1.0
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	wayland-backend@0.3.5
	wayland-client@0.31.4
	wayland-protocols-wlr@0.2.0
	wayland-protocols@0.31.2
	wayland-scanner@0.31.3
	wayland-sys@0.31.3
	web-sys@0.3.69
	webpki-roots@0.26.3
	weezl@0.1.8
	whoami@1.5.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winreg@0.50.0
	winreg@0.52.0
	wl-clipboard-rs@0.8.1
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	yansi@0.5.1
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zeroize@1.8.1
	zeroize_derive@1.4.2
"

RUST_MIN_VER="1.82"

inherit cargo greadme shell-completion systemd

DESCRIPTION="Shell history manager supporting encrypted synchronisation"
HOMEPAGE="https://atuin.sh https://github.com/atuinsh/atuin"
SRC_URI="
	https://github.com/atuinsh/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
# - openssl for ring crate
LICENSE+=" Apache-2.0 BSD Boost-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 openssl"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~riscv"
IUSE="+client +daemon server test +sync"
RESTRICT="!test? ( test )"
REQUIRED_USE="
	|| ( client server )
	sync? ( client )
	test? ( client server sync )
"
RDEPEND="server? ( acct-user/atuin )"
DEPEND="test? ( dev-db/postgresql )"

QA_FLAGS_IGNORED="usr/bin/${PN}"

GREADME_DISABLE_AUTOFORMAT=1

DOCS=(
	CONTRIBUTING.md
	CONTRIBUTORS
	README.md
)

src_configure() {
	local myfeatures=(
		$(usev client)
		$(usev daemon)
		$(usev server)
		$(usev sync)
	)
	cargo_src_configure --no-default-features
}

src_compile() {
	cargo_src_compile

	ATUIN_BIN="$(cargo_target_dir)/${PN}"

	# Prepare shell completion generation
	mkdir completions || die
	local shell
	for shell in bash fish zsh; do
		"${ATUIN_BIN}" gen-completions \
					 -s ${shell} \
					 -o completions \
			|| die
	done

	if ! use client; then
		return 0
	fi

	mkdir shell-init || die
	for shell in bash fish zsh; do
		"${ATUIN_BIN}" init ${shell} > shell-init/${shell} || die
	done
}

src_test() {
	local postgres_dir="${T}"/postgres
	initdb "${postgres_dir}" || die

	local port=11123
	# -h '' → only socket connections allowed.
	postgres -D "${postgres_dir}" \
			 -k "${postgres_dir}" \
			 -p "${port}" &
	local postgres_pid=${!}

	local timeout_secs=30
	timeout "${timeout_secs}" bash -c \
			'until printf "" >/dev/tcp/${0}/${1} 2>> "${T}/portlog"; do sleep 1; done' \
			localhost "${port}" || die "Timeout waiting for postgres port ${port} to become available"

	psql -h localhost -p "${port}" -d postgres <<-EOF || die "Failed to configure postgres"
	create database atuin;
	create user atuin with encrypted password 'pass';
	grant all privileges on database atuin to atuin;
	\connect atuin
	grant all on schema public to atuin;
	EOF

	# Subshell so that postgres_pid is in scope when the trap is executed.
	(
		cleanup() {
			kill "${postgres_pid}" || die "failed to send SIGTERM to postgres"
		}
		trap cleanup EXIT

		ATUIN_DB_URI="postgres://atuin:pass@localhost:${port}/atuin" cargo_src_test
	)
}

src_install() {
	dobin "${ATUIN_BIN}"

	if use server; then
		systemd_dounit "${FILESDIR}/atuin.service"
	fi

	dodoc -r "${DOCS[@]}"

	newbashcomp "completions/${PN}.bash" "${PN}"
	dozshcomp "completions/_${PN}"
	dofishcomp "completions/${PN}.fish"

	if use daemon; then
		systemd_douserunit "${FILESDIR}"/atuin-daemon.{service,socket}
	fi

	if ! use client; then
		return 0
	fi

	insinto "/usr/share/${PN}"
	doins -r shell-init

	greadme_stdin <<-EOF
	Gentoo installs atuin's shell-init code under
	    /usr/share/atuin/shell-init/
	Therefore, instead of using, e.g., 'eval \"\$(atuin init zsh)\"' in
	your .zshrc you can simply put \"source /usr/share/atuin/shell-init/zsh\"
	there, which avoids the cost of forking a process.
EOF
}
