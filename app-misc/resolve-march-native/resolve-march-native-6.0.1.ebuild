# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1

DESCRIPTION="Resolve GCC flag -march=native"
HOMEPAGE="https://github.com/hartwork/resolve-march-native"
SRC_URI="https://github.com/hartwork/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~alpha ~amd64 arm64 ~x86"

RDEPEND="|| ( >=sys-devel/gcc-4.2 llvm-core/clang )"

distutils_enable_tests pytest
