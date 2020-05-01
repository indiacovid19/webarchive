all: push

push: archive readme
	git add .
	git commit
	git status
	git push origin master

page = MoHFW | Home

archive:
	if [ ! -e "mohfw/$(page).html" ]; then echo "No new archive"; exit; fi; \
	echo "Creating new archive directory ..."; \
	dir=$$(sed -n \
	       's/.*as on.*\([0-9]\{2\}\) \(.*\) \([0-9]\{4\}\).*\([0-9]\{2\}\):\([0-9]\{2\}\).*/\3-\2-\1_\4\5/p' \
	       "mohfw/$(page).html" | \
	       sed 's/Jan/01/; s/Feb/02/; s/Mar/03/; s/Apr/04/; s/May/05/; s/Jun/06/; s/Jul/07/; s/Aug/08/; s/Sep/09/; s/Oct/10/; s/Nov/11/; s/Dec/12/'); \
	mkdir -p "mohfw/$$dir"; \
	mv "mohfw/$(page).html" "mohfw/$$dir/index.html"; \
	mv "mohfw/$(page)_files" "mohfw/$$dir/"; \
	echo "Done"

readme:
	sed '/<!-- .* automatically generated .* -->/q' README.md > README.tmp
	echo >> README.tmp
	ls -1Fd mohfw/* pib/* | sort | while read -r path; \
	do \
		echo "- [$$path](https://indiacovid19.github.io/webarchive/$$path)"; \
	done >> README.tmp
	mv README.tmp README.md
	cat README.md
