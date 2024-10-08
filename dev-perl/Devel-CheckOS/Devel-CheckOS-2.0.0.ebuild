# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=DCANTRELL
DIST_VERSION=2.00
inherit perl-module

DESCRIPTION="Check what OS we're running on"

LICENSE="GPL-2 Artistic Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"

RDEPEND="
	>=dev-perl/File-Find-Rule-0.280.0
"
BDEPEND="
	${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.640.0
	test? (
		>=virtual/perl-File-Temp-0.190.0
		>=virtual/perl-Test-Simple-0.880.0
		dev-perl/Test-Warnings
	)
"

PERL_RM_FILES=(
	"t/pod.t"
)
