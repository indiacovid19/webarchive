all: update

update: readme
	git add .
	git status

push: update
	git commit
	git push origin master

readme:
	sed '/<!-- .* automatically generated .* -->/q' README.md > README.tmp
	echo >> README.tmp
	ls -1Fd mohfw/* pib/* | sort | while read -r path; \
	do \
		echo "- [$$path](https://indiacovid19.github.io/webarchive/$$path)"; \
	done >> README.tmp
	mv README.tmp README.md
	cat README.md
