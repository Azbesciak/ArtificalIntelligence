package com.witkups.rodzina;

import java.util.Arrays;

public class Relacja {
    public Osoba[] osoby = new Osoba[2];
    public TypRelacji typ;

    public Relacja(Osoba o1, Osoba o2, TypRelacji typ) {
        osoby[0] = o1;
        osoby[1] = o2;
        this.typ = typ;
        o1.relacje.add(this);
        o2.relacje.add(this);
    }

    @Override
    public String toString() {
        return "Relacja{" +
                "osoby=" + Arrays.toString(osoby) +
                ", typ=" + typ +
                '}';
    }
}
