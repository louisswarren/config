noreabbrev mkc2a $(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) -o $@ $<
noreabbrev mkc2o $(CC) $(CFLAGS) -c -o $@ $<
noreabbrev mko2a $(CC) $(LDFLAGS) $(LDLIBS) -o $@ $^

noreabbrev mkdefault .PHONY: default<cr><esc>idefault:
noreabbrev mkclean .PHONY: clean<cr><esc>iclean:<cr><tab>rm -f

nnoremap \p (yt:O.PHONY:<space><esc>p0j
