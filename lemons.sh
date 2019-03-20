#!/usr/bin/env bash
Clock() {
	TIME=$(date "+%r | %A %b %Y | %D")
	echo "$TIME"
}
Battery() {
	BATPERC=$(acpi --battery | cut -d, -f2)
	echo "$BATPERC"
}
BG() {
	BG_LEMON="%{B#280000} $@ %{B-}"
	echo "$BG_LEMON"
}
FG() {
	BG_LEMON="%{F#FF5701} $@ %{F-}"
	echo "$BG_LEMON"
}
Colorize() {
	BEGIN=$(FG $@ )
	END=$(BG $BEGIN)
	echo $END;
}
ClockS() {
	CLOCK_SYMBOL="\uf017"
	echo "$CLOCK_SYMBOL"
}
BatS() {
	BAT_SYMBOL="\uf242"
	echo "$BAT_SYMBOL"
}
while sleep 1;
do
	echo -e "%{c} $(Colorize $(ClockS) $(Clock)) %{r} $(Colorize $(BatS) $(Battery))%{O30}"
done
