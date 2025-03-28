# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop toolchain-funcs

DESCRIPTION="A graphical multiple sequence alignment editor"
HOMEPAGE="http://pbil.univ-lyon1.fr/software/seaview.html"
SRC_URI="ftp://pbil.univ-lyon1.fr/pub/mol_phylogeny/seaview/archive/${PN}_${PV}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+xft"

RDEPEND="
	sci-biology/clustalw:2
	sci-biology/phyml
	|| (
		sci-libs/libmuscle
		sci-biology/muscle
	)
	sys-libs/zlib
	x11-libs/fltk:1=[xft(+)?]
	x11-libs/libX11
	xft? ( x11-libs/libXft )"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/${PN}"
PATCHES=(
	"${FILESDIR}"/${PN}-4.6-fno-common.patch
	"${FILESDIR}"/${PN}-4.6-Wreserved-user-defined-literal.patch
)

src_prepare() {
	default

	# respect CXXFLAGS (package uses them as CFLAGS)
	sed \
		-e "s:^CC.*:CC = $(tc-getCC):" \
		-e "s:^CXX.*:CXX = $(tc-getCXX):" \
		-e "s:\$(OPT):${CXXFLAGS}:" \
		-e "s:^OPT:#OPT:" \
		-e "s:^FLTK = .*$:FLTK = ${EPREFIX}/usr/include/fltk-1:" \
		-e "s:^#IFLTK .*:IFLTK = $(fltk-config --use-images --cflags):" \
		-e "s:^#LFLTK .*:LFLTK = $(fltk-config --use-images --ldflags):" \
		-e "s:^USE_XFT:#USE_XFT:" \
		-e "s:^#HELPFILE:HELPFILE:" \
		-e "s:/usr/share/doc/seaview/seaview.htm:${EPREFIX}/usr/share/seaview/seaview.htm:" \
		-e "s:^#PHYMLNAME:PHYMLNAME:" \
		-e 's:-lXinerama::g' \
		-e 's:-lpng::g' \
		-e 's:-ljpeg::g' \
		-e 's:-lfontconfig::g' \
		-i Makefile || die "sed failed while editing Makefile"

	if use xft; then
		sed \
			-e "s:^#USE_XFT .*:USE_XFT = -DUSE_XFT $($(tc-getPKG_CONFIG) --cflags xft):" \
			-e "s:-lXft:$($(tc-getPKG_CONFIG) --libs xft):" \
			-i Makefile || die "sed failed while editing Makefile to enable xft"
	else
		sed -i -e "s:-lXft::" Makefile || die
	fi
}

src_install() {
	dobin seaview

	# /usr/share/seaview/seaview.html is hardcoded in the binary, see Makefile
	insinto /usr/share/seaview
	doins example.nxs seaview.html

	insinto /usr/share/seaview/images
	doins seaview.xpm

	make_desktop_entry seaview Seaview

	doman seaview.1
}
