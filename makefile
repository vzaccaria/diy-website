# Makefile autogenerated by Dyi on 
#
# Main target: all
# Sources:  src/index.jade  src/fonts/glyphicons-halflings-regular.eot  src/fonts/glyphicons-halflings-regular.svg  src/fonts/glyphicons-halflings-regular.ttf  src/fonts/glyphicons-halflings-regular.woff  src/fonts/glyphicons-halflings-regular.woff2  example/configure.js  example/makefile  src/index.ls 

.DEFAULT_GOAL := all


.PHONY: c-ckn78fyx
c-ckn78fyx: src/index.html 


.PHONY: p-xtwehwee
p-xtwehwee: bemified-8prb.html 


.PHONY: r-gusweivi
r-gusweivi: _site/index.html 


.PHONY: c-xvqvqmc6
c-xvqvqmc6: src/fonts/glyphicons-halflings-regular.eot src/fonts/glyphicons-halflings-regular.svg src/fonts/glyphicons-halflings-regular.ttf src/fonts/glyphicons-halflings-regular.woff src/fonts/glyphicons-halflings-regular.woff2 


.PHONY: m-05q2qnrn
m-05q2qnrn: _site/fonts/glyphicons-halflings-regular.eot _site/fonts/glyphicons-halflings-regular.svg _site/fonts/glyphicons-halflings-regular.ttf _site/fonts/glyphicons-halflings-regular.woff _site/fonts/glyphicons-halflings-regular.woff2 


.PHONY: c-kn0hcf0s
c-kn0hcf0s: example/configure.js 


.PHONY: c-btclmxgr
c-btclmxgr: example/makefile 


.PHONY: m-y522ccoq
m-y522ccoq: _site/demo/configure.js _site/demo/makefile 


.PHONY: c-g2pjidqm
c-g2pjidqm: src/index.bfd.js 


.PHONY: r-uliu4dbp
r-uliu4dbp: _site/client.js 


.PHONY: all
all: r-gusweivi m-05q2qnrn m-y522ccoq r-uliu4dbp 


.PHONY: start
start: k-6l4o54nu k-gv6s7fs4 


.PHONY: stop
stop: k-xfgdugn6 k-ju5uwvrt 


.PHONY: prepare
prepare: src . _site src/fonts _site/fonts example _site/demo 




.PHONY: k-6l4o54nu
k-6l4o54nu:  
	/Users/zaccaria/development/github/diy/lib/packs/../../node_modules/.bin/pm2 start /Users/zaccaria/development/github/diy/lib/packs/livereload.js -- '_site/**/*'


.PHONY: k-gv6s7fs4
k-gv6s7fs4:  
	/Users/zaccaria/development/github/diy/lib/packs/../../node_modules/.bin/pm2 start /Users/zaccaria/development/github/diy/lib/packs/serve.js -- _site -p 4000


.PHONY: k-xfgdugn6
k-xfgdugn6:  
	/Users/zaccaria/development/github/diy/lib/packs/../../node_modules/.bin/pm2 delete /Users/zaccaria/development/github/diy/lib/packs/livereload.js


.PHONY: k-ju5uwvrt
k-ju5uwvrt:  
	/Users/zaccaria/development/github/diy/lib/packs/../../node_modules/.bin/pm2 delete /Users/zaccaria/development/github/diy/lib/packs/serve.js


.PHONY: clean
clean:  
	rm -f src/index.html
	rm -f bemified-8prb.html
	rm -f _site/index.html
	echo 'Not cleaning up src/fonts/glyphicons-halflings-regular.eot because is a source'
	echo 'Not cleaning up src/fonts/glyphicons-halflings-regular.svg because is a source'
	echo 'Not cleaning up src/fonts/glyphicons-halflings-regular.ttf because is a source'
	echo 'Not cleaning up src/fonts/glyphicons-halflings-regular.woff because is a source'
	echo 'Not cleaning up src/fonts/glyphicons-halflings-regular.woff2 because is a source'
	rm -f _site/fonts/glyphicons-halflings-regular.eot
	rm -f _site/fonts/glyphicons-halflings-regular.svg
	rm -f _site/fonts/glyphicons-halflings-regular.ttf
	rm -f _site/fonts/glyphicons-halflings-regular.woff
	rm -f _site/fonts/glyphicons-halflings-regular.woff2
	echo 'Not cleaning up example/configure.js because is a source'
	echo 'Not cleaning up example/makefile because is a source'
	rm -f _site/demo/configure.js
	rm -f _site/demo/makefile
	rm -f src/index.bfd.js
	rm -f _site/client.js




src/index.html: src/index.jade 
	./node_modules/.bin/jade src/index.jade	

bemified-8prb.html: src/index.html 
	./node_modules/.bin/beml-cli < src/index.html > bemified-8prb.html	

_site/index.html: bemified-8prb.html 
	cp bemified-8prb.html _site/index.html	

_site/fonts/glyphicons-halflings-regular.eot: src/fonts/glyphicons-halflings-regular.eot 
	cp src/fonts/glyphicons-halflings-regular.eot _site/fonts/glyphicons-halflings-regular.eot	

_site/fonts/glyphicons-halflings-regular.svg: src/fonts/glyphicons-halflings-regular.svg 
	cp src/fonts/glyphicons-halflings-regular.svg _site/fonts/glyphicons-halflings-regular.svg	

_site/fonts/glyphicons-halflings-regular.ttf: src/fonts/glyphicons-halflings-regular.ttf 
	cp src/fonts/glyphicons-halflings-regular.ttf _site/fonts/glyphicons-halflings-regular.ttf	

_site/fonts/glyphicons-halflings-regular.woff: src/fonts/glyphicons-halflings-regular.woff 
	cp src/fonts/glyphicons-halflings-regular.woff _site/fonts/glyphicons-halflings-regular.woff	

_site/fonts/glyphicons-halflings-regular.woff2: src/fonts/glyphicons-halflings-regular.woff2 
	cp src/fonts/glyphicons-halflings-regular.woff2 _site/fonts/glyphicons-halflings-regular.woff2	

_site/demo/configure.js: example/configure.js 
	cp example/configure.js _site/demo/configure.js	

_site/demo/makefile: example/makefile 
	cp example/makefile _site/demo/makefile	

src/index.bfd.js: src/index.ls src/feature.less src/less/alerts.less src/less/badges.less src/less/bootstrap.less src/less/breadcrumbs.less src/less/button-groups.less src/less/buttons.less src/less/carousel.less src/less/close.less src/less/code.less src/less/component-animations.less src/less/dropdowns.less src/less/forms.less src/less/glyphicons.less src/less/grid.less src/less/input-groups.less src/less/jumbotron.less src/less/labels.less src/less/list-group.less src/less/media.less src/less/mixins.less src/less/mixins/alerts.less src/less/mixins/background-variant.less src/less/mixins/border-radius.less src/less/mixins/buttons.less src/less/mixins/center-block.less src/less/mixins/clearfix.less src/less/mixins/forms.less src/less/mixins/gradients.less src/less/mixins/grid-framework.less src/less/mixins/grid.less src/less/mixins/hide-text.less src/less/mixins/image.less src/less/mixins/labels.less src/less/mixins/list-group.less src/less/mixins/nav-divider.less src/less/mixins/nav-vertical-align.less src/less/mixins/opacity.less src/less/mixins/pagination.less src/less/mixins/panels.less src/less/mixins/progress-bar.less src/less/mixins/reset-filter.less src/less/mixins/resize.less src/less/mixins/responsive-visibility.less src/less/mixins/size.less src/less/mixins/tab-focus.less src/less/mixins/table-row.less src/less/mixins/text-emphasis.less src/less/mixins/text-overflow.less src/less/mixins/vendor-prefixes.less src/less/modals.less src/less/navbar.less src/less/navs.less src/less/normalize.less src/less/pager.less src/less/pagination.less src/less/panels.less src/less/popovers.less src/less/print.less src/less/progress-bars.less src/less/responsive-embed.less src/less/responsive-utilities.less src/less/scaffolding.less src/less/tables.less src/less/theme.less src/less/thumbnails.less src/less/tooltip.less src/less/type.less src/less/utilities.less src/less/variables.less src/less/wells.less src/main.less src/section.less 
	./node_modules/.bin/browserify -t liveify -t node-lessify  src/index.ls -o src/index.bfd.js	

_site/client.js: src/index.bfd.js 
	cp src/index.bfd.js _site/client.js	

src: 
	mkdir -p src	

.: 
	mkdir -p .	

_site: 
	mkdir -p _site	

src/fonts: 
	mkdir -p src/fonts	

_site/fonts: 
	mkdir -p _site/fonts	

example: 
	mkdir -p example	

_site/demo: 
	mkdir -p _site/demo	


