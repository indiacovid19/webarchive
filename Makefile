all: push

push: archive readme
	git add .
	git commit -F /tmp/commit.txt
	git log -n 1
	git status
	@echo
	@echo Press enter to push repository
	@read
	git push origin master

page = MoHFW | Home

archive:
	if [ ! -e "$(HOME)/Downloads/$(page).html" ]; then echo "No new archive"; exit 1; fi; \
	echo "Creating new archive directory ..."; \
	date=$$(sed -n \
	        's/.*as on.*\([0-9]\{2\}\)[[:space:]]\(.*\) \([0-9]\{4\}\).*\([0-9]\{2\}\):\([0-9]\{2\}\).*/\3-\2-\1 \4:\5/p' \
	        "$(HOME)/Downloads/$(page).html" | head -n 1 | \
	        sed 's/Jan[a-z]*/01/; s/Feb[a-z]*/02/; s/Mar[a-z]*/03/; s/Apr[a-z]*/04/; s/May[a-z]*/05/; s/June[a-z]*/06/; s/July[a-z]*/07/; s/Aug[a-z]*/08/; s/Sep[a-z]*/09/; s/Oct[a-z]*/10/; s/Nov[a-z]*/11/; s/Dec[a-z]*/12/'); \
	dir=$$(echo "$$date" | sed 's/ /_/; s/://'); \
	mkdir -p "mohfw/$$dir"; \
	echo "Add MoHFW archive for $$date" > /tmp/commit.txt
	cat /tmp/commit.txt
	@echo
	@echo Press enter to confirm commit message.
	@read
	mv "$(HOME)/Downloads/$(page).html" "mohfw/$$dir/index.html"; \
	mv "$(HOME)/Downloads/$(page)_files" "mohfw/$$dir/"; \
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
