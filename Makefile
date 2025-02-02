include_dir=build
source=chapters2/*.md
title='电子书模板'
filename='ebook'


all: html epub rtf pdf mobi

markdown:
	awk 'FNR==1{print ""}{print}' $(source) > $(filename).md

html: markdown
	pandoc -s $(filename).md -t html5 -o index.html -c style.css \
		--include-in-header $(include_dir)/head.html \
		--include-before-body $(include_dir)/author.html \
		--include-before-body $(include_dir)/share.html \
		--include-after-body $(include_dir)/stats.html \
		--title-prefix $(title) \
		--toc-depth=4 \
		--toc

epub: markdown
	pandoc -s $(filename).md -t epub -o $(filename).epub \
		--epub-metadata $(include_dir)/metadata.xml \
		--epub-cover-image img/cover.jpg \
		--title-prefix $(title) \
		--toc

rtf: markdown
	pandoc -s $(filename).md -o $(filename).rtf \
		--title-prefix $(title)

pdf: markdown
	# OS X: http://www.tug.org/mactex/
	# Then find its path: find /usr/ -name "pdflatex"
	# Then symlink it: ln -s /path/to/pdflatex /usr/local/bin
	pandoc -s $(filename).md -o $(filename).pdf \
		--title-prefix $(title) \
		--listings -H listings-setup.tex \
		--pdf-engine=xelatex \
		--template=template/template.tex \
		--toc

mobi: epub
	# Symlink bin: ln -s /path/to/kindlegen /usr/local/bin
	kindlegen $(filename).epub
