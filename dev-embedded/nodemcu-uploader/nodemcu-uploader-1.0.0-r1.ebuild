# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Simple tool for uploading files to the filesystem of an ESP8266 running NodeMCU"
HOMEPAGE="https://github.com/kmpm/nodemcu-uploader"
SRC_URI="
	https://github.com/kmpm/nodemcu-uploader/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/pyserial-3.4[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
	)
"

src_prepare() {
	# https://bugs.gentoo.org/796422
	sed -i -e 's:description-file:description_file:' setup.cfg || die

	distutils-r1_src_prepare
}

python_test() {
	"${EPYTHON}" -m unittest -v tests.get_tests ||
		die "Tests failed on ${EPYTHON}"
}
