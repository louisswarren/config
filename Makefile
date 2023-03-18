M4SRC := $(shell find -name '*.m4')
M4OBJ := $(patsubst %.m4,%,$(M4SRC))

.PHONY: makegnu
makegnu: $(M4OBJ)

.PHONY: makeposix
makeposix:
	find -name '*.m4' | while read -r fname; do echo "$${fname%.m4}"; done | xargs $(MAKE)

%: %.m4
	@echo "make $@"
	@echo "m4_divert(-1)" \
	      "m4_define(HOST, \`$$(uname -n)')" \
	      "m4_define(\`HOST_PLATO',  \`m4_ifelse(HOST, \`plato',  \`\$$1', \`\$$2')')" \
	      "m4_define(\`HOST_EULER',  \`m4_ifelse(HOST, \`euler',  \`\$$1', \`\$$2')')" \
	      "m4_define(\`HOST_TURING', \`m4_ifelse(HOST, \`turing', \`\$$1', \`\$$2')')" \
	      'm4_divert(0)m4_dnl' \
	    | m4 --prefix-builtins - "$<" > "$@"

#	[ -x "$<" ] && chmod +x "$@"
