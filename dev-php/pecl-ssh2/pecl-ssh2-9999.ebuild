# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

PHP_EXT_NAME="ssh2"

USE_PHP="php8-2 php8-3"
EGIT_REPO_URI="https://github.com/php/pecl-networking-ssh2.git"

inherit php-ext-source-r3 git-r3

DESCRIPTION="PHP bindings for the libssh2 library"
HOMEPAGE="https://pecl.php.net/package/ssh2"
LICENSE="PHP-3.01"
SLOT="7"
KEYWORDS=""
# Upstream notes say there are errors with gcrypt backend
DEPEND=">=net-libs/libssh2-1.2[-gcrypt]"
RDEPEND="${DEPEND}"
