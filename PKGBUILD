# Maintainer: condexpr01(Vito Devlin) <condexpr01@outlook.com>
PACKAGER='condexpr01(Vito Devlin) <condexpr01@outlook.com>'
pkgname=nvim-config-lazymiku
pkgver=2026.01.21.1
pkgrel=1
pkgdesc='nvim configuration files'
arch=('any')
url='https://github.com/condexpr01/nvim-config-lazymiku'

license=('MIT')

#depends=()
#makedepends=('pandoc' 'gzip' 'tmux' 'zsh')

source=('readme.md'
		'LICENSE.txt'
		'nvim-config-lazymiku-install'
	)

sha256sums=('SKIP' 'SKIP' 'SKIP')

prefix=${PREFIX:-/usr}

prepare() {
	cp $startdir/init.lua $srcdir/init.lua
	cp -r $startdir/lua $srcdir/lua
	cp -r $startdir/luasnippets $srcdir/luasnippets
}

package() {
	pandoc -s -t man "$srcdir/readme.md" -o "$srcdir/readme.1"
	gzip -9c "$srcdir/readme.1" > "$srcdir/${pkgname}.gz"
	install -Dm644 "$srcdir/${pkgname}.gz" "$pkgdir${prefix}/share/man/man1/${pkgname}.1.gz"

	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir${prefix}/share/license/${pkgname}/LICENSE.txt"

	install -Dm755 "$srcdir/nvim-config-lazymiku-install" "$pkgdir${prefix}/bin/nvim-config-lazymiku-install"

	install -Dm644 "$srcdir/init.lua" "$pkgdir${prefix}/share/nvim-config-lazymiku/init.lua"
	cp -r "$srcdir/lua" "$pkgdir${prefix}/share/nvim-config-lazymiku/lua"
	cp -r "$srcdir/luasnippets" "$pkgdir${prefix}/share/nvim-config-lazymiku/luasnippets"

}

