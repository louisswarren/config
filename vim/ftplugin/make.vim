noreabbrev ctoa $(CC) $(CFLAGS) $(LDFLAGS) $(LDLIBS) -o $@ $<
noreabbrev ctoo $(CC) $(CFLAGS) -c -o $@ $<
noreabbrev otoa $(CC) $(LDFLAGS) $(LDLIBS) -o $@ $^

noreabbrev phonyclean .PHONY: clean<cr><esc>iclean:<cr><tab>rm -f
