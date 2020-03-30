all: readme

readme:
	sed '/<!-- .* automatically generated .* -->/q' README.md > README.tmp
	echo >> README.tmp
	ls -1d mohfw/* | while read -r path; \
	do \
		echo "- [$$path]($$path)" >> README.tmp; \
	done >> README.tmp
	mv README.tmp README.md
	cat README.md
